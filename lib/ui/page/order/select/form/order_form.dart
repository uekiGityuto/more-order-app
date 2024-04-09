import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order/domain/entity/payment_method.dart';
import 'package:more_order/domain/entity/reason.dart';
import 'package:more_order/domain/entity/scene.dart';
import 'package:more_order/domain/valueObject/id.dart';
import 'package:more_order/ui/form/form_creation_status.dart';

part 'order_form.freezed.dart';

@freezed
class OrderForm with _$OrderForm {
  factory OrderForm({
    required FormCreationStatus creationStatus,
    required List<Reason>? reasons,
    required Id? reasonInput,
    required Scene? scene,
    required Map<Id, int> phrasesInput,
    required List<PaymentMethod>? paymentMethods,
    required Id? paymentMethodInput,
  }) = _OrderForm;
}
