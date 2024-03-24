import 'package:flutter/material.dart';
import 'package:more_order/ui/component/form/form_additional_message.dart';
import 'package:more_order/ui/component/form/simple_checkbox_list_tile.dart';
import 'package:more_order/ui/component/typography/section_title.dart';

class ReasonDefaultCheckboxField extends StatelessWidget {
  final String description;
  final bool value;
  final void Function(bool?) onChanged;
  final String? additionalMessage;

  const ReasonDefaultCheckboxField({
    Key? key,
    required this.description,
    required this.value,
    required this.onChanged,
    this.additionalMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(text: "いつもの理由"),
        Text(description),
        const SizedBox(height: 12.0),
        SimpleCheckboxListTile(
          value: value,
          onChanged: onChanged,
          title: "いつもの理由として登録",
        ),
        FormAdditionalMessage(message: additionalMessage),
      ],
    );
  }
}
