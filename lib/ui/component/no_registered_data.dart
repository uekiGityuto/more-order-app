import 'package:flutter/material.dart';

class NoRegisteredData extends StatelessWidget {
  final String message;

  const NoRegisteredData({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.topLeft, child: Text(message));
  }
}
