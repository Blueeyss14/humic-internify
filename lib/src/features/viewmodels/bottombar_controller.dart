import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:humic_internify/src/features/models/bottombar_model.dart';

class BottombarController extends GetxController {
  var currentIndex = 0.obs;
  var icon = <BottombarModel>[].obs;

  final box = GetStorage();

  final List<String> icons = [
    'assets/icons/home1.png',
    'assets/icons/cv1.png',
    'assets/icons/about_us1.png',
  ];
  final List<String> filledIcons = [
    'assets/icons/home_filled1.png',
    'assets/icons/cv_filled1.png',
    'assets/icons/about_us_filled1.png',
  ];
  final List<String> labels = ['Beranda', 'Lowongan', 'Tentang Kami'];

  @override
  void onInit() {
    super.onInit();
    currentIndex.value = box.read('currentIndex') ?? 0;
    fetchIcon(currentIndex.value);
  }

  void changeIndex(int index) {
    currentIndex.value = index;
    fetchIcon(index);
    box.write('currentIndex', index);
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
