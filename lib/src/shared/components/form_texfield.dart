import 'package:flutter/material.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class FormTexfield extends StatelessWidget {
  final String? text;
  final Color? borderColor;
  final String? hintText;
  final int? maxlines;
  final double? height;
  final IconData? errorIcon;
  final bool? isRequired;
  final TextEditingController? controller;
  final Color? textColor;

  const FormTexfield({
    super.key,
    this.text,
    this.borderColor,
    this.hintText,
    this.maxlines = 1,
    this.height,
    this.errorIcon,
    this.isRequired = true,
    this.controller,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? 'text',
          style: TextStyle(
            color: textColor ?? blackHumic1,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.3,
                    color: borderColor ?? greyHumic,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: controller,
                  maxLines: maxlines,
                  cursorColor: blackHumic1,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(color: greyHumic, fontSize: 14),
                    border: InputBorder.none,

                    isDense: true,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ),
            if (isRequired!) const SizedBox(width: 5),
            if (isRequired!) Icon(errorIcon, color: redHumic, size: 16),
          ],
        ),
      ],
    );
  }
}
