import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Packages Implementation"),
      ),

      body: Column(children: [
        ListTile(title: Text("Share Plus Example",),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SharePlusExample()));
          
        },),
        ListTile(title: Text("Flutter Svg Example"),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> FlutterSvgExample()));

        },),
        ListTile(title: Text("Flutter Toast Example"),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> FlutterToastExample()));

        },),
        ListTile(title: Text("Lottie Example"),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> LottieExample()));

        },),
        ListTile(title: Text("Device Info Plus Example"),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DeviceInfoExample()));

        },),
        ListTile(title: Text("Connectivity Plus Example"),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ConnectivityPlusExample(title: "Connectivity Plus Example",)));

        },),
        ListTile(title: Text("Facebook Audience Network Example"),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> FacebookAdsPage()));

        },),
      ]),
    );
  }
}