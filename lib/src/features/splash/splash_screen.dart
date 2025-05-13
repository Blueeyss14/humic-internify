import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:humic_internify/src/routes/routes_name.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _angle = 0;
  double _size = 30;
  double opacity = 0;
  double opacity2 = 0;
  double opacity3 = 0;

  double width = 170;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _angle = 135 / 360;
        _size = 50;
        opacity = 0;
        opacity2 = 0;
        opacity3 = 0;
      });
    });

    Future.delayed(const Duration(seconds: 1, milliseconds: 700), () {
      setState(() {
        _angle = 0;
        _size = 30;
      });
    });

    Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      setState(() {
        opacity = 1;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        opacity2 = 1;
      });
    });

    Future.delayed(const Duration(seconds: 3, milliseconds: 500), () {
      setState(() {
        opacity3 = 1;
      });
    });

    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed(RoutesName.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashScreen,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Hero(
          tag: 'humic',
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 180, height: 55),
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    alignment: Alignment.centerRight,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedOpacity(
                              opacity: opacity,
                              duration: const Duration(milliseconds: 500),
                              child: const Text(
                                "by",
                                style: TextStyle(
                                  fontSize: 7,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            ///LOGO
                            AnimatedRotation(
                              curve: Curves.easeInOutBack,
                              duration: const Duration(milliseconds: 800),
                              turns: -_angle,
                              child: AnimatedContainer(
                                curve: Curves.easeInOutBack,
                                duration: const Duration(milliseconds: 500),
                                height: _size,
                                width: _size,
                                child: Image.asset(
                                  "assets/logo/humic_splash.png",
                                ),
                              ),
                            ),
                          ],
                        ),

                        ///HUMIC ENGINEERING
                        AnimatedOpacity(
                          opacity: opacity2,
                          duration: const Duration(milliseconds: 1000),
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
                opacity: opacity3,
                duration: const Duration(milliseconds: 1500),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 60),
                  height: 55,
                  width: width,
                  child: Image.asset("assets/logo/humic_splash3.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
