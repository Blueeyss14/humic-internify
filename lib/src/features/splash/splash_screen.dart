import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:humic_internify/src/features/viewmodels/splash_screen_controller.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.find<SplashScreenController>();

    double width = 170.0;

    return Scaffold(
      backgroundColor: splashScreen,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Hero(
          tag: 'humic',
          child: Obx(
            () => Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 180, height: 55),
                    Container(
                      padding: const EdgeInsets.only(right: 13),
                      alignment: Alignment.centerRight,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedOpacity(
                                opacity: splashController.opacity.value,
                                duration: const Duration(milliseconds: 500),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    right: 1,
                                  ),
                                  child: Image.asset(
                                    "assets/logo/by_humic.png",
                                    width: 8,
                                  ),
                                ),
                              ),

                              ///LOGO
                              AnimatedRotation(
                                curve: Curves.elasticOut,

                                duration: const Duration(milliseconds: 2000),
                                turns: -splashController.angle.value,
                                child: AnimatedContainer(
                                  curve: Curves.elasticOut,
                                  duration: const Duration(milliseconds: 2000),
                                  height: splashController.size.value,
                                  width: splashController.size.value,
                                  child: Image.asset(
                                    "assets/logo/humic_splash.png",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 1),

                          ///HUMIC ENGINEERING
                          AnimatedOpacity(
                            opacity: splashController.opacity2.value,
                            duration: const Duration(milliseconds: 1500),
                            child: Image.asset(
                              "assets/logo/humic_splash2.png",
                              width: 55,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),

                /// INTERNIFY
                AnimatedOpacity(
                  opacity: splashController.opacity3.value,
                  duration: const Duration(milliseconds: 2000),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 60, left: 5),
                    height: 55,
                    width: width,
                    child: Image.asset("assets/logo/humic_splash3.png"),
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
