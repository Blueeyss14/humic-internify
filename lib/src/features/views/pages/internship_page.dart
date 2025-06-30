import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:humic_internify/src/features/viewmodels/posisition_viewmodel.dart';
import 'package:humic_internify/src/routes/routes_name.dart';
import 'package:humic_internify/src/shared/components/humic_loading.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class InternshipPage extends StatelessWidget {
  const InternshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    final positionController = Get.find<PosisitionViewmodel>();
    // final internetConnection = Get.find<InternetConnectionController>();

    List icons = const [Iconsax.location, Iconsax.briefcase, Iconsax.moneys];
    return Obx(() {
      if (positionController.isLoading.value) {
        return Container(
          height: 120,
          alignment: Alignment.center,
          child: const Center(child: HumicLoading()),
        );
      }

      if (positionController.data.isEmpty) {
        return Container(
          height: 120,
          alignment: Alignment.center,
          child: const Text("Tidak Ada Lowongan Yang tersedia"),
        );
      }

      return Column(
        children: [
          const SizedBox(height: 30),
          for (int i = 0; i < positionController.filteredData.length; i++)
            //clicked
            GestureDetector(
              onTap: () {
                // if (!internetConnection.isConnected.value) {}

                if (positionController.filteredData[i].status.toLowerCase() ==
                    'dibuka') {
                  final originalIndex = positionController.data.indexWhere(
                    (item) => item.id == positionController.filteredData[i].id,
                  );
                  positionController.selectPage(originalIndex);
                  Get.toNamed(RoutesName.detailMagang);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          positionController.filteredData[i].jobTitle,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color:
                                positionController.filteredData[i].status
                                            .toLowerCase() ==
                                        'dibuka'
                                    ? softGreen
                                    : softRed,
                            border: Border.all(
                              width: 2,
                              color:
                                  positionController.filteredData[i].status
                                              .toLowerCase() ==
                                          'dibuka'
                                      ? greenHumic
                                      : redHumic,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            positionController.filteredData[i].status
                                        .toLowerCase() ==
                                    'dibuka'
                                ? "Opened"
                                : "Closed",
                            style: TextStyle(
                              color:
                                  positionController.filteredData[i].status
                                              .toLowerCase() ==
                                          'dibuka'
                                      ? greenHumic
                                      : redHumic,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(icons.length, (index) {
                            List<String> currPos = [
                              (positionController.filteredData[i].location),

                              positionController.filteredData[i].category,
                              positionController.filteredData[i].paidStatus,
                            ];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(icons[index], color: greyHumic, size: 17),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Text(
                                    currPos[index],
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: greyHumic,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 100),
        ],
      );
    });
  }
}
