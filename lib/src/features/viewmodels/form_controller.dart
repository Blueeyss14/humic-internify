import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FormController extends GetxController {
  var isAgree = false.obs;

  void checkIsAgree() {
    isAgree.value = !isAgree.value;
  }
}
