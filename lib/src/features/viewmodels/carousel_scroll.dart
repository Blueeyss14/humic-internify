import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CarouselScroll extends GetxController {
  final ScrollController scrollController = ScrollController();
  late Timer timer;

  int currentIndex = 0;
  double itemWidth = 165;

  @override
  void onInit() {
    super.onInit();

    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      currentIndex++;
      if (currentIndex >= 7) {
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
}
