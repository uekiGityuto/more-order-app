import 'package:flutter/material.dart';
import 'package:more_order_app/ui/component/no_registered_data.dart';

class NoPaymentMethod extends StatelessWidget {
  const NoPaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NoRegisteredData(
      message: '''注文時に「PayPay」、「現金」などの支払方法を表示することができます。
非表示にすることもできるので、何かしら登録してみることをおすすめします。
''',
    );
  }
}
