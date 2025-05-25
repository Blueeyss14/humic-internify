import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FormController extends GetxController {
  var isAgree = false.obs;

  var isFirstNameError = false.obs;
  var isLastNameError = false.obs;
  var isEmailError = false.obs;
  var isContactError = false.obs;
  var isFacultyError = false.obs;
  var isMajorError = false.obs;
  var isSkillsError = false.obs;
  var isMotivationError = false.obs;

  var firstName = TextEditingController().obs;
  var lastName = TextEditingController().obs;
  var email = TextEditingController().obs;
  var contact = TextEditingController().obs;
  var faculty = TextEditingController().obs;
  var major = TextEditingController().obs;
  var skills = TextEditingController().obs;
  var motivation = TextEditingController().obs;

  void checkIsAgree() {
    isAgree.value = !isAgree.value;
  }

  void submitForm() {
    if (isAgree.value) {
      isFirstNameError.value = firstName.value.text.isEmpty;
      // isLastNameError.value = lastName.value.text.isEmpty;
      isEmailError.value = email.value.text.isEmpty;
      isContactError.value = contact.value.text.isEmpty;
      isFacultyError.value = faculty.value.text.isEmpty;
      isMajorError.value = major.value.text.isEmpty;
      isSkillsError.value = skills.value.text.isEmpty;
      isMotivationError.value = motivation.value.text.isEmpty;

      if (isFirstNameError.value ||
          isEmailError.value ||
          isContactError.value ||
          isFacultyError.value ||
          isMajorError.value ||
          isSkillsError.value ||
          isMotivationError.value) {
        print("gak boleh submit");
      } else {
        print("boleh submit");
      }
    }
  }
}
