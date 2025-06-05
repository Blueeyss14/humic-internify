import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/models/developer_mode.dart';

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

  void fetchDeveloper() {
    List<Map<String, dynamic>> developers = [
      {
        "name": "Taufik",
        "image": "assets/images/taufik.png",
        "position": "Project Manager",
        "Link": "/",
      },
      {
        "name": "Reinhard",
        "image": "assets/images/reinhard.jpg",
        "position": "Web Designer",
        "Link": "/",
      },
      {
        "name": "Shafa",
        "image": "assets/images/shafa.jpg",
        "position": "Mobile Designer",
        "Link": "/",
      },
      {
        "name": "Faried",
        "image": "assets/images/faried.jpg",
        "position": "Frontend Developer",
        "Link": "/",
      },
      {
        "name": "Delkano",
        "image": "assets/images/dell.png",
        "position": "Mobile Developer",
        "Link": "/",
      },
      {
        "name": "Yohanes",
        "image": "assets/images/yohanes.jpg",
        "position": "Backend Developer",
        "Link": "/",
      },
      {
        "name": "Reihan",
        "image": "assets/images/reihan.jpg",
        "position": "Backend Developer",
        "Link": "/",
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
