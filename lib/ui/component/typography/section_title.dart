import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16 * MediaQuery.of(context).textScaleFactor,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
