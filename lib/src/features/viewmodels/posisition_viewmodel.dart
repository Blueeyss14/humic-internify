import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/models/position_model.dart';
import 'package:http/http.dart' as http;
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';

class PosisitionViewmodel extends GetxController {
  final bottomBarController = Get.find<BottombarController>();

  var data = <PositionModel>[].obs;
  var filteredData = <PositionModel>[].obs;
  var categoryList = <String>[].obs;
  var positionList = <String>[].obs;

  var categoryPosition = <String>[].obs;

  var isLoading = false.obs;
  var error = "".obs;

  var itemCount = 0.obs;
  final int maxPerRow = 2;
  var indexPage = 0.obs;
  var activeCategory = ''.obs;
  var activePosition = ''.obs;

  var itemGroup = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPositionData();
  }

  Future<void> fetchPositionData() async {
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
        itemGroup.value = data.length;

        final seen = <String>{};
        categoryList.value =
            data.map((e) => e.category).where((cat) => seen.add(cat)).toList();
      } else {
        error.value = "Failed to load data. Status: ${response.statusCode}";
      }
    } catch (e) {
      error.value = "error: $e";
    } finally {
      isLoading.value = false;
    }
  }

  List<List<int>> get groupedItems {
    List<List<int>> groups = [];
    for (int i = 0; i < itemGroup.value; i += maxPerRow) {
      int end =
          (i + maxPerRow < itemGroup.value) ? i + maxPerRow : itemGroup.value;
      groups.add(List.generate(end - i, (j) => i + j));
    }
    return groups;
  }

  List<int> get uniqueJobIndexes {
    final seen = <String>{};
    List<int> uniqueIndexes = [];
    for (int i = 0; i < data.length; i++) {
      if (seen.add(data[i].jobTitle)) {
        uniqueIndexes.add(i);
      }
    }
    return uniqueIndexes;
  }

  List<List<int>> get groupedUniqueJobs {
    final indexes = uniqueJobIndexes;
    List<List<int>> groups = [];
    for (int i = 0; i < indexes.length; i += maxPerRow) {
      int end =
          (i + maxPerRow < indexes.length) ? i + maxPerRow : indexes.length;
      groups.add(List.generate(end - i, (j) => indexes[i + j]));
    }
    return groups;
  }

  /// index page
  void selectPage(int index) {
    indexPage.value = index;
  }

  /// filter item berdasarkan kategori
  void clickToFilterItem(String category) {
    if (activeCategory.value.toLowerCase() == category.toLowerCase()) {
      activeCategory.value = '';
    } else {
      activeCategory.value = category;
    }
    applyFilters();
  }

  void clickToFilterPosition(String position) {
    if (activePosition.value.toLowerCase() == position.toLowerCase()) {
      activePosition.value = '';
    } else {
      activePosition.value = position;
    }
    applyFilters();
  }

  void resetPositionFilter() {
    activePosition.value = '';
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

          final matchesPosition =
              activePosition.value.isEmpty ||
              item.jobTitle.toLowerCase() == activePosition.value.toLowerCase();

          final matchesSearch =
              item.jobTitle.toLowerCase().contains(lowerQuery) ||
              item.category.toLowerCase().contains(lowerQuery);

          return matchesCategory && matchesPosition && matchesSearch;
        }).toList();

    itemCount.value = filteredData.length;
  }
}
