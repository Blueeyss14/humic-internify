import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/viewmodels/posisition_viewmodel.dart';
import 'package:humic_internify/src/routes/routes_name.dart';
import 'package:humic_internify/src/shared/components/humic_button.dart';
import 'package:humic_internify/src/shared/components/humic_circle.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DetailMagang extends StatelessWidget {
  const DetailMagang({super.key});

  @override
  Widget build(BuildContext context) {
    final positionController = Get.find<PosisitionViewmodel>();

    List icons = const [Iconsax.location, Iconsax.briefcase, Iconsax.moneys];

    return Scaffold(
      backgroundColor: whiteHumic,
      body: Obx(() {
        var currentPage = positionController.indexPage.value;
        var currPosition = positionController.data[currentPage];
        return Column(
          children: [
            ///APPBAR
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: greyBlueHumic,
              width: double.infinity,
              height: 120,
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Detail Magang",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currPosition.jobTitle,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(icons.length, (index) {
                              List<String> currPos = [
                                "${currPosition.location}, ${currPosition.type}",
                                currPosition.category,
                                currPosition.paidStatus,
                              ];
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    icons[index],
                                    color: greyHumic,
                                    size: 17,
                                  ),
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
                        const SizedBox(height: 40),
                        const Text(
                          "Deskripsi Pekerjaan:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text(
                          currPosition.description,
                          style: const TextStyle(height: 2, fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 30),

                        const Text(
                          "Kualifikasi:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),

                        ...List.generate(
                          currPosition.qualification.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ///Humic Circle
                                  const HumicCircle(
                                    margin: EdgeInsets.only(top: 8),
                                    size: 5,
                                    color: greyHumic,
                                  ),

                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      currPosition.qualification[index],
                                      style: const TextStyle(
                                        height: 2,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),

                        const Text(
                          "Benefit:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),

                        ...List.generate(
                          currPosition.benefit.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ///Humic Circle
                                  const HumicCircle(
                                    margin: EdgeInsets.only(top: 8),
                                    size: 5,
                                    color: greyHumic,
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      currPosition.benefit[index],
                                      style: const TextStyle(
                                        height: 2,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),
                        HumicButton(
                          onTap: () {
                            positionController.selectPage(currentPage);
                            Get.toNamed(
                              RoutesName.formPendaftaran,
                              arguments: currentPage,
                            );
                          },
                          child: const Text(
                            "Daftar Magang",
                            style: TextStyle(
                              color: whiteHumic,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
