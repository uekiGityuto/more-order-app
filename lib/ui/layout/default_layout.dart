import 'package:flutter/material.dart';
import 'package:more_order_app/ui/component/app_bar/simple_app_bar.dart';
import 'package:more_order_app/ui/component/app_bar/simple_bottom_app_bar.dart';
import 'package:more_order_app/ui/component/drawer/simple_drawer.dart';

class BodyOption {
  final bool dense;

  BodyOption({this.dense = false});
}

class DefaultLayout extends StatelessWidget {
  final String title;
  final bool suppressBack;
  final Widget body;
  final BodyOption? bodyOption;
  final bool suppressBannerAd;

  const DefaultLayout({
    Key? key,
    required this.title,
    this.suppressBack = false,
    required this.body,
    this.bodyOption,
    this.suppressBannerAd = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveBodyOption = bodyOption ?? BodyOption();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: SimpleAppBar(
            title: title,
            leading: !suppressBack && Navigator.canPop(context)
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                : null),
        drawer: const SimpleDrawer(),
        body: SafeArea(
          child: Container(
            padding: effectiveBodyOption.dense
                ? const EdgeInsets.all(0)
                : const EdgeInsets.all(16.0),
            child: body,
          ),
        ),
        bottomNavigationBar:
            SimpleBottomAppBar(suppressBannerAd: suppressBannerAd),
      ),
    );
  }
}
