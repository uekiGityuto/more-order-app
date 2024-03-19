import 'package:formz/formz.dart';
import 'package:more_order_app/domain/entity/payment_method.dart';
import 'package:more_order_app/ui/page/management/payment_method/edit/form/payment_method_edit_form.dart';
import 'package:more_order_app/ui/page/management/payment_method/form/payment_method_validation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_method_edit_form_controller.g.dart';

@riverpod
class PaymentMethodEditFormController
    extends _$PaymentMethodEditFormController {
  @override
  PaymentMethodEditForm build(PaymentMethod paymentMethod) {
    return PaymentMethodEditForm(
      methodInput: MethodInput.dirty(value: paymentMethod.method),
      isDefault: paymentMethod.isDefault,
      isValid: false,
    );
  }

  void onChangeMethod(String value) {
    final methodInput = MethodInput.dirty(value: value);
    state = state.copyWith(
        methodInput: methodInput,
        isValid: Formz.validate([
          methodInput,
        ]));
  }

  void onChangeIsDefault(bool? value) {
    state = state.copyWith(
        isDefault: value ?? false,
        isValid: Formz.validate([
          state.methodInput,
        ]));
  }
}
