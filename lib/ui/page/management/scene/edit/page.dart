import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order_app/domain/entity/scene.dart';
import 'package:more_order_app/ui/error_handler_mixin.dart';
import 'package:more_order_app/ui/layout/default_layout.dart';
import 'package:more_order_app/ui/page/management/scene/component/scene_input_form.dart';
import 'package:more_order_app/ui/page/management/scene/edit/form/scene_edit_form_controller.dart';
import 'package:more_order_app/usecase/state/scenes.dart';

class SceneEditPage extends ConsumerWidget with ErrorHandlerMixin {
  final Scene scene;
  const SceneEditPage({Key? key, required this.scene}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sceneForm = ref.watch(sceneEditFormControllerProvider(scene));
    final navigator = Navigator.of(context);
    return DefaultLayout(
      title: "場面編集",
      body: Column(children: [
        Expanded(
          child: SceneInputField(
            description: "場面を編集して下さい。",
            initialValue: sceneEditFormControllerProvider(scene).scene.scene,
            onChanged: ref
                .read(sceneEditFormControllerProvider(scene).notifier)
                .onChangeScene,
            errorMessage: sceneForm.sceneInput.displayError?.errorMessage,
          ),
        ),
        ElevatedButton(
          onPressed: sceneForm.isValid
              ? () async {
                  action() async {
                    await ref.read(scenesNotifierProvider.notifier).editScene(
                          scene.copyWith(scene: sceneForm.sceneInput.value),
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
