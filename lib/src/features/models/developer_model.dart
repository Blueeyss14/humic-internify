class DeveloperModel {
  String name;
  String image;
  String position;
  String link;

  DeveloperModel(this.name, this.image, this.position, this.link);

  factory DeveloperModel.fromJson(Map<String, dynamic> json) {
    return DeveloperModel(
      json['name'] ?? '',
      json['image'] ?? '',
      json['position'] ?? '',
      json['link'] ?? '',
    );
  }
}
