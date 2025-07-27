import 'dart:typed_data';

import 'src/dicom.dart';
import 'src/dicom_model.dart';

export 'src/dicom_model.dart';
export 'src/tag_model.dart';

class DICOMParser {
  DICOMParser._internal();

  static final DICOMParser _instance = DICOMParser._internal();

  factory DICOMParser() => _instance;

  Future<DICOMModel?> parseDICOMFile(Uint8List? dicomFileBytes) async {
    DICOMModel? dicomModel;
    if (dicomFileBytes != null) {
      try {
        dicomModel = await parseDICOM(dicomFileBytes);
        return dicomModel;
      } catch (_) {
        return null;
      }
    }
    return null;
  }
}
