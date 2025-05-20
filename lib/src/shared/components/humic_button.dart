import 'package:flutter/material.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class HumicButton extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? textColor;
  final void Function()? onTap;
  final Widget? child;
  const HumicButton({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.textColor,
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color ?? redHumic,
        ),
        child: child,
      ),
    );
  }
}
