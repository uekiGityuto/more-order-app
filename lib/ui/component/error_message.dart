import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage(
      {Key? key, this.message = "エラーが発生しました。お手数ですが、アプリの再起動等をお試し下さい。"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(message),
    );
  }
}
