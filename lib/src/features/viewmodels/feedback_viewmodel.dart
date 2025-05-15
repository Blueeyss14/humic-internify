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
  var isCLicked = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeedback();
  }

  void fetchFeedback() {
    List<Map<String, dynamic>> datas = [
      {
        "feedback": "Bagaimana cara magang disini?",
        "reply":
            "Untuk magang di sini, kamu bisa klik tombol Lowongan. Setelah itu, pilih lowongan magang yang kamu inginkan. Agar lebih spesifik, kamu juga bisa memfilter lowongan sesuai minat kamu dengan menekan tombol Filter, lalu pilih kategori magang yang sesuai.",
      },

      {
        "feedback": "Apakah saya bisa melamar lebih dari satu lowongan?",
        "reply":
            "Untuk magang di sini, kamu bisa klik tombol Lowongan. Setelah itu, pilih lowongan magang yang kamu inginkan. Agar lebih spesifik, kamu juga bisa memfilter lowongan sesuai minat kamu dengan menekan tombol Filter, lalu pilih kategori magang yang sesuai.",
      },

      {
        "feedback":
            "Bagaimana saya tahu jika lamaran saya diterima atau ditolak?",
        "reply":
            "Untuk magang di sini, kamu bisa klik tombol Lowongan. Setelah itu, pilih lowongan magang yang kamu inginkan. Agar lebih spesifik, kamu juga bisa memfilter lowongan sesuai minat kamu dengan menekan tombol Filter, lalu pilih kategori magang yang sesuai.",
      },

      {
        "feedback": "Apakah data pribadi saya aman?",
        "reply":
            "Untuk magang di sini, kamu bisa klik tombol Lowongan. Setelah itu, pilih lowongan magang yang kamu inginkan. Agar lebih spesifik, kamu juga bisa memfilter lowongan sesuai minat kamu dengan menekan tombol Filter, lalu pilih kategori magang yang sesuai.",
      },
    ];

    feedback.value = datas.map((e) => FeedbackModel.toJson(e)).toList();
  }

  void clickFeedback() {
    isCLicked.value = !isCLicked.value;
  }
}
