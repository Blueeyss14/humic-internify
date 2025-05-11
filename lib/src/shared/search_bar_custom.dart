import 'package:flutter/material.dart';
import 'package:humic_internify/src/shared/textfield_custom.dart';

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
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.height / 5,
        child: const Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Tingkatkan keahlian, perluas kesempatan",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Asah keterampilanmu dan jadilah mahasiswa yang siap bersaing di dunia industri",
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
              ],
            ),
            Align(alignment: Alignment.center, child: TextfieldCustom()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Tingkatkan keahlian, perluas kesempatan",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
