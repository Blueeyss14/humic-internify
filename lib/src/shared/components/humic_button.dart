import 'package:flutter/material.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

class HumicButton extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final void Function()? onTap;
  final Widget? child;
  final AlignmentGeometry? alignment;
  final bool? isBorder;
  const HumicButton({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.onTap,
    this.child,
    this.alignment,
    this.isBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    double border = 1.5;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        width: width,
        height: height,
        padding:
            padding ??
            EdgeInsets.symmetric(
              horizontal: isBorder! ? (15 - border) : 15,
              vertical: isBorder! ? (10 - border) : 10,
            ),
        margin: margin,
        decoration: BoxDecoration(
          border: isBorder! ? Border.all(color: redHumic, width: border) : null,
          borderRadius: BorderRadius.circular(6),
          color: color ?? redHumic,
        ),
        child: child,
      ),
    );
  }
}
