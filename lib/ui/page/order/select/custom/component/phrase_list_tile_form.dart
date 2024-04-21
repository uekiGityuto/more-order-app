import 'package:flutter/material.dart';
import 'package:more_order/ui/component/form/quantity_selector.dart';

class PhraseListTileForm extends StatelessWidget {
  final String quantity;
  final void Function(String) onChangedPhrase;
  final void Function() countUp;
  final void Function() countDown;

  const PhraseListTileForm({
    Key? key,
    required this.quantity,
    required this.onChangedPhrase,
    required this.countUp,
    required this.countDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        decoration: const InputDecoration(
          hintText: '注文したいものを入力',
        ),
        onChanged: onChangedPhrase,
      ),
      tileColor: Theme.of(context).colorScheme.surface,
      contentPadding: const EdgeInsets.all(0.0),
      dense: true,
      trailing: QuantitySelector(
        quantity: quantity,
        countUp: countUp,
        countDown: countDown,
      ),
    );
  }
}
