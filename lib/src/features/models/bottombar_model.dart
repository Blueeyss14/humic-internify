import 'package:flutter/material.dart';

class BottombarModel {
  IconData icon;
  String label;

  BottombarModel(this.icon, this.label);

  static List<BottombarModel> bottombarData() {
    List<Map<String, dynamic>> datas = [
      {"Icon": Icons.flutter_dash, "Label": "Beranda"},
      {"Icon": Icons.flutter_dash, "Label": "Lowongan"},
      {"Icon": Icons.flutter_dash, "Label": "Tentang Kami"},
    ];

    return datas
        .map((data) => BottombarModel(data["Icon"], data["Label"]))
        .toList();
  }
}
