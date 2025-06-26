import 'package:flutter/material.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

class AttachFile extends StatelessWidget {
  final void Function()? onTap;
  final String? fileName;
  final String? title;
  final bool? isRequired;
  final IconData? errorIcon;
  final Color? borderColor;

  const AttachFile({
    super.key,
    this.onTap,
    this.fileName,
    this.title,
    this.isRequired = true,
    this.errorIcon,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? 'title',
          style: const TextStyle(
            color: blackHumic1,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(7),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.3,
                      color: borderColor ?? greyHumic,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: greyAttach,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.rotate(
                              angle: 35,
                              child: const Icon(
                                Icons.attach_file,
                                size: 20,
                                color: blackHumic1,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "Unggah File",
                              style: TextStyle(
                                fontSize: 12,
                                color: blackHumic1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          fileName ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: blueAttach,
                            color: blueAttach,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isRequired!) const SizedBox(width: 5),
            if (isRequired!) Icon(errorIcon, color: redHumic, size: 16),
          ],
        ),

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            "*only a PDF file will be accepted",
            style: TextStyle(color: redHumic, fontSize: 10),
          ),
        ),
      ],
    );
  }
}
