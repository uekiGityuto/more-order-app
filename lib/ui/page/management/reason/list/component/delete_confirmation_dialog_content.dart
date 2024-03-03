import 'package:flutter/material.dart';
import 'package:smart_order_app/domain/entity/reason.dart';

class DeleteConfirmationDialogContent extends StatelessWidget {
  final Reason reason;
  const DeleteConfirmationDialogContent({Key? key, required this.reason})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        reason.isDefault
            ? const Text("この理由はデフォルトとして登録されていますが、削除しても良いですか？")
            : const Text("この理由を削除しますか？"),
        ListTile(
          leading: const Icon(Icons.fiber_manual_record),
          title: Text(reason.reason),
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
