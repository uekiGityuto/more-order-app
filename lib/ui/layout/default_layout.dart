import 'package:flutter/material.dart';
import 'package:more_order_app/ui/component/app_bar/simple_app_bar.dart';
import 'package:more_order_app/ui/component/app_bar/simple_bottom_app_bar.dart';
import 'package:more_order_app/ui/component/drawer/simple_drawer.dart';

class BodyOption {
  final bool dense;

  BodyOption({this.dense = false});
}

class DefaultLayout extends StatelessWidget {
  final Widget body;
  final String title;
  final BodyOption? bodyOption;

  const DefaultLayout({
    Key? key,
    required this.title,
    required this.body,
    this.bodyOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveBodyOption = bodyOption ?? BodyOption();

    return Scaffold(
      appBar: SimpleAppBar(title: title),
      drawer: const SimpleDrawer(),
      body: SafeArea(
        child: Container(
          padding: effectiveBodyOption.dense
              ? const EdgeInsets.all(0)
              : const EdgeInsets.all(16.0),
          child: body,
        ),
      ),
      bottomNavigationBar: const SimpleBottomAppBar(),
    );
  }
}
