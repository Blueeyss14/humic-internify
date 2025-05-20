import 'package:flutter/material.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class HumicButton extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? textColor;
  const HumicButton({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color ?? redHumic,
      ),
      child: Text("Daftar", style: TextStyle(color: textColor ?? whiteHumic)),
    );
  }
}
