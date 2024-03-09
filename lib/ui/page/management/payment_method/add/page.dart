import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/ui/component/form/form_additional_message.dart';
import 'package:smart_order_app/ui/component/form/form_error_message.dart';
import 'package:smart_order_app/ui/component/form/simple_checkbox_list_tile.dart';
import 'package:smart_order_app/ui/error_handler_mixin.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/management/payment_method/add/form/payment_method_add_form_controller.dart';
import 'package:smart_order_app/usecase/state/payment_methods.dart';

String getIsDefaultAdditionalMessage(bool isDefault) {
  return isDefault
      ? "既にデフォルトとして登録されている支払方法がある場合、その支払方法は、自動的にデフォルトではなくなります。"
      : "";
}

class PaymentMethodAddPage extends ConsumerWidget with ErrorHandlerMixin {
  const PaymentMethodAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentMethodForm = ref.watch(paymentMethodAddFormControllerProvider);
    final navigator = Navigator.of(context);
    return DefaultLayout(
      title: "支払方法の登録",
      body: Column(children: [
        Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '支払方法を入力してください',
                    ),
                    onChanged: ref
                        .read(paymentMethodAddFormControllerProvider.notifier)
                        .onChangeMethod,
                  ),
                  FormErrorMessage(
                    errorMessage: paymentMethodForm
                        .methodInput.displayError?.errorMessage,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  SimpleCheckboxListTile(
                    value: paymentMethodForm.isDefault,
                    onChanged: (bool? newValue) {
                      ref
                          .read(paymentMethodAddFormControllerProvider.notifier)
                          .onChangeIsDefault(newValue);
                    },
                    title: "デフォルトとして登録",
                  ),
                  FormAdditionalMessage(
                    message: getIsDefaultAdditionalMessage(
                        paymentMethodForm.isDefault),
                  ),
                ],
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: paymentMethodForm.isValid
              ? () async {
                  action() => ref
                      .read(paymentMethodsNotifierProvider.notifier)
                      .addPaymentMethod(
                        paymentMethodForm.methodInput.value,
                        paymentMethodForm.isDefault,
                      );
                  await execute(
                    context,
                    action,
                    successMessage: "登録しました",
                  );
                  navigator.pop();
                }
              : null,
          child: const Text('登録'),
        ),
      ]),
    );
  }
}