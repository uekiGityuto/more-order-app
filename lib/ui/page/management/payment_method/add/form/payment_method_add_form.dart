import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order_app/ui/page/management/payment_method/form/payment_method_validation.dart';

part 'payment_method_add_form.freezed.dart';

@freezed
class PaymentMethodAddForm with _$PaymentMethodAddForm {
  factory PaymentMethodAddForm({
    required MethodInput methodInput,
    required bool isDefault,
    required bool isValid,
  }) = _PaymentMethodAddForm;
}
