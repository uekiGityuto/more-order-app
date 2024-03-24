import 'package:flutter/material.dart';
import 'package:more_order/domain/entity/reason.dart';

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
        const Text("この理由を削除しますか？"),
        const SizedBox(
          height: 8.0,
        ),
        ListTile(
          leading: const Icon(Icons.fiber_manual_record),
          title: Text(reason.reason),
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
