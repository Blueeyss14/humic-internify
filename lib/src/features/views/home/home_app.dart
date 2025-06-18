import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';
import 'package:humic_internify/src/features/viewmodels/languange_viewmodel.dart';
import 'package:humic_internify/src/features/views/components/bottom_navbar.dart';
import 'package:humic_internify/src/features/views/pages/about_us.dart';
import 'package:humic_internify/src/features/views/pages/home_page.dart';
import 'package:humic_internify/src/features/views/pages/internship_page.dart';
import 'package:humic_internify/src/shared/components/humic_appbar.dart';
import 'package:humic_internify/src/shared/components/search_bg_custom.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final page = Get.find<BottombarController>();
    final language = Get.find<LanguangeViewmodel>();
    List<Widget> pages = const [
      HomePage(),
      SingleChildScrollView(child: InternshipPage()),
    ];
    ScrollController scrollController = ScrollController();

    ever(page.currentIndex, (_) {
      if (page.currentIndex.value != 2 && scrollController.hasClients) {
        scrollController.jumpTo(0);
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: humicBackground,
      body: Obx(
        () => Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomScrollView(
              controller: scrollController,
              physics:
                  page.currentIndex.value == 2
                      ? const AlwaysScrollableScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    AnimatedContainer(
                      height:
                          page.currentIndex.value == 2
                              ? MediaQuery.of(context).size.height / 8
                              : 0,
                      duration: const Duration(milliseconds: 300),
                    ),

                    Column(
                      children: [
                        const SearchBgCustom(),
                        if (page.currentIndex.value == 2) const AboutUs(),
                      ],
                    ),
                  ]),
                ),
                if (page.currentIndex.value != 2)
                  SliverFillRemaining(
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
                  )
                else
                  SliverToBoxAdapter(
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
              ],
            ),
            const BottomNavbar(),
            const HumicAppbar(),

            AnimatedSwitcher(
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              duration: const Duration(milliseconds: 150),
              child:
                  language.isOpened.value
                      ? SizedBox(
                        key: ValueKey<bool>(language.isOpened.value),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            color: Colors.black.withAlpha(100),
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      )
                      : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
