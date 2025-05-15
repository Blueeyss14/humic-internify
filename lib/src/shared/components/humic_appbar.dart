import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class HumicAppbar extends StatelessWidget {
  const HumicAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBar = Get.find<BottombarController>();
    return Obx(
      () => AnimatedContainer(
        height: MediaQuery.of(context).size.height / 8,
        color:
            bottomBar.currentIndex.value == 2
                ? greyBlueHumic
                : Colors.transparent,
        duration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  transitionOnUserGestures: true,
                  tag: 'humic',
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 90,
                    height: 36,
                  ),
                ),
                AnimatedContainer(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          bottomBar.currentIndex.value == 2
                              ? blackHumic1
                              : whiteHumic,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: Row(
                    children: [
                      Image.asset("assets/images/indonesia.png", width: 18),
                      const SizedBox(width: 3),
                      Image.asset(
                        "assets/icons/down-arrow.png",
                        width: 8,
                        color:
                            bottomBar.currentIndex.value == 2
                                ? blackHumic1
                                : whiteHumic,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
