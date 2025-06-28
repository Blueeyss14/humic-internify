import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:humic_internify/src/features/viewmodels/developer_viewmodel.dart';
import 'package:humic_internify/src/shared/components/humic_button.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

class OurDeveloperCard extends StatelessWidget {
  const OurDeveloperCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dev = Get.find<DeveloperViewmodel>();
    double width = 210;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Our Developers",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          maxLines: 1,
          minFontSize: 3,
        ),
        const SizedBox(height: 10),

        CarouselSlider.builder(
          itemCount: dev.devModel.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: whiteHumic,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(40),
                    blurRadius: 10,
                    spreadRadius: 0.2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greyHumic,
                    ),
                    child: Image.asset(
                      dev.devModel[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  AutoSizeText(
                    dev.devModel[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText(
                    dev.devModel[index].position,
                    style: const TextStyle(fontSize: 12),
                    maxLines: 1,
                    minFontSize: 3,
                  ),
                  HumicButton(
                    color: pinkHumic,
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/link.png", width: 10),
                        const SizedBox(width: 5),
                        const Text(
                          "Website",
                          style: TextStyle(
                            color: redHumic,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: width / MediaQuery.of(context).size.width,
            autoPlayInterval: const Duration(seconds: 2),
            height: 310,
          ),
        ),
        // SingleChildScrollView(
        //   controller: dev.scrollController,
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: List.generate(
        //       dev.devModel.length,
        //       (index) => Container(
        //         margin: const EdgeInsets.all(15),
        //         padding: const EdgeInsets.all(15),
        //         width: 150,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(15),
        //           color: whiteHumic,
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.black.withAlpha(40),
        //               blurRadius: 10,
        //               spreadRadius: 0.2,
        //               offset: const Offset(0, 4),
        //             ),
        //           ],
        //         ),
        //         child: Column(
        //           children: [
        //             Container(
        //               clipBehavior: Clip.antiAlias,
        //               height: 140,
        //               width: double.infinity,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(5),
        //                 color: Colors.grey,
        //               ),
        //               child: Image.asset(
        //                 dev.devModel[index].image,
        //                 fit: BoxFit.cover,
        //               ),
        //             ),
        //             const SizedBox(height: 10),
        //             AutoSizeText(
        //               dev.devModel[index].name,
        //               style: const TextStyle(
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 1,
        //               ),
        //               // maxLines: 2,
        //               // minFontSize: 3,
        //             ),

        //             const SizedBox(height: 2),
        //             AutoSizeText(
        //               dev.devModel[index].position,
        //               style: const TextStyle(fontSize: 1),
        //               // maxLines: 2,
        //             ),
        //             const SizedBox(height: 7),

        //             HumicButton(
        //               color: pinkHumic,
        //               alignment: Alignment.center,
        //               width: double.infinity,
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Image.asset("assets/icons/link.png", width: 10),
        //                   const SizedBox(width: 5),
        //                   const Text(
        //                     "Website",
        //                     style: TextStyle(
        //                       color: redHumic,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
