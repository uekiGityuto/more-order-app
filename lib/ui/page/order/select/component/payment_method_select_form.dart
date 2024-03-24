import 'package:flutter/material.dart';
import 'package:more_order/domain/entity/payment_method.dart';
import 'package:more_order/domain/valueObject/id.dart';

class PaymentMethodSelectForm extends StatelessWidget {
  final Id? value;
  final List<PaymentMethod> paymentMethods;
  final void Function(Id? newValue) onChanged;
  const PaymentMethodSelectForm({
    Key? key,
    this.value,
    required this.paymentMethods,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Id?>(
      value: value,
      isExpanded: true,
      iconSize: 32,
      elevation: 16,
      onChanged: onChanged,
      items: [
        const DropdownMenuItem<Id?>(
          value: null,
          child: Text("表示しない"),
        ),
        ...paymentMethods
            .map<DropdownMenuItem<Id?>>((PaymentMethod paymentMethod) {
          return DropdownMenuItem<Id?>(
            value: paymentMethod.id,
            child: Text(paymentMethod.method),
          );
        }).toList(),
      ],
    );
  }
}
