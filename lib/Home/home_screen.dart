import 'package:flutter/material.dart';
import 'package:flutter_packages_implementation/Carousel%20Slider/carousel_slider_example.dart';
import 'package:flutter_packages_implementation/Google%20Fonts/google_fonts_example.dart';
import 'package:flutter_packages_implementation/Image%20Picker/image_picker_example.dart';

import '../Connectivity Plus/connectivity_plus_example.dart';
import '../Device Info Plus/device_info_example.dart';
import '../Facebook Audience Network/facebook_ads_example.dart';
import '../Flutter Svg/flutter_svg_example.dart';
import '../Flutter Toast/flutter_toast_example.dart';
import '../Lottie/lottie_example.dart';
import '../Share Plus/share_plus_example.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pagesNamese = [
    "Share Plus Example",
    "Image Picker Example",
    "Flutter Svg Example",
    "Flutter Toast Example",
    "Lottie Example",
    "Device Info Plus Example",
    "Connectivity Plus Example",
    "Facebook Audience Network",
    "Carousel Slider",
    "Google Fonts"
  ];

  List<Widget> pages = [
    const SharePlusExample(),
    const ImagePickerExample(),
    const FlutterSvgExample(),
    FlutterToastExample(),
    const LottieExample(),
    const DeviceInfoExample(),
    const ConnectivityPlusExample(
      title: "Connectivity Plus Example",
    ),
    const FacebookAdsPage(),
    const CarouselSliderExample(),
    const GoogleFontsExample(title: "Google Fonts Example")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Packages Implementation"),
      ),
      body: Column(children: [
        for (int i = 0; i < pages.length; i++)
          Column(
            children: [
              ListTile(
                title: Text(pagesNamese[i]),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => pages[i]));
                },
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            const  Divider()
            ],
          ),
      ]),
    );
  }
}
