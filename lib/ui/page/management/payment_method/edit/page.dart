import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order_app/domain/entity/payment_method.dart';
import 'package:more_order_app/ui/error_handler_mixin.dart';
import 'package:more_order_app/ui/layout/default_layout.dart';
import 'package:more_order_app/ui/page/management/payment_method/edit/form/payment_method_edit_form_controller.dart';
import 'package:more_order_app/usecase/state/payment_methods.dart';

import '../component/payment_method_default_checkbox_form.dart';
import '../component/payment_method_input_form.dart';

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
                value: paymentMethodForm.isDefault,
                onChanged: (bool? newValue) {
                  ref
                      .read(
                          paymentMethodEditFormControllerProvider(paymentMethod)
                              .notifier)
                      .onChangeIsDefault(newValue);
                },
                additionalMessage: _getIsDefaultAdditionalMessage(
                  existingIsDefault: paymentMethod.isDefault,
                  isDefault: paymentMethodForm.isDefault,
                ),
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

  String _getIsDefaultAdditionalMessage(
      {required bool existingIsDefault, required bool isDefault}) {
    if (existingIsDefault && !isDefault) {
      return "デフォルト登録を解除する場合は、他の支払方法をデフォルトとして登録することをおすすめします。デフォルトの支払方法がない場合、支払方法の非表示がデフォルトになります。";
    } else if (!existingIsDefault && isDefault) {
      return "既にデフォルトとして登録されている支払方法がある場合、その支払方法は、自動的にデフォルトではなくなります。";
    } else {
      return "";
    }
  }
}
