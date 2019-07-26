import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String appId = "ca-app-pub-2580587965389686~8149355163";
    FirebaseAdMob.instance.initialize(appId: appId);

    MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['game', 'lol'],
      contentUrl: 'https://flutter.io',
      childDirected: false,
      testDevices: <String>[], // Android emulators are considered test devices
    );

    BannerAd myBanner = BannerAd(
      // Replace the testAdUnitId with an ad unit id from the AdMob dash.
      // https://developers.google.com/admob/android/test-ads
      // https://developers.google.com/admob/ios/test-ads

      // adUnitId: BannerAd.testAdUnitId,
      adUnitId: "ca-app-pub-2580587965389686/9335332371",
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );

    myBanner
    // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        anchorOffset: 0.0,
        // Banner Position
        anchorType: AnchorType.bottom,
      );

    return Scaffold(
      appBar: AppBar(
        title: Text('AdMob Tutorial'),
      ),
      body: Center(child: Text('admob')),
    );
  }
}