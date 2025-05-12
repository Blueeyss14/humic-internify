import 'package:flutter/material.dart';
import 'package:humic_internify/src/features/views/components/bottom_navbar.dart';
import 'package:humic_internify/src/shared/search_bar_custom.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final page = Get.find<BottombarController>();
    // List<Widget> pages = const [HomePage(), InternshipPage(), AboutUs()];

    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: humicBackground,
      body: Stack(
        children: [
          // Obx(() => pages[page.currentIndex.value]),
          SearchBarCustom(),
          BottomNavbar(),
        ],
      ),
    );
  }
}
