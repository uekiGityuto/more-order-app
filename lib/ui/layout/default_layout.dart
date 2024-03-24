import 'package:flutter/material.dart';
import 'package:more_order_app/ui/component/ad/simple_banner_ad.dart';
import 'package:more_order_app/ui/component/app_bar/simple_app_bar.dart';
import 'package:more_order_app/ui/component/app_bar/simple_bottom_app_bar.dart';
import 'package:more_order_app/ui/component/drawer/simple_drawer.dart';

class BodyOption {
  final bool dense;

  BodyOption({this.dense = false});
}

class DefaultLayout extends StatelessWidget {
  final String title;
  final bool cannotBack;
  final Widget body;
  final BodyOption? bodyOption;

  const DefaultLayout({
    Key? key,
    required this.title,
    this.cannotBack = false,
    required this.body,
    this.bodyOption,
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
            leading: !cannotBack && Navigator.canPop(context)
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                : null),
        drawer: const SimpleDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              const SimpleBannerAd(),
              Flexible(
                child: Container(
                  padding: effectiveBodyOption.dense
                      ? const EdgeInsets.all(0)
                      : const EdgeInsets.all(16.0),
                  child: body,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const SimpleBottomAppBar(),
      ),
    );
  }
}
