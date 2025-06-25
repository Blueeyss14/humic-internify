import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottombarController = Get.find<BottombarController>();
    final bottomBar = Get.find<BottombarController>().icon;

    double padding = 30;

    return Obx(() {
      double screenWidth = MediaQuery.of(context).size.width;
      double availableWidth = screenWidth - (padding * 2);
      double itemWidth = availableWidth / bottomBar.length;

      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Row(
                    children: List.generate(
                      bottomBar.length,
                      (index) => GestureDetector(
                        onTap: () {
                          bottombarController.changeIndex(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 18),

                          alignment: Alignment.center,
                          width: itemWidth,
                          height: double.infinity,
                          color: Colors.white.withAlpha(0),

                          ///Icon & Label
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                bottomBar[index].icon,
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                bottomBar[index].label,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0,
                                  color: blackHumic1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedAlign(
                    curve: Curves.easeOutBack,
                    alignment: Alignment(
                      -1.0 +
                          (2.0 * bottombarController.currentIndex.value) /
                              (bottomBar.length - 1),
                      -1.0,
                    ),
                    duration: const Duration(milliseconds: 500),

                    child: SizedBox(
                      height: 3,
                      width: itemWidth,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        alignment: Alignment.center,
                        color: blackHumic1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
