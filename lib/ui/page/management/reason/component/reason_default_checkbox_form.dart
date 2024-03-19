import 'package:flutter/material.dart';
import 'package:more_order_app/ui/component/form/form_additional_message.dart';
import 'package:more_order_app/ui/component/form/simple_checkbox_list_tile.dart';
import 'package:more_order_app/ui/component/typography/section_title.dart';

class ReasonDefaultCheckboxField extends StatelessWidget {
  final String description;
  final bool value;
  final void Function(bool?) onChanged;
  final String additionalMessage;

  const ReasonDefaultCheckboxField({
    Key? key,
    this.description = "この理由をデフォルトにする場合はチェックして下さい。",
    required this.value,
    required this.onChanged,
    required this.additionalMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(text: "デフォルト"),
        Text(description),
        const SizedBox(height: 12.0),
        SimpleCheckboxListTile(
          value: value,
          onChanged: onChanged,
          title: "デフォルトとして登録",
        ),
        FormAdditionalMessage(message: additionalMessage),
      ],
    );
  }
}
