import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/models/bottombar_model.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottombarController = Get.find<BottombarController>();
    List<BottombarModel> bottomBar = BottombarModel.bottombarData();

    double padding = 30;
    double screenWidth = MediaQuery.of(context).size.width;
    double availableWidth = screenWidth - (padding * 2);
    double itemWidth = availableWidth / bottomBar.length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 88,
          padding: EdgeInsets.symmetric(horizontal: padding),
          width: screenWidth,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 40,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: Obx(
            () => Stack(
              children: [
                Row(
                  children: List.generate(
                    bottomBar.length,
                    (index) => GestureDetector(
                      onTap: () {
                        bottombarController.changeIndex(index);
                      },
                      child: Container(
                        width: itemWidth,
                        height: double.infinity,
                        color: Colors.white.withAlpha(0),
                        child: Icon(bottomBar[index].icon),
                      ),
                    ),
                  ),
                ),
                AnimatedAlign(
                  alignment: Alignment(
                    -1.0 +
                        (2.0 * bottombarController.currentIndex.value) /
                            (bottomBar.length - 1),
                    -1.0,
                  ),
                  duration: const Duration(milliseconds: 200),

                  child: SizedBox(
                    height: 3,
                    width: itemWidth,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
