# dicom_parser - DICOM Parser in Flutter (Dart)

`dicom_parser` is a pure Dart-based package for parsing and rendering DICOM medical images across mobile, web, and desktop platforms — without relying on any native C/C++ libraries.

Fully implemented using Flutter, it enables seamless integration into healthcare and medical imaging applications. Use `dicom_parser` to effortlessly build DICOM viewers for all platforms.


## Platform Support

| Android |  iOS  | MacOS |  Web  | Linux | Windows |
| :-----: | :---: | :---: | :---: | :---: | :-----: |
|✅|✅|✅|✅|✅|✅|

![dicom_parser](https://gunasekhar0027.github.io/dicom_parser/files/preview.png)


## Features

- 📂 Parse DICOM files
- 🔄 Support for various Transfer Syntaxes
- 🎨 Support for multiple Photometric Interpretations
- 💻 Works on Android, iOS, Web, macOS, Linux, and Windows
- ❌ No native dependencies — 100% Dart

## Supported Transfer Syntaxes

Supports a wide range of DICOM Transfer Syntax UIDs for uncompressed and compressed image data:

- `1.2.840.10008.1.2` — Implicit VR Little Endian
- `1.2.840.10008.1.2.1` — Explicit VR Little Endian
- `1.2.840.10008.1.2.2` — Explicit VR Big Endian
- `1.2.840.10008.1.2.5` — RLE Lossless
- `1.2.840.10008.1.2.4.50` — JPEG Baseline (8-bit)
- `1.2.840.10008.1.2.4.51` — JPEG Extended (12-bit)
- `1.2.840.10008.1.2.4.57` — JPEG Lossless (Non-Hierarchical)
- `1.2.840.10008.1.2.4.70` — JPEG Lossless (First-Order Prediction)
- `1.2.840.10008.1.2.1.98` — Deflated Explicit VR Little Endian


## Supported Photometric Interpretations

- `MONOCHROME1` — Inverted grayscale (0 = white)
- `MONOCHROME2` — Standard grayscale (0 = black)
- `RGB` — Color images
- `PALETTE COLOR` — Indexed color with LUTs
- `YBR_FULL` — YUV color encoding (JPEG-related)

## Usage

```dart
import 'package:dicom_parser/dicom_parser.dart';
import 'dart:typed_data';

Uint8List? fileBytes;

// Read DICOM file bytes into fileBytes

var dicomParser = DICOMParser();
DICOMModel? dicomModel =
    await dicomParser.parseDICOMFile(fileBytes);
if (dicomModel != null) {
    // Parsed tags from DICOM File
    List<TagModel> tags = dicomModel.tags;
    
    // Parsed Image as Uint8List that can be  used in Image.memory() to view in flutter widget
    Uint8List? parsedImageBytes = dicomModel.imageBytes;
    
    // Get Modality of DICOM File
    String? modality = dicomModel.getModality();
}
```


**Developed by:** Gunasekhar Athuluri  
**Contact:** [gunasekhar.athuluri@gmail.com](mailto:gunasekhar.athuluri@gmail.com)