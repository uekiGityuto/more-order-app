import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final bool dense;
  const DefaultLayout({Key? key, required this.child, this.dense = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: dense ? const EdgeInsets.all(0) : const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
