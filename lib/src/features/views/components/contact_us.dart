import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:humic_internify/src/shared/components/humic_circle.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Our Developers",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          maxLines: 1,
          minFontSize: 3,
        ),

        Row(
          children: List.generate(
            4,
            (index) => const HumicCircle(color: redHumic, size: 50),
          ),
        ),
      ],
    );
  }
}
