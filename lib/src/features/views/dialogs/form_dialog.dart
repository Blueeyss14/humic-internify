import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:humic_internify/src/shared/components/humic_button.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

Future<bool> formDialog() async {
  final result = await Get.defaultDialog<bool>(
    backgroundColor: whiteHumic,
    title: 'Apakah Anda yakin ingin mengirim formulir ini?',
    titleStyle: const TextStyle(
      fontSize: 14,
      height: 2,
      fontWeight: FontWeight.bold,
    ),
    titlePadding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HumicButton(
          onTap: () {
            Get.back(result: false);
          },
          alignment: Alignment.center,
          width: 90,
          isBorder: true,
          color: Colors.transparent,
          child: const Text(
            "Batal",
            style: TextStyle(color: redHumic, fontWeight: FontWeight.bold),
          ),
        ),
        HumicButton(
          onTap: () {
            Get.back(result: true);
          },
          alignment: Alignment.center,
          width: 90,
          child: const Text(
            "Submit",
            style: TextStyle(color: whiteHumic, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );

  return result ?? false;
}
