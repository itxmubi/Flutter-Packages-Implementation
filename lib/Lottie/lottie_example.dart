import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieExample extends StatefulWidget {
  const LottieExample({Key? key}) : super(key: key);

  @override
  State<LottieExample> createState() => _LottieExampleState();
}

class _LottieExampleState extends State<LottieExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie Example"),
      ),
      body: Column(children: [
        Lottie.asset("assets/gif/gif1.json", height: 200),
        Lottie.asset("assets/gif/gif2.json", height: 200),
        Lottie.asset("assets/gif/gif3.json", height: 200),
      ]),
    );
  }
}
