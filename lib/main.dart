// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:humic_internify/src/core/dependencies_binding.dart';
import 'package:humic_internify/src/features/splash/splash_screen.dart';
import 'package:humic_internify/src/routes/routes_name.dart';
import 'package:humic_internify/src/routes/routes_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  // await GetStorage.init();
  // runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),

      initialRoute: RoutesName.splash,
      getPages: RoutesPage.pages,
      theme: ThemeData(fontFamily: 'Plus-Jakarta-Sans'),
    );
  }
}
