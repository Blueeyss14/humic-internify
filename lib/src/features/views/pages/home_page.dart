import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';
import 'package:humic_internify/src/shared/humic_appbar.dart';
import 'package:humic_internify/src/shared/search_bar_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBar = Get.find<BottombarController>();

    return Stack(
      children: [
        Obx(
          () => AnimatedContainer(
            alignment: Alignment.center,
            curve: Curves.easeOutBack,
            duration: const Duration(milliseconds: 500),
            color: Colors.blue,
            width: double.infinity,
            height:
                bottomBar.currentIndex.value == 1
                    ? MediaQuery.of(context).size.height / 3 + 50
                    : MediaQuery.of(context).size.height / 3,
            child: SizedBox.expand(
              child: Image.asset(
                "assets/images/appbar_image.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SearchBarCustom(),
        const HumicAppbar(),
      ],
    );
  }
}
