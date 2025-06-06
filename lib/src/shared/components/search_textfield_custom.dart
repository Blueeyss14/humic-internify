import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';
import 'package:humic_internify/src/features/viewmodels/posisition_viewmodel.dart';
import 'package:humic_internify/src/styles/custom_color.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SearchTextfieldCustom extends StatelessWidget {
  const SearchTextfieldCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final positionController = Get.find<PosisitionViewmodel>();
    final bottombarController = Get.find<BottombarController>();
    return IntrinsicHeight(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: whiteHumic,
        ),
        // margin: const EdgeInsets.symmetric(horizontal: 40),
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: const TextSelectionThemeData(
                    selectionHandleColor: blackHumic1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: TextField(
                    onChanged: (value) => positionController.searchItem(value),
                    style: const TextStyle(fontSize: 14),
                    textCapitalization: TextCapitalization.sentences,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: blackHumic1,
                    decoration: const InputDecoration(
                      hintText: "Cari Lowongan Magangmu di Sini",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                bottombarController.currentIndex.value = 1;
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: redHumic,
                ),
                child: const Icon(
                  Iconsax.search_normal_1_copy,
                  size: 14,
                  color: whiteHumic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
