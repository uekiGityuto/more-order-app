import 'package:flutter/material.dart';
import 'package:smart_order_app/domain/entity/payment_method.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/domain/entity/reason.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/order/display/component/last_message.dart';
import 'package:smart_order_app/ui/page/order/display/component/reason_field.dart';

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
                const SizedBox(
                  height: 24,
                ),
                ...phrases
                    .map(
                      (phrase) => ListTile(
                        leading: const Icon(Icons.fiber_manual_record),
                        title: Text(
                          phrase.phrase,
                          style: TextStyle(
                            fontSize:
                                24 * MediaQuery.of(context).textScaleFactor,
                          ),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                    )
                    .toList(),
                const SizedBox(
                  height: 24,
                ),
                LastMessage(paymentMethod: paymentMethodText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
