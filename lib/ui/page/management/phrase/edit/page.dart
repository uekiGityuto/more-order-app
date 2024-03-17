import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';
import 'package:smart_order_app/ui/component/error_message.dart';
import 'package:smart_order_app/ui/component/loader.dart';
import 'package:smart_order_app/ui/error_handler_mixin.dart';
import 'package:smart_order_app/ui/form/form_creation_status.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/management/phrase/component/phrase_input_form.dart';
import 'package:smart_order_app/ui/page/management/phrase/component/scenes_checkbox_form.dart';
import 'package:smart_order_app/ui/page/management/phrase/edit/form/phrase_edit_form_controller.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

class PhraseEditPage extends ConsumerWidget with ErrorHandlerMixin {
  final Phrase phrase;
  const PhraseEditPage({Key? key, required this.phrase}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phraseForm = ref.watch(phraseEditFormControllerProvider(phrase));
    final scenes = phraseForm.scenes;
    final navigator = Navigator.of(context);
    return DefaultLayout(
      title: "フレーズ編集",
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
                            description: 'フレーズを編集して下さい。',
                            initialValue:
                                phraseEditFormControllerProvider(phrase)
                                    .phrase
                                    .phrase,
                            onChanged: ref
                                .read(phraseEditFormControllerProvider(phrase)
                                    .notifier)
                                .onChangePhrase,
                            errorMessage: phraseForm
                                .phraseInput.displayError?.errorMessage,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ScenesCheckboxField(
                            scenes: scenes,
                            values: phraseForm.scenesInput.value,
                            onChanged: (Id sceneId, bool? newValue) {
                              ref
                                  .read(phraseEditFormControllerProvider(phrase)
                                      .notifier)
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
                                    .editPhrase(
                                      phrase.copyWith(
                                          phrase: phraseForm.phraseInput.value),
                                      prevScenes:
                                          phrase.getScenesOfBelonging(scenes),
                                      nextScenes: scenes
                                          .where((s) =>
                                              phraseForm
                                                  .scenesInput.value[s.id] ==
                                              true)
                                          .toList(),
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
                  ],
                ),
    );
  }
}
