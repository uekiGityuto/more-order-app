import 'package:flutter/material.dart';
import 'package:more_order/domain/entity/payment_method.dart';
import 'package:more_order/domain/entity/reason.dart';
import 'package:more_order/ui/layout/default_layout.dart';
import 'package:more_order/ui/page/order/display/component/free_text_field.dart';
import 'package:more_order/ui/page/order/display/component/last_message.dart';
import 'package:more_order/ui/page/order/display/component/phrases.dart';
import 'package:more_order/ui/page/order/display/component/reason_field.dart';
import 'package:more_order/ui/page/order/form/order.dart';
import 'package:more_order/ui/style/extension/list_space_between.dart';

class OrderDisplayPage extends StatelessWidget {
  final Reason? reason;
  final List<Order> orders;
  final PaymentMethod? paymentMethod;
  const OrderDisplayPage({
    Key? key,
    this.reason,
    required this.orders,
    required this.paymentMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reasonText = reason?.reason;
    final paymentMethodText = paymentMethod?.method;
    return DefaultLayout(
      title: "表示画面",
      bottomAppBarOption: const BottomAppBarOption(suppressBannerAd: true),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                if (reasonText != null) ReasonField(reason: reasonText),
                if (orders.isNotEmpty) Phrases(initialOrders: orders),
                if (orders.isNotEmpty || paymentMethodText != null)
                  LastMessage(paymentMethod: paymentMethodText),
                const FreeTextField(),
              ].withSpaceBetween(height: 24.0),
            ),
          ),
        ],
      ),
    );
  }
}
