import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/models/position_model.dart';
import 'package:http/http.dart' as http;

class PosisitionViewmodel extends GetxController {
  var data = <PositionModel>[].obs;

  var isLoading = false.obs;
  var error = "".obs;

  var itemCount = 0.obs;
  final int maxPerRow = 2;
  var indexPage = 0.obs;

  var filteredData = <PositionModel>[].obs;
  var activeCategory = ''.obs;
  List<List<int>> get groupedItems {
    List<List<int>> groups = [];
    for (int i = 0; i < itemCount.value; i += maxPerRow) {
      int end =
          (i + maxPerRow < itemCount.value) ? i + maxPerRow : itemCount.value;
      groups.add(List.generate(end - i, (j) => i + j));
    }
    return groups;
  }

  @override
  void onInit() {
    super.onInit();
    fetchPositionData();
  }

  void fetchPositionData() async {
    try {
      isLoading.value = true;
      error.value = "";

      final response = await http.get(
        Uri.parse('${dotenv.env['API_BASE_URL']}/lowongan-magang-api/get'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final datas = result['data'];

        data.value =
            datas.map<PositionModel>((d) => PositionModel.fromJson(d)).toList();
        filteredData.value = data;
        itemCount.value = data.length;
      } else {
        error.value = "Failed to load data. Status: ${response.statusCode}";
      }
    } catch (e) {
      error.value = "error: $e";
    } finally {
      isLoading.value = false;
    }
  }

  ///index page
  void selectPage(int index) {
    indexPage.value = index;
  }

  ///filter item
  void clickToFilterItem(String category) {
    if (activeCategory.value.toLowerCase() == category.toLowerCase()) {
      activeCategory.value = '';
    } else {
      activeCategory.value = category;
    }
    applyFilters();
  }

  void searchItem(String query) {
    applyFilters(query);
  }

  void applyFilters([String query = '']) {
    final lowerQuery = query.toLowerCase();
    filteredData.value =
        data.where((item) {
          final matchesCategory =
              activeCategory.value.isEmpty ||
              item.category.toLowerCase() == activeCategory.value.toLowerCase();
          final matchesSearch =
              item.jobTitle.toLowerCase().contains(lowerQuery) ||
              item.category.toLowerCase().contains(lowerQuery);
          return matchesCategory && matchesSearch;
        }).toList();

    itemCount.value = filteredData.length;
  }
}
