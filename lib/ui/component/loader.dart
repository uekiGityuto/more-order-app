import 'package:flutter/material.dart';

Widget buildProgressIndicator(BuildContext context) {
  return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      ));
}
