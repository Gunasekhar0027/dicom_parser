class TagModel {
  String group;
  String element;
  String vr;
  String value;
  String tagDescription;
  List<int> valueBytes;

  TagModel({
    required this.group,
    required this.element,
    required this.vr,
    required this.value,
    required this.tagDescription,
    required this.valueBytes,
  });

  getTag() {
    return "$group,$element";
  }
}
