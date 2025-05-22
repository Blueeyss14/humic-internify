import 'package:get/get.dart';

class LanguageModel {
  String country;
  String flag;

  LanguageModel(this.country, this.flag);

  factory LanguageModel.toJson(Map<String, dynamic> json) {
    return LanguageModel(json['country'], json['flag']);
  }
}

class LanguangeViewmodel extends GetxController {
  var data = <LanguageModel>[].obs;
  var selectedIndex = 0.obs;

  var isOpened = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    List<Map<String, dynamic>> datas = [
      {'country': 'Indonesia', 'flag': 'assets/images/indonesia.png'},
      {'country': 'English', 'flag': 'assets/images/united-states.png'},
    ];

    data.value =
        datas.map((e) => LanguageModel(e["country"], e["flag"])).toList();
    selectedIndex.value = 0;
  }

  void chooseLanguage(int index) {
    selectedIndex.value = index;
    isOpened.value = false;
  }
}
