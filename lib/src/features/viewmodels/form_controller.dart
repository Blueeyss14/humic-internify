import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:humic_internify/src/shared/components/humic_button.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

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
        ///DIALOG WINDOW

        print("gak boleh submit");
      } else {
        print("boleh submit");

        Get.defaultDialog(
          backgroundColor: whiteHumic,
          title: 'Apakah Anda yakin ingin mengirim formulir ini?',
          titleStyle: const TextStyle(
            fontSize: 14,
            height: 2,
            fontWeight: FontWeight.bold,
          ),
          titlePadding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 20,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HumicButton(
                alignment: Alignment.center,
                width: 90,
                isBorder: true,
                color: Colors.transparent,
                child: Text(
                  "Batal",
                  style: TextStyle(
                    color: redHumic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              HumicButton(
                alignment: Alignment.center,
                width: 90,
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: whiteHumic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }
  }
}
