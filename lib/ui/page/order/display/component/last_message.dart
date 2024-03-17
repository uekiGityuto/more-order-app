import 'package:flutter/material.dart';
import 'package:nil/nil.dart';

class LastMessage extends StatelessWidget {
  final bool hasPhrases;
  final String? paymentMethod;
  const LastMessage({Key? key, required this.hasPhrases, this.paymentMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return paymentMethod != null
        ? RichText(
            text: TextSpan(
              text: "支払いは",
              style: DefaultTextStyle.of(context).style.copyWith(
                    fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                  ),
              children: [
                TextSpan(
                  text: "「$paymentMethod」",
                  style: TextStyle(
                    fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                  ),
                ),
                const TextSpan(text: 'でお願いします'),
              ],
            ),
          )
        : hasPhrases
            ? Text(
                "お願いします",
                style: TextStyle(
                  fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                ),
              )
            : nil;
  }
}
