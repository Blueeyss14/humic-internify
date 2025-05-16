import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:humic_internify/src/features/viewmodels/posisition_viewmodel.dart';
import 'package:humic_internify/src/styles/custom_color.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class InternshipPage extends StatelessWidget {
  const InternshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    final positionController = Get.find<PosisitionViewmodel>();
    return Column(
      children: [
        const SizedBox(height: 30),
        for (int i = 0; i < positionController.data.length; i++)
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      positionController.data[i].jobTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color:
                            positionController.data[i].status
                                ? softGreen
                                : softRed,
                        border: Border.all(
                          width: 2,
                          color:
                              positionController.data[i].status
                                  ? greenHumic
                                  : redHumic,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        positionController.data[i].status ? "Opened" : "Closed",
                        style: TextStyle(
                          color:
                              positionController.data[i].status
                                  ? greenHumic
                                  : redHumic,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Iconsax.location, color: greyHumic),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(positionController.data[i].location),
                    ),
                    const SizedBox(width: 5),

                    const Icon(Iconsax.briefcase, color: greyHumic),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(positionController.data[i].category),
                    ),
                    const SizedBox(width: 5),

                    const Icon(Iconsax.moneys, color: greyHumic),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(positionController.data[i].paidStatus),
                    ),
                  ],
                ),
              ],
            ),
          ),
        const SizedBox(height: 100),
      ],
    );
  }
}
