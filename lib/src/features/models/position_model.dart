// import 'package:html/parser.dart' as html_parser;

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
    // final rawHtml = json["jobdesk"] ?? "";
    // final document = html_parser.parse(rawHtml);
    // final String cleanText = document.body?.text ?? "";
    // final cleaned = cleanText.replaceAll('Powered by Froala Editor', '').trim();
    final rawHtml = json["jobdesk"] ?? '';
    final cleaned =
        rawHtml
            .replaceAll(
              RegExp(
                r'<[^>]+>([^<]*froala[^<]*)<\/[^>]+>',
                caseSensitive: false,
              ),
              '',
            )
            .replaceAll(
              RegExp(
                r'<[^>]+>([^<]*Powered[^<]*)<\/[^>]+>',
                caseSensitive: false,
              ),
              '',
            )
            .replaceAll(RegExp(r'froala', caseSensitive: false), '')
            .replaceAll(RegExp(r'\s{2,}'), ' ')
            .trim();

    return PositionModel(
      json['id']?.toString() ?? '',
      json['posisi'] ?? '',
      json['image_path'] ?? '',
      json['lokasi'] ?? '',
      json['status_lowongan'] ?? '',
      json['paid'] ?? '',
      json['kelompok_peminatan'] ?? '',
      cleaned,
      // List<String>.from(json['kualifikasi'] ?? []),
      // List<String>.from(json['benefit'] ?? []),
      [json['kualifikasi']?.toString() ?? ''],
      [json['benefit']?.toString() ?? ''],
    );
  }
}
