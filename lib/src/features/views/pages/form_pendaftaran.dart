import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/viewmodels/form_controller.dart';
import 'package:humic_internify/src/shared/components/form_texfield.dart';
import 'package:humic_internify/src/shared/components/humic_button.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class FormPendaftaran extends StatelessWidget {
  const FormPendaftaran({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Get.find<FormController>();
    return Scaffold(
      backgroundColor: whiteHumic,
      body: Obx(
        () => Column(
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

            Flexible(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Expanded(child: FormTexfield(text: "Nama Depan")),
                            SizedBox(width: 10),
                            Expanded(
                              child: FormTexfield(text: "Nama Belakang"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const FormTexfield(
                          text: "Email",
                          hintText: "email@gmail.com",
                          errorIcon: Icons.error,
                        ),

                        const SizedBox(height: 20),
                        const FormTexfield(
                          text: "Kontak",
                          hintText: "ex: 08123456789",
                        ),

                        const SizedBox(height: 20),
                        const FormTexfield(
                          text: "Fakultas",
                          hintText: "ex: Fakultas Informatika",
                        ),

                        const SizedBox(height: 20),
                        const FormTexfield(
                          text: "Program Studi",
                          hintText: "ex: S1 Teknologi Informasi",
                        ),

                        const SizedBox(height: 20),
                        const FormTexfield(
                          height: 100,
                          maxlines: null,
                          text: "Skill",
                          hintText: "Ketik disini",
                        ),

                        const SizedBox(height: 20),
                        const FormTexfield(
                          height: 130,
                          maxlines: null,
                          text: "Motivasi ingin bergabung ke Humic?",
                          hintText: "Ketik disini",
                        ),

                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: form.checkIsAgree,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        form.isAgree.value
                                            ? Colors.blue
                                            : blackHumic1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      form.isAgree.value
                                          ? Colors.blue
                                          : Colors.white,
                                ),
                                child:
                                    form.isAgree.value
                                        ? const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        )
                                        : const SizedBox.shrink(),
                              ),

                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "Dengan melanjutkan, saya mengonfirmasi bahwa saya telah membaca secara seksama dan menyetujui ",
                                      ),
                                      TextSpan(
                                        text: "Persyaratan Layanan ",
                                        style: TextStyle(color: redHumic),
                                      ),
                                      TextSpan(text: "dan "),
                                      TextSpan(
                                        text: "Kebijakan Privasi.",
                                        style: TextStyle(color: redHumic),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),
                        HumicButton(
                          color:
                              form.isAgree.value
                                  ? redHumic
                                  : redHumic.withAlpha(150),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: whiteHumic,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
