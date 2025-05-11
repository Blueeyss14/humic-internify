import 'package:flutter/material.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class TextfieldCustom extends StatelessWidget {
  const TextfieldCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: whiteHumic,
        ),
        // margin: const EdgeInsets.symmetric(horizontal: 40),
        width: MediaQuery.of(context).size.width,
        height: 38,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: const TextSelectionThemeData(
                    selectionHandleColor: blackHumic1,
                  ),
                ),
                child: const TextField(
                  cursorColor: blackHumic1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ),
            const Icon(Icons.flutter_dash),
          ],
        ),
      ),
    );
  }
}
