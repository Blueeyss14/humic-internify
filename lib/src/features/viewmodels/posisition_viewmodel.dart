import 'package:get/get.dart';
import 'package:humic_internify/src/features/models/position_model.dart';

class PosisitionViewmodel extends GetxController {
  var data = <PositionModel>[].obs;

  var itemCount = 0.obs;
  final int maxPerRow = 2;

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
      {"jobTitle": "Backend Developer", "image": "assets/images/job.png"},
      {"jobTitle": "Frontend Developer", "image": "assets/images/job.png"},
      {"jobTitle": "UI/UX Designer", "image": "assets/images/job.png"},
      {"jobTitle": "AI Developer", "image": "assets/images/job.png"},
      {"jobTitle": "Content Writer", "image": "assets/images/job.png"},
      {"jobTitle": "Data Science", "image": "assets/images/job.png"},
      {"jobTitle": "Multimedia Designer", "image": "assets/images/job.png"},
      {"jobTitle": "Mobile Developer", "image": "assets/images/job.png"},
    ];
    data.value = datas.map((d) => PositionModel.toJson(d)).toList();
    itemCount.value = data.length;
  }
}
