import 'package:flutter/material.dart';

class FormAdditionalMessage extends StatelessWidget {
  final String? message;
  const FormAdditionalMessage({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: message != null,
        child: Text(message ?? "",
            style: const TextStyle(
              color: Colors.brown,
            )));
  }
}
