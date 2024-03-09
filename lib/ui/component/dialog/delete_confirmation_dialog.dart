import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final Future<void> Function() onPressed;

  const DeleteConfirmationDialog(
      {Key? key,
      this.title = '削除の確認',
      required this.content,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context, rootNavigator: true);

    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: navigator.pop,
                child: const Text('戻る'),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Text('削除'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
