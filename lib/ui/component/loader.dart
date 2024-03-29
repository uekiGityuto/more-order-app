import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ));
  }
}
