import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:humic_internify/src/shared/components/humic_button.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

void formDialog() {
  Get.defaultDialog(
    backgroundColor: whiteHumic,
    title: 'Apakah Anda yakin ingin mengirim formulir ini?',
    titleStyle: const TextStyle(
      fontSize: 14,
      height: 2,
      fontWeight: FontWeight.bold,
    ),
    titlePadding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    content: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HumicButton(
          alignment: Alignment.center,
          width: 90,
          isBorder: true,
          color: Colors.transparent,
          child: Text(
            "Batal",
            style: TextStyle(color: redHumic, fontWeight: FontWeight.bold),
          ),
        ),
        HumicButton(
          alignment: Alignment.center,
          width: 90,
          child: Text(
            "Submit",
            style: TextStyle(color: whiteHumic, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
