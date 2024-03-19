import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order_app/ui/component/dialog/delete_confirmation_dialog.dart';
import 'package:more_order_app/ui/component/error_message.dart';
import 'package:more_order_app/ui/component/loader.dart';
import 'package:more_order_app/ui/error_handler_mixin.dart';
import 'package:more_order_app/ui/layout/default_layout.dart';
import 'package:more_order_app/ui/page/management/component/edit_and_delete_list_tile.dart';
import 'package:more_order_app/ui/page/management/scene/edit/page.dart';
import 'package:more_order_app/ui/page/management/scene/list/component/delete_confirmation_dialog_content.dart';
import 'package:more_order_app/usecase/state/scenes.dart';

class SceneListPage extends ConsumerWidget with ErrorHandlerMixin {
  const SceneListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    final navigator = Navigator.of(context);
    return DefaultLayout(
      title: "場面編集/削除",
      body: scenesFuture.when(
        error: (e, s) => const ErrorMessage(),
        loading: () => const Loader(),
        data: (scenes) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: scenes.map(
                    (scene) {
                      return EditAndDeleteListTile(
                        title: scene.scene,
                        disabled: scene.isDefault,
                        editPage: SceneEditPage(scene: scene),
                        onDeletePressed: () async {
                          action() async {
                            await ref
                                .read(scenesNotifierProvider.notifier)
                                .deleteScene(scene);
                            navigator.pop();
                          }

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DeleteConfirmationDialog(
                                content: DeleteConfirmationDialogContent(
                                    scene: scene),
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
