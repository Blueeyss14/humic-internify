import 'package:flutter/material.dart';
// import 'package:humic_internify/src/features/views/home/home_app.dart';
// import 'dart:async';

/*
class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => TestPageState();
}

class TestPageState extends State<TestPage> {
  Color _currentColor = Colors.red;
  late Timer _colorTimer;

  @override
  void initState() {
    super.initState();

    _colorTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentColor = _currentColor == Colors.red ? Colors.blue : Colors.red;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      _colorTimer.cancel();
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeApp()));
    });
  }

  @override
  void dispose() {
    _colorTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 200,
          height: 200,
          color: _currentColor,
        ),
      ),
    );
  }
}
*/
class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF263742),
      body: Center(child: Image.asset("assets/logo/splash_screen.png")),
    );
  }
}
