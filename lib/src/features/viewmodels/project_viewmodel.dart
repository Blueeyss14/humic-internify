import 'package:flutter/services.dart';
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
    initData();
  }

  void initData() async {
    final token = await loginAndGetToken();
    if (token != null) {
      await addData(token);
      await fetchData();
    } else {
      print("Login failed, token null");
    }
  }

  Future<String?> loginAndGetToken() async {
    try {
      final response = await http.post(
        Uri.parse(
          'https://internify-backend-ckdrhfhzbahnesdm.indonesiacentral-01.azurewebsites.net/auth-api/login',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': 'admin.test@gmail.com',
          'password': '12345678',
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Login sukses");
        return data['token'];
      } else {
        print("Login gagal: ${response.statusCode}");
        print("Body: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception login: $e");
      return null;
    }
  }

  Future<void> addData(String token) async {
    try {
      var uri = Uri.parse(
        'https://internify-backend-ckdrhfhzbahnesdm.indonesiacentral-01.azurewebsites.net/hasil-research-api/add',
      );

      var request = http.MultipartRequest('POST', uri);
      request.headers['Authorization'] = 'Bearer $token';

      request.fields['nama_project'] = 'Project Dummy Flutter';
      request.fields['deskripsi'] = 'Deskripsi dummy tanpa UI';

      final bytes = await rootBundle.load('assets/images/dummy.jpg');
      final imageData = bytes.buffer.asUint8List();

      request.files.add(
        http.MultipartFile.fromBytes('image', imageData, filename: 'dummy.jpg'),
      );

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print("Data berhasil ditambahkan");
      } else {
        print("Gagal tambah data: ${response.statusCode}");
        print("Body: ${response.body}");
      }
    } catch (e) {
      print("Exception POST multipart: $e");
    }
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      error.value = "";

      final response = await http.get(
        Uri.parse(
          'https://internify-backend-ckdrhfhzbahnesdm.indonesiacentral-01.azurewebsites.net/hasil-research-api/get',
        ),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        data.value = jsonData.map((e) => ProjectModel.fromJson(e)).toList();
        print("Data berhasil di-fetch: ${data.length} item");
      } else {
        error.value = "Failed: ${response.statusCode}";
        print("Gagal fetch: ${response.body}");
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
