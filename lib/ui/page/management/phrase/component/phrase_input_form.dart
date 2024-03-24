import 'package:flutter/material.dart';
import 'package:more_order/ui/component/form/form_error_message.dart';
import 'package:more_order/ui/component/typography/section_title.dart';

class PhraseInputField extends StatelessWidget {
  final String description;
  final TextEditingController? controller;
  final String? initialValue;
  final void Function(String) onChanged;
  final String? errorMessage;

  const PhraseInputField({
    Key? key,
    required this.description,
    this.initialValue,
    this.controller,
    required this.onChanged,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(text: "フレーズ"),
        Text(description),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          decoration: const InputDecoration(
            hintText: '例: ホットのコーヒー Mサイズ',
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
