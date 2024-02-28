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
    void closeDialog() {
      Navigator.of(context, rootNavigator: true).pop();
    }

    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        TextButton(
          onPressed: closeDialog,
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () async {
            await onPressed();
            closeDialog();
          },
          child: const Text('削除'),
        ),
      ],
    );
  }
}
