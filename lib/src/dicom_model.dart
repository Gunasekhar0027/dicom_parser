import 'dart:typed_data';

import 'tag_model.dart';

class DICOMModel {
  List<TagModel> tags;
  Uint8List? imageBytes;

  DICOMModel({
    required this.tags,
    required this.imageBytes,
  });

  int getInstanceNumber() {
    String instanceNumberTag = "0020,0013";

    final tag = tags.cast<TagModel?>().firstWhere(
          (tag) => tag?.getTag() == instanceNumberTag,
          orElse: () => null,
        );

    return tag == null ? -1 : int.tryParse(tag.value) ?? -1;
  }

  int getSeriesNumber() {
    String seriesNumberTag = "0020,0011";

    final tag = tags.cast<TagModel?>().firstWhere(
          (tag) => tag?.getTag() == seriesNumberTag,
          orElse: () => null,
        );

    return tag == null ? -1 : int.tryParse(tag.value) ?? -1;
  }

  String? getModality() {
    const modalityTag = "0008,0060";

    final tag = tags.cast<TagModel?>().firstWhere(
          (tag) => tag?.getTag() == modalityTag,
          orElse: () => null,
        );

    return tag?.value;
  }

  String? getSeriesDescription() {
    const seriesDescriptionTag = "0008,103e";

    final tag = tags.cast<TagModel?>().firstWhere(
          (tag) => tag?.getTag() == seriesDescriptionTag,
          orElse: () => null,
        );

    return tag?.value;
  }

  String? getPatientName() {
    const patientNameTag = "0010,0010";

    final tag = tags.cast<TagModel?>().firstWhere(
          (tag) => tag?.getTag() == patientNameTag,
          orElse: () => null,
        );

    return tag?.value;
  }

  String? getPatientSex() {
    const patientSexTag = "0010,0040";

    final tag = tags.cast<TagModel?>().firstWhere(
          (tag) => tag?.getTag() == patientSexTag,
          orElse: () => null,
        );

    return tag?.value;
  }
}
