import 'package:get/get.dart';
import 'package:humic_internify/src/features/models/bottombar_model.dart';

class BottombarController extends GetxController {
  var currentIndex = 0.obs;
  var icon = <BottombarModel>[].obs;

  final List<String> icons = [
    'assets/icons/home.png',
    'assets/icons/cv.png',
    'assets/icons/about_us.png',
  ];
  final List<String> filledIcons = [
    'assets/icons/home_filled.png',
    'assets/icons/cv_filled.png',
    'assets/icons/about_us_filled.png',
  ];
  final List<String> labels = ['Beranda', 'CV', 'Tentang Kami'];

  @override
  void onInit() {
    super.onInit();
    fetchIcon(currentIndex.value);
  }

  void changeIndex(int index) {
    currentIndex.value = index;
    fetchIcon(index);
  }

  void fetchIcon(int index) {
    icon.value = List.generate(icons.length, (i) {
      return BottombarModel(
        currentIndex.value == i ? filledIcons[i] : icons[i],
        labels[i],
      );
    });
  }
}
