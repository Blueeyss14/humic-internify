// import 'dart:io';
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:humic_internify/src/core/dependencies_binding.dart';
import 'package:humic_internify/src/features/splash/splash_screen.dart';
import 'package:humic_internify/src/routes/routes_name.dart';
import 'package:humic_internify/src/routes/routes_page.dart';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");

  // HttpOverrides.global = MyHttpOverrides();
  initDependencies();
  // await GetStorage.init();
  // runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
