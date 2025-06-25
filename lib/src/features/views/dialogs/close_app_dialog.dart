import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:humic_internify/src/shared/components/humic_button.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

Future<bool?> closeAppDialog(BuildContext context) {
  final completer = Completer<bool?>();

  Get.defaultDialog(
    backgroundColor: whiteHumic,
    title: 'Apakah anda yakin ingin keluar dari aplikasi ini?',
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
            Get.back();
            completer.complete(false);
          },
          alignment: Alignment.center,
          width: 90,
          isBorder: true,
          color: Colors.transparent,
          child: const Text(
            "Tidak",
            style: TextStyle(color: redHumic, fontWeight: FontWeight.bold),
          ),
        ),
        HumicButton(
          onTap: () {
            Get.back();
            completer.complete(true);
          },
          alignment: Alignment.center,
          width: 90,
          child: const Text(
            "Keluar",
            style: TextStyle(color: whiteHumic, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );

  return completer.future;
}
