import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:more_order_app/ui/component/ad/banner/ad_banner.dart';

class AdBannerWrapper extends StatelessWidget {
  const AdBannerWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: AdSize.getAnchoredAdaptiveBannerAdSize(
          Orientation.portrait,
          MediaQuery.of(context).size.width.truncate(),
        ),
        builder: (
          BuildContext context,
          AsyncSnapshot<AnchoredAdaptiveBannerAdSize?> snapshot,
        ) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            if (data != null) {
              return Container(
                height: 70,
                color: Colors.white70,
                child: AdBanner(size: data),
              );
            } else {
              return Container(
                height: 70,
                color: Colors.white70,
              );
            }
          } else {
            return Container(
              height: 70,
              color: Colors.white70,
            );
          }
        },
      );
}
