import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/viewmodels/feedback_viewmodel.dart';
import 'package:humic_internify/src/styles/custom_color.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    final feedbackController = Get.find<FeedbackViewmodel>();
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Frequently Asked Questions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "Berikut adalah informasi mengenai pertanyaan umum seputar program magang di Humic, termasuk tata cara pendaftaran dan persyaratan yang perlu dipenuhi. Masih ada yang perlu ditanyakan? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: "Silahkan DM kami.",
                      style: TextStyle(color: redHumic),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 10),
              ),
            ),

            ///FEEDBACK
            for (int i = 0; i < feedbackController.feedback.length; i++)
              GestureDetector(
                onTap: () => feedbackController.selectFeedback(i),
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: pinkHumic,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: Text(
                                feedbackController.feedback[i].feedback,
                                style: const TextStyle(
                                  color: redHumic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          if (feedbackController.selectedIndex.value == i)
                            const Icon(Icons.close, color: redHumic, size: 14)
                          else
                            const Icon(Icons.add, color: redHumic, size: 16),
                        ],
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child:
                            feedbackController.selectedIndex.value == i
                                ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    feedbackController.feedback[i].reply,
                                    style: const TextStyle(
                                      color: redHumic,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                )
                                : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
