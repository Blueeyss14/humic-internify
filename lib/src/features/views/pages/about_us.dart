import 'package:flutter/material.dart';
import 'package:humic_internify/src/features/models/about_item_model.dart';
import 'package:humic_internify/src/features/views/components/contact_us.dart';
import 'package:humic_internify/src/features/views/components/hasil_produk_card.dart';
import 'package:humic_internify/src/features/views/components/our_developer_card.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutItem = AboutItemModel.aboutData();
    // final project = Get.find<ProjectViewmodel>();
    return Column(
      children: [
        const SizedBox(height: 50),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          color: softRed,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Partnership",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
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
                    for (int i = 0; i < aboutItem.length; i++)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 80,
                        child: Image.asset(aboutItem[i].image, width: 100),
                      ),
                  ],
                ),
              ),
            ],
          ),
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
    );
  }
}
