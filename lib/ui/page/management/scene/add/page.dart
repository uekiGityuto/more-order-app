import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_order_app/ui/component/form_error_message.dart';
import 'package:smart_order_app/ui/error_handler_mixin.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/management/scene/add/form/add_scene_form_controller.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

class SceneAddPage extends HookConsumerWidget with ErrorHandlerMixin {
  const SceneAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sceneForm = ref.watch(addSceneFormControllerProvider);
    return DefaultLayout(
      title: "場面追加",
      body: Column(children: [
        Expanded(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: '場面を入力してください',
                ),
                onChanged: ref
                    .read(addSceneFormControllerProvider.notifier)
                    .onChangeScene,
              ),
              FormErrorMessage(
                errorMessage: sceneForm.sceneInput.displayError?.errorMessage,
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: sceneForm.isValid
              ? () async {
                  action() => ref
                      .read(scenesNotifierProvider.notifier)
                      .addScene(sceneForm.sceneInput.value);
                  await execute(
                    context,
                    action,
                    successMessage: "追加しました",
                  );
                }
              : null,
          child: const Text('登録'),
        ),
      ]),
    );
  }
}
