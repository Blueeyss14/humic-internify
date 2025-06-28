class PartnershipModel {
  int id;
  String name;
  String image;

  PartnershipModel(this.id, this.name, this.image);

  factory PartnershipModel.fromJson(Map<String, dynamic> json) {
    return PartnershipModel(
      json['id'] ?? 0,
      json['nama_partner'] ?? '',
      json['image_path'] ?? '',
    );
  }
}
