import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:humic_internify/src/features/viewmodels/about_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/developer_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/feedback_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/languange_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/posisition_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/project_viewmodel.dart';

Future<void> refreshAllData() async {
  await Get.find<PosisitionViewmodel>().fetchPositionData();
  await Get.find<FeedbackViewmodel>().fetchFeedback();
  await Get.find<AboutViewmodel>().fetchData();
  await Get.find<ProjectViewmodel>().fetchData();
  await Get.find<LanguangeViewmodel>().fetchData();
  await Get.find<DeveloperViewmodel>().fetchDeveloper();
}
