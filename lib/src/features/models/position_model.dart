class PositionModel {
  String jobTitle;
  String image;

  PositionModel(this.jobTitle, this.image);

  factory PositionModel.toJson(Map<String, dynamic> json) {
    return PositionModel(json['jobTitle'], json['image']);
  }
}
