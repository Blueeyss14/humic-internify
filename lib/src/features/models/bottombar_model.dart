class BottombarModel {
  String icon;
  String label;

  BottombarModel(this.icon, this.label);

  factory BottombarModel.fromJson(Map<String, dynamic> json) {
    return BottombarModel(json["Icon"], json["Label"]);
  }
}
