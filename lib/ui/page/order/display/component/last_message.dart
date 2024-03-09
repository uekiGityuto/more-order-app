import 'package:flutter/material.dart';

class LastMessage extends StatelessWidget {
  final String? paymentMethod;
  const LastMessage({Key? key, this.paymentMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      paymentMethod == null ? "以上、宜しくお願いします" : "支払いは$paymentMethodでお願いします",
      style: TextStyle(
        fontSize: 24 * MediaQuery.of(context).textScaleFactor,
      ),
    );
  }
}
