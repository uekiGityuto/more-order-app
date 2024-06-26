import 'package:flutter/material.dart';

class ReasonField extends StatelessWidget {
  final String reason;
  const ReasonField({Key? key, required this.reason}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFECE8D5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        reason,
        style: TextStyle(
          fontSize: 20 * MediaQuery.of(context).textScaleFactor,
        ),
      ),
    );
  }
}
