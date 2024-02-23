import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final bool isDense;
  const DefaultLayout({Key? key, required this.child, this.isDense = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: isDense ? const EdgeInsets.all(0) : const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
