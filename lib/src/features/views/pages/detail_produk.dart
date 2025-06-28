import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:humic_internify/src/features/viewmodels/project_viewmodel.dart';
import 'package:humic_internify/src/shared/styles/custom_color.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DetailProduk extends StatelessWidget {
  const DetailProduk({super.key});

  @override
  Widget build(BuildContext context) {
    final project = Get.find<ProjectViewmodel>();

    return Scaffold(
      backgroundColor: whiteHumic,
      body: Column(
        children: [
          ///APPBAR
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
                      'Detail Produk Internship',
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        project.data[project.selectedItem.value].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),

                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl:
                            '${dotenv.env['API_BASE_URL']}${project.data[project.selectedItem.value].image}',

                        errorWidget:
                            (context, url, error) => const SizedBox.shrink(),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: pinkHumic,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(Iconsax.box, color: redHumic, size: 20),
                              SizedBox(width: 5),
                              Text(
                                "Mobile Apps",
                                style: TextStyle(
                                  color: redHumic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(Iconsax.calendar, color: redHumic, size: 20),
                              SizedBox(width: 5),
                              Text(
                                "2 bulan",
                                style: TextStyle(
                                  color: redHumic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Iconsax.clock, color: redHumic, size: 20),
                              SizedBox(width: 5),
                              Text(
                                "16 Juni 2025",
                                style: TextStyle(
                                  color: redHumic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: pinkHumic,
                      ),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Icon(Iconsax.user, color: redHumic, size: 20),
                              SizedBox(width: 10),
                              Text(
                                "Jane Doe",
                                style: TextStyle(
                                  color: redHumic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Project Manager",
                                style: TextStyle(color: redHumic, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(Iconsax.path, color: redHumic, size: 20),
                              SizedBox(width: 10),
                              Text(
                                "Jane Doe",
                                style: TextStyle(
                                  color: redHumic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Project Manager",
                                style: TextStyle(color: redHumic, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(
                                Iconsax.mobile_programming,
                                color: redHumic,
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Jane Doe",
                                style: TextStyle(
                                  color: redHumic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Project Manager",
                                style: TextStyle(color: redHumic, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(
                                Iconsax.document_code,
                                color: redHumic,
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Jane Doe",
                                style: TextStyle(
                                  color: redHumic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Project Manager",
                                style: TextStyle(color: redHumic, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(
                                Iconsax.document_code,
                                color: redHumic,
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Jane Doe",
                                style: TextStyle(
                                  color: redHumic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Project Manager",
                                style: TextStyle(color: redHumic, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // const Text(
                    //   "Program magang di berbagai perusahaan teknologi dan startup semakin menjadi wadah bagi para mahasiswa untuk melahirkan inovasi. Salah satu bidang yang kini banyak dilirik adalah Internet of Things (IoT) untuk sektor kesehatan. Melalui proyek akhir magang, para talenta muda ini berhasil mengembangkan berbagai solusi canggih. Salah satu yang menonjol adalah \"VitalSense IoT\", sebuah platform pemantauan kesehatan terintegrasi yang menunjukkan potensi besar dalam mentransformasi layanan kesehatan di masa depan.",
                    //   style: TextStyle(fontSize: 12),
                    //   textAlign: TextAlign.justify,
                    // ),
                    // const SizedBox(height: 20),

                    // const Text(
                    //   "Tujuan utama dikembangkannya aplikasi VitalSense IoT adalah untuk menyediakan sistem pemantauan kondisi vital pasien secara real-time dan dapat diakses dari jarak jauh. Aplikasi ini dirancang untuk mengumpulkan data penting seperti detak jantung, suhu tubuh, saturasi oksigen, dan laju pernapasan melalui sensor-sensor nirkabel. Tujuannya adalah agar tenaga medis dapat memantau pasien, terutama mereka yang berisiko tinggi atau dalam masa pemulihan di rumah, tanpa memerlukan kunjungan fisik yang konstan. Selain itu, aplikasi ini bertujuan memberikan peringatan dini (early warning) kepada tim medis atau keluarga jika terdeteksi adanya parameter vital yang keluar dari batas normal.",
                    //   style: TextStyle(fontSize: 12),
                    //   textAlign: TextAlign.justify,
                    // ),
                    // const SizedBox(height: 20),

                    // const Text(
                    //   "Dampak yang diharapkan dari implementasi VitalSense IoT sangat signifikan. Pertama, ia meningkatkan kualitas perawatan pasien dengan memungkinkan deteksi dini perburukan kondisi, sehingga intervensi medis bisa dilakukan lebih cepat dan berpotensi menyelamatkan nyawa. Kedua, aplikasi ini meningkatkan efisiensi tenaga medis, memungkinkan mereka memantau lebih banyak pasien dengan sumber daya yang ada. Ketiga, VitalSense IoT memberikan rasa aman dan kemandirian bagi pasien dan keluarganya, karena kondisi kesehatan dapat terpantau terus-menerus. Kehadiran inovasi seperti VitalSense IoT, yang lahir dari program magang, membuktikan kontribusi nyata generasi muda dalam menciptakan solusi teknologi tepat guna untuk sektor kesehatan.",
                    //   style: TextStyle(fontSize: 12),
                    //   textAlign: TextAlign.justify,
                    // ),

                    ///fetch
                    Text(
                      project.data[project.selectedItem.value].deskripsi,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
