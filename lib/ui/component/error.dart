import 'package:flutter/material.dart';

// TODO: 文字サイズ周りは別途検討
Widget createErrorMessage(
    {String message = 'エラーが発生しました。お手数ですが、アプリの再起動等をお試しください。'}) {
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
