import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/domain/entity/reason.dart';
import 'package:smart_order_app/ui/component/form/form_additional_message.dart';
import 'package:smart_order_app/ui/component/form/form_error_message.dart';
import 'package:smart_order_app/ui/component/form/simple_checkbox_list_tile.dart';
import 'package:smart_order_app/ui/error_handler_mixin.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/management/reason/edit/form/reason_edit_form_controller.dart';
import 'package:smart_order_app/usecase/state/reasons.dart';

String getIsDefaultAdditionalMessage(
    {required bool existingIsDefault, required bool isDefault}) {
  if (existingIsDefault && !isDefault) {
    return "デフォルト登録を解除する場合は、他の理由をデフォルトとして登録することをおすすめします。デフォルトの理由がない場合、理由の非表示がデフォルトになります。";
  } else if (!existingIsDefault && isDefault) {
    return "既にデフォルトとして登録されている理由がある場合、その理由は、自動的にデフォルトではなくなります。";
  } else {
    return "";
  }
}

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
              Column(
                children: [
                  TextFormField(
                    initialValue: reasonForm.reasonInput.value,
                    decoration: const InputDecoration(
                      hintText: '理由を入力してください',
                    ),
                    onChanged: ref
                        .read(reasonEditFormControllerProvider(reason).notifier)
                        .onChangeReason,
                  ),
                  FormErrorMessage(
                    errorMessage:
                        reasonForm.reasonInput.displayError?.errorMessage,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  SimpleCheckboxListTile(
                    value: reasonForm.isDefault,
                    onChanged: (bool? newValue) {
                      ref
                          .read(
                              reasonEditFormControllerProvider(reason).notifier)
                          .onChangeIsDefault(newValue);
                    },
                    title: "デフォルトとして登録",
                  ),
                  FormAdditionalMessage(
                    message: getIsDefaultAdditionalMessage(
                        existingIsDefault: reason.isDefault,
                        isDefault: reasonForm.isDefault),
                  ),
                ],
              ),
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
}
