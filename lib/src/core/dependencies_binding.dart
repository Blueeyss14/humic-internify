import 'package:get/instance_manager.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';
import 'package:humic_internify/src/features/viewmodels/feedback_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/posisition_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/splash_screen_controller.dart';

void initDependencies() {
  Get.put(BottombarController());
  Get.put(SplashScreenController());
  Get.put(PosisitionViewmodel());
  Get.put(FeedbackViewmodel());
}
