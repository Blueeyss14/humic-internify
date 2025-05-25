import 'package:get/instance_manager.dart';
import 'package:humic_internify/src/features/viewmodels/about_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';
import 'package:humic_internify/src/features/viewmodels/feedback_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/form_controller.dart';
import 'package:humic_internify/src/features/viewmodels/form_picker_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/languange_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/posisition_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/project_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/splash_screen_controller.dart';

void initDependencies() {
  Get.put(BottombarController());
  Get.put(SplashScreenController());
  Get.put(PosisitionViewmodel());
  Get.put(FeedbackViewmodel());
  Get.put(AboutViewmodel());
  Get.put(ProjectViewmodel());
  Get.put(LanguangeViewmodel());
  Get.put(FormController());
  Get.put(FormPickerViewmodel());
}
