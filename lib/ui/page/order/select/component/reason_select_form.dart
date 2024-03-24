import 'package:flutter/material.dart';
import 'package:more_order/domain/entity/reason.dart';
import 'package:more_order/domain/valueObject/id.dart';

class ReasonSelectForm extends StatelessWidget {
  final Id? value;
  final List<Reason> reasons;
  final void Function(Id? newValue) onChanged;
  const ReasonSelectForm({
    Key? key,
    this.value,
    required this.reasons,
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
        ...reasons.map<DropdownMenuItem<Id?>>((Reason reason) {
          return DropdownMenuItem<Id?>(
            value: reason.id,
            child: Text(reason.reason),
          );
        }).toList(),
      ],
    );
  }
}
