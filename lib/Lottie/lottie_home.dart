import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieExampleHome extends StatefulWidget {
  const LottieExampleHome({Key? key}) : super(key: key);

  @override
  State<LottieExampleHome> createState() => _LottieExampleHomeState();
}

class _LottieExampleHomeState extends State<LottieExampleHome> {
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
