import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order/domain/entity/payment_method.dart';
import 'package:more_order/ui/error_handler_mixin.dart';
import 'package:more_order/ui/layout/default_layout.dart';
import 'package:more_order/ui/page/management/payment_method/component/payment_method_default_checkbox_form.dart';
import 'package:more_order/ui/page/management/payment_method/component/payment_method_input_form.dart';
import 'package:more_order/ui/page/management/payment_method/edit/form/payment_method_edit_form_controller.dart';
import 'package:more_order/usecase/state/payment_methods.dart';

class PaymentMethodEditPage extends ConsumerWidget with ErrorHandlerMixin {
  final PaymentMethod paymentMethod;
  const PaymentMethodEditPage({Key? key, required this.paymentMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentMethodForm =
        ref.watch(paymentMethodEditFormControllerProvider(paymentMethod));
    final navigator = Navigator.of(context);
    return DefaultLayout(
      title: "支払方法の編集",
      body: Column(children: [
        Expanded(
          child: ListView(
            children: [
              PaymentMethodInputField(
                description: '支払方法を編集して下さい。',
                initialValue: paymentMethodForm.methodInput.value,
                onChanged: ref
                    .read(paymentMethodEditFormControllerProvider(paymentMethod)
                        .notifier)
                    .onChangeMethod,
                errorMessage:
                    paymentMethodForm.methodInput.displayError?.errorMessage,
              ),
              const SizedBox(
                height: 24,
              ),
              PaymentMethodDefaultCheckboxField(
                description: _getDefaultMessage(
                    existingIsDefault: paymentMethod.isDefault),
                value: paymentMethodForm.isDefault,
                onChanged: (bool? newValue) {
                  ref
                      .read(
                          paymentMethodEditFormControllerProvider(paymentMethod)
                              .notifier)
                      .onChangeIsDefault(newValue);
                },
              )
            ],
          ),
        ),
        ElevatedButton(
          onPressed: paymentMethodForm.isValid
              ? () async {
                  action() async {
                    await ref
                        .read(paymentMethodsNotifierProvider.notifier)
                        .editPaymentMethod(
                          paymentMethod.copyWith(
                              method: paymentMethodForm.methodInput.value,
                              isDefault: paymentMethodForm.isDefault),
                        );
                    navigator.pop();
                  }

                  await execute(
                    context,
                    action,
                    successMessage: "編集しました",
                  );
                }
              : null,
          child: const Text('確定'),
        ),
      ]),
    );
  }

  String _getDefaultMessage({required bool existingIsDefault}) {
    var message = "いつもの支払方法にする場合はチェックして下さい。";
    if (!existingIsDefault) {
      message += "\nなお、いつもの支払方法は一つしか登録できないので、既に登録されている場合は、自動的に更新されます。";
    }
    return message;
  }
}
