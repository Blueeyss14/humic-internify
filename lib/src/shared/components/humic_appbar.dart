import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';
import 'package:humic_internify/src/features/viewmodels/languange_viewmodel.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

class HumicAppbar extends StatelessWidget {
  const HumicAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBar = Get.find<BottombarController>();
    final language = Get.find<LanguangeViewmodel>();

    return Obx(
      () => AnimatedContainer(
        alignment: Alignment.bottomCenter,
        // height: MediaQuery.of(context).size.height / 8,
        padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
        height: (MediaQuery.of(context).size.height / 3 + 50) / 4 + 10,
        color:
            bottomBar.currentIndex.value == 2
                ? greyBlueHumic
                : Colors.transparent,
        duration: const Duration(milliseconds: 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              bottomBar.currentIndex.value != 2
                  ? "assets/images/white-logo.png"
                  : "assets/images/black-logo.png",
              width: 80,
              height: 35,
            ),

            /*
            PopupMenuButton<int>(
              color: whiteHumic,
              onSelected: (index) => language.chooseLanguage(index),
              onOpened: () {
                language.isOpened.value = true;
              },
              onCanceled: () {
                language.isOpened.value = false;
              },
              itemBuilder: (context) {
                return List.generate(language.data.length, (index) {
                  return PopupMenuItem<int>(
                    value: index,
                    child: Row(
                      children: [
                        Image.asset(language.data[index].flag, width: 18),
                        const SizedBox(width: 8),
                        Text(language.data[index].country),
                      ],
                    ),
                  );
                });
              },
              child: AnimatedContainer(
                padding: const EdgeInsets.all(5),
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
                    SizedBox(
                      height: 12,
                      width: 18,
                      child: Image.asset(
                        language.data[language.selectedIndex.value].flag,
                        fit: BoxFit.cover,
                      ),
                    ),
        
                    const SizedBox(width: 5),
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
            ),
            */
            AnimatedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
              child: SizedBox(
                height: 12,
                width: 18,
                child: Image.asset(
                  language.data[language.selectedIndex.value].flag,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
