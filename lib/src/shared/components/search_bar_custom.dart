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
    return Obx(
      () => Stack(
        children: [
          AnimatedContainer(
            alignment: Alignment.center,
            curve: Curves.easeOutBack,
            duration: const Duration(milliseconds: 500),
            // color: Colors.blue,
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
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            child: Container(
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
                          Text(
                            text[bottomBar.currentIndex.value],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        const SizedBox(height: 5),
                        if (bottomBar.currentIndex.value < text2.length)
                          Text(
                            text2[bottomBar.currentIndex.value],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
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
      ),
    );
  }
}
