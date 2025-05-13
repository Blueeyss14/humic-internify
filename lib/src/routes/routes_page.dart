import 'package:get/get_navigation/get_navigation.dart';
import 'package:humic_internify/src/features/splash/splash_screen.dart';
import 'package:humic_internify/src/features/views/home/home_app.dart';
import 'package:humic_internify/src/routes/routes_name.dart';

class RoutesPage {
  static final pages = [
    GetPage(
      name: RoutesName.splash,
      page: () => const SplashScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RoutesName.home,
      page: () => const HomeApp(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 3),
    ),
  ];
}
