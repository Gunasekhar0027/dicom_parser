import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'constants.dart';
import 'dicom_exceptions.dart';
import 'dicom_image_parser.dart';
import 'dicom_model.dart';
import 'dicom_tags_library.dart';
import 'tag_model.dart';

Future<DICOMModel> parseDICOM(Uint8List dicomData) async {
  final preProcessedDICOMStrings = dicomLibraryData.split('\n');
  Map<String, String> tagDescriptionMap = {};
  Map<String, String> tagVRMap = {};
  for (int i = 0; i < preProcessedDICOMStrings.length; i++) {
    List<String> split = preProcessedDICOMStrings[i].split(';');
    tagDescriptionMap[split[0]
        .replaceAll("(", "")
        .replaceAll(")", "")
        .trim()
        .toLowerCase()] = split[2];

    tagVRMap[split[0]
        .replaceAll("(", "")
        .replaceAll(")", "")
        .trim()
        .toLowerCase()] = split[1];
  }

  List<TagModel> tags = [];
  if (dicomData.length < 138) {
    throw DicomParseException("Invalid DICOM File");
  }
  //Uint8List preamble = dicomData.sublist(0, 128);
  Uint8List dicomPrefix = dicomData.sublist(128, 132);

  if (String.fromCharCodes(dicomPrefix) != "DICM") {
    throw DicomParseException("Not DICOM File");
  }

  const extendedVRs = ['OB', 'OW', 'OF', 'SQ', 'UT', 'UN', 'UN', 'OD', 'OL'];
  const numericVRs = ['UL', 'US', 'SS', 'SL', 'FL', 'FD', 'DS', 'IS'];
  const stringVRs = ['SH', 'LO', 'ST', 'LT', 'PN', 'CS'];
  const dateVRs = ['DA', 'TM', 'DT'];

  List<int> imageBytes = [];
  Endian currentEndian = Endian.little;
  String? currentTransferSyntax;

  String parseAsciiValue(List<int> valueBytes) {
    try {
      List<int> cleanBytes = valueBytes.where((b) => b != 0).toList();
      return ascii.decode(cleanBytes, allowInvalid: true).trim();
    } catch (_) {
      return "<binary>";
    }
  }

  Future<List<TagModel>> parseDICOMTagsData(
      {required Uint8List dicomDataInput, required int startOffset}) async {
    List<TagModel> mainTags = [];
    ByteData byteDataInput =
        ByteData.sublistView(Uint8List.fromList(dicomDataInput));
    int offset = startOffset;
    while (offset + 8 <= byteDataInput.lengthInBytes) {
      bool isMetaFileInfoGroup =
          dicomDataInput[offset] == 2 && dicomDataInput[offset + 1] == 0;

      // Read Group
      String group = byteDataInput
          .getUint16(
              offset, isMetaFileInfoGroup ? Endian.little : currentEndian)
          .toRadixString(16)
          .padLeft(4, '0');
      offset += 2;

      // Read Element
      String element = byteDataInput
          .getUint16(
              offset, isMetaFileInfoGroup ? Endian.little : currentEndian)
          .toRadixString(16)
          .padLeft(4, '0');
      offset += 2;

      // Read VR & Length
      int length = 0;
      String vr;
      bool isImplicitVR = (currentTransferSyntax == kImplicitVrLittleEndian);
      if (isImplicitVR && !isMetaFileInfoGroup) {
        // Implicit VR: don't read VR from the stream, assume 4-byte length directly
        vr = tagVRMap["$group,$element"] ?? "UN"; // Default to UN;
        length = byteDataInput.getUint32(offset, currentEndian);
        offset += 4;
      } else {
        // Explicit VR
        vr = ascii.decode(dicomDataInput.sublist(offset, offset + 2));
        offset += 2;

        if (extendedVRs.contains(vr)) {
          offset += 2; // reserved
          length = byteDataInput.getUint32(
              offset, isMetaFileInfoGroup ? Endian.little : currentEndian);
          offset += 4;
        } else {
          length = byteDataInput.getUint16(
              offset, isMetaFileInfoGroup ? Endian.little : currentEndian);
          offset += 2;
        }
      }

      // Value Bytes
      List<int> valueBytes = [];
      List<TagModel> sqChildTags = [];
      if (length == 0xFFFFFFFF && vr == "SQ") {
        int seqOffset = offset;

        while (seqOffset + 8 <= dicomDataInput.lengthInBytes) {
          int groupNum = byteDataInput.getUint16(seqOffset, currentEndian);
          int elementNum =
              byteDataInput.getUint16(seqOffset + 2, currentEndian);

          // Sequence Delimitation Item
          if (groupNum == 0xFFFE && elementNum == 0xE0DD) {
            sqChildTags.add(TagModel(
                group: "fffe",
                element: "e0dd",
                vr: "_",
                value: "Sequence Delimitation",
                valueBytes: [],
                tagDescription: "",
                childTags: []));
            seqOffset += 8; // skip delimiter tag + zero length
            break;
          }

          // Item Tag
          if (groupNum == 0xFFFE && elementNum == 0xE000) {
            sqChildTags.add(TagModel(
              group: "fffe",
              element: "e000",
              vr: "_",
              value: "Item",
              valueBytes: [],
              tagDescription: "",
              childTags: [],
            ));

            int itemLength =
                byteDataInput.getUint32(seqOffset + 4, currentEndian);
            seqOffset += 8;

            if (itemLength == 0xFFFFFFFF) {
              // Undefined length item — find Item Delimitation Item
              int itemStart = seqOffset;
              while (seqOffset + 8 <= dicomDataInput.lengthInBytes) {
                int nextGroup =
                    byteDataInput.getUint16(seqOffset, currentEndian);
                int nextElement =
                    byteDataInput.getUint16(seqOffset + 2, currentEndian);
                if (nextGroup == 0xFFFE && nextElement == 0xE00D) {
                  break;
                }
                seqOffset++;
              }
              int itemLengthCalculated = seqOffset - itemStart;

              // Parse item contents recursively — handles nested SQ
              List<TagModel> infiniteLengthTags = await parseDICOMTagsData(
                dicomDataInput: dicomDataInput.sublist(
                    itemStart, itemStart + itemLengthCalculated),
                startOffset: 0,
              );
              sqChildTags.addAll(infiniteLengthTags);

              // Item Delimitation Item
              sqChildTags.add(TagModel(
                group: "fffe",
                element: "e00d",
                vr: "_",
                value: "Item Delimitation",
                valueBytes: [],
                tagDescription: "",
                childTags: [],
              ));
              seqOffset += 8; // skip delimiter
            } else {
              // Defined length item
              List<TagModel> definedLengthTags = await parseDICOMTagsData(
                dicomDataInput:
                    dicomDataInput.sublist(seqOffset, seqOffset + itemLength),
                startOffset: 0,
              );
              sqChildTags.addAll(definedLengthTags);
              seqOffset += itemLength;
            }

            continue;
          }

          // If we hit here, data is not aligned — break to avoid infinite loop
          if (kDebugMode) {
            print(
                "⚠ Unexpected tag inside SQ at offset $seqOffset — stopping SQ parse");
          }
          break;
        }

        offset = seqOffset;
      } else if (length == 0xFFFFFFFF &&
          vr == "OB" &&
          group == "7fe0" &&
          element == "0010") {
        // Special case: encapsulated Pixel Data (e.g., JPEG compressed)
        List<int> fragments = [];
        while (offset + 8 <= byteDataInput.lengthInBytes) {
          int itemTagGroup = byteDataInput.getUint16(offset, currentEndian);
          int itemTagElement =
              byteDataInput.getUint16(offset + 2, currentEndian);
          int itemLength = byteDataInput.getUint32(offset + 4, currentEndian);
          offset += 8;

          // Sequence Delimiter: end of fragments
          if (itemTagGroup == 0xFFFE && itemTagElement == 0xE0DD) {
            break;
          }

          // Fragment item (FFFE,E000)
          if (itemTagGroup != 0xFFFE || itemTagElement != 0xE000) {
            if (kDebugMode) {
              print(
                  "⚠️ Unexpected item tag in encapsulated Pixel Data at offset $offset.");
            }
            break;
          }

          if (offset + itemLength > byteDataInput.lengthInBytes) {
            if (kDebugMode) {
              print("⚠️ Invalid JPEG fragment size. Skipping remaining.");
            }
            break;
          }

          fragments.addAll(dicomDataInput.sublist(offset, offset + itemLength));
          offset += itemLength;
        }

        valueBytes = fragments;
      } else if (length != 0xFFFFFFFF &&
          (offset + length) <= dicomDataInput.lengthInBytes) {
        valueBytes = dicomDataInput.sublist(offset, offset + length);
        offset += length;
      } else {
        if (kDebugMode) {
          print(
              "⚠️ Invalid or unknown length at offset $offset. Skipping tag.");
        }
        break;
      }

      dynamic value;
      if (group == "7fe0" || group == "7fe1") {
        value = "Pixel Data";
      } else if (vr == "OB") {
        // Other Byte, store as Uint8List
        value = Uint8List.fromList(valueBytes);
      } else if (vr == "AT") {
        // Attribute Tag, list of (group, element) pairs
        final byteData = ByteData.sublistView(Uint8List.fromList(valueBytes));
        final tagList = <String>[];
        for (int i = 0; i + 3 < valueBytes.length; i += 4) {
          int groupVal = byteData.getUint16(
              i, isMetaFileInfoGroup ? Endian.little : currentEndian);
          int elementVal = byteData.getUint16(
              i + 2, isMetaFileInfoGroup ? Endian.little : currentEndian);
          tagList.add(
              "(${groupVal.toRadixString(16).padLeft(4, '0')},${elementVal.toRadixString(16).padLeft(4, '0')})");
        }
        value = tagList;
      } else if (numericVRs.contains(vr)) {
        if (valueBytes.isNotEmpty) {
          final byteData = ByteData.sublistView(Uint8List.fromList(valueBytes));
          switch (vr) {
            case 'UL':
              value = byteData.getUint32(
                  0, isMetaFileInfoGroup ? Endian.little : currentEndian);
              break;
            case 'US':
              value = byteData.getUint16(
                  0, isMetaFileInfoGroup ? Endian.little : currentEndian);
              break;
            case 'SS':
              value = byteData.getInt16(
                  0, isMetaFileInfoGroup ? Endian.little : currentEndian);
              break;
            case 'SL':
              value = byteData.getInt32(
                  0, isMetaFileInfoGroup ? Endian.little : currentEndian);
              break;
            case 'FL':
              value = byteData.getFloat32(
                  0, isMetaFileInfoGroup ? Endian.little : currentEndian);
              break;
            case 'FD':
              value = byteData.getFloat64(
                  0, isMetaFileInfoGroup ? Endian.little : currentEndian);
              break;
            default:
              value = parseAsciiValue(valueBytes);
          }
        }
      } else if (stringVRs.contains(vr) || dateVRs.contains(vr)) {
        value = parseAsciiValue(valueBytes);
      } else if (vr == "SQ") {
        try {
          if (valueBytes.length > 8) {
            List<TagModel> sqTags = await parseDICOMTagsData(
              dicomDataInput: Uint8List.fromList(valueBytes.sublist(8)),
              startOffset: 0,
            );
            mainTags.addAll(sqTags);
          } else {
            if (kDebugMode) {
              print("Skipping SQ parsing due to insufficient bytes.");
            }
          }
        } catch (e) {
          if (kDebugMode) {
            print("Error while parsing SQ: $e");
          }
        }
      } else if (group == "fffe") {
        if (element == "e00d" || element == "e0dd") {
          // Sequence/item delimiters – skip
          if (kDebugMode) {
            print("Skipping special marker: $group,$element");
          }
          offset += 8; // 4 bytes tag + 4 bytes length
          mainTags.add(TagModel(
            group: "fffe",
            element: "e0dd",
            vr: "_",
            value: "Sequence Delimitation",
            valueBytes: [],
            tagDescription: "",
            childTags: [],
          ));
          continue;
        } else if (element == "e000") {
          mainTags.add(TagModel(
            group: "fffe",
            element: "e000",
            vr: "_",
            value: "Item",
            valueBytes: [],
            tagDescription: "",
            childTags: [],
          ));
          // This is a sequence item (FFFE,E000)
          int itemLength = byteDataInput.getUint32(offset, currentEndian);
          offset += 4;

          if (itemLength == 0xFFFFFFFF) {
            // Undefined length item – scan until next item delimiter
            while (offset + 8 <= byteDataInput.lengthInBytes) {
              final nextGroup = byteDataInput
                  .getUint16(offset, currentEndian)
                  .toRadixString(16)
                  .padLeft(4, '0');
              final nextElement = byteDataInput
                  .getUint16(offset + 2, currentEndian)
                  .toRadixString(16)
                  .padLeft(4, '0');

              if (nextGroup == "fffe" && nextElement == "e00d") {
                mainTags.add(TagModel(
                  group: "fffe",
                  element: "e00d",
                  vr: "_",
                  value: "Item Delimitation",
                  valueBytes: [],
                  tagDescription: "",
                  childTags: [],
                ));
                break;
              }
              offset++;
            }
            continue;
          } else {
            // Defined-length item
            if ((offset + itemLength) > byteDataInput.lengthInBytes) {
              if (kDebugMode) {
                print("⚠️ Sequence item length exceeds buffer.");
              }
              break;
            }

            // Recursively parse the item
            List<TagModel> definedLengthTags = await parseDICOMTagsData(
              dicomDataInput:
                  dicomDataInput.sublist(offset, offset + itemLength),
              startOffset: 0,
            );
            mainTags.addAll(definedLengthTags);

            offset += itemLength;
            continue;
          }
        } else {
          if (kDebugMode) {
            print("⚠️ Unknown FFFE element: $element. Skipping.");
          }
          offset += 8;
          continue;
        }
      } else {
        try {
          value = parseAsciiValue(valueBytes);
          if (value.isEmpty) {
            value = "<empty>";
          }
        } catch (_) {
          value = "<binary>";
        }
      }
      TagModel tagModel = TagModel(
        group: group.toLowerCase(),
        element: element.toLowerCase(),
        vr: vr,
        value: value.toString(),
        valueBytes: valueBytes,
        tagDescription: "",
        childTags: [],
      );
      tagModel.tagDescription = tagDescriptionMap[tagModel.getTag()] ?? "";

      if (tagModel.group == "0002" && tagModel.element == "0010") {
        currentTransferSyntax = tagModel.value.trim();
        if (tagModel.value.trim() == kExplicitVrBigEndian) {
          currentEndian = Endian.big;
        } else if (tagModel.value.trim() == kDeflatedExplicitVrLittleEndian) {
          currentEndian = Endian.little; // Explicit VR Little Endian
          // Pixel data is MPEG-4 video
        }
      }
      mainTags.add(tagModel);
      mainTags.addAll(sqChildTags);
    }

    return mainTags;
  }

  List<TagModel> finalTags =
      await parseDICOMTagsData(dicomDataInput: dicomData, startOffset: 132);

  tags.addAll(finalTags);

  imageBytes = extractImageBytesFromTags(tags, currentEndian).toList();
  List<TagModel> nestedTags = [];
  nestedTags = buildNestedTags(tags);

  Uint8List? pngBytes;
  if (imageBytes.isNotEmpty) {
    try {
      pngBytes = await parseDICOMPixelData(
          pixelData: imageBytes, tags: tags, endian: currentEndian);
    } catch (e) {
      if (kDebugMode) {
        print("Pixel Data Parse Error: $e");
      }
      if (kDebugMode) {
        print(e);
      }
    }
  }

  DICOMModel dicomModel = DICOMModel(tags: nestedTags, imageBytes: pngBytes);
  return dicomModel;
}

Uint8List extractImageBytesFromTags(
    List<TagModel> flatList, Endian currentEndian) {
  Uint8List imageBytes = Uint8List(0);

  for (final tag in flatList) {
    final group = tag.group.toLowerCase();
    final element = tag.element.toLowerCase();

    if (group == "7fe0") {
      if (element == "0010") {
        // Standard Pixel Data
        imageBytes = Uint8List.fromList(tag.valueBytes);
        break;
      } else if (element == "0008") {
        // Float Pixel Data
        if (kDebugMode) {
          print("Float Pixel Data (7FE0,0008) found.");
        }

        final floatList = <double>[];
        final byteData =
            ByteData.sublistView(Uint8List.fromList(tag.valueBytes));

        for (int i = 0; i + 3 < tag.valueBytes.length; i += 4) {
          floatList.add(byteData.getFloat32(i, currentEndian));
        }

        if (floatList.isEmpty) {
          if (kDebugMode) print("⚠️ Float Pixel Data is empty. Skipping.");
          continue;
        }

        double minVal = floatList.reduce((a, b) => a < b ? a : b);
        double maxVal = floatList.reduce((a, b) => a > b ? a : b);
        double range = (maxVal - minVal).abs();
        if (range == 0) range = 1;

        final normalizedBytes = floatList.map((val) {
          return ((val - minVal) / range * 255).clamp(0, 255).toInt();
        }).toList();

        imageBytes = Uint8List.fromList(normalizedBytes);
        if (kDebugMode) {
          print("✅ Float Pixel Data normalized to 8-bit grayscale.");
        }
        break;
      }
    }
  }

  return imageBytes;
}

List<TagModel> buildNestedTags(List<TagModel> flatList) {
  List<TagModel> root = [];
  List<List<TagModel>> stack = [root];

  for (var tag in flatList) {
    final group = tag.group.toUpperCase();
    final element = tag.element.toUpperCase();

    if (tag.vr == "SQ") {
      // Start of Sequence
      tag.childTags = [];
      stack.last.add(tag);
      stack.add(tag.childTags);
    } else if (group == "FFFE" && element == "E000") {
      // Start of Item — don't keep the item node, just go deeper
      List<TagModel> tempChildList = [];
      stack.add(tempChildList);
    } else if (group == "FFFE" && element == "E00D") {
      // End of Item — pop and merge its children into parent
      if (stack.length > 1) {
        List<TagModel> itemChildren = stack.removeLast();
        stack.last.addAll(itemChildren); // merge children into parent
      }
    } else if (group == "FFFE" && element == "E0DD") {
      // End of Sequence
      if (stack.length > 1) stack.removeLast();
    } else {
      // Normal Tag
      stack.last.add(tag);
    }
  }

  return root;
}
