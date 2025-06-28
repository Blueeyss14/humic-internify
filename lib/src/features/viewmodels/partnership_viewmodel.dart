import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:humic_internify/src/features/models/partnership_model.dart';
import 'package:http/http.dart' as http;

class PartnershipViewmodel extends GetxController {
  var data = <PartnershipModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fectData();
  }

  Future<void> fectData() async {
    try {
      final response = await http.get(
        Uri.parse('${dotenv.env['API_BASE_URL']}/partnership-api/get'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        data.value = jsonData.map((e) => PartnershipModel.fromJson(e)).toList();
      }
    } catch (e) {
      print('failed: $e');
    } finally {}
  }
}
