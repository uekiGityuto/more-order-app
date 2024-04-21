import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order/domain/entity/payment_method.dart';
import 'package:more_order/domain/entity/reason.dart';
import 'package:more_order/domain/valueObject/id.dart';
import 'package:more_order/ui/form/form_creation_status.dart';
import 'package:more_order/ui/page/order/form/order.dart';

part 'custom_order_form.freezed.dart';

@freezed
class CustomOrderForm with _$CustomOrderForm {
  factory CustomOrderForm({
    required FormCreationStatus creationStatus,
    required List<Reason>? reasons,
    required Id? reasonInput,
    required Map<int, Order> ordersInput,
    required List<PaymentMethod>? paymentMethods,
    required Id? paymentMethodInput,
  }) = _CustomOrderForm;
}
