import 'package:get/get.dart';

class FeedbackModel {
  String feedback;
  String reply;

  FeedbackModel(this.feedback, this.reply);

  factory FeedbackModel.toJson(Map<String, dynamic> json) {
    return FeedbackModel(json["feedback"], json["reply"]);
  }
}

class FeedbackViewmodel extends GetxController {
  var feedback = <FeedbackModel>[].obs;
  var selectedIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeedback();
  }

  Future<void> fetchFeedback() async {
    List<Map<String, dynamic>> datas = [
      {
        "feedback": "Bagaimana cara magang disini?",
        "reply":
            "Untuk magang di sini, kamu bisa klik tombol \"Lowongan\". Setelah itu, pilih lowongan magang yang kamu inginkan. Agar lebih spesifik, kamu juga bisa memfilter lowongan sesuai minat kamu dengan menekan tombol \"Filter\", lalu pilih kategori magang yang sesuai.",
      },

      {
        "feedback": "Apakah saya bisa melamar lebih dari satu lowongan?",
        "reply": "Tidak Bisa, Hanya Bisa Melamar 1 Lowongan.",
      },

      {
        "feedback":
            "Bagaimana saya tahu jika lamaran saya diterima atau ditolak?",
        "reply":
            "Sistem Akan Mengirimkan Pesan Diterima/Ditolak Ke Email Anda.",
      },

      {
        "feedback": "Apakah data pribadi saya aman?",
        "reply":
            "Data Pribadi Dipastikan Aman, Sistem Ini Memiliki Admin Dashboard.",
      },
    ];

    feedback.value = datas.map((e) => FeedbackModel.toJson(e)).toList();
  }

  void selectFeedback(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1;
    } else {
      selectedIndex.value = index;
    }
  }
}
