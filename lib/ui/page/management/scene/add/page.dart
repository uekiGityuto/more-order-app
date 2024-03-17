import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_order_app/ui/error_handler_mixin.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/management/scene/add/form/scene_add_form_controller.dart';
import 'package:smart_order_app/ui/page/management/scene/component/scene_input_form.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

class SceneAddPage extends HookConsumerWidget with ErrorHandlerMixin {
  const SceneAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 登録後にTextFieldをクリアするためだけに使う。それ以外で使わないこと。
    final sceneEditingController = useTextEditingController();

    final sceneForm = ref.watch(sceneAddFormControllerProvider);
    return DefaultLayout(
      title: "場面登録",
      body: Column(children: [
        Expanded(
          child: SceneInputField(
            description:
                "このアプリを使いたい場面を入力して下さい。\n注文したいフレーズを選択するとき、登録した場面ごとにフレーズを選択することができます。",
            controller: sceneEditingController,
            onChanged:
                ref.read(sceneAddFormControllerProvider.notifier).onChangeScene,
            errorMessage: sceneForm.sceneInput.displayError?.errorMessage,
          ),
        ),
        ElevatedButton(
          onPressed: sceneForm.isValid
              ? () async {
                  action() async {
                    await ref
                        .read(scenesNotifierProvider.notifier)
                        .addScene(sceneForm.sceneInput.value);
                    sceneEditingController.clear();
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
