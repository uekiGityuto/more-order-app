import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:more_order_app/constants.dart';
import 'package:more_order_app/ui/component/ad/ad_banner.dart';
import 'package:more_order_app/ui/page/management/page.dart';
import 'package:more_order_app/ui/page/order/select/page.dart';

class SimpleBottomAppBar extends StatelessWidget {
  const SimpleBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        FutureBuilder(
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
        ),
        BottomAppBar(
          height: 72.0,
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Builder(
                  builder: (context) => _buildBottomAppBarItem(
                    context: context,
                    icon: Icons.menu,
                    label: '場面一覧',
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                _buildBottomAppBarItem(
                  context: context,
                  icon: Icons.star,
                  label: defaultScene,
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const OrderSelectPage(sceneName: defaultScene),
                    ),
                    (_) => false,
                  ),
                ),
                _buildBottomAppBarItem(
                  context: context,
                  icon: Icons.playlist_add,
                  label: 'メニュー',
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ManagementPage()),
                    (_) => false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomAppBarItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24.0),
          const SizedBox(height: 4.0),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
