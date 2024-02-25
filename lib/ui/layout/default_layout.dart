import 'package:flutter/material.dart';
import 'package:smart_order_app/ui/component/app_bar/simple_app_bar.dart';
import 'package:smart_order_app/ui/component/app_bar/simple_bottom_app_bar.dart';
import 'package:smart_order_app/ui/component/simple_drawer.dart';

class BodyOption {
  final bool dense;

  BodyOption({this.dense = false});
}

class DefaultLayout extends StatelessWidget {
  final Widget body;
  final String title;
  final BodyOption bodyOption;

  const DefaultLayout({
    Key? key,
    required this.title,
    required this.body,
    required this.bodyOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: title),
      drawer: const SimpleDrawer(),
      body: SafeArea(
        child: Container(
          padding: bodyOption.dense
              ? const EdgeInsets.all(0)
              : const EdgeInsets.all(16.0),
          child: body,
        ),
      ),
      bottomNavigationBar: const SimpleBottomAppBar(),
    );
  }
}
