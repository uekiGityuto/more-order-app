import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:more_order/ui/error_handler_mixin.dart';
import 'package:more_order/ui/layout/default_layout.dart';
import 'package:more_order/ui/page/management/payment_method/add/form/payment_method_add_form_controller.dart';
import 'package:more_order/ui/page/management/payment_method/component/payment_method_default_checkbox_form.dart';
import 'package:more_order/ui/page/management/payment_method/component/payment_method_input_form.dart';
import 'package:more_order/usecase/state/payment_methods.dart';

class PaymentMethodAddPage extends HookConsumerWidget with ErrorHandlerMixin {
  const PaymentMethodAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 登録後にTextFieldをクリアするためだけに使う。それ以外で使わないこと。
    final paymentMethodEditingController = useTextEditingController();
    final paymentMethodForm = ref.watch(paymentMethodAddFormControllerProvider);
    return DefaultLayout(
      title: "支払方法の登録",
      body: Column(children: [
        Expanded(
          child: ListView(
            children: [
              PaymentMethodInputField(
                description: '注文時に表示する支払方法を入力して下さい。\nなお、支払方法は複数登録可能です。',
                controller: paymentMethodEditingController,
                onChanged: ref
                    .read(paymentMethodAddFormControllerProvider.notifier)
                    .onChangeMethod,
                errorMessage:
                    paymentMethodForm.methodInput.displayError?.errorMessage,
              ),
              const SizedBox(
                height: 24,
              ),
              PaymentMethodDefaultCheckboxField(
                description: '''いつもの支払方法にしておけば、注文時に選択する手間が省けて便利です。
なお、いつもの支払方法は一つしか登録できないので、既に登録されている場合は、自動的に更新されます。''',
                value: paymentMethodForm.isDefault,
                onChanged: (bool? newValue) {
                  ref
                      .read(paymentMethodAddFormControllerProvider.notifier)
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
                        .addPaymentMethod(
                          paymentMethodForm.methodInput.value,
                          paymentMethodForm.isDefault,
                        );
                    paymentMethodEditingController.clear();
                  }

                  await execute(
                    context,
                    action,
                    successMessage: "登録しました",
                  );
                }
              : null,
          child: const Text('登録'),
        ),
      ]),
    );
  }
}
