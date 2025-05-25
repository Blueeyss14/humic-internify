import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FormPickerViewmodel extends GetxController {
  var fileNames = "".obs;
  void pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        List<String> names = result.names.whereType<String>().toList();
        fileNames.value = names.join(', ');
      } else {
        print("User canceled the picker");
      }
    } catch (e) {
      print("Error when choosing file: $e");
    }
  }
}
