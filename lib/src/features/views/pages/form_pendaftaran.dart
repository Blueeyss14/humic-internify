import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:humic_internify/src/shared/components/form_texfield.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class FormPendaftaran extends StatelessWidget {
  const FormPendaftaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteHumic,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: greyBlueHumic,
            width: double.infinity,
            height: 120,
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      "Form Pendaftaran",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Flexible(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: FormTexfield(text: "Nama Depan")),
                          SizedBox(width: 10),
                          Expanded(child: FormTexfield(text: "Nama Belakang")),
                        ],
                      ),
                      SizedBox(height: 20),
                      FormTexfield(
                        text: "Email",
                        hintText: "email@gmail.com",
                        errorIcon: Icons.error,
                      ),

                      SizedBox(height: 20),
                      FormTexfield(text: "Kontak", hintText: "ex: 08123456789"),

                      SizedBox(height: 20),
                      FormTexfield(
                        text: "Fakultas",
                        hintText: "ex: Fakultas Informatika",
                      ),

                      SizedBox(height: 20),
                      FormTexfield(
                        text: "Program Studi",
                        hintText: "ex: S1 Teknologi Informasi",
                      ),

                      SizedBox(height: 20),
                      FormTexfield(
                        height: 100,
                        maxlines: null,
                        text: "Skill",
                        hintText: "Ketik disini",
                      ),

                      SizedBox(height: 20),
                      FormTexfield(
                        height: 130,
                        maxlines: null,
                        text: "Motivasi ingin bergabung ke Humic?",
                        hintText: "Ketik disini",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
