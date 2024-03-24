import 'package:flutter/material.dart';
import 'package:more_order/ui/component/form/form_error_message.dart';

class SceneInputField extends StatelessWidget {
  final String description;
  final TextEditingController? controller;
  final String? initialValue;
  final void Function(String) onChanged;
  final String? errorMessage;

  const SceneInputField({
    Key? key,
    required this.description,
    this.controller,
    this.initialValue,
    required this.onChanged,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(description),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          decoration: const InputDecoration(
            hintText: '例: コンビニ',
          ),
          onChanged: onChanged,
        ),
        FormErrorMessage(
          errorMessage: errorMessage,
        ),
      ],
    );
  }
}
