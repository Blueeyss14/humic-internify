class PositionModel {
  String id;
  String jobTitle;
  String image;
  String status;
  String location;
  String paidStatus;
  String category;
  String description;
  List<String> qualification;
  List<String> benefit;

  PositionModel(
    this.id,
    this.jobTitle,
    this.image,
    this.location,
    this.status,
    this.paidStatus,
    this.category,
    this.description,
    this.qualification,
    this.benefit,
  );

  factory PositionModel.fromJson(Map<String, dynamic> json) {
    return PositionModel(
      json['id']?.toString() ?? '',
      json['posisi'] ?? '',
      json['image_path'] ?? '',
      json['lokasi'] ?? '',
      json['status_lowongan'] ?? '',
      json['paid'] ?? '',
      json['kelompok_peminatan'] ?? '',
      json['jobdesk'] ?? '',
      // List<String>.from(json['kualifikasi'] ?? []),
      // List<String>.from(json['benefit'] ?? []),
      [json['kualifikasi']?.toString() ?? ''],
      [json['benefit']?.toString() ?? ''],
    );
  }
}
