import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:more_order/ui/page/order/form/order.dart';

class Phrases extends HookWidget {
  final List<Order> initialOrders;

  const Phrases({Key? key, required this.initialOrders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = useState<List<Order>>(initialOrders);

    void onReorder(int oldIndex, int newIndex) {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = orders.value.removeAt(oldIndex);
      orders.value.insert(newIndex, item);
      orders.value = List<Order>.from(orders.value);
    }

    return ReorderableListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      onReorder: onReorder,
      children: orders.value.map((order) {
        return Padding(
          key: ValueKey(order.phrase),
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 6.0 * MediaQuery.of(context).textScaleFactor,
                ),
                child: Icon(
                  Icons.drag_handle,
                  size: 20 * MediaQuery.of(context).textScaleFactor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  order.quantity == 1
                      ? order.phrase
                      : '${order.phrase} ×${order.quantity}',
                  style: TextStyle(
                    fontSize: 24 * MediaQuery.of(context).textScaleFactor,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
