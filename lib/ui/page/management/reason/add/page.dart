import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:more_order/ui/error_handler_mixin.dart';
import 'package:more_order/ui/layout/default_layout.dart';
import 'package:more_order/ui/page/management/reason/add/form/reason_add_form_controller.dart';
import 'package:more_order/ui/page/management/reason/component/reason_default_checkbox_form.dart';
import 'package:more_order/ui/page/management/reason/component/reason_input_form.dart';
import 'package:more_order/usecase/state/reasons.dart';

class ReasonAddPage extends HookConsumerWidget with ErrorHandlerMixin {
  const ReasonAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 登録後にTextFieldをクリアするためだけに使う。それ以外で使わないこと。
    final reasonEditingController = useTextEditingController();

    final reasonForm = ref.watch(reasonAddFormControllerProvider);
    return DefaultLayout(
      title: "理由登録",
      body: Column(children: [
        Expanded(
          child: ListView(
            children: [
              ReasonInputField(
                description: "注文時に表示する理由を入力して下さい。\nなお、理由は複数登録可能です。",
                controller: reasonEditingController,
                onChanged: ref
                    .read(reasonAddFormControllerProvider.notifier)
                    .onChangeReason,
                errorMessage: reasonForm.reasonInput.displayError?.errorMessage,
              ),
              const SizedBox(
                height: 24,
              ),
              ReasonDefaultCheckboxField(
                description: '''いつもの理由にしておけば、注文時に選択する手間が省けて便利です。
なお、いつもの理由は一つしか登録できないので、既に登録されている場合は、自動的に更新されます。''',
                value: reasonForm.isDefault,
                onChanged: (bool? newValue) {
                  ref
                      .read(reasonAddFormControllerProvider.notifier)
                      .onChangeIsDefault(newValue);
                },
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: reasonForm.isValid
              ? () async {
                  action() async {
                    await ref.read(reasonsNotifierProvider.notifier).addReason(
                        reasonForm.reasonInput.value, reasonForm.isDefault);
                    reasonEditingController.clear();
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
