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
                    padding: const EdgeInsets.only(
                      left: 25,
                      top: 25,
                      bottom: 25,
                      right: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: FormTexfield(
                                controller: form.firstName.value,
                                text: "Nama Depan",
                                textColor:
                                    form.isFirstNameError.value
                                        ? redHumic
                                        : null,
                                isRequired:
                                    form.isFirstNameError.value ? true : false,
                                borderColor:
                                    form.isFirstNameError.value
                                        ? redHumic
                                        : null,
                                errorIcon:
                                    form.isFirstNameError.value
                                        ? Icons.error
                                        : null,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: FormTexfield(
                                controller: form.lastName.value,
                                isRequired: false,
                                text: "Nama Belakang",
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 20),
                        FormTexfield(
                          controller: form.email.value,
                          text: "Email",
                          textColor: form.isEmailError.value ? redHumic : null,
                          hintText: "email@gmail.com",
                          borderColor:
                              form.isEmailError.value ? redHumic : null,
                          errorIcon:
                              form.isEmailError.value ? Icons.error : null,
                        ),

                        const SizedBox(height: 20),
                        FormTexfield(
                          controller: form.contact.value,
                          text: "Kontak",
                          textColor:
                              form.isContactError.value ? redHumic : null,
                          hintText: "ex: 08123456789",
                          borderColor:
                              form.isContactError.value ? redHumic : null,
                          errorIcon:
                              form.isContactError.value ? Icons.error : null,
                        ),

                        const SizedBox(height: 20),
                        FormTexfield(
                          controller: form.faculty.value,
                          text: "Fakultas",
                          textColor:
                              form.isFacultyError.value ? redHumic : null,
                          hintText: "ex: Fakultas Informatika",
                          borderColor:
                              form.isFacultyError.value ? redHumic : null,
                          errorIcon:
                              form.isFacultyError.value ? Icons.error : null,
                        ),

                        const SizedBox(height: 20),
                        FormTexfield(
                          controller: form.major.value,
                          text: "Program Studi",
                          textColor: form.isMajorError.value ? redHumic : null,
                          hintText: "ex: S1 Teknologi Informasi",
                          borderColor:
                              form.isMajorError.value ? redHumic : null,
                          errorIcon:
                              form.isMajorError.value ? Icons.error : null,
                        ),

                        const SizedBox(height: 20),
                        FormTexfield(
                          controller: form.skills.value,
                          height: 100,
                          maxlines: null,
                          text: "Skill",
                          textColor: form.isSkillsError.value ? redHumic : null,
                          hintText: "Ketik disini",
                          borderColor:
                              form.isSkillsError.value ? redHumic : null,
                          errorIcon:
                              form.isSkillsError.value ? Icons.error : null,
                        ),

                        const SizedBox(height: 20),
                        FormTexfield(
                          controller: form.motivation.value,
                          height: 130,
                          maxlines: null,
                          text: "Motivasi ingin bergabung ke Humic?",
                          textColor:
                              form.isMotivationError.value ? redHumic : null,
                          hintText: "Ketik disini",
                          borderColor:
                              form.isMotivationError.value ? redHumic : null,
                          errorIcon:
                              form.isMotivationError.value ? Icons.error : null,
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
                                child: Padding(
                                  padding: EdgeInsets.only(right: 5),
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
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),
                        HumicButton(
                          margin: const EdgeInsets.only(right: 15),
                          padding: const EdgeInsets.all(10),
                          onTap: () => form.submitForm(),
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
