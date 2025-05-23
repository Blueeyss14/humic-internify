import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:humic_internify/src/shared/components/humic_button.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class OurDeveloperCard extends StatelessWidget {
  const OurDeveloperCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> developers = [
      {
        "name": "Taufik",
        "image": "/",
        "position": "Project Manager",
        "Link": "/",
      },
      {
        "name": "Reinhard",
        "image": "/",
        "position": "Web Designer",
        "Link": "/",
      },
      {
        "name": "Shafa",
        "image": "/",
        "position": "Mobile Designer",
        "Link": "/",
      },
      {
        "name": "Faried",
        "image": "/",
        "position": "Frontend Developer",
        "Link": "/",
      },
      {
        "name": "Delkano",
        "image": "/",
        "position": "Mobile Developer",
        "Link": "/",
      },
      {
        "name": "Yohanes",
        "image": "/",
        "position": "Backend Developer",
        "Link": "/",
      },
      {
        "name": "Reihan",
        "image": "/",
        "position": "Backend Developer",
        "Link": "/",
      },
    ];

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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                developers.length,
                (index) => Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  width: 150,
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
                    children: [
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AutoSizeText(
                        developers[index]['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 1,
                        ),
                        // maxLines: 2,
                        // minFontSize: 3,
                      ),

                      const SizedBox(height: 2),
                      AutoSizeText(
                        developers[index]['position'],
                        style: const TextStyle(fontSize: 1),
                        // maxLines: 2,
                      ),
                      const SizedBox(height: 7),

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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
