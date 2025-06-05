import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/viewmodels/posisition_viewmodel.dart';
import 'package:humic_internify/src/features/views/pages/feedback_page.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final posisitionController = Get.find<PosisitionViewmodel>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/life-at-humic.png"),
                  Positioned.fill(
                    child: Container(
                      margin: const EdgeInsets.only(right: 50),
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Life at Humic Engineering",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 1,
                              minFontSize: 3,
                            ),
                            SizedBox(height: 10),
                            AutoSizeText(
                              "Raih pengalaman internship yang bernilai dengan berkontribusi langsung dalam pengembangan solusi teknologi kami. Kembangkan kompetensi Anda melalui keterlibatan nyata dalam proyek IT serta bimbingan langsung dari para expert di bidang Software engineering dan IoT.",
                              style: TextStyle(fontSize: 12, height: 1.7),
                              maxLines: 5,
                              minFontSize: 3,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/mereka-humic.png", width: 120),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Kata mereka tentang",
                          style: TextStyle(fontSize: 12),
                          maxLines: 1,
                          maxFontSize: 12,
                          minFontSize: 3,
                        ),

                        AutoSizeText(
                          "Humic Engineering",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                          // maxLines: 1,
                          minFontSize: 3,
                        ),
                        SizedBox(height: 5),
                        AutoSizeText(
                          "Humic engineering menjadi tempat yang menyenangkan bagi saya, karena dapat meningkatkan kemampuan saya dalam melakukan desain UI/UX. Banyak pembelajaran yang berharga serta memiliki lingkungan yang suportif",
                          style: TextStyle(fontSize: 10, height: 1.7),
                          maxLines: 6,
                          // maxFontSize: 7,
                          minFontSize: 3,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Indra, Humic Internship Batch 3 2025 ",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: redHumic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              ///JELAJAHI POSISI
              const Text(
                "Jelajahi posisi yang kamu inginkan",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              for (var group in posisitionController.groupedItems)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(posisitionController.maxPerRow, (
                    index,
                  ) {
                    if (index < group.length) {
                      // int containerIndex = group[index];
                      return Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                posisitionController.data[group[index]].image,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 50),
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.bottomLeft,
                                child: AutoSizeText(
                                  posisitionController
                                      .data[group[index]]
                                      .jobTitle,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                  maxFontSize: 12,
                                  minFontSize: 3,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Expanded(child: SizedBox(height: 130));
                    }
                  }),
                ),
              const SizedBox(height: 20),
              const FeedbackPage(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
