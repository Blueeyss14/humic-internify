import 'package:flutter/material.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      alignment: Alignment.bottomCenter,
      height: MediaQuery.of(context).size.height / 3 + 50,
      width: double.infinity,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4 - 50,
        child: const Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [Text("data", style: TextStyle(color: Colors.white))],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("data", style: TextStyle(color: Colors.white))],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("data", style: TextStyle(color: Colors.white))],
            ),
          ],
        ),
      ),
    );
  }
}
