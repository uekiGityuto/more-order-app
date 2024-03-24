import 'package:formz/formz.dart';
import 'package:more_order/ui/page/management/payment_method/add/form/payment_method_add_form.dart';
import 'package:more_order/ui/page/management/payment_method/form/payment_method_validation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_method_add_form_controller.g.dart';

@riverpod
class PaymentMethodAddFormController extends _$PaymentMethodAddFormController {
  @override
  PaymentMethodAddForm build() {
    return PaymentMethodAddForm(
      methodInput: const MethodInput.pure(),
      isDefault: false,
      isValid: false,
    );
  }

  void onChangeMethod(String value) {
    final paymentMethodInput = MethodInput.dirty(value: value);
    state = state.copyWith(
        methodInput: paymentMethodInput,
        isValid: Formz.validate([
          paymentMethodInput,
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
