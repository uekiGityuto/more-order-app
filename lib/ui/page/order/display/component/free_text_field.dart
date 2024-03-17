import 'package:flutter/material.dart';

class FreeTextField extends StatelessWidget {
  const FreeTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 20 * MediaQuery.of(context).textScaleFactor,
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      minLines: 3,
      decoration: InputDecoration(
        hintText: '店員さんとの会話でご利用ください',
        hintStyle: TextStyle(
          fontSize: 16 * MediaQuery.of(context).textScaleFactor,
        ),
        filled: true,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
