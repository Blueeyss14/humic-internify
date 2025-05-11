import 'package:flutter/material.dart';

class HumicAppbar extends StatelessWidget {
  const HumicAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      color: Colors.transparent,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Appbar", style: TextStyle(color: Colors.white)),
          Text("Appbar", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
