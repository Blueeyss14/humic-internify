import 'package:flutter/widgets.dart';

class HumicCircle extends StatelessWidget {
  final double? size;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final void Function()? onTap;
  final BoxBorder? border;
  const HumicCircle({
    super.key,
    this.size,
    this.margin,
    this.color,
    this.padding,
    this.child,
    this.onTap,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        margin: margin,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: border,
        ),
        child: child,
      ),
    );
  }
}
