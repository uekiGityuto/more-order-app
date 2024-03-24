import 'package:flutter/material.dart';
import 'package:more_order/domain/entity/scene.dart';

class DeleteConfirmationDialogContent extends StatelessWidget {
  final Scene scene;
  const DeleteConfirmationDialogContent({Key? key, required this.scene})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("この場面を削除しますか？"),
        ListTile(
          leading: const Icon(Icons.fiber_manual_record),
          title: Text(scene.scene),
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
