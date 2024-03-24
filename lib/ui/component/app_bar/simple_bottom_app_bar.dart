import 'package:flutter/material.dart';
import 'package:more_order/constants.dart';
import 'package:more_order/ui/component/ad/banner/banner_ad_wrapper.dart';
import 'package:more_order/ui/page/management/page.dart';
import 'package:more_order/ui/page/order/select/page.dart';

enum NavigationItem {
  defaultSceneItem(name: defaultScene),
  managementItem(name: "メニュー");

  const NavigationItem({required this.name});

  final String name;
}

class SimpleBottomAppBar extends StatelessWidget {
  final bool suppressBannerAd;
  final NavigationItem? currentLocation;

  const SimpleBottomAppBar({
    Key? key,
    this.suppressBannerAd = false,
    this.currentLocation,
  }) : super(key: key);

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
                  icon: currentLocation == NavigationItem.defaultSceneItem
                      ? Icons.star
                      : Icons.star_border,
                  label: NavigationItem.defaultSceneItem.name,
                  onPressed: currentLocation == NavigationItem.defaultSceneItem
                      ? null
                      : () => Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const OrderSelectPage(
                                          sceneName: defaultScene),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                            (_) => false,
                          ),
                  active: currentLocation == NavigationItem.defaultSceneItem,
                ),
                _buildBottomAppBarItem(
                  context: context,
                  icon: currentLocation == NavigationItem.managementItem
                      ? Icons.my_library_add
                      : Icons.my_library_add_outlined,
                  label: NavigationItem.managementItem.name,
                  onPressed: currentLocation == NavigationItem.managementItem
                      ? null
                      : () => Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const ManagementPage(),
                              transitionDuration: const Duration(seconds: 0),
                            ),
                            (_) => false,
                          ),
                  active: currentLocation == NavigationItem.managementItem,
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
    VoidCallback? onPressed,
    bool active = false,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24.0,
            color: active ? Theme.of(context).colorScheme.primary : null,
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(
              color: active ? Theme.of(context).colorScheme.primary : null,
              // これ以上大きくするとoverflowするので固定値にする
              fontSize: 12,
              fontWeight: active ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }
}
