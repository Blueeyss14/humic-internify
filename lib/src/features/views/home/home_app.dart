import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';
import 'package:humic_internify/src/features/views/components/bottom_navbar.dart';
import 'package:humic_internify/src/features/views/pages/about_us.dart';
import 'package:humic_internify/src/features/views/pages/home_page.dart';
import 'package:humic_internify/src/features/views/pages/internship_page.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final page = Get.find<BottombarController>();
    List<Widget> pages = const [HomePage(), InternshipPage(), AboutUs()];

    return Scaffold(
      backgroundColor: humicBackground,
      body: Stack(
        children: [
          Obx(() => pages[page.currentIndex.value]),
          const BottomNavbar(),
        ],
      ),
    );
  }
}
