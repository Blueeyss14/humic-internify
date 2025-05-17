import 'package:get/get.dart';
import 'package:humic_internify/src/features/models/position_model.dart';

class PosisitionViewmodel extends GetxController {
  var data = <PositionModel>[].obs;

  var itemCount = 0.obs;
  final int maxPerRow = 2;
  var indexPage = 0.obs;

  var filteredData = <PositionModel>[].obs;

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

  void fetchPositionData() {
    List<Map<String, dynamic>> datas = [
      {
        "jobTitle": "Backend Developer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Software Engineer",
        "status": true,
      },
      {
        "jobTitle": "Frontend Developer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Software Engineer",
        "status": true,
      },
      {
        "jobTitle": "UI/UX Designer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Software Engineer",
        "status": false,
      },
      {
        "jobTitle": "AI Developer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Software Engineer",
        "status": true,
      },
      {
        "jobTitle": "Content Writer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Software Engineer",
        "status": false,
      },
      {
        "jobTitle": "Data Science",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Software Engineer",
        "status": true,
      },
      {
        "jobTitle": "Multimedia Designer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Software Engineer",
        "status": false,
      },
      {
        "jobTitle": "Mobile Developer",
        "image": "assets/images/job.png",
        "location": "Bandung",
        "type": "Onsite",
        "paidStatus": "Paid",
        "category": "Software Engineer",
        "status": false,
      },
    ];
    data.value = datas.map((d) => PositionModel.toJson(d)).toList();
    filteredData.value = data;
    itemCount.value = data.length;
  }

  ///index page
  void selectPage(int index) {
    indexPage.value = index;
  }

  ///filter item
  void clickToFilterItem(String category) {
    filteredData.value =
        data
            .where(
              (item) => item.category.toLowerCase() == category.toLowerCase(),
            )
            .toList();

    itemCount.value = filteredData.length;
  }

  void resetFilter() {
    filteredData.value = data;
    itemCount.value = data.length;
  }
}
