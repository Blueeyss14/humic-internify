class PositionModel {
  String jobTitle;
  String image;
  bool status;
  String location;
  String type;
  String paidStatus;
  String category;

  PositionModel(
    this.jobTitle,
    this.image,
    this.location,
    this.status,
    this.type,
    this.paidStatus,
    this.category,
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
    );
  }
}
