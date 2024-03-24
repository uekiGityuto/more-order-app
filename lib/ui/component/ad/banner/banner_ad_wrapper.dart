import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:more_order_app/ui/component/ad/banner/simpole_banner_ad.dart';

class BannerAdWrapper extends StatelessWidget {
  const BannerAdWrapper({Key? key}) : super(key: key);

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
              return SizedBox(
                height: 70,
                child: SimpleBannerAd(size: data),
              );
            } else {
              return const SizedBox(height: 70);
            }
          } else {
            return const SizedBox(height: 70);
          }
        },
      );
}
