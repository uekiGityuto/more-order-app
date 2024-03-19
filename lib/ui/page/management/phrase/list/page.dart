import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order_app/domain/entity/phrase.dart';
import 'package:more_order_app/ui/component/dialog/delete_confirmation_dialog.dart';
import 'package:more_order_app/ui/component/error_message.dart';
import 'package:more_order_app/ui/component/loader.dart';
import 'package:more_order_app/ui/error_handler_mixin.dart';
import 'package:more_order_app/ui/layout/default_layout.dart';
import 'package:more_order_app/ui/page/management/component/edit_and_delete_list_tile.dart';
import 'package:more_order_app/ui/page/management/phrase/edit/page.dart';
import 'package:more_order_app/ui/page/management/phrase/list/component/delete_confirmation_dialog_content.dart';
import 'package:more_order_app/usecase/state/scenes.dart';

class PhraseListPage extends ConsumerWidget with ErrorHandlerMixin {
  const PhraseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    final navigator = Navigator.of(context);
    return DefaultLayout(
      title: "フレーズ編集/削除",
      body: scenesFuture.when(
        error: (e, s) => const ErrorMessage(),
        loading: () => const Loader(),
        data: (scenes) {
          Set<Phrase> phrases = <Phrase>{};
          for (final scene in scenes) {
            phrases.addAll(scene.phrases);
          }
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: phrases.map(
                    (phrase) {
                      return EditAndDeleteListTile(
                        title: phrase.phrase,
                        editPage: PhraseEditPage(phrase: phrase),
                        onDeletePressed: () async {
                          action() async {
                            await ref
                                .read(scenesNotifierProvider.notifier)
                                .deletePhrase(phrase);
                            navigator.pop();
                          }

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DeleteConfirmationDialog(
                                content: DeleteConfirmationDialogContent(
                                    phrase: phrase),
                                onPressed: () async {
                                  execute(
                                    context,
                                    action,
                                    successMessage: "削除しました",
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
