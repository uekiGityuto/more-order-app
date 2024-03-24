import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order/ui/page/management/payment_method/form/payment_method_validation.dart';

part 'payment_method_edit_form.freezed.dart';

@freezed
class PaymentMethodEditForm with _$PaymentMethodEditForm {
  factory PaymentMethodEditForm({
    required MethodInput methodInput,
    required bool isDefault,
    required bool isValid,
  }) = _PaymentMethodEditForm;
}
