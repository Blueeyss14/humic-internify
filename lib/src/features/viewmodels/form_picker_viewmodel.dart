import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FormPickerViewmodel extends GetxController {
  var cvFile = "".obs;
  var portfolioFile = "".obs;

  void pickCV() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        List<String> names = result.names.whereType<String>().toList();
        cvFile.value = names.join(', ');
      } else {
        print("User canceled the picker");
      }
    } catch (e) {
      print("Error when choosing file: $e");
    }
  }

  void pickPortfolio() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        List<String> names = result.names.whereType<String>().toList();
        portfolioFile.value = names.join(', ');
      } else {
        print("User canceled the picker");
      }
    } catch (e) {
      print("Error when choosing file: $e");
    }
  }
}
