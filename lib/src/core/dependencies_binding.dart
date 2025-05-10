import 'package:get/instance_manager.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';

void initDependencies() {
  Get.put(BottombarController());
}
