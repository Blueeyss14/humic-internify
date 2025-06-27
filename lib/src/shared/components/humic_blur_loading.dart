import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:humic_internify/src/shared/components/humic_loading.dart';

class HumicBlurLoading extends StatelessWidget {
  final bool? isLoading;
  const HumicBlurLoading({super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.white.withAlpha(80),
          child: const HumicLoading(),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
