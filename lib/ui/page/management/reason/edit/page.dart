import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order/domain/entity/reason.dart';
import 'package:more_order/ui/error_handler_mixin.dart';
import 'package:more_order/ui/layout/default_layout.dart';
import 'package:more_order/ui/page/management/reason/component/reason_default_checkbox_form.dart';
import 'package:more_order/ui/page/management/reason/component/reason_input_form.dart';
import 'package:more_order/ui/page/management/reason/edit/form/reason_edit_form_controller.dart';
import 'package:more_order/usecase/state/reasons.dart';

class ReasonEditPage extends ConsumerWidget with ErrorHandlerMixin {
  final Reason reason;
  const ReasonEditPage({Key? key, required this.reason}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reasonForm = ref.watch(reasonEditFormControllerProvider(reason));
    final navigator = Navigator.of(context);
    return DefaultLayout(
      title: "理由編集",
      body: Column(children: [
        Expanded(
          child: ListView(
            children: [
              ReasonInputField(
                description: "理由を編集して下さい。",
                initialValue: reasonForm.reasonInput.value,
                onChanged: ref
                    .read(reasonEditFormControllerProvider(reason).notifier)
                    .onChangeReason,
                errorMessage: reasonForm.reasonInput.displayError?.errorMessage,
              ),
              const SizedBox(
                height: 24,
              ),
              ReasonDefaultCheckboxField(
                description:
                    _getDefaultMessage(existingIsDefault: reason.isDefault),
                value: reasonForm.isDefault,
                onChanged: (bool? newValue) {
                  ref
                      .read(reasonEditFormControllerProvider(reason).notifier)
                      .onChangeIsDefault(newValue);
                },
              )
            ],
          ),
        ),
        ElevatedButton(
          onPressed: reasonForm.isValid
              ? () async {
                  action() async {
                    await ref.read(reasonsNotifierProvider.notifier).editReason(
                          reason.copyWith(
                              reason: reasonForm.reasonInput.value,
                              isDefault: reasonForm.isDefault),
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
    var message = "いつもの理由にする場合はチェックして下さい。";
    if (!existingIsDefault) {
      message += "\nなお、いつもの理由は一つしか登録できないので、既に登録されている場合は、自動的に更新されます。";
    }
    return message;
  }
}
