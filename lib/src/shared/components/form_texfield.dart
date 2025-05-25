import 'package:flutter/material.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class FormTexfield extends StatelessWidget {
  final String? text;
  final Color? color;
  final String? hintText;
  final int? maxlines;
  final double? height;
  final IconData? errorIcon;
  const FormTexfield({
    super.key,
    this.text,
    this.color,
    this.hintText,
    this.maxlines = 1,
    this.height,
    this.errorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? 'text',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  border: Border.all(color: greyHumic),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
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
            const SizedBox(width: 5),
            Icon(errorIcon, color: redHumic, size: 16),
          ],
        ),
      ],
    );
  }
}
