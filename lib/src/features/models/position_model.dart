class PositionModel {
  String jobTitle;
  String image;
  bool status;
  String location;
  String type;
  String paidStatus;
  String category;
  String description;
  List<String> qualification;
  List<String> benefit;

  PositionModel(
    this.jobTitle,
    this.image,
    this.location,
    this.status,
    this.type,
    this.paidStatus,
    this.category,
    this.description,
    this.qualification,
    this.benefit,
  );

  factory PositionModel.toJson(Map<String, dynamic> json) {
    return PositionModel(
      json['jobTitle'] ?? '',
      json['image'] ?? '',
      json['location'] ?? '',
      json['status'] ?? false,
      json['type'] ?? '',
      json['paidStatus'] ?? '',
      json['category'] ?? '',
      json['description'] ?? '',
      List<String>.from(json['qualification'] ?? []),
      List<String>.from(json['benefit'] ?? []),
    );
  }
}
