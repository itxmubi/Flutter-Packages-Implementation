import 'package:flutter/material.dart';
import 'package:flutter_packages_implementation/Flutter%20Rating%20Bar/flutter_rating_bar_example.dart';

import '../Auto Size Text/auto_size_text_example.dart';
import '../Carousel Slider/carousel_slider_example.dart';
import '../Connectivity Plus/connectivity_plus_example.dart';
import '../Device Info Plus/device_info_example.dart';
import '../Facebook Audience Network/facebook_ads_example.dart';
import '../Flutter SpinKit/flutter_spinkit_example.dart';
import '../Flutter Svg/flutter_svg_example.dart';
import '../Flutter Toast/flutter_toast_example.dart';
import '../Google Fonts/google_fonts_example.dart';
import '../Image Picker/image_picker_example.dart';
import '../Lottie/lottie_example.dart';
import '../Percent Indicator/percent_indicator_example.dart';
import '../Photo View Example/screens/home_screen.dart';
import '../Share Plus/share_plus_example.dart';
import '../Shimmer/shimmer_example.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pagesNamese = [
    "Flutter Rating Bar Example",
    "Percent Indicator Example",
    "Auto Size Text",
    "Photo View Example",
    "Flutter SpinKit Example",
    "Shimmer Example",
    "Share Plus Example",
    "Image Picker Example",
    "Flutter Svg Example",
    "Flutter Toast Example",
    "Lottie Example",
    "Device Info Plus Example",
    "Connectivity Plus Example",
    "Facebook Audience Network",
    "Carousel Slider",
    "Google Fonts",
  ];

  List<Widget> pages = [
    FlutterRatingBarExample(),
    const PercentInicatorExample(),
    const AutoSizeTextExample(),
    HomeScreenPhotoView(),
    const FlutterSpinkitExample(),
    ShimmerExample(),
    const SharePlusExample(),
    const ImagePickerExample(),
    const FlutterSvgExample(),
    const FlutterToastExample(),
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
