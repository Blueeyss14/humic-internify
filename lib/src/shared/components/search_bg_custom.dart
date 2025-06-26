import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:humic_internify/src/features/viewmodels/about_viewmodel.dart';
import 'package:humic_internify/src/features/viewmodels/bottombar_controller.dart';
import 'package:humic_internify/src/features/viewmodels/posisition_viewmodel.dart';
import 'package:humic_internify/src/shared/components/humic_circle.dart';
import 'package:humic_internify/src/shared/components/search_textfield_custom.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

class SearchBgCustom extends StatelessWidget {
  const SearchBgCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutBar = Get.find<AboutViewmodel>();

    List text = ["Tingkatkan keahlian, perluas kesempatan", "Cari internship"];
    List text2 = [
      "Asah keterampilanmu dan jadilah mahasiswa yang siap bersaing di dunia industri",
      "Berikut merupakan daftar internship yang sedang dibuka. Harap untuk memperhatikan syarat dan ketentuan untuk setiap posisi yang tersedia.",
    ];
    final bottomBar = Get.find<BottombarController>();
    final positionData = Get.find<PosisitionViewmodel>();

    int previousIndex = bottomBar.currentIndex.value;

    List mediaQuery = [
      MediaQuery.of(context).size.height / 3 + 10,
      MediaQuery.of(context).size.height / 3 + 50,
      420.0,
    ];

    double firstMediaQuery = mediaQuery[1] / 4 + 10;
    double secondMediaQuery = mediaQuery[1] / 4 - 10;
    double thirdMediaQuery = mediaQuery[1] / 4;

    // double fourthMediaQuery =
    //     mediaQuery[1] - (firstMediaQuery + secondMediaQuery + thirdMediaQuery);

    // double categorySize = 38;

    final categoryBar = positionData.categoryList;

    return Obx(() {
      final animationPadding = bottomBar.currentIndex.value == 2 ? 30.0 : 0.0;

      ///handle search fade out animation
      int currentIndex = bottomBar.currentIndex.value;
      bool triggerAnimation = previousIndex == 1 && currentIndex == 2;
      previousIndex = currentIndex;
      return Stack(
        children: [
          AnimatedPadding(
            duration: const Duration(milliseconds: 300),
            padding:
                bottomBar.currentIndex.value == 2
                    ? EdgeInsets.only(
                      top: animationPadding + 20,
                      left: animationPadding,
                      right: animationPadding,
                    )
                    : EdgeInsets.zero,
            child: Stack(
              children: [
                AnimatedContainer(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius:
                        bottomBar.currentIndex.value == 2
                            ? BorderRadius.circular(20)
                            : null,
                  ),
                  curve: Curves.easeOutBack,
                  duration: const Duration(milliseconds: 800),
                  width: double.infinity,
                  height: mediaQuery[bottomBar.currentIndex.value],
                  child: Image.asset(
                    "assets/images/appbar_image.png",
                    fit: BoxFit.cover,
                  ),
                ),

                ///SEARCH CONTENT [TEXT, SEARCH, FILTER ANIMATION]
                Positioned.fill(
                  child: AnimatedSwitcher(
                    switchInCurve: Curves.easeIn,
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      key:
                          triggerAnimation
                              ? ValueKey<int>(currentIndex)
                              : const ValueKey<String>('static'),
                      child:
                          bottomBar.currentIndex.value != 2
                              ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      // color: Colors.amber,
                                      height: firstMediaQuery,
                                    ),
                                    Container(
                                      // color: Colors.amber,
                                      height: secondMediaQuery,
                                      alignment: Alignment.center,
                                      child: AnimatedSwitcher(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          key: ValueKey<int>(
                                            bottomBar.currentIndex.value,
                                          ),
                                          children: [
                                            if (bottomBar.currentIndex.value <
                                                text.length)
                                              Expanded(
                                                child: AutoSizeText(
                                                  text[bottomBar
                                                      .currentIndex
                                                      .value],
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  maxFontSize: 14,
                                                  maxLines: 1,
                                                  minFontSize: 3,
                                                ),
                                              ),
                                            // const SizedBox(height: 3),
                                            if (bottomBar.currentIndex.value <
                                                text2.length)
                                              Expanded(
                                                child: AutoSizeText(
                                                  text2[bottomBar
                                                      .currentIndex
                                                      .value],
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                  ),
                                                  maxFontSize: 10,
                                                  maxLines: 2,
                                                  minFontSize: 3,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    /// SEARCH BAR
                                    Container(
                                      // color: Colors.blue,
                                      height: thirdMediaQuery,
                                      alignment: Alignment.center,
                                      child: const SearchTextfieldCustom(),
                                    ),

                                    /// ITEM FILTERED
                                    AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      child:
                                          bottomBar.currentIndex.value == 1
                                              ? SizedBox(
                                                key: ValueKey<int>(
                                                  bottomBar.currentIndex.value,
                                                ),
                                                child: SingleChildScrollView(
                                                  key: ValueKey<int>(
                                                    bottomBar
                                                        .currentIndex
                                                        .value,
                                                  ),

                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          top: 8.0,
                                                        ),
                                                    child: Row(
                                                      children: List.generate(
                                                        categoryBar.length,
                                                        (
                                                          index,
                                                        ) => GestureDetector(
                                                          onTap:
                                                              () => positionData
                                                                  .clickToFilterItem(
                                                                    categoryBar[index],
                                                                  ),
                                                          child: Container(
                                                            alignment:
                                                                Alignment
                                                                    .center,
                                                            margin:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      10,
                                                                ),
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      10,
                                                                ),
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    10,
                                                                  ),
                                                              border: Border.all(
                                                                width: 2,
                                                                color:
                                                                    positionData.activeCategory.value ==
                                                                            categoryBar[index]
                                                                        ? redHumic
                                                                        : pinkBorderHumic,
                                                              ),
                                                              color:
                                                                  positionData
                                                                              .activeCategory
                                                                              .value ==
                                                                          categoryBar[index]
                                                                      ? redHumic
                                                                      : pinkHumic,
                                                            ),
                                                            height: 38,
                                                            child: AutoSizeText(
                                                              categoryBar[index],
                                                              style: TextStyle(
                                                                fontSize: 2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color:
                                                                    positionData.activeCategory.value ==
                                                                            categoryBar[index]
                                                                        ? whiteHumic
                                                                        : redHumic,
                                                              ),
                                                              maxLines: 1,
                                                              // minFontSize: 0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              : const SizedBox.shrink(),
                                    ),
                                  ],
                                ),
                              )
                              : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                key: ValueKey<int>(
                                  bottomBar.currentIndex.value,
                                ),
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(30),
                                    width: double.infinity,

                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        HumicCircle(
                                          onTap:
                                              () => aboutBar.clickItem(false),
                                          padding: const EdgeInsets.all(10),
                                          color: softGreyHumic,
                                          child: const Center(
                                            child: Icon(
                                              Icons.arrow_back_ios_new,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          aboutBar
                                              .data[aboutBar.itemClicked.value]
                                              .title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        HumicCircle(
                                          onTap:
                                              () => aboutBar.clickItem(false),
                                          padding: const EdgeInsets.all(10),
                                          color: softGreyHumic,
                                          child: Center(
                                            child: Transform.rotate(
                                              angle: 3.14,
                                              child: const Icon(
                                                Icons.arrow_back_ios_new,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ...List.generate(
                                              aboutBar
                                                  .data[aboutBar
                                                      .itemClicked
                                                      .value]
                                                  .description
                                                  .length,
                                              (index) {
                                                final text =
                                                    aboutBar
                                                        .data[aboutBar
                                                            .itemClicked
                                                            .value]
                                                        .description;

                                                if (text.length > 1) {
                                                  return SizedBox(
                                                    width: double.infinity,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${index + 1}. ',
                                                          style:
                                                              const TextStyle(
                                                                height: 2,

                                                                color:
                                                                    Colors
                                                                        .white,
                                                                fontSize: 12,
                                                              ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            text[index],
                                                            style:
                                                                const TextStyle(
                                                                  height: 2,
                                                                  color:
                                                                      Colors
                                                                          .white,
                                                                  fontSize: 12,
                                                                ),
                                                            textAlign:
                                                                TextAlign
                                                                    .justify,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                                return Text(
                                                  text[index],
                                                  style: const TextStyle(
                                                    height: 2,
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.justify,
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 30),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
