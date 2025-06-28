import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:humic_internify/src/shared/components/humic_circle.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> socials = [
      {
        "icon": "assets/icons/instagram.png",
        "link":
            "https://www.instagram.com/humicengineering?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
      },
      {
        "icon": "assets/icons/linkedin.png",
        "link": "https://www.linkedin.com/company/humic-engineering/about/",
      },
      {
        "icon": "assets/icons/email.png",
        "link": "mailto:humic@telkomuniversity.ac.id",
      },
      {
        "icon": "assets/icons/website.png",
        "link": "https://humic.telkomuniversity.ac.id/",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Contact Us",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          maxLines: 1,
          minFontSize: 3,
        ),
        const SizedBox(height: 20),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Iconsax.location),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Gedung Kultubai Selatan, Blok F",
                    style: TextStyle(height: 2, fontWeight: FontWeight.bold),
                  ),

                  const Text(
                    "Jl. Telekomunikasi, Terusan Buah Batu Bandung Jawa Barat, Indonesia, 40257.",
                    style: TextStyle(height: 2),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        socials.length,
                        (index) => HumicCircle(
                          onTap: () async {
                            final url = socials[index]['link'];
                            if (url != null && url.toString().isNotEmpty) {
                              try {
                                await launchUrl(
                                  Uri.parse(url),
                                  mode: LaunchMode.externalApplication,
                                );
                              } catch (e) {
                                debugPrint("Gagal membuka URL: $e");
                              }
                            }
                          },

                          margin: const EdgeInsets.only(right: 10),
                          border: Border.all(width: 2),
                          size: 45,
                          child: Image.asset(socials[index]['icon'], width: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
