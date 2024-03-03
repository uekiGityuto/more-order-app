import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/ui/component/form_error_message.dart';
import 'package:smart_order_app/ui/error_handler_mixin.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/management/scene/edit/form/edit_scene_form_controller.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

class SceneEditPage extends ConsumerWidget with ErrorHandlerMixin {
  final Scene scene;
  const SceneEditPage({Key? key, required this.scene}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sceneForm = ref.watch(editSceneFormControllerProvider(scene));
    final navigator = Navigator.of(context);
    return DefaultLayout(
      title: "場面編集",
      body: Column(children: [
        Expanded(
          child: Column(
            children: [
              TextFormField(
                initialValue:
                    editSceneFormControllerProvider(scene).scene.scene,
                decoration: const InputDecoration(
                  hintText: '場面を入力してください',
                ),
                onChanged: ref
                    .read(editSceneFormControllerProvider(scene).notifier)
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
                  action() =>
                      ref.read(scenesNotifierProvider.notifier).editScene(
                            scene.copyWith(scene: sceneForm.sceneInput.value),
                          );
                  await execute(
                    context,
                    action,
                    successMessage: "編集しました",
                  );
                  navigator.pop();
                }
              : null,
          child: const Text('編集'),
        ),
      ]),
    );
  }
}
