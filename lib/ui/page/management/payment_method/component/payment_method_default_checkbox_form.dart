import 'package:flutter/material.dart';
import 'package:more_order_app/ui/component/form/form_additional_message.dart';
import 'package:more_order_app/ui/component/form/simple_checkbox_list_tile.dart';
import 'package:more_order_app/ui/component/typography/section_title.dart';

class PaymentMethodDefaultCheckboxField extends StatelessWidget {
  final String description;
  final bool value;
  final void Function(bool?) onChanged;
  final String? additionalMessage;

  const PaymentMethodDefaultCheckboxField({
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
        const SectionTitle(text: "いつもの支払方法"),
        Text(description),
        const SizedBox(height: 12.0),
        SimpleCheckboxListTile(
          value: value,
          onChanged: onChanged,
          title: "いつもの支払方法として登録",
        ),
        FormAdditionalMessage(message: additionalMessage),
      ],
    );
  }
}
