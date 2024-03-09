import 'package:flutter/material.dart';
import 'package:smart_order_app/domain/entity/payment_method.dart';

class DeleteConfirmationDialogContent extends StatelessWidget {
  final PaymentMethod paymentMethod;
  const DeleteConfirmationDialogContent({Key? key, required this.paymentMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        paymentMethod.isDefault
            ? const Text("この支払方法はデフォルトとして登録されていますが、削除しても良いですか？")
            : const Text("この支払方法を削除しますか？"),
        ListTile(
          leading: const Icon(Icons.fiber_manual_record),
          title: Text(paymentMethod.method),
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
