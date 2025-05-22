import 'package:get/get.dart';

class ProjectModel {
  String image;
  String description;

  ProjectModel(this.image, this.description);

  factory ProjectModel.toJson(Map<String, dynamic> json) {
    return ProjectModel(json["image"], json["description"]);
  }
}

class ProjectViewmodel extends GetxController {
  var data = <ProjectModel>[].obs;

  var currentPage = 0.obs;
  final int itemsPerPage = 2;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    List<Map<String, dynamic>> datas = [
      {
        "image": "assets/images/bg1.png",
        "description": "Pengembangan Aplikasi Penerimaan Magang Humic",
      },
      {
        "image": "assets/images/bg1.png",
        "description": "Pengembangan Aplikasi Penerimaan Magang Humic",
      },
      {
        "image": "assets/images/bg2.png",
        "description": "Pengembangan Aplikasi Penerimaan Magang Humic",
      },
      {
        "image": "assets/images/bg2.png",
        "description": "Pengembangan Aplikasi Penerimaan Magang Humic",
      },
      {
        "image": "assets/images/bg1.png",
        "description": "Pengembangan Aplikasi Penerimaan Magang Humic",
      },
    ];

    data.value =
        datas.map((e) => ProjectModel(e["image"], e["description"])).toList();
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
}
