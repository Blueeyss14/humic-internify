/*

import 'package:get/get.dart';

class ProjectModel {
  String image;
  String title;

  ProjectModel(this.image, this.title);

  factory ProjectModel.toJson(Map<String, dynamic> json) {
    return ProjectModel(json["image"], json["description"]);
  }
}

class ProjectViewmodel extends GetxController {
  var data = <ProjectModel>[].obs;

  var currentPage = 0.obs;
  final int itemsPerPage = 2;

  var selectedItem = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    List<Map<String, dynamic>> datas = [
      {
        "image": "assets/images/bg1.png",
        "title":
            "Produk Akhir Magang: Solusi IoT untuk Pemantauan Kesehatan yang Efektif dan Real-Time",
      },
      {"image": "assets/images/bg1.png", "title": "test2"},
      {"image": "assets/images/bg2.png", "title": "test3"},
      {"image": "assets/images/bg2.png", "title": "test4"},
      {"image": "assets/images/bg1.png", "title": "test5"},
    ];

    data.value =
        datas.map((e) => ProjectModel(e["image"], e["title"])).toList();
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
*/

//Local Test

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProjectModel {
  String image;
  String title;
  String deskripsi;

  ProjectModel({
    required this.image,
    required this.title,
    required this.deskripsi,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      image: json["image_path"] ?? "",
      title: json["nama_project"] ?? "",
      deskripsi: json["deskripsi"] ?? "",
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
        // Uri.parse('http://localhost:3001/hasil-research-api/get'),
        // Uri.parse('http://192.168.18.186:3001/hasil-research-api/get'),
        Uri.parse(
          'https://internify-backend-ckdrhfhzbahnesdm.indonesiacentral-01.azurewebsites.net/hasil-research-api/get',
        ),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        data.value = jsonData.map((e) => ProjectModel.fromJson(e)).toList();
      } else {
        error.value = "Failed to load data. Status: ${response.statusCode}";
      }
    } catch (e) {
      error.value = e.toString();
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
