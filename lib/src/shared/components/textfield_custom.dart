import 'package:flutter/material.dart';
import 'package:humic_internify/src/styles/custom_color.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TextfieldCustom extends StatelessWidget {
  const TextfieldCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  style: TextStyle(fontSize: 14),
                  textCapitalization: TextCapitalization.sentences,
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: blackHumic1,
                  decoration: InputDecoration(
                    hintText: "Cari Lowongan Magangmu di Sini",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: redHumic,
              ),
              child: const Icon(
                Iconsax.search_normal_1_copy,
                size: 14,
                color: whiteHumic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
