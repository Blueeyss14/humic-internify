import 'package:flutter/material.dart';
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

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        opacity3 = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashScreen,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacity3,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                "assets/logo/humic_splash3.png",
                width: 171,
                height: 45,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedOpacity(
                      opacity: opacity,
                      duration: const Duration(milliseconds: 500),
                      child: const Text(
                        "by",
                        style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      curve: Curves.easeInOutBack,
                      duration: const Duration(milliseconds: 1000),
                      turns: -_angle,
                      child: AnimatedContainer(
                        curve: Curves.easeInOutBack,
                        duration: const Duration(milliseconds: 1000),
                        height: _size,
                        width: _size,
                        child: Image.asset("assets/logo/humic_splash.png"),
                      ),
                    ),
                  ],
                ),
                AnimatedOpacity(
                  opacity: opacity2,
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    "assets/logo/humic_splash2.png",
                    width: 68,
                    height: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
