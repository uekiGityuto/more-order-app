import 'package:flutter/material.dart';

class SimpleCheckboxListTile extends StatelessWidget {
  final bool? value;
  final void Function(bool?)? onChanged;
  final Widget title;
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
        title: title,
        tileColor: tileColor ?? Theme.of(context).colorScheme.surface,
        dense: dense);
  }
}
