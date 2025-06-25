import 'package:get/get.dart';

class AboutModel {
  String title;
  List<String> description;

  AboutModel(this.title, this.description);

  factory AboutModel.toJson(Map<String, dynamic> json) {
    return AboutModel(json["title"], json["description"]);
  }
}

class AboutViewmodel extends GetxController {
  var data = <AboutModel>[].obs;
  var itemClicked = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Map<String, dynamic>> datas = [
      {
        "title": "About Us",
        "description": [
          "Research Center Human Centric Engineering (RC HUMIC), merupakan pusat penelitian Telkom University yang berfokus pada pengembangkan rekayasa teknologi yang berkaitan dengan dukungan aktivitas manusia sehari-hari seperti bidang komputasi, informatika, elektronika, robotik, mekanikal, dan teknik biomedis.",
        ],
      },
      {
        "title": "MISI",
        "description": [
          "Becoming the science and technology excellent center in the field of embedded sensor systems to support biomedical applications based on the Internet of Things (IoT).",
          "Becoming the science and technology excellent center on development remote health monitoring systems based on Internet of Things (IoT).",
          "Becoming the science and technology excellent center on Big Data Analytic.",
          "Becoming the science and technology excellent center on health development of Information and Communication Technology (ICT).",
        ],
      },
      {
        "title": "VISI",
        "description": [
          "To become an excellent research center in the field of engineering to improve the human health and prosperity",
        ],
      },
    ];

    data.value =
        datas
            .map(
              (e) =>
                  AboutModel(e["title"], List<String>.from(e["description"])),
            )
            .toList();
  }

  void clickItem(bool isRight) {
    if (isRight) {
      if (itemClicked.value >= data.length - 1) {
        itemClicked.value = 0;
      } else {
        itemClicked.value++;
      }
    } else {
      if (itemClicked.value <= 0) {
        itemClicked.value = data.length - 1;
      } else {
        itemClicked.value--;
      }
    }
  }
}
