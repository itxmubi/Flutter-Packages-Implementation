import 'package:flutter/material.dart';
import 'package:flutter_packages_implementation/Shimmer/shimmer_example.dart';

import '../Google Mobile Ads/native_ads_example.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pagesNamese = [
    "Native Ad Example",
    "Shimmer Example",
    // "Share Plus Example",
    // "Image Picker Example",
    // "Flutter Svg Example",
    // "Flutter Toast Example",
    // "Lottie Example",
    // "Device Info Plus Example",
    // "Connectivity Plus Example",
    // "Facebook Audience Network",
    // "Carousel Slider",
    // "Google Fonts"
  ];

  List<Widget> pages = [
    const NativeAdExample(),
    ShimmerExample(),
    // const SharePlusExample(),
    // const ImagePickerExample(),
    // const FlutterSvgExample(),
    // FlutterToastExample(),
    // const LottieExample(),
    // const DeviceInfoExample(),
    // const ConnectivityPlusExample(
    //   title: "Connectivity Plus Example",
    // ),
    // const FacebookAdsPage(),
    // const CarouselSliderExample(),
    // const GoogleFontsExample(title: "Google Fonts Example")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ntive Ad Implementation"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          for (int i = 0; i < pages.length; i++)
            Column(
              children: [
                ListTile(
                  title: Text(pagesNamese[i]),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => pages[i]));
                  },
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const Divider()
              ],
            ),
        ]),
      ),
    );
  }
}
