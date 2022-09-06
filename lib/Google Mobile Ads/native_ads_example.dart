// Future<InitializationStatus> _initGoogleMobileAds() {
//     // TODO: Initialize Google Mobile Ads SDK
//     return MobileAds.instance.initialize();
//   }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdExample extends StatefulWidget {
  const NativeAdExample({super.key});

  @override
  State<NativeAdExample> createState() => _NativeAdExampleState();
}

class _NativeAdExampleState extends State<NativeAdExample> {
  late NativeAd _ad;
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState

    loadNativeAd();
  }

  void loadNativeAd() {
    _ad = NativeAd(
        nativeAdOptions: NativeAdOptions(
            requestCustomMuteThisAd: true,
            mediaAspectRatio: MediaAspectRatio.landscape),
        adUnitId: 'ca-app-pub-3940256099942544/2247696110',
        factoryId: 'listTile',
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            log("ad failed $error");
          },
        ),
        request: const AdRequest());
    _ad.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Native Ad Example")),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: ((context, index) {
                // if (isLoaded == true && index == 2) {
                //   return Container(
                //     alignment: Alignment.center,
                //     height: 100,
                //     child: AdWidget(ad: _ad),
                //   );
                // } else {
                return ListTile(
                  title: Text("Line No $index"),
                  leading: const FlutterLogo(),
                );
                // }
              })),
          isLoaded == true
              ? SizedBox(
                  // color: Colors.amber,
                  // alignment: Alignment.center,
                  height: 100,
                  child: AdWidget(ad: _ad),
                )
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
