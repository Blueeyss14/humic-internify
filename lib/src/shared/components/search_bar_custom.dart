import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';
import 'package:humic_internify/src/shared/components/textfield_custom.dart';
import 'package:humic_internify/test_page.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    List text = ["Tingkatkan keahlian, perluas kesempatan", "Cari internship"];
    List text2 = [
      "Asah keterampilanmu dan jadilah mahasiswa yang siap bersaing di dunia industri",
      "Berikut merupakan daftar internship yang sedang dibuka. Harap untuk memperhatikan syarat dan ketentuan untuk setiap posisi yang tersedia.",
    ];
    final bottomBar = Get.find<BottombarController>();

    List mediaQuery = [
      MediaQuery.of(context).size.height / 3,
      MediaQuery.of(context).size.height / 3 + 50,
      MediaQuery.of(context).size.height / 2,
    ];

    return Obx(() {
      final animationPadding = bottomBar.currentIndex.value == 2 ? 30.0 : 0.0;

      return Stack(
        children: [
          AnimatedPadding(
            duration: const Duration(milliseconds: 300),
            padding:
                bottomBar.currentIndex.value == 2
                    ? EdgeInsets.only(
                      top: animationPadding + 20,
                      left: animationPadding,
                      right: animationPadding,
                    )
                    : EdgeInsets.zero,
            child: AnimatedContainer(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius:
                    bottomBar.currentIndex.value == 2
                        ? BorderRadius.circular(20)
                        : null,
              ),
              curve: Curves.easeOutBack,
              duration: const Duration(milliseconds: 800),
              width: double.infinity,
              height: mediaQuery[bottomBar.currentIndex.value],
              child: Image.asset(
                "assets/images/appbar_image.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            child: Container(
              // color: Colors.amber,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.height,
              height: MediaQuery.of(context).size.height / 5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Column(
                      key: ValueKey<int>(bottomBar.currentIndex.value),
                      children: [
                        if (bottomBar.currentIndex.value < text.length)
                          AutoSizeText(
                            text[bottomBar.currentIndex.value],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            maxFontSize: 13,
                            maxLines: 1,
                            minFontSize: 3,
                          ),
                        const SizedBox(height: 5),
                        if (bottomBar.currentIndex.value < text2.length)
                          AutoSizeText(
                            text2[bottomBar.currentIndex.value],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            maxFontSize: 8,
                            maxLines: bottomBar.currentIndex.value == 1 ? 2 : 1,
                            minFontSize: 3,
                          ),
                      ],
                    ),
                  ),

                  const Align(
                    alignment: Alignment.center,
                    child: TextfieldCustom(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const TestPage());
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child:
                            bottomBar.currentIndex.value == 1
                                ? Container(
                                  key: ValueKey<int>(
                                    bottomBar.currentIndex.value,
                                  ),
                                  color: Colors.red,
                                  height: 30,
                                  width: 30,
                                )
                                : const SizedBox.shrink(),
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
