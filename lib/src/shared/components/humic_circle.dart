import 'package:flutter/widgets.dart';

class HumicCircle extends StatelessWidget {
  final double? size;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  const HumicCircle({
    super.key,
    this.size,
    this.margin,
    this.color,
    this.padding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: padding,
      margin: margin,
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: child,
    );
  }
}
