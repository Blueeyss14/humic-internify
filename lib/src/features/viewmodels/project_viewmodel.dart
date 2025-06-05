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
      {
        "image": "assets/images/bg1.png",
        "title":
            "Produk Akhir Magang: Solusi IoT untuk Pemantauan Kesehatan yang Efektif dan Real-Time",
      },
      {
        "image": "assets/images/bg2.png",
        "title":
            "Produk Akhir Magang: Solusi IoT untuk Pemantauan Kesehatan yang Efektif dan Real-Time",
      },
      {
        "image": "assets/images/bg2.png",
        "title": "Pengembangan Aplikasi Penerimaan Magang Humic",
      },
      {
        "image": "assets/images/bg1.png",
        "title": "Pengembangan Aplikasi Penerimaan Magang Humic",
      },
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
}
