import 'package:get/get_navigation/get_navigation.dart';
import 'package:humic_internify/src/features/splash/splash_screen.dart';
import 'package:humic_internify/src/features/views/home/home_app.dart';
import 'package:humic_internify/src/features/views/pages/detail_magang.dart';
import 'package:humic_internify/src/features/views/pages/detail_produk.dart';
import 'package:humic_internify/src/features/views/pages/form_pendaftaran.dart';
import 'package:humic_internify/src/features/views/pages/lamaran_terkirim.dart';
import 'package:humic_internify/src/routes/routes_name.dart';

class RoutesPage {
  static final pages = [
    GetPage(
      name: RoutesName.splash,
      page: () => const SplashScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: RoutesName.home,
      page: () => const HomeApp(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),

    GetPage(
      name: RoutesName.detailMagang,
      page: () => const DetailMagang(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    GetPage(
      name: RoutesName.formPendaftaran,
      page: () => const FormPendaftaran(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    GetPage(
      name: RoutesName.detailProduk,
      page: () => const DetailProduk(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    GetPage(
      name: RoutesName.lamaranTerkirim,
      page: () => const LamaranTerkirim(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 200),
    ),
  ];
}
