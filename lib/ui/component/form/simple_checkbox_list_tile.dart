import 'package:flutter/material.dart';

class SimpleCheckboxListTile extends StatelessWidget {
  final bool? value;
  final void Function(bool?)? onChanged;
  final String title;
  final Color? tileColor;
  final bool? dense;

  const SimpleCheckboxListTile({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.tileColor,
    this.dense = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16 * MediaQuery.of(context).textScaleFactor,
          ),
        ),
        tileColor: tileColor ?? Theme.of(context).colorScheme.surface,
        dense: dense);
  }
}
