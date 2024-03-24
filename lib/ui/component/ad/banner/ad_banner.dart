import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBanner extends StatefulWidget {
  final AdSize size;

  const AdBanner({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  late BannerAd banner;

  @override
  void initState() {
    super.initState();
    banner = _createBanner(widget.size);
  }

  @override
  void dispose() {
    banner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: banner.size.width.toDouble(),
      height: banner.size.height.toDouble(),
      child: AdWidget(ad: banner),
    );
  }

  String get _bannerAdUnitId {
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

  BannerAd _createBanner(AdSize size) {
    return BannerAd(
      size: size,
      adUnitId: _bannerAdUnitId,
      listener: BannerAdListener(
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          banner.dispose();
        },
      ),
      request: const AdRequest(),
    )..load();
  }
}
