import 'package:flutter/material.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class HumicAppbar extends StatelessWidget {
  const HumicAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/logo.png", width: 90, height: 36),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: whiteHumic),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/indonesia.png", width: 18),
                    const SizedBox(width: 3),
                    Image.asset(
                      "assets/icons/down-arrow.png",
                      width: 8,
                      color: whiteHumic,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
