import 'package:flutter/material.dart';
import 'package:more_order_app/domain/entity/phrase.dart';

class DeleteConfirmationDialogContent extends StatelessWidget {
  final Phrase phrase;
  const DeleteConfirmationDialogContent({Key? key, required this.phrase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("このフレーズを削除しますか？"),
        ListTile(
          leading: const Icon(Icons.fiber_manual_record),
          title: Text(phrase.phrase),
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
