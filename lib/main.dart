import 'package:flutter/material.dart';
import 'package:flutter_packages_implementation/Url%20Launcher/url_launcher_main.dart';

import 'Flutter Svg/flutter_svg_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const FlutterSvgHome(
        // title: "UrlLancher Example",
      ),
    );
  }
}
