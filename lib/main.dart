import 'package:flutter/material.dart';

import 'Lottie/lottie_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Packages Implementation',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LottieExampleHome(
          // title: "UrlLancher Example",
          ),
    );
  }
}
