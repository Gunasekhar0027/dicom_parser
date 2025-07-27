import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

import 'constants.dart';
import 'tag_model.dart';

Future<Uint8List> parseDICOMPixelData({
  required List<int> pixelData,
  required List<TagModel> tags,
  required Endian endian,
}) async {
  String transferSyntax = tags
      .firstWhere((tag) => tag.getTag() == "0002,0010")
      .value
      .toLowerCase()
      .trim();

  int samplesPerPixel =
      int.parse(tags.firstWhere((tag) => tag.getTag() == "0028,0002").value);
  String photometricInterpretation = tags
      .firstWhere((tag) => tag.getTag() == "0028,0004")
      .value
      .toUpperCase()
      .trim();
  int rows =
      int.parse(tags.firstWhere((tag) => tag.getTag() == "0028,0010").value);
  int columns =
      int.parse(tags.firstWhere((tag) => tag.getTag() == "0028,0011").value);

  // List<double> pixelSpacingData() {
  //   const pixelSpacingTag = "0028,0030";
  //   final tag = tags.cast<TagModel?>().firstWhere(
  //         (tag) => tag?.getTag() == pixelSpacingTag,
  //     orElse: () => null,
  //   );
  //   try {
  //     return tag?.value.split('\\').map((e) => double.parse(e)).toList() ??
  //         [1.0, 1.0];
  //   } catch (e) {
  //     return [1.0, 1.0];
  //   }
  // }

  // List<double> pixelSpacing = pixelSpacingData();

  int bitsAllocated =
      int.parse(tags.firstWhere((tag) => tag.getTag() == "0028,0100").value);
  int bitsStored =
      int.parse(tags.firstWhere((tag) => tag.getTag() == "0028,0101").value);
  // int highBit =
  //     int.parse(tags.firstWhere((tag) => tag.getTag() == "0028,0102").value);
  int pixelRepresentation =
      int.parse(tags.firstWhere((tag) => tag.getTag() == "0028,0103").value);

  int planarConfiguration = 0;
  final planarTag = tags.where((tag) => tag.getTag() == "0028,0006").toList();
  if (planarTag.isNotEmpty) {
    planarConfiguration = int.parse(planarTag.first.value);
  }

  // print("Transfer Syntax: $transferSyntax");
  // print("Samples Per Pixel: $samplesPerPixel");
  // print("Photometric Interpretation: $photometricInterpretation");
  // print("Rows: $rows");
  // print("Columns: $columns");
  // print("Pixel Spacing: $pixelSpacing mm");
  // print("Bits Allocated: $bitsAllocated");
  // print("Bits Stored: $bitsStored");
  // print("High Bit: $highBit");
  // print("Pixel Representation: $pixelRepresentation");
  // print("Planar Configuration: $planarConfiguration");

  int width = columns;
  int height = rows;
  int pixelCount = width * height;
  final image = img.Image(width: width, height: height);

  final bool isMonochrome1 = photometricInterpretation == 'MONOCHROME1';
  final bool isMonochrome2 = photometricInterpretation == 'MONOCHROME2';
  final bool isRGB = photometricInterpretation == 'RGB';
  final bool isYbrFull = photometricInterpretation == 'YBR_FULL';
  final bool isPaletteColor = photometricInterpretation == 'PALETTE COLOR';
// JPEG-LS Handling
  if (transferSyntax == kJpegLsLossless ||
      transferSyntax == kJpegLsNearLossless) {
    throw UnsupportedError(
        'JPEG-LS decoding is not supported natively in Dart.\n'
        'Transfer Syntax: $transferSyntax');
  }

// JPEG 2000 Handling
  if (transferSyntax == kJpeg2000Lossless || transferSyntax == kJpeg2000Lossy) {
    throw UnsupportedError(
        'JPEG 2000 decoding is not supported natively in Dart.\n'
        'Transfer Syntax: $transferSyntax');
  }
  if (transferSyntax == kDeflatedExplicitVrLittleEndian) {
    final inflater = ZLibDecoder().decodeBytes(pixelData);
    return await parseDICOMPixelData(
      pixelData: inflater,
      tags: tags,
      endian: endian,
    );
  }
  if (isPaletteColor) {
    if (transferSyntax == kRleLossless) {
      // RLE Lossless
      // Decompress first
      final decompressedBytes = await _decodeRLE(pixelData, width * height);
      pixelData = decompressedBytes;
    }
    if (transferSyntax == kExplicitVrLittleEndian ||
        transferSyntax == kExplicitVrBigEndian) {
      // Handle endianness for 16-bit palette indices
      if (bitsAllocated == 16) {
        final byteData = ByteData.sublistView(Uint8List.fromList(pixelData));
        pixelData = List.generate(
            width * height, (i) => byteData.getUint16(i * 2, endian));
      }
    }
    // Handle all JPEG variants
    if (transferSyntax == kJpegBaseline8Bit ||
        transferSyntax == kJpegExtended12Bit ||
        transferSyntax == kJpegLosslessNh ||
        transferSyntax == kJpegLosslessNhFirstOrder) {
      final jpegData = Uint8List.fromList(pixelData);
      final jpegImage = img.decodeJpg(jpegData);

      if (jpegImage == null) {
        throw UnsupportedError('JPEG decompression failed for $transferSyntax');
      }

      // Handle different bit depths
      if (transferSyntax == kJpegExtended12Bit) {
        // 12-bit JPEG needs scaling to 8-bit
        pixelData = List<int>.generate(jpegImage.width * jpegImage.height, (i) {
          final pixel =
              jpegImage.getPixel(i % jpegImage.width, i ~/ jpegImage.width);
          return (img.getLuminance(pixel) / 16)
              .round()
              .clamp(0, 255); // 4096→256
        });
      } else {
        // Standard 8-bit conversion for other JPEG variants
        pixelData = List<int>.generate(jpegImage.width * jpegImage.height, (i) {
          final pixel =
              jpegImage.getPixel(i % jpegImage.width, i ~/ jpegImage.width);
          return img.getLuminance(pixel).round().clamp(0, 255);
        });
      }
    }

    // if (transferSyntax == '1.2.840.10008.1.2.1.99') {
    //   // Requires zlib decompression
    //   import 'package:archive/archive.dart';
    //   pixelData = Inflate.buffer(pixelData).getBytes();
    // }

// Then process as palette color
    final redLut = getPaletteLut(tags, '0028,1201', '0028,1101');
    final greenLut = getPaletteLut(tags, '0028,1202', '0028,1102');
    final blueLut = getPaletteLut(tags, '0028,1203', '0028,1103');

    final image = img.Image(width: width, height: height);
    for (int i = 0; i < width * height; i++) {
      final index = pixelData[i];
      image.setPixelRgba(
        i % width,
        i ~/ width,
        redLut![index],
        greenLut![index],
        blueLut![index],
        255,
      );
    }
    return Uint8List.fromList(img.encodePng(image));
  }

  final int bytesPerSample = bitsAllocated ~/ 8;
  final byteData = Uint8List.fromList(pixelData).buffer.asByteData();

  // Handle compressed formats
  if (transferSyntax == kJpegBaseline8Bit ||
      transferSyntax == kJpegExtended12Bit ||
      transferSyntax == kJpegLosslessNh ||
      transferSyntax == kJpegLosslessNhFirstOrder) {
    // Search for JPEG SOI (start of image) marker 0xFFD8 and EOI 0xFFD9
    final data = Uint8List.fromList(pixelData);

    int startOffset = -1;
    int endOffset = -1;

    for (int i = 0; i < data.length - 1; i++) {
      if (data[i] == 0xFF && data[i + 1] == 0xD8) {
        startOffset = i;
        break;
      }
    }

    for (int i = data.length - 2; i >= 0; i--) {
      if (data[i] == 0xFF && data[i + 1] == 0xD9) {
        endOffset = i + 2;
        break;
      }
    }

    if (startOffset == -1 || endOffset == -1 || endOffset <= startOffset) {
      throw UnsupportedError('Could not locate JPEG stream in pixel data.');
    }

    final jpegData = data.sublist(startOffset, endOffset);
    final decodedImage = img.decodeImage(jpegData);

    if (decodedImage == null) {
      throw UnsupportedError('Could not decode JPEG stream.');
    }

    final pngBytes = img.encodePng(decodedImage);
    return Uint8List.fromList(pngBytes);
  }

  // Handle RLE Lossless compression
  if (transferSyntax == kRleLossless) {
    // RLE compressed data has a 64-byte header followed by segments
    final data = Uint8List.fromList(pixelData);
    if (data.length < 64) {
      throw FormatException('Invalid RLE data - too short for header');
    }

    // Read the header which contains offsets for each segment (16 segments for 16-bit data)
    final header = ByteData.sublistView(data, 0, 64);
    final segmentOffsets =
        List<int>.generate(16, (i) => header.getUint32(i * 4, Endian.little));

    // Determine number of segments actually used (based on bits allocated)
    final segmentsNeeded = (bitsAllocated + 7) ~/ 8;
    if (segmentsNeeded > 16) {
      throw FormatException('Invalid RLE data - too many segments needed');
    }

    // Prepare output buffer
    final output = Uint8List(width * height * segmentsNeeded);

    // Process each segment
    for (int segment = 0; segment < segmentsNeeded; segment++) {
      final startOffset = segmentOffsets[segment];
      final endOffset = segment == segmentsNeeded - 1
          ? data.length
          : segmentOffsets[segment + 1];

      if (startOffset >= endOffset || endOffset > data.length) {
        throw FormatException('Invalid RLE segment offsets');
      }

      int inputPos = startOffset;
      int outputPos = segment; // Interleaved output

      while (inputPos < endOffset && outputPos < output.length) {
        final byte = data[inputPos++];

        if (byte >= 128) {
          // Run-length packet: repeat next byte (257 - count) times
          final count = 257 - byte;
          if (inputPos >= endOffset) {
            throw FormatException('Unexpected end of RLE data');
          }
          final value = data[inputPos++];
          for (int i = 0; i < count && outputPos < output.length; i++) {
            output[outputPos] = value;
            outputPos += segmentsNeeded;
          }
        } else if (byte < 128) {
          // Literal packet: copy next (byte + 1) bytes
          final count = byte + 1;
          if (inputPos + count > endOffset) {
            throw FormatException('Unexpected end of RLE data');
          }
          for (int i = 0; i < count && outputPos < output.length; i++) {
            output[outputPos] = data[inputPos++];
            outputPos += segmentsNeeded;
          }
        }
      }
    }

    if (isMonochrome1 || isMonochrome2) {
      int minPixel = 65535;
      int maxPixel = 0;

      for (int i = 0; i < pixelCount; i++) {
        int value;
        if (segmentsNeeded == 1) {
          value = output[i];
        } else {
          // Combine bytes according to endianness
          final pos = i * segmentsNeeded;
          if (endian == Endian.little) {
            value = output[pos] | (output[pos + 1] << 8);
          } else {
            value = (output[pos] << 8) | output[pos + 1];
          }
        }

        if (pixelRepresentation == 1) {
          value += (1 << (bitsStored - 1)); // shift signed values
        } else {
          value &= (1 << bitsStored) - 1; // mask for unsigned
        }

        if (value < minPixel) minPixel = value;
        if (value > maxPixel) maxPixel = value;
      }

      TagModel? wcTag = tags.where((tag) => tag.getTag() == "0028,1050").isEmpty
          ? null
          : tags.firstWhere((tag) => tag.getTag() == "0028,1050");
      TagModel? wwTag = tags.where((tag) => tag.getTag() == "0028,1051").isEmpty
          ? null
          : tags.firstWhere((tag) => tag.getTag() == "0028,1051");

      int wc = (wcTag != null)
          ? int.tryParse(wcTag.value) ?? ((maxPixel + minPixel) ~/ 2)
          : ((maxPixel + minPixel) ~/ 2);

      int ww = (wwTag != null)
          ? int.tryParse(wwTag.value) ?? (maxPixel - minPixel)
          : (maxPixel - minPixel);

      if (ww <= 0) ww = 1;
      final double windowMin = wc - ww / 2.0;
      final double windowMax = wc + ww / 2.0;

      for (int i = 0; i < pixelCount; i++) {
        int value;
        if (segmentsNeeded == 1) {
          value = output[i];
        } else {
          final pos = i * segmentsNeeded;
          if (endian == Endian.little) {
            value = output[pos] | (output[pos + 1] << 8);
          } else {
            value = (output[pos] << 8) | output[pos + 1];
          }
        }

        if (pixelRepresentation == 1) {
          value += (1 << (bitsStored - 1));
        } else {
          value &= (1 << bitsStored) - 1;
        }

        double normalized;
        if (value <= windowMin) {
          normalized = 0.0;
        } else if (value >= windowMax) {
          normalized = 1.0;
        } else {
          normalized = (value - windowMin) / (windowMax - windowMin);
        }

        int gray = (normalized * 255).round();
        if (isMonochrome1) gray = 255 - gray;
        gray = gray.clamp(0, 255);

        final x = i % width;
        final y = i ~/ width;
        image.setPixelRgba(x, y, gray, gray, gray, 255);
      }
    } else if (isYbrFull && samplesPerPixel == 3 && bitsAllocated == 8) {
      if (planarConfiguration == 0) {
        for (int i = 0; i < pixelCount; i++) {
          final y = output[i * 3].toDouble();
          final cb = output[i * 3 + 1].toDouble();
          final cr = output[i * 3 + 2].toDouble();

          // Convert YCbCr to RGB using ITU-R BT.601
          final r = (y + 1.402 * (cr - 128)).clamp(0, 255).toInt();
          final g = (y - 0.344136 * (cb - 128) - 0.714136 * (cr - 128))
              .clamp(0, 255)
              .toInt();
          final b = (y + 1.772 * (cb - 128)).clamp(0, 255).toInt();

          final xPos = i % width;
          final yPos = i ~/ width;
          image.setPixelRgba(xPos, yPos, r, g, b, 255);
        }
      } else if (planarConfiguration == 1) {
        final planeSize = pixelCount;
        for (int i = 0; i < pixelCount; i++) {
          final y = byteData.getUint8(i);
          final cb = byteData.getUint8(i + planeSize);
          final cr = byteData.getUint8(i + 2 * planeSize);

          final r = (y + 1.402 * (cr - 128)).clamp(0, 255).toInt();
          final g = (y - 0.344136 * (cb - 128) - 0.714136 * (cr - 128))
              .clamp(0, 255)
              .toInt();
          final b = (y + 1.772 * (cb - 128)).clamp(0, 255).toInt();

          final x = i % width;
          final yPos = i ~/ width;
          image.setPixelRgba(x, yPos, r, g, b, 255);
        }
      }

      return Uint8List.fromList(img.encodePng(image));
    } else {
      throw UnsupportedError(
          'Unsupported photometric interpretation: $photometricInterpretation');
    }

    return Uint8List.fromList(img.encodePng(image));
  }

  // Handle uncompressed formats (Implicit/Explicit VR Little/Big Endian)
  if (transferSyntax == kImplicitVrLittleEndian ||
      transferSyntax == kExplicitVrLittleEndian ||
      transferSyntax == kExplicitVrBigEndian) {
    // Existing MONOCHROME1 / MONOCHROME2 handling
    if (isMonochrome1 || isMonochrome2) {
      int minPixel = 65535;
      int maxPixel = 0;

      for (int i = 0; i < pixelCount; i++) {
        int value = (bytesPerSample == 1)
            ? byteData.getUint8(i)
            : (pixelRepresentation == 0
                ? byteData.getUint16(i * bytesPerSample, endian)
                : byteData.getInt16(i * bytesPerSample, endian));

        if (pixelRepresentation == 1) {
          // Signed
          value = byteData.getInt16(i * bytesPerSample, endian);
        } else {
          // Unsigned
          value = byteData.getUint16(i * bytesPerSample, endian);
        }
        value &= (1 << bitsStored) - 1;

        if (value < minPixel) minPixel = value;
        if (value > maxPixel) maxPixel = value;
      }

      TagModel? wcTag = tags.where((tag) => tag.getTag() == "0028,1050").isEmpty
          ? null
          : tags.firstWhere((tag) => tag.getTag() == "0028,1050");
      TagModel? wwTag = tags.where((tag) => tag.getTag() == "0028,1051").isEmpty
          ? null
          : tags.firstWhere((tag) => tag.getTag() == "0028,1051");

      int wc = (wcTag != null)
          ? int.tryParse(wcTag.value) ?? ((maxPixel + minPixel) ~/ 2)
          : ((maxPixel + minPixel) ~/ 2);

      int ww = (wwTag != null)
          ? int.tryParse(wwTag.value) ?? (maxPixel - minPixel)
          : (maxPixel - minPixel);

      if (ww <= 0 || ww > (maxPixel - minPixel)) {
        ww = maxPixel - minPixel;
      }
      if (wc < minPixel || wc > maxPixel) {
        wc = (maxPixel + minPixel) ~/ 2;
      }

      if (ww <= 0) ww = 1;
      final double windowMin = wc - ww / 2.0;
      final double windowMax = wc + ww / 2.0;

      for (int i = 0; i < pixelCount; i++) {
        int value = (bytesPerSample == 1)
            ? byteData.getUint8(i)
            : (pixelRepresentation == 0
                ? byteData.getUint16(i * bytesPerSample, endian)
                : byteData.getInt16(i * bytesPerSample, endian));

        if (pixelRepresentation == 1) {
          // Signed
          value = byteData.getInt16(i * bytesPerSample, endian);
        } else {
          // Unsigned
          value = byteData.getUint16(i * bytesPerSample, endian);
        }
        value &= (1 << bitsStored) - 1;

        double normalized;
        if (value <= windowMin) {
          normalized = 0.0;
        } else if (value >= windowMax) {
          normalized = 1.0;
        } else {
          normalized = (value - windowMin) / (windowMax - windowMin);
        }

        int gray = (normalized * 255).round();
        if (isMonochrome1) gray = 255 - gray;
        gray = gray.clamp(0, 255);

        final x = i % width;
        final y = i ~/ width;
        image.setPixelRgba(x, y, gray, gray, gray, 255);
      }
    } else if (isRGB && samplesPerPixel == 3 && bitsAllocated == 8) {
      if (planarConfiguration == 0) {
        // RGBRGBRGB... format
        for (int i = 0; i < pixelCount; i++) {
          final r = byteData.getUint8(i * 3);
          final g = byteData.getUint8(i * 3 + 1);
          final b = byteData.getUint8(i * 3 + 2);

          final x = i % width;
          final y = i ~/ width;
          image.setPixelRgba(x, y, r, g, b, 255);
        }
      } else if (planarConfiguration == 1) {
        // RRR...GGG...BBB... format
        final planeSize = width * height;
        for (int i = 0; i < pixelCount; i++) {
          final r = byteData.getUint8(i);
          final g = byteData.getUint8(i + planeSize);
          final b = byteData.getUint8(i + 2 * planeSize);

          final x = i % width;
          final y = i ~/ width;
          image.setPixelRgba(x, y, r, g, b, 255);
        }
      }
    } else {
      throw UnsupportedError(
          'Unsupported photometric interpretation: $photometricInterpretation');
    }

    return Uint8List.fromList(img.encodePng(image));
  }

  throw UnsupportedError('Unsupported transfer syntax: $transferSyntax');
}

List<int>? getPaletteLut(
  List<TagModel> tags,
  String dataTagStr,
  String descriptorTagStr,
) {
  final descriptorTag = tags.firstWhere(
    (t) => t.getTag().toLowerCase() == descriptorTagStr.toLowerCase(),
    orElse: () => TagModel(
      group: '',
      element: '',
      vr: '',
      value: '',
      tagDescription: '',
      valueBytes: [],
    ),
  );

  final dataTag = tags.firstWhere(
    (t) => t.getTag().toLowerCase() == dataTagStr.toLowerCase(),
    orElse: () => TagModel(
      group: '',
      element: '',
      vr: '',
      value: '',
      tagDescription: '',
      valueBytes: [],
    ),
  );

  if (dataTag.valueBytes.isEmpty) {
    if (kDebugMode) {
      print('❌ No LUT data in $dataTagStr');
    }
    return null;
  }

  int numberOfEntries = 0;
  int bitsPerEntry = 8;

  if (descriptorTag.valueBytes.length >= 6) {
    final bd =
        ByteData.sublistView(Uint8List.fromList(descriptorTag.valueBytes));
    numberOfEntries = bd.getUint16(0, Endian.little);
    bitsPerEntry = bd.getUint16(4, Endian.little);
  } else if (descriptorTag.value.contains('\\')) {
    final parts = descriptorTag.value.split('\\');
    if (parts.length >= 3) {
      numberOfEntries = int.tryParse(parts[0]) ?? 0;
      bitsPerEntry = int.tryParse(parts[2]) ?? 8;
    }
  } else {
    if (kDebugMode) {
      print(
          '❌ Invalid descriptor value for $descriptorTagStr: ${descriptorTag.value}');
    }
    return null;
  }

  if (numberOfEntries == 0) {
    if (kDebugMode) {
      print('❌ Descriptor has 0 entries for $descriptorTagStr');
    }
    return null;
  }

  final bytes = Uint8List.fromList(dataTag.valueBytes);
  final lut = <int>[];
  final bd = ByteData.sublistView(bytes);

  if (bitsPerEntry <= 8) {
    for (int i = 0; i < numberOfEntries && i < bytes.length; i++) {
      lut.add(bytes[i]);
    }
  } else {
    for (int i = 0; i < numberOfEntries && i * 2 + 1 < bytes.length; i++) {
      // LUT entries might be 16-bit, shift right 8 bits to scale to 8-bit color
      lut.add(bd.getUint16(i * 2, Endian.little) >> 8);
    }
  }

  return lut;
}

Future<Uint8List> _decodeRLE(
    List<int> compressedData, int expectedLength) async {
  final input = Uint8List.fromList(compressedData);
  final output = Uint8List(expectedLength);
  int outPos = 0;
  int inPos = 64; // Skip 64-byte header

  while (inPos < input.length && outPos < expectedLength) {
    final byte = input[inPos++];

    if (byte > 128) {
      // Run-length packet
      final count = 257 - byte;
      if (inPos >= input.length) break;
      final value = input[inPos++];
      for (int i = 0; i < count; i++) {
        if (outPos >= expectedLength) break;
        output[outPos++] = value;
      }
    } else if (byte < 128) {
      // Literal packet
      final count = byte + 1;
      for (int i = 0; i < count; i++) {
        if (inPos >= input.length || outPos >= expectedLength) break;
        output[outPos++] = input[inPos++];
      }
    }
  }

  return output;
}
