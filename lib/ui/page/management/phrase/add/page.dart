import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_order_app/ui/component/error_message.dart';
import 'package:smart_order_app/ui/component/form_error_message.dart';
import 'package:smart_order_app/ui/component/loader.dart';
import 'package:smart_order_app/ui/error_handler_mixin.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/management/phrase/add/validation/phrase_form_controller.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

class PhraseAddPage extends HookConsumerWidget with ErrorHandlerMixin {
  const PhraseAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    final phraseForm = ref.watch(phraseFormControllerProvider);
    return DefaultLayout(
      title: "フレーズ追加",
      body: scenesFuture.when(
        error: (e, s) => const ErrorMessage(),
        loading: () => const Loader(),
        data: (scenes) {
          return Column(children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("◼️場面"),
                        ...scenes.map(
                          (scene) {
                            return CheckboxListTile(
                              value: phraseForm.scenesInput.value[scene.id],
                              onChanged: (bool? newValue) {
                                ref
                                    .read(phraseFormControllerProvider.notifier)
                                    .onChangeScenes(scene.id, newValue);
                              },
                              title: Text(scene.scene),
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                            );
                          },
                        ).toList(),
                        FormErrorMessage(
                            errorMessage: phraseForm
                                .scenesInput.displayError?.errorMessage),
                      ]),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("◼️フレーズ"),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'フレーズを入力してください',
                        ),
                        onChanged: ref
                            .read(phraseFormControllerProvider.notifier)
                            .onChangePhrase,
                      ),
                      FormErrorMessage(
                          errorMessage: phraseForm
                              .phraseInput.displayError?.errorMessage),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: phraseForm.isValid
                  ? () async {
                      action() =>
                          ref.read(scenesNotifierProvider.notifier).addPhrase(
                              phraseForm.phraseInput.value,
                              scenes
                                  .where((s) =>
                                      phraseForm.scenesInput.value[s.id] ==
                                      true)
                                  .toList());
                      await execute(
                        context,
                        action,
                        successMessage: "追加しました",
                      );
                    }
                  : null,
              child: const Text('登録'),
            ),
          ]);
        },
      ),
    );
  }
}
