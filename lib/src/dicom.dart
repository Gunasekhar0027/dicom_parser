import 'dart:convert';
import 'dart:typed_data';


import 'dicom_exceptions.dart';
import 'tag_model.dart';

import 'constants.dart';
import 'dicom_model.dart';
import 'dicom_tags_library.dart';
import 'dicom_image_parser.dart';

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
  Uint8List preamble = dicomData.sublist(0, 128);
  print(preamble);
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

  Future<void> parseDICOMTagsData(
      {required Uint8List dicomDataInput, required int startOffset}) async {
    ByteData byteDataInput =
        ByteData.sublistView(Uint8List.fromList(dicomDataInput));
    int offset = startOffset;
    while (offset + 8 <= byteDataInput.lengthInBytes) {
      bool isMetaFileInfoGroup = dicomDataInput[offset] == 2 &&
          dicomDataInput[offset + 1] == 0;

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
      print(group + "," + element);

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
      print(length);
      print(vr);

      // Value Bytes
      List<int> valueBytes = [];

      if (length == 0xFFFFFFFF && vr == "SQ") {
        // The value starts from here
        int sequenceContentStart = offset;

        while (offset + 8 <= dicomDataInput.lengthInBytes) {
          int groupDelim = byteDataInput.getUint16(offset, currentEndian);
          int elementDelim = byteDataInput.getUint16(offset + 2, currentEndian);

          if (groupDelim == 0xFFFE && elementDelim == 0xE0DD) {
            // Sequence Delimitation Item found
            valueBytes = dicomDataInput.sublist(sequenceContentStart, offset);

            offset += 8; // Skip delimiter tag (FFFE,E0DD) + 4-byte zero length
            break;
          } else {
            offset++; // Scan forward byte-by-byte until delimiter is found
          }
        }
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
            print(
                "⚠️ Unexpected item tag in encapsulated Pixel Data at offset $offset.");
            break;
          }

          if (offset + itemLength > byteDataInput.lengthInBytes) {
            print("⚠️ Invalid JPEG fragment size. Skipping remaining.");
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
        print("⚠️ Invalid or unknown length at offset $offset. Skipping tag.");
        break;
      }

      print(valueBytes.length < 200 ? valueBytes : "<200");

      dynamic value;
      if (group == "7fe0") {
        if (element == "0010") {
          imageBytes = valueBytes.toList();
          print("Standard Pixel Data (7FE0,0010) extracted.");
        } else if (element == "0008") {
          print("Float Pixel Data (7FE0,0008) found.");

          final floatList = <double>[];
          final byteData = ByteData.sublistView(Uint8List.fromList(valueBytes));
          for (int i = 0; i + 3 < valueBytes.length; i += 4) {
            floatList.add(byteData.getFloat32(i, currentEndian));
          }

          if (floatList.isEmpty) {
            print("⚠️ Float Pixel Data is empty. Skipping.");
          } else {
            double minVal = floatList.first;
            double maxVal = floatList.first;
            for (var val in floatList) {
              if (val < minVal) minVal = val;
              if (val > maxVal) maxVal = val;
            }

            double range = (maxVal - minVal).abs();
            if (range == 0) range = 1;

            final normalizedBytes = floatList.map((val) {
              return ((val - minVal) / range * 255).clamp(0, 255).toInt();
            }).toList();

            imageBytes = Uint8List.fromList(normalizedBytes);
            print("✅ Float Pixel Data normalized to 8-bit grayscale.");
          }
        }
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
            await parseDICOMTagsData(
              dicomDataInput: Uint8List.fromList(valueBytes.sublist(8)),
              startOffset: 0,
            );
          } else {
            print("Skipping SQ parsing due to insufficient bytes.");
          }
        } catch (e) {
          print("Error while parsing SQ: $e");
        }
      } else if (group == "fffe") {
        if (element == "e00d" || element == "e0dd") {
          // Sequence/item delimiters – skip
          print("Skipping special marker: $group,$element");
          offset += 8; // 4 bytes tag + 4 bytes length
          continue;
        } else if (element == "e000") {
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
                break;
              }
              offset++;
            }
            continue;
          } else {
            // Defined-length item
            if ((offset + itemLength) > byteDataInput.lengthInBytes) {
              print("⚠️ Sequence item length exceeds buffer.");
              break;
            }

            // Recursively parse the item
            await parseDICOMTagsData(
              dicomDataInput:
                  dicomDataInput.sublist(offset, offset + itemLength),
              startOffset: 0,
            );

            offset += itemLength;
            continue;
          }
        } else {
          print("⚠️ Unknown FFFE element: $element. Skipping.");
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
      );

      print(
          "Value:    ${tagModel.value.length < 200 ? tagModel.value : ">200"}");
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

      tags.add(tagModel);
    }
  }

  print("Next Image parsing");
  await parseDICOMTagsData(dicomDataInput: dicomData, startOffset: 132);

  tags.removeWhere((tag) =>
      tag.vr == "SQ" ||
      tag.getTag() == "fffe,e00d" ||
      tag.getTag() == "fffe,e0dd" ||
      tag.value == "null" ||
      tag.value.isEmpty);

  Uint8List? pngBytes;
  if (imageBytes.isNotEmpty) {
    try {
      pngBytes = await parseDICOMPixelData(
          pixelData: imageBytes, tags: tags, endian: currentEndian);
    } catch (e) {
      print("Pixel Data Parse Error");
      print(e);
    }
  }

  DICOMModel dicomModel = DICOMModel(tags: tags, imageBytes: pngBytes);
  return dicomModel;
}
