import 'package:flutter/material.dart';

class InternshipPage extends StatelessWidget {
  const InternshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset("assets/images/pexels-pixabay-53594.jpg"),
        ),
        Container(color: Colors.amber, height: 6000, width: 20),
      ],
    );
  }
}
