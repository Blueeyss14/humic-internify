import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:humic_internify/src/features/viewmodels/project_viewmodel.dart';
import 'package:humic_internify/src/shared/components/humic_circle.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class HasilProdukCard extends StatelessWidget {
  const HasilProdukCard({super.key});

  @override
  Widget build(BuildContext context) {
    final project = Get.find<ProjectViewmodel>();
    return Obx(
      () => Column(
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
                    size: 30,
                    color: redHumic,
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 12,
                      color: whiteHumic,
                    ),
                  ),
                  const SizedBox(width: 10),
                  HumicCircle(
                    onTap: () => project.nextPage(),
                    size: 30,
                    color: redHumic,
                    child: Transform.rotate(
                      angle: 3.14,
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 12,
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
          ...List.generate(
            project.paginatedData.length,
            (index) => Container(
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
                    child: Image.asset(
                      project.paginatedData[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: const Text(
                        "Pengembangan Aplikasi Penerimaan Magang Humic",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
