import 'package:flutter/material.dart';

class Option<T> {
  final T value;
  final String label;

  const Option({required this.value, required this.label});
}

class SimpleSelectForm<T> extends StatelessWidget {
  final T? value;
  final List<Option<T>> options;
  final void Function(T? newValue) onChanged;

  const SimpleSelectForm({
    Key? key,
    this.value,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T?>(
      value: value,
      isExpanded: true,
      iconSize: 32,
      elevation: 16,
      onChanged: onChanged,
      items: [
        DropdownMenuItem<T?>(
          value: null,
          child: const Text("表示しない"),
        ),
        ...options.map<DropdownMenuItem<T?>>((Option option) {
          return DropdownMenuItem<T?>(
            value: option.value,
            child: Text(option.label),
          );
        }).toList(),
      ],
    );
  }
}
