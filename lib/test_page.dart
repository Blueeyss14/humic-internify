import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_recaptcha_v2_compat/flutter_recaptcha_v2_compat.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();
  String recaptchaToken = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: RecaptchaV2(
          apiKey: '${dotenv.env['SITE_KEY']}',
          apiSecret: '',
          controller: recaptchaV2Controller,
          onVerifiedSuccessfully: (token) {
            print('$token');
          },
          onVerifiedError: (err) {
            print('RECAPTCHA ERROR: $err');
          },
        ),
      ),
    );
  }
}
