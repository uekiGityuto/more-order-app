import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order/domain/valueObject/id.dart';

part 'payment_method.freezed.dart';

@freezed
abstract class PaymentMethod implements _$PaymentMethod {
  const PaymentMethod._();

  const factory PaymentMethod({
    required Id id,
    required String method,
    required bool isDefault,
  }) = _PaymentMethod;
}
