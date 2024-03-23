import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:more_order_app/ui/component/ad/ad_helper.dart';

class AdBanner extends StatelessWidget {
  AdBanner({super.key});

  final isMobile = (Platform.isAndroid || Platform.isIOS);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60,
        child: isMobile
            ? AdWidget(ad: AdHelper.createBannerAd()..load())
            : Container(),
      );
}
