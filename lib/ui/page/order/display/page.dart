import 'package:flutter/material.dart';
import 'package:more_order_app/domain/entity/payment_method.dart';
import 'package:more_order_app/domain/entity/phrase.dart';
import 'package:more_order_app/domain/entity/reason.dart';
import 'package:more_order_app/ui/layout/default_layout.dart';
import 'package:more_order_app/ui/page/order/display/component/free_text_field.dart';
import 'package:more_order_app/ui/page/order/display/component/last_message.dart';
import 'package:more_order_app/ui/page/order/display/component/phrases.dart';
import 'package:more_order_app/ui/page/order/display/component/reason_field.dart';
import 'package:more_order_app/ui/style/extension/list_space_between.dart';

class OrderDisplayPage extends StatelessWidget {
  final Reason? reason;
  final List<Phrase> phrases;
  final PaymentMethod? paymentMethod;
  const OrderDisplayPage({
    Key? key,
    this.reason,
    required this.phrases,
    required this.paymentMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reasonText = reason?.reason;
    final paymentMethodText = paymentMethod?.method;
    return DefaultLayout(
      title: "表示画面",
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                if (reasonText != null) ReasonField(reason: reasonText),
                if (phrases.isNotEmpty) Phrases(phrases: phrases),
                if (phrases.isNotEmpty || paymentMethodText != null)
                  LastMessage(paymentMethod: paymentMethodText),
                const FreeTextField(),
              ].withSpaceBetween(height: 24.0),
            ),
          ),
        ],
      ),
      suppressBannerAd: true,
    );
  }
}
