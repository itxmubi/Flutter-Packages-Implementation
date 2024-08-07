import 'package:flutter/material.dart';
import 'package:flutter_packages_implementation/Another%20FLushBar/another_flushbar_example.dart';
import 'package:flutter_packages_implementation/Flutter%20Blue%20Plus/flutter_blue_plus_example.dart';
import 'package:flutter_packages_implementation/Flutter%20fl_chart/util/app_helper.dart';

import '../Animated Text Kit/animated_text_kit_example.dart';
import '../App Settings/app_settings_example.dart';
import '../Auto Size Text/auto_size_text_example.dart';
import '../Badges/badges_example.dart';
import '../Camera/camera_example.dart';
import '../Card Swiper/card_swipper_example.dart';
import '../Carousel Slider/carousel_slider_example.dart';
import '../Connectivity Plus/connectivity_plus_example.dart';
import '../Device Info Plus/device_info_example.dart';
import '../Dots Indicator/dots_indicator_example.dart';
import '../Dotted Border/dotted_border_example.dart';
import '../Drop down Search/drop_down_search_example.dart';
import '../Dropdown Button2/drop_down_button2_example.dart';
import '../Facebook Audience Network/facebook_ads_example.dart';
import '../Flutter Alarm Clock/flutter_alarm_clock_example.dart';
import '../Flutter ColorPicker/flutter_colorpicker_example.dart';
import '../Flutter Easy Loading/flutter_easyloading_example.dart';
import '../Flutter HTML/flutter_html_example.dart';
import '../Flutter Image Compress/flutter_image_compress.dart';
import '../Flutter Rating Bar/flutter_rating_bar_example.dart';
import '../Flutter Slideable/flutter_slideble_example.dart';
import '../Flutter Speed Dial/flutter_speed_dial_example.dart';
import '../Flutter SpinKit/flutter_spinkit_example.dart';
import '../Flutter Staggered Animation/flutter_stager_example.dart';
import '../Flutter Sticky Header/flutter_sticky_header_example.dart';
import '../Flutter Svg/flutter_svg_example.dart';
import '../Flutter Switch/flutter_switch_example.dart';
import '../Flutter Toast/flutter_toast_example.dart';
import '../Flutter Typehead/f_typehead_main.dart';
import '../Flutter fl_chart/presentation/pages/home_page.dart';
import '../Flutter reflective Visual/reflective_visual_example.dart';
import '../Google Fonts/google_fonts_example.dart';
import '../Image Cropper/Image_cropper.dart';
import '../Image Picker/image_picker_example.dart';
import '../Just Audio/just_audio_example.dart';
import '../Local Auth Package/local_auth_example.dart';
import '../Location/location_example.dart';
import '../Lottie/lottie_example.dart';
import '../Mobile Scanner/mobile_scanner_example.dart';
import '../NFC FLUTTER Kit/nfc_flutter_kit_example.dart';
import '../NFC Manager/nfc_manager_example.dart';
import '../Nice Ripple/nice_ripple.dart';
import '../Percent Indicator/percent_indicator_example.dart';
import '../Photo View Example/home_screen.dart';
import '../Pin Code Fields/pin_code_fields_exmple.dart';
import '../Presistent NavBar/presistent_nav_bar.dart';
import '../QR Scanner/qr_scan_example.dart';
import '../RFlutter Alert/rflutter_alert_example.dart';
import '../Sensors Pus/sensor_plus_example.dart';
import '../Share Plus/share_plus_example.dart';
import '../Shimmer/shimmer_example.dart';
import '../Smooth Page Idicator/smooth-page_indicator_example.dart';
import '../Table Calendar/table_calendar_example.dart';
import '../WakeLock/wakelock_example.dart';
import '../Youtube Player Flutter/youtube_player_flutter_example.dart';
import '../one_clock_example.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pagesNamese = [
    "Sensors Plus Example",
    "Flutter Alarm Clock Example",
    "Flutter Blue Plus Example",
    "Flutter HTML Example",
    "Another FlushBar Example",
    "NFC Flutter Kit",
    "NFC Example",
    "Flutter Sticky Header",
    "Dots Indicator Example",
    "WakeLock Example",
    "Location Example",
    "Youtube Player Flutter Example",
    "Flutter Easy Loading",
    "Flutter Speed Dial Example",
    "Flutter Typehead Example",
    "Mobile Scanner Example",
    "QR Scanner Example",
    "Flutter Color Picker Example",
    "App Settings Example",
    "Dropdown Button 2 Example",
    "RFlutter Alert Example",
    "Drop Down Search Example",
    "Camera Example",
    "Flutter Staggerd Animation Example",
    "Card Swipper Example",
    "Flutter Slideable Example",
    "Nice Ripple Example",
    "Animated Text Kit Example",
    "Flutter Switch Example",
    "Table Calendar Example",
    "Presistent NaVBar Example",
    // "Edge Detection Example",
    "Flutter Image Compress",
    "Local Auth Example",
    "Smooth Page Indicator",
    "Just Audio",
    "Image Cropper Example",
    "Dotted Border EXAMPLE",
    "FL Chart Example",
    "Badges Example",
    "Pin Code Fields Example",
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
    "Reflective Visual Example",
    "One CLock Example"
  ];

  List<Widget> pages = [
    const SensorsPlusExample(),
    const FlutterAlarmClockExample(),
    const FlutterBlueApp(),
    // const FlutterBlueAppExample(),
    const FlutterHTMLExample(),
    const AnotherFLushbarExample(),
    const NFCFlutterKitExample(),
    const NFCExample(),
    const StickyHeaderExample(),
    const DotsIndicatorExample(),
    const WakelockPlusExampleApp(),
    const LocationExample(),
    const FlutterYoutubePlayerExample(),
    const FlutterEasyLoading(),
    const FlutterSpeedDialExample(),
    const FlutterTypeHeadExample(),
    const MobileScannerExample(),
    const QRScannerExample(),
    const FlutterColorPickerExample(),
    const AppSettingExample(),
    const DropDownButton2Example(),
    const RFlutterAlertExample(),
    const DropDownSearchExample(),
    const CameraExampleHome(),
    const FlutterStaggeredAnimationExample(),
    const CardSwipperExample(),
    const FlutterSlideAbleExample(),
    const NiceRippleExample(),
    const AnimatedTextKitExample(),
    const FlutterSwitchExamples(),
    const TableCalendarExample(),
    const PresistentNavBarExample(),
    // const EdgeDetetionExample(),
    const FlutterImageCompressExample(),
    const LocalAuthExample(),
    const SmoothPageIndicatorExample(),
    const JustAudioExample(),
    const ImageCropperExample(),
    const DottedBorderExample(),
    FlChartExample(
      showingChartType: ChartType.bar,
    ),
    const BadgesExample(),
    const PinCodeVerificationScreen(),
    const FlutterRatingBarExample(),
    const PercentInicatorExample(),
    const AutoSizeTextExample(),
    const HomeScreenPhotoView(),
    const FlutterSpinkitExample(),
    const ShimmerExample(),
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
    const GoogleFontsExample(title: "Google Fonts Example"),
    const ReflectiveVisualExample(),
    const OneClockExample(
      title: "One Clock Example",
    )
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
