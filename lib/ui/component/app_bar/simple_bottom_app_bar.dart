import 'package:flutter/material.dart';
import 'package:more_order_app/constants.dart';
import 'package:more_order_app/ui/component/ad/banner/banner_ad_wrapper.dart';
import 'package:more_order_app/ui/page/management/page.dart';
import 'package:more_order_app/ui/page/order/select/page.dart';

class SimpleBottomAppBar extends StatelessWidget {
  final bool suppressBannerAd;
  const SimpleBottomAppBar({Key? key, this.suppressBannerAd = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!suppressBannerAd) const BannerAdWrapper(),
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
