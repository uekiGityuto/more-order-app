import 'package:flutter/material.dart';
import 'package:more_order/domain/entity/payment_method.dart';

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
        const Text("この支払方法を削除しますか？"),
        const SizedBox(
          height: 8.0,
        ),
        ListTile(
          leading: const Icon(Icons.fiber_manual_record),
          title: Text(paymentMethod.method),
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
