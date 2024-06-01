import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final String quantity;
  final void Function() countUp;
  final void Function() countDown;

  const QuantitySelector({
    Key? key,
    required this.quantity,
    required this.countUp,
    required this.countDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          iconSize: 28,
          icon: const Icon(Icons.remove_circle),
          onPressed: countDown,
        ),
        SizedBox(
          width: 20,
          child: Text(
            quantity,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          iconSize: 28,
          icon: const Icon(Icons.add_circle),
          onPressed: countUp,
        ),
      ],
    );
  }
}
