import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:humic_internify/src/features/viewmodels/project_viewmodel.dart';
import 'package:humic_internify/src/routes/routes_name.dart';
import 'package:humic_internify/src/shared/components/humic_circle.dart';
import 'package:humic_internify/src/shared/components/humic_loading.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

class HasilProdukCard extends StatelessWidget {
  const HasilProdukCard({super.key});

  @override
  Widget build(BuildContext context) {
    final project = Get.find<ProjectViewmodel>();
    return Obx(() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AutoSizeText(
                "Hasil Produk Research",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                maxLines: 1,
                minFontSize: 3,
              ),

              ///BUTTON
              Row(
                children: [
                  HumicCircle(
                    onTap: () => project.prevPage(),
                    size: 35,
                    color: redHumic,
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 14,
                      color: whiteHumic,
                    ),
                  ),
                  const SizedBox(width: 10),
                  HumicCircle(
                    onTap: () => project.nextPage(),
                    size: 35,
                    color: redHumic,
                    child: Transform.rotate(
                      angle: 3.14,
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 14,
                        color: whiteHumic,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),

          ///HASIL PRODUK
          if (project.data.isNotEmpty)
            ...List.generate(
              project.paginatedData.length,
              (index) => GestureDetector(
                onTap: () {
                  project.selectItem(index);
                  Get.toNamed(RoutesName.detailProduk);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: whiteHumic,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(60),
                        blurRadius: 25,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: 135,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        child: Hero(
                          tag: project.paginatedData[index].image,
                          child: CachedNetworkImage(
                            imageUrl:
                                '${dotenv.env['API_BASE_URL']}${project.paginatedData[index].image}',
                            errorWidget:
                                (context, error, stackTrace) =>
                                    const SizedBox.shrink(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(
                            project.paginatedData[index].title,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              height: 1.8,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            // const Text("No Data"),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: greyBlueHumic,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Memuat Hasil Produk Reaserch",
                    style: TextStyle(fontSize: 12, letterSpacing: 1.5),
                  ),
                  SizedBox(height: 20, width: 20, child: HumicLoading()),
                ],
              ),
            ),
        ],
      );
    });
  }
}
