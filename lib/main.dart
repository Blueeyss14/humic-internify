import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:humic_internify/src/core/dependencies_binding.dart';
import 'package:humic_internify/src/features/splash/splash_screen.dart';

void main() {
  initDependencies();
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),

      // AnimatedSplashScreen(
      //   splash: Image.asset("assets/logo/splash_screen.png"),
      //   nextScreen: const TestPage(),
      //   splashTransition: SplashTransition.scaleTransition,
      //   pageTransitionType: PageTransitionType.rightToLeft,
      //   backgroundColor: Colors.white,
      //   duration: 2000,
      // ),
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
