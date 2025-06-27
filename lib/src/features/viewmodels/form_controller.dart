import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/viewmodels/form_picker_viewmodel.dart';
import 'package:humic_internify/src/features/views/dialogs/form_dialog.dart';
import 'package:humic_internify/src/routes/routes_name.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

final formPicker = Get.find<FormPickerViewmodel>();

class FormController extends GetxController {
  var isAgree = false.obs;
  var isLoading = false.obs;

  var isLastNameError = false.obs;
  var isFirstNameError = false.obs;
  var isEmailError = false.obs;
  var isContactError = false.obs;
  var isFacultyError = false.obs;
  var isMajorError = false.obs;
  var isSkillsError = false.obs;
  var isMotivationError = false.obs;
  var isCVError = false.obs;
  var isPortfoError = false.obs;

  late final List errorList =
      [
        isFirstNameError,
        isEmailError,
        isContactError,
        isFacultyError,
        isMajorError,
        isSkillsError,
        isMotivationError,
        isCVError,
        isPortfoError,
      ].obs;

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

  void submitForm({required String idLowonganMagang}) async {
    if (isAgree.value) {
      isFirstNameError.value = firstName.value.text.isEmpty;
      isEmailError.value = email.value.text.isEmpty;
      isContactError.value = contact.value.text.isEmpty;
      isFacultyError.value = faculty.value.text.isEmpty;
      isMajorError.value = major.value.text.isEmpty;
      isSkillsError.value = skills.value.text.isEmpty;
      isMotivationError.value = motivation.value.text.isEmpty;
      isCVError.value = formPicker.cvFile.isEmpty;
      isPortfoError.value = formPicker.portfolioFile.isEmpty;

      if (errorList.any((e) => e.value)) {
        print("gak boleh submit");
        return;
      }

      bool accepted = await formDialog();
      if (accepted) {
        ///Loading handler
        isLoading.value = true;

        print("ID Lowongan: $idLowonganMagang");
        print("Nama Depan: ${firstName.value.text}");
        print("Nama Belakang: ${lastName.value.text}");
        print("Email: ${email.value.text}");
        print("Kontak: ${contact.value.text}");
        print("Fakultas: ${faculty.value.text}");
        print("Program Studi: ${major.value.text}");
        print("Skill: ${skills.value.text}");
        print("Motivasi: ${motivation.value.text}");
        print("CV File: ${formPicker.cvFile.value}");
        print("Portfolio File: ${formPicker.portfolioFile.value}");

        await sendFormToApi(idLowonganMagang);

        resetForm();
        Get.offAllNamed(RoutesName.lamaranTerkirim);
      }
    }
  }

  void resetForm() {
    firstName.value.clear();
    lastName.value.clear();
    email.value.clear();
    contact.value.clear();
    faculty.value.clear();
    major.value.clear();
    skills.value.clear();
    motivation.value.clear();
    formPicker.resetFiles();
    isAgree.value = false;
    isFirstNameError.value = false;
    isLastNameError.value = false;
    isEmailError.value = false;
    isContactError.value = false;
    isFacultyError.value = false;
    isMajorError.value = false;
    isSkillsError.value = false;
    isMotivationError.value = false;
    isCVError.value = false;
    isPortfoError.value = false;

    ///Loading Handler
    isLoading.value = false;
  }

  Future<void> sendFormToApi(String idLowonganMagang) async {
    var uri = Uri.parse(
      '${dotenv.env['API_BASE_URL']}/lamaran-magang-api/add/$idLowonganMagang',
    );

    var request = http.MultipartRequest('POST', uri);

    request.fields['nama_depan'] = firstName.value.text;
    request.fields['nama_belakang'] = lastName.value.text;
    request.fields['email'] = email.value.text;
    request.fields['kontak'] = contact.value.text;
    request.fields['jurusan'] = major.value.text;
    request.fields['angkatan'] = '2021';
    request.fields['motivasi'] = motivation.value.text;
    request.fields['relevant_skills'] = skills.value.text;

    if (formPicker.cvFile.value.isNotEmpty) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'cv',
          formPicker.cvFile.value,
          contentType: MediaType('application', 'pdf'),
        ),
      );
    }

    if (formPicker.portfolioFile.value.isNotEmpty) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'portofolio',
          formPicker.portfolioFile.value,
          contentType: MediaType('application', 'pdf'),
        ),
      );
    }

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print("Berhasil Slurd");
      } else {
        print("Gagal coy. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
