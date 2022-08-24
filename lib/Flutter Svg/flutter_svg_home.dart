import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FlutterSvgHome extends StatefulWidget {
  const FlutterSvgHome({Key? key}) : super(key: key);

  @override
  State<FlutterSvgHome> createState() => _FlutterSvgHomeState();
}

class _FlutterSvgHomeState extends State<FlutterSvgHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Svg Home"),
      ),
      body: Column(children: [
        SvgPicture.asset(
          "assets/svg/img1.svg",
          height: 100,
        ),
        SvgPicture.asset(
          "assets/svg/img2.svg",
          height: 100,
        ),
        SvgPicture.asset(
          "assets/svg/img3.svg",
          height: 100,
        ),
        SvgPicture.asset(
          "assets/svg/img4.svg",
          height: 100,
        ),
      ]),
    );
  }
}
