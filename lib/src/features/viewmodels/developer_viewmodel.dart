import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/models/developer_model.dart';

class DeveloperViewmodel extends GetxController {
  var devModel = <DeveloperModel>[].obs;

  final ScrollController scrollController = ScrollController();
  late Timer timer;

  int currentIndex = 0;
  double itemWidth = 165;

  @override
  void onInit() {
    super.onInit();

    fetchDeveloper();

    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      currentIndex++;
      if (currentIndex >= devModel.length) {
        currentIndex = 0;
      }

      if (scrollController.hasClients) {
        scrollController.animateTo(
          currentIndex * itemWidth,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void onClose() {
    timer.cancel();
    scrollController.dispose();
    super.onClose();
  }

  Future<void> fetchDeveloper() async {
    List<Map<String, dynamic>> developers = [
      {
        "name": "Taufik",
        "image": "assets/images/taufik.png",
        "position": "Project Manager",
        "link": "https://www.linkedin.com/in/rayataufik/",
      },
      {
        "name": "Reinhard",
        "image": "assets/images/reinhard.jpg",
        "position": "Web Designer",
        "link": "https://www.linkedin.com/in/reinhard-situmeang/",
      },
      {
        "name": "Shafa",
        "image": "assets/images/shafa.jpg",
        "position": "Mobile Designer",
        "link": "https://www.linkedin.com/in/shafasalmapermana/",
      },
      {
        "name": "Faried",
        "image": "assets/images/faried.jpg",
        "position": "Frontend Developer",
        "link": "https://www.linkedin.com/in/faried-gunawan/",
      },
      {
        "name": "Delkano",
        "image": "assets/images/dell.png",
        "position": "Mobile Developer",
        "link": "https://www.linkedin.com/in/delkano-berutu-28b7482a2/",
      },
      {
        "name": "Yohanes",
        "image": "assets/images/yohanes.jpg",
        "position": "Backend Developer",
        "link": "https://www.linkedin.com/in/yohanesjanuarico/",
      },
      {
        "name": "Reihan",
        "image": "assets/images/reihan.jpg",
        "position": "Backend Developer",
        "link": "https://www.linkedin.com/in/reihanramadhana/",
      },
    ];

    devModel.value =
        developers
            .map(
              (e) => DeveloperModel(
                e['name'] ?? '',
                e['image'] ?? '',
                e['position'] ?? '',
                e['link'] ?? '',
              ),
            )
            .toList();
  }
}
