import 'package:flutter/material.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

class HumicLoading extends StatelessWidget {
  const HumicLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(color: redHumic, strokeWidth: 1.3);
  }
}
