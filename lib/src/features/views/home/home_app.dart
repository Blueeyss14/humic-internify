import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';
import 'package:humic_internify/src/features/views/components/bottom_navbar.dart';
import 'package:humic_internify/src/features/views/pages/home_page.dart';
import 'package:humic_internify/src/features/views/pages/internship_page.dart';
import 'package:humic_internify/src/shared/components/humic_appbar.dart';
import 'package:humic_internify/src/shared/components/search_bar_custom.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final page = Get.find<BottombarController>();
    List<Widget> pages = const [HomePage(), InternshipPage()];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: humicBackground,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              const SearchBarCustom(),

              Obx(
                () => Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        page.currentIndex.value < pages.length
                            ? Container(
                              alignment: Alignment.topCenter,
                              key: ValueKey<int>(page.currentIndex.value),
                              child: pages[page.currentIndex.value],
                            )
                            : const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
          const BottomNavbar(),
          const HumicAppbar(),
        ],
      ),
    );
  }
}
