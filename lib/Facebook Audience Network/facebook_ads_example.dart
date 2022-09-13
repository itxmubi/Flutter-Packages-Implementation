import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

class FacebookAdsPage extends StatefulWidget {
  final String idfa;

  const FacebookAdsPage({Key? key, this.idfa = ''}) : super(key: key);

  @override
  FacebookAdsPageState createState() => FacebookAdsPageState();
}

class FacebookAdsPageState extends State<FacebookAdsPage> {
  bool _isInterstitialAdLoaded = false;
  bool _isRewardedAdLoaded = false;

  /// All widget ads are stored in this variable. When a button is pressed, its
  /// respective ad widget is set to this variable and the view is rebuilt using
  /// setState().
  Widget _currentAd = const SizedBox(
    width: 0.0,
    height: 0.0,
  );

  @override
  void initState() {
    super.initState();

    /// please add your own device testingId
    /// (testingId will print in console if you don't provide  )
    FacebookAudienceNetwork.init(
      testingId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      iOSAdvertiserTrackingEnabled: true,
    );

    _loadInterstitialAd();
    _loadRewardedVideoAd();
  }

  void _loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      // placementId: "YOUR_PLACEMENT_ID",
      placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
      listener: (result, value) {
        log(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED) {
          _isInterstitialAdLoaded = true;
        }

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          _loadInterstitialAd();
        }
      },
    );
  }

  void _loadRewardedVideoAd() {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId: "YOUR_PLACEMENT_ID",
      listener: (result, value) {
        log("Rewarded Ad: $result --> $value");
        if (result == RewardedVideoAdResult.LOADED) _isRewardedAdLoaded = true;
        if (result == RewardedVideoAdResult.VIDEO_COMPLETE)

        /// Once a Rewarded Ad has been closed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        // ignore: curly_braces_in_flow_control_structures
        if (result == RewardedVideoAdResult.VIDEO_CLOSED &&
            (value == true || value["invalidated"] == true)) {
          _isRewardedAdLoaded = false;
          _loadRewardedVideoAd();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Align(
              alignment: const Alignment(0, -1.0),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: _getAllButtons(),
              ),
            ),
          ),
          // Column(children: <Widget>[
          //   _nativeAd(),
          //   // _nativeBannerAd(),
          //   _nativeAd(),
          // ],),
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: Align(
              alignment: const Alignment(0, 1.0),
              child: _currentAd,
            ),
          )
        ],
      ),
    );
  }

  Widget _getAllButtons() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 3,
      children: <Widget>[
        _getRaisedButton(title: "Banner Ad", onPressed: _showBannerAd),
        _getRaisedButton(title: "Native Ad", onPressed: _showNativeAd),
        _getRaisedButton(
            title: "Native Banner Ad", onPressed: _showNativeBannerAd),
        _getRaisedButton(
            title: "Intestitial Ad", onPressed: _showInterstitialAd),
        _getRaisedButton(title: "Rewarded Ad", onPressed: _showRewardedAd),
      ],
    );
  }

  Widget _getRaisedButton({required String title, void Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _showInterstitialAd() {
    if (_isInterstitialAdLoaded == true) {
      FacebookInterstitialAd.showInterstitialAd();
    } else {
      print("Interstial Ad not yet loaded!");
    }
  }

  _showRewardedAd() {
    if (_isRewardedAdLoaded == true) {
      FacebookRewardedVideoAd.showRewardedVideoAd();
    } else {
      log("Rewarded Ad not yet loaded!");
    }
  }

  _showBannerAd() {
    setState(() {
      _currentAd = FacebookBannerAd(
        // placementId: "YOUR_PLACEMENT_ID",
        placementId:
            // "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047", //testid
            "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID", //testid
        bannerSize: BannerSize.STANDARD,
        listener: (result, value) {
          log("Banner Ad: $result -->  $value");
        },
      );
    });
  }

  _showNativeBannerAd() {
    setState(() {
      _currentAd = _nativeBannerAd();
    });
  }

  Widget _nativeBannerAd() {
    return FacebookNativeAd(
      // placementId: "YOUR_PLACEMENT_ID",
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      adType: NativeAdType.NATIVE_BANNER_AD,
      bannerAdSize: NativeBannerAdSize.HEIGHT_100,
      width: double.infinity,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: (result, value) {
        log("Native Banner Ad: $result --> $value");
      },
    );
  }

  _showNativeAd() {
    setState(() {
      _currentAd = _nativeAd();
    });
  }

  Widget _nativeAd() {
    return FacebookNativeAd(
      placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964952163583650",
      adType: NativeAdType.NATIVE_AD_VERTICAL,
      width: double.infinity,
      height: 300,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: (result, value) {
        print("Native Ad: $result --> $value");
      },
      keepExpandedWhileLoading: true,
      expandAnimationDuraion: 1000,
    );
  }
}
