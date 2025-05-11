import 'package:flutter/material.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class TextfieldCustom extends StatelessWidget {
  const TextfieldCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      width: MediaQuery.of(context).size.width,
      height: 38,
      color: whiteHumic,
    );
  }
}
