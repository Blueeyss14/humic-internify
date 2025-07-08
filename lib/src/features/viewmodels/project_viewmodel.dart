import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProjectModel {
  int id;
  String image;
  String title;
  String deskripsi;

  ProjectModel({
    required this.id,
    required this.image,
    required this.title,
    required this.deskripsi,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    final rawHtml = json["deskripsi"] ?? "";
    final document = html_parser.parse(rawHtml);
    final String cleanText = document.body?.text ?? "";

    return ProjectModel(
      id: json["id"],
      image: json["image_path"] ?? "",
      title: json["nama_project"] ?? "",
      deskripsi: cleanText.trim(),
    );
  }
}

class ProjectViewmodel extends GetxController {
  var data = <ProjectModel>[].obs;
  var isLoading = false.obs;
  var error = "".obs;

  var currentPage = 0.obs;
  final int itemsPerPage = 2;
  var selectedItem = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      error.value = "";

      final response = await http.get(
        Uri.parse('${dotenv.env['API_BASE_URL']}/hasil-research-api/get'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        data.value = jsonData.map((e) => ProjectModel.fromJson(e)).toList();
        print("Data berhasil slurd: ${data.length} item");
      } else {
        error.value = "Failed: ${response.statusCode}";
        print("Gagal fetch coy: ${response.body}");
      }
    } catch (e) {
      error.value = e.toString();
      print("Exception fetch: $e");
    } finally {
      isLoading.value = false;
    }
  }

  List<ProjectModel> get paginatedData {
    int start = currentPage.value * itemsPerPage;
    int end = start + itemsPerPage;
    if (end > data.length) end = data.length;
    return data.sublist(start, end);
  }

  void nextPage() {
    if ((currentPage.value + 1) * itemsPerPage < data.length) {
      currentPage.value++;
    }
  }

  void prevPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  void selectItem(int index) {
    selectedItem.value = currentPage.value * itemsPerPage + index;
  }
}
