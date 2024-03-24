import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SimpleBannerAd extends StatefulWidget {
  const SimpleBannerAd({Key? key}) : super(key: key);

  @override
  State<SimpleBannerAd> createState() => _SimpleBannerAdState();
}

class _SimpleBannerAdState extends State<SimpleBannerAd> {
  late BannerAd _bannerAd;
  bool _isBannerAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _initBannerAd();
  }

  void _initBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: _getBannerAdUnitId(),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Ad failed to load: $error');
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  String _getBannerAdUnitId() {
    if (Platform.isAndroid) {
      return kDebugMode
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-8112256294079848/4307421763';
    } else if (Platform.isIOS) {
      return kDebugMode
          ? 'ca-app-pub-3940256099942544/2934735716'
          : 'ca-app-pub-8112256294079848/4335341920';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double placeholderHeight = 50;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: _isBannerAdLoaded
          ? AdSize.banner.height.toDouble()
          : placeholderHeight,
      alignment: Alignment.center,
      child: _isBannerAdLoaded
          ? AdWidget(ad: _bannerAd)
          : const SizedBox(
              height: placeholderHeight,
              // TODO: 多分消す
              child: Center(
                child: Text('Loading ad...'),
              ),
            ),
    );
  }
}
