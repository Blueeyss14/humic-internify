import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int itemCount = 7;
    final int maxPerRow = 2;

    List<Widget> rows = [];
    for (int i = 0; i < itemCount; i += maxPerRow) {
      int remaining = itemCount - i;
      int countInThisRow = remaining >= maxPerRow ? maxPerRow : remaining;

      rows.add(
        Row(
          children: List.generate(maxPerRow, (index) {
            if (index < countInThisRow) {
              return Expanded(
                child: Container(
                  height: 100,
                  color:
                      Colors.primaries[(i + index) % Colors.primaries.length],
                  margin: EdgeInsets.only(
                    right: index < maxPerRow - 1 ? 8 : 0,
                    bottom: 8,
                  ),
                  child: Center(
                    child: Text(
                      'Container ${i + index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            } else {
              return Expanded(
                child: SizedBox(
                  height: 100,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: index < maxPerRow - 1 ? 8 : 0,
                      bottom: 8,
                    ),
                  ),
                ),
              );
            }
          }),
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: rows),
      ),
    );
  }
}
