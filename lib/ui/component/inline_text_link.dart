import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:more_order/ui/style/custom_color.dart';

InlineSpan buildInlineTextLink(
    {required BuildContext context,
    required String text,
    required Widget nextPage}) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      color: CustomColors.linkBlue,
    ),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
  );
}
