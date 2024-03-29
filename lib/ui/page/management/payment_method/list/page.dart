import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order/ui/component/dialog/delete_confirmation_dialog.dart';
import 'package:more_order/ui/component/error_message.dart';
import 'package:more_order/ui/component/loader.dart';
import 'package:more_order/ui/error_handler_mixin.dart';
import 'package:more_order/ui/layout/default_layout.dart';
import 'package:more_order/ui/page/management/component/edit_and_delete_list_tile.dart';
import 'package:more_order/ui/page/management/payment_method/edit/page.dart';
import 'package:more_order/ui/page/management/payment_method/list/component/delete_confirmation_dialog_content.dart';
import 'package:more_order/usecase/state/payment_methods.dart';

class PaymentMethodListPage extends ConsumerWidget with ErrorHandlerMixin {
  const PaymentMethodListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentMethodsFuture = ref.watch(paymentMethodsNotifierProvider);
    final navigator = Navigator.of(context);
    return DefaultLayout(
      title: "支払方法の編集/削除",
      body: paymentMethodsFuture.when(
        error: (e, s) => const ErrorMessage(),
        loading: () => const Loader(),
        data: (paymentMethods) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: paymentMethods.map(
                    (paymentMethod) {
                      return EditAndDeleteListTile(
                        title: paymentMethod.method,
                        editPage:
                            PaymentMethodEditPage(paymentMethod: paymentMethod),
                        onDeletePressed: () async {
                          action() async {
                            await ref
                                .read(paymentMethodsNotifierProvider.notifier)
                                .deletePaymentMethod(paymentMethod);
                            navigator.pop();
                          }

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DeleteConfirmationDialog(
                                content: DeleteConfirmationDialogContent(
                                    paymentMethod: paymentMethod),
                                onPressed: () async {
                                  execute(
                                    context,
                                    action,
                                    successMessage: "削除しました",
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
