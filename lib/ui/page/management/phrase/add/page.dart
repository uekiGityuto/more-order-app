import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:more_order_app/domain/valueObject/id.dart';
import 'package:more_order_app/ui/component/error_message.dart';
import 'package:more_order_app/ui/component/loader.dart';
import 'package:more_order_app/ui/error_handler_mixin.dart';
import 'package:more_order_app/ui/form/form_creation_status.dart';
import 'package:more_order_app/ui/layout/default_layout.dart';
import 'package:more_order_app/ui/page/management/phrase/add/form/phrase_add_form_controller.dart';
import 'package:more_order_app/ui/page/management/phrase/component/phrase_input_form.dart';
import 'package:more_order_app/ui/page/management/phrase/component/scenes_checkbox_form.dart';
import 'package:more_order_app/usecase/state/scenes.dart';

class PhraseAddPage extends HookConsumerWidget with ErrorHandlerMixin {
  const PhraseAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 登録後にTextFieldをクリアするためだけに使う。それ以外で使わないこと。
    final phraseEditingController = useTextEditingController();
    final phraseForm = ref.watch(phraseAddFormControllerProvider);
    final scenes = phraseForm.scenes;
    return DefaultLayout(
      title: "フレーズ登録",
      body: phraseForm.creationStatus == FormCreationStatus.failed
          ? const ErrorMessage()
          : scenes == null
              ? const Loader()
              : Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          PhraseInputField(
                            description: '注文したいフレーズを入力して下さい。',
                            controller: phraseEditingController,
                            onChanged: ref
                                .read(phraseAddFormControllerProvider.notifier)
                                .onChangePhrase,
                            errorMessage: phraseForm
                                .phraseInput.displayError?.errorMessage,
                          ),
                          const SizedBox(height: 24),
                          ScenesCheckboxField(
                            scenes: scenes,
                            values: phraseForm.scenesInput.value,
                            onChanged: (Id sceneId, bool? newValue) {
                              ref
                                  .read(
                                      phraseAddFormControllerProvider.notifier)
                                  .onChangeScenes(sceneId, newValue);
                            },
                            errorMessage: phraseForm
                                .scenesInput.displayError?.errorMessage,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: phraseForm.isValid
                          ? () async {
                              action() async {
                                await ref
                                    .read(scenesNotifierProvider.notifier)
                                    .addPhrase(
                                      phraseForm.phraseInput.value,
                                      scenes
                                          .where((s) =>
                                              phraseForm
                                                  .scenesInput.value[s.id] ==
                                              true)
                                          .toList(),
                                    );
                                phraseEditingController.clear();
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
                  ],
                ),
    );
  }
}
