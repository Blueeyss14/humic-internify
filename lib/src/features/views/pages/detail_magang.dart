import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/viewmodels/posisition_viewmodel.dart';

class DetailMagang extends StatelessWidget {
  const DetailMagang({super.key});

  @override
  Widget build(BuildContext context) {
    final positionController = Get.find<PosisitionViewmodel>();
    var currentPage = positionController.indexPage.value;

    return Scaffold(
      appBar: AppBar(),

      body: Obx(() => Text(positionController.data[currentPage].jobTitle)),
    );
  }
}
