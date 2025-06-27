import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/routes/routes_name.dart';
import 'package:humic_internify/src/shared/components/humic_button.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';

class LamaranTerkirim extends StatelessWidget {
  const LamaranTerkirim({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        return;
      },
      child: Scaffold(
        backgroundColor: whiteHumic,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/lamaran_diterima.png', width: 150),
                const SizedBox(height: 20),
                const Text(
                  "Lamaran Telah Terkirim",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                const Text(
                  "Kami akan segera memeriksa lamaran kamu.",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                const Text(
                  "Cek email secara berkala untuk informasi selanjutnya!",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 35),

                IntrinsicWidth(
                  child: HumicButton(
                    onTap: () => Get.offAllNamed(RoutesName.home),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    child: const Text(
                      "Kembali ke Beranda",
                      style: TextStyle(
                        fontSize: 10,
                        color: whiteHumic,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
