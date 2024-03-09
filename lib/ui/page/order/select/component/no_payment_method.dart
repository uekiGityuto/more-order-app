import 'package:flutter/material.dart';
import 'package:smart_order_app/ui/component/button/navigation_button.dart';
import 'package:smart_order_app/ui/component/no_registered_data.dart';
import 'package:smart_order_app/ui/page/management/payment_method/add/page.dart';

class NoPaymentMethod extends StatelessWidget {
  const NoPaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NoRegisteredData(
      message: "支払方法が登録されていません",
      navigationButton: NavigationButton(
        nextPage: PaymentMethodAddPage(),
        text: "支払方法を登録",
        isSecondary: true,
      ),
    );
  }
}
