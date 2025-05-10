import 'package:flutter/material.dart';
import 'package:humic_internify/src/features/views/components/bottom_navbar.dart';
import 'package:humic_internify/styles/custom_color.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: humicBackground,
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.transparent)),
          const BottomNavbar(),
        ],
      ),
    );
  }
}
