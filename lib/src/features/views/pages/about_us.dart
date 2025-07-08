import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/viewmodels/partnership_viewmodel.dart';
import 'package:humic_internify/src/features/views/components/contact_us.dart';
import 'package:humic_internify/src/features/views/components/hasil_produk_card.dart';
import 'package:humic_internify/src/features/views/components/our_developer_card.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final partnership = Get.find<PartnershipViewmodel>();

    return Obx(
      () => Column(
        children: [
          const SizedBox(height: 50),
          Column(
            children: [
              GestureDetector(
                onTap: () => partnership.hideThis(),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  color: softRed,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Partnership",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      AnimatedRotation(
                        turns: partnership.isHide.value ? 0.5 : 0,
                        duration: const Duration(milliseconds: 250),
                        child: const Icon(
                          CupertinoIcons.chevron_down,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (partnership.isHide.value)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  color: softRed,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      const Text(
                        "Kami bersama-sama menciptakan solusi yang memberdayakan bisnis dan meningkatkan efisiensi operasional.",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 2,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < partnership.data.length; i++)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 80,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${dotenv.env['API_BASE_URL']}${partnership.data[i].image}',
                                  width: 100,
                                  errorWidget:
                                      (context, url, error) =>
                                          const SizedBox.shrink(),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),

          const SizedBox(height: 40),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///HASIL  PRODUK
                HasilProdukCard(),

                ///Developer
                SizedBox(height: 20),
                OurDeveloperCard(),

                //Contact Us
                SizedBox(height: 20),
                ContactUs(),
              ],
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
