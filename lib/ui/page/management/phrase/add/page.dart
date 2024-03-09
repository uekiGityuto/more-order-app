import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/ui/component/error_message.dart';
import 'package:smart_order_app/ui/component/form/form_error_message.dart';
import 'package:smart_order_app/ui/component/form/simple_checkbox_list_tile.dart';
import 'package:smart_order_app/ui/component/loader.dart';
import 'package:smart_order_app/ui/component/typography/section_title.dart';
import 'package:smart_order_app/ui/error_handler_mixin.dart';
import 'package:smart_order_app/ui/form/form_creation_status.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/management/phrase/add/form/phrase_add_form_controller.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

class PhraseAddPage extends ConsumerWidget with ErrorHandlerMixin {
  const PhraseAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phraseForm = ref.watch(phraseAddFormControllerProvider);
    final scenes = phraseForm.scenes;
    final navigator = Navigator.of(context);
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SectionTitle(text: "場面"),
                              ...scenes.map(
                                (scene) {
                                  return SimpleCheckboxListTile(
                                    value:
                                        phraseForm.scenesInput.value[scene.id],
                                    onChanged: (bool? newValue) {
                                      ref
                                          .read(phraseAddFormControllerProvider
                                              .notifier)
                                          .onChangeScenes(scene.id, newValue);
                                    },
                                    title: scene.scene,
                                  );
                                },
                              ).toList(),
                              FormErrorMessage(
                                errorMessage: phraseForm
                                    .scenesInput.displayError?.errorMessage,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SectionTitle(text: "フレーズ"),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'フレーズを入力してください',
                                ),
                                onChanged: ref
                                    .read(phraseAddFormControllerProvider
                                        .notifier)
                                    .onChangePhrase,
                              ),
                              FormErrorMessage(
                                errorMessage: phraseForm
                                    .phraseInput.displayError?.errorMessage,
                              ),
                            ],
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
                                navigator.pop();
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
