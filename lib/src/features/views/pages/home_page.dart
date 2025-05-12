import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset("assets/images/life-at-humic.png"),
                Positioned.fill(
                  child: Container(
                    margin: const EdgeInsets.only(right: 110),
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
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            maxFontSize: 12,
                            minFontSize: 3,
                          ),
                          SizedBox(height: 10),
                          AutoSizeText(
                            "Raih pengalaman internship yang bernilai dengan berkontribusi langsung dalam pengembangan solusi teknologi kami. Kembangkan kompetensi Anda melalui keterlibatan nyata dalam proyek IT serta bimbingan langsung dari para expert di bidang Software engineering dan IoT.",
                            style: TextStyle(fontSize: 7, height: 1.7),
                            maxLines: 5,
                            maxFontSize: 7,
                            minFontSize: 3,
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
                Expanded(
                  child: Image.asset(
                    "assets/images/mereka-humic.png",
                    width: 200,
                  ),
                ),
                const SizedBox(width: 15),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Kata mereka tentang",
                        style: TextStyle(fontSize: 9),
                        maxLines: 1,
                        maxFontSize: 12,
                        minFontSize: 3,
                      ),

                      AutoSizeText(
                        "Humic Engineering",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 1,
                        maxFontSize: 12,
                        minFontSize: 3,
                      ),
                      SizedBox(height: 5),
                      AutoSizeText(
                        "Humic engineering menjadi tempat yang menyenangkan bagi saya, karena dapat meningkatkan kemampuan saya dalam melakukan desain UI/UX. Banyak pembelajaran yang berharga serta memiliki lingkungan yang suportif",
                        style: TextStyle(fontSize: 7, height: 1.7),
                        maxLines: 5,
                        maxFontSize: 7,
                        minFontSize: 3,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Indra, Humic Internship Batch 3 2025 ",
                        style: TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.w800,
                          color: redHumic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            ///JELAJAHI POSISI
            const Text(
              "Jelajahi posisi yang kamu inginkan",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            Container(height: 300, width: 30, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
