import 'package:flutter/material.dart';

class AddEmptyOrder extends StatelessWidget {
  final void Function() onTapAdd;

  const AddEmptyOrder({
    Key? key,
    required this.onTapAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAdd,
      child: Container(
        margin: const EdgeInsets.only(top: 12.0),
        child: const Row(
          children: [
            Icon(Icons.add_circle),
            SizedBox(width: 12),
            Text('フレーズの入力を追加'),
          ],
        ),
      ),
    );
  }
}
