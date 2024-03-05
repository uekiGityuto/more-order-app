import 'package:flutter/material.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/domain/entity/reason.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/order/display/component/reason_field.dart';

class OrderDisplayPage extends StatelessWidget {
  final String sceneName;
  final Reason? reason;
  final List<Phrase> phrases;
  const OrderDisplayPage(
      {Key? key, required this.sceneName, this.reason, required this.phrases})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reasonText = reason?.reason;
    return DefaultLayout(
      title: sceneName,
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
                Text(
                  "以上、宜しくお願いします",
                  style: TextStyle(
                    fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
