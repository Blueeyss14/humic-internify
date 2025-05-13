import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:humic_internify/src/routes/routes_name.dart';

class SplashScreenController extends GetxController {
  var angle = 0.0.obs;
  var size = 30.0.obs;
  var opacity = 0.0.obs;
  var opacity2 = 0.0.obs;
  var opacity3 = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1000), () {
      angle.value = 135 / 360;
      size.value = 50;
      opacity.value = 0;
      opacity2.value = 0;
      opacity3.value = 0;
    });

    Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      angle.value = 0;
      size.value = 30;
      opacity.value = 1;
      opacity2.value = 1;
    });

    Future.delayed(const Duration(seconds: 3, milliseconds: 500), () {
      opacity3.value = 1;
    });

    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed(RoutesName.home);
    });
  }
}
