import 'package:flutter/material.dart';

// TODO: 文字サイズ周りは別途検討
class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({Key? key, String? message})
      : message = message ?? 'エラーが発生しました。お手数ですが、アプリの再起動等をお試し下さい。',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            message,
            // style: const TextStyle(fontSize: 16),
          ),
        ));
  }
}
