class PositionModel {
  String jobTitle;
  String image;
  String status;
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

  factory PositionModel.fromJson(Map<String, dynamic> json) {
    return PositionModel(
      json['posisi'] ?? '',
      json['image_path'] ?? '',
      json['lokasi'] ?? '',
      json['status_lowongan'] ?? '',
      json['lokasi'] ?? '',
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
