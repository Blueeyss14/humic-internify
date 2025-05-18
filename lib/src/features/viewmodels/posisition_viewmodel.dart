import 'package:get/get.dart';
import 'package:humic_internify/src/features/models/position_model.dart';

class PosisitionViewmodel extends GetxController {
  var data = <PositionModel>[].obs;

  var itemCount = 0.obs;
  final int maxPerRow = 2;
  var indexPage = 0.obs;

  var filteredData = <PositionModel>[].obs;
  var activeCategory = ''.obs;
  List<List<int>> get groupedItems {
    List<List<int>> groups = [];
    for (int i = 0; i < itemCount.value; i += maxPerRow) {
      int end =
          (i + maxPerRow < itemCount.value) ? i + maxPerRow : itemCount.value;
      groups.add(List.generate(end - i, (j) => i + j));
    }
    return groups;
  }

  @override
  void onInit() {
    super.onInit();
    fetchPositionData();
  }

  void fetchPositionData() {
    List<Map<String, dynamic>> datas = [
      {
        "jobTitle": "Backend Developer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Software Engineer",
        "status": true,
        "description":
            "Bertanggung jawab membantu tim desain dalam merancang antarmuka pengguna (UI) yang intuitif dan pengalaman pengguna (UX) yang optimal untuk aplikasi web maupun mobile, melalui wireframe, prototipe, dan desain visual.",
        "qualification": {
          "Mahasiswa Universitas Telkom (Semua Jurusan)",
          "Kreatif dalam mendesain antarmuka dan pengalaman pengguna",
          "Menguasai pembuatan prototipe menggunakan Figma dan Adobe Photoshop",
          "Memiliki kemampuan ilustasi dan desain grafis",
          "Memahami user research, wireframing, dan usability testing",
        },
        "benefit": {
          "Sertifikasi Magang",
          "Professional Networking",
          "Self Improvement",
          "Uang magang jika masuk ke dalam project",
        },
      },
      {
        "jobTitle": "Frontend Developer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Software Engineer",
        "status": true,

        "description":
            "Bertanggung jawab membantu tim desain dalam merancang antarmuka pengguna (UI) yang intuitif dan pengalaman pengguna (UX) yang optimal untuk aplikasi web maupun mobile, melalui wireframe, prototipe, dan desain visual.",
        "qualification": {
          "Mahasiswa Universitas Telkom (Semua Jurusan)",
          "Kreatif dalam mendesain antarmuka dan pengalaman pengguna",
          "Menguasai pembuatan prototipe menggunakan Figma dan Adobe Photoshop",
          "Memiliki kemampuan ilustasi dan desain grafis",
          "Memahami user research, wireframing, dan usability testing",
        },
        "benefit": {
          "Sertifikasi Magang",
          "Professional Networking",
          "Self Improvement",
          "Uang magang jika masuk ke dalam project",
        },
      },
      {
        "jobTitle": "UI/UX Designer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Design",
        "status": false,
        "description":
            "Bertanggung jawab membantu tim desain dalam merancang antarmuka pengguna (UI) yang intuitif dan pengalaman pengguna (UX) yang optimal untuk aplikasi web maupun mobile, melalui wireframe, prototipe, dan desain visual.",
        "qualification": {
          "Mahasiswa Universitas Telkom (Semua Jurusan)",
          "Kreatif dalam mendesain antarmuka dan pengalaman pengguna",
          "Menguasai pembuatan prototipe menggunakan Figma dan Adobe Photoshop",
          "Memiliki kemampuan ilustasi dan desain grafis",
          "Memahami user research, wireframing, dan usability testing",
        },
        "benefit": {
          "Sertifikasi Magang",
          "Professional Networking",
          "Self Improvement",
          "Uang magang jika masuk ke dalam project",
        },
      },
      {
        "jobTitle": "AI Developer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Data/AI",
        "status": true,
        "description":
            "Bertanggung jawab membantu tim desain dalam merancang antarmuka pengguna (UI) yang intuitif dan pengalaman pengguna (UX) yang optimal untuk aplikasi web maupun mobile, melalui wireframe, prototipe, dan desain visual.",
        "qualification": {
          "Mahasiswa Universitas Telkom (Semua Jurusan)",
          "Kreatif dalam mendesain antarmuka dan pengalaman pengguna",
          "Menguasai pembuatan prototipe menggunakan Figma dan Adobe Photoshop",
          "Memiliki kemampuan ilustasi dan desain grafis",
          "Memahami user research, wireframing, dan usability testing",
        },
        "benefit": {
          "Sertifikasi Magang",
          "Professional Networking",
          "Self Improvement",
          "Uang magang jika masuk ke dalam project",
        },
      },
      {
        "jobTitle": "Content Writer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Design",
        "status": false,
        "description":
            "Bertanggung jawab membantu tim desain dalam merancang antarmuka pengguna (UI) yang intuitif dan pengalaman pengguna (UX) yang optimal untuk aplikasi web maupun mobile, melalui wireframe, prototipe, dan desain visual.",
        "qualification": {
          "Mahasiswa Universitas Telkom (Semua Jurusan)",
          "Kreatif dalam mendesain antarmuka dan pengalaman pengguna",
          "Menguasai pembuatan prototipe menggunakan Figma dan Adobe Photoshop",
          "Memiliki kemampuan ilustasi dan desain grafis",
          "Memahami user research, wireframing, dan usability testing",
        },
        "benefit": {
          "Sertifikasi Magang",
          "Professional Networking",
          "Self Improvement",
          "Uang magang jika masuk ke dalam project",
        },
      },
      {
        "jobTitle": "Data Scientist",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Data/AI",
        "status": true,
        "description":
            "Bertanggung jawab membantu tim desain dalam merancang antarmuka pengguna (UI) yang intuitif dan pengalaman pengguna (UX) yang optimal untuk aplikasi web maupun mobile, melalui wireframe, prototipe, dan desain visual.",
        "qualification": {
          "Mahasiswa Universitas Telkom (Semua Jurusan)",
          "Kreatif dalam mendesain antarmuka dan pengalaman pengguna",
          "Menguasai pembuatan prototipe menggunakan Figma dan Adobe Photoshop",
          "Memiliki kemampuan ilustasi dan desain grafis",
          "Memahami user research, wireframing, dan usability testing",
        },
        "benefit": {
          "Sertifikasi Magang",
          "Professional Networking",
          "Self Improvement",
          "Uang magang jika masuk ke dalam project",
        },
      },
      {
        "jobTitle": "Multimedia Designer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Multimedia",
        "status": false,
        "description":
            "Bertanggung jawab membantu tim desain dalam merancang antarmuka pengguna (UI) yang intuitif dan pengalaman pengguna (UX) yang optimal untuk aplikasi web maupun mobile, melalui wireframe, prototipe, dan desain visual.",
        "qualification": {
          "Mahasiswa Universitas Telkom (Semua Jurusan)",
          "Kreatif dalam mendesain antarmuka dan pengalaman pengguna",
          "Menguasai pembuatan prototipe menggunakan Figma dan Adobe Photoshop",
          "Memiliki kemampuan ilustasi dan desain grafis",
          "Memahami user research, wireframing, dan usability testing",
        },
        "benefit": {
          "Sertifikasi Magang",
          "Professional Networking",
          "Self Improvement",
          "Uang magang jika masuk ke dalam project",
        },
      },
      {
        "jobTitle": "Mobile Developer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Software Engineer",
        "status": false,
        "description":
            "Bertanggung jawab membantu tim desain dalam merancang antarmuka pengguna (UI) yang intuitif dan pengalaman pengguna (UX) yang optimal untuk aplikasi web maupun mobile, melalui wireframe, prototipe, dan desain visual.",
        "qualification": {
          "Mahasiswa Universitas Telkom (Semua Jurusan)",
          "Kreatif dalam mendesain antarmuka dan pengalaman pengguna",
          "Menguasai pembuatan prototipe menggunakan Figma dan Adobe Photoshop",
          "Memiliki kemampuan ilustasi dan desain grafis",
          "Memahami user research, wireframing, dan usability testing",
        },
        "benefit": {
          "Sertifikasi Magang",
          "Professional Networking",
          "Self Improvement",
          "Uang magang jika masuk ke dalam project",
        },
      },
    ];

    data.value = datas.map((d) => PositionModel.toJson(d)).toList();
    filteredData.value = data;
    itemCount.value = data.length;
  }

  ///index page
  void selectPage(int index) {
    indexPage.value = index;
  }

  ///filter item
  void clickToFilterItem(String category) {
    if (activeCategory.value.toLowerCase() == category.toLowerCase()) {
      activeCategory.value = '';
      resetFilter();
    } else {
      activeCategory.value = category;
      filteredData.value =
          data
              .where(
                (item) => item.category.toLowerCase() == category.toLowerCase(),
              )
              .toList();
      itemCount.value = filteredData.length;
    }
  }

  void resetFilter() {
    filteredData.value = data;
    itemCount.value = data.length;
  }
}
