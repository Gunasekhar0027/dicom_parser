class TagModel {
  String group;
  String element;
  String vr;
  String value;
  String tagDescription;
  List<int> valueBytes;
  List<TagModel> childTags;

  TagModel({
    required this.group,
    required this.element,
    required this.vr,
    required this.value,
    required this.tagDescription,
    required this.valueBytes,
    required this.childTags,
  });

  getTag() {
    return "$group,$element";
  }
}
