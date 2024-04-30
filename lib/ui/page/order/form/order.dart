import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

@freezed
abstract class Order implements _$Order {
  const Order._();

  const factory Order({
    required String phrase,
    required int quantity,
  }) = _Order;

  bool isEmpty() {
    return phrase.isEmpty || quantity == 0;
  }

  bool isQuantityZero() {
    return phrase.isNotEmpty && quantity == 0;
  }
}
