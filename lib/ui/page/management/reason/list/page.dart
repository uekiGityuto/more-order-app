import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order/ui/component/dialog/delete_confirmation_dialog.dart';
import 'package:more_order/ui/component/error_message.dart';
import 'package:more_order/ui/component/loader.dart';
import 'package:more_order/ui/error_handler_mixin.dart';
import 'package:more_order/ui/layout/default_layout.dart';
import 'package:more_order/ui/page/management/component/edit_and_delete_list_tile.dart';
import 'package:more_order/ui/page/management/reason/edit/page.dart';
import 'package:more_order/ui/page/management/reason/list/component/delete_confirmation_dialog_content.dart';
import 'package:more_order/usecase/state/reasons.dart';

class ReasonListPage extends ConsumerWidget with ErrorHandlerMixin {
  const ReasonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reasonsFuture = ref.watch(reasonsNotifierProvider);
    final navigator = Navigator.of(context);
    return DefaultLayout(
      title: "理由編集/削除",
      body: reasonsFuture.when(
        error: (e, s) => const ErrorMessage(),
        loading: () => const Loader(),
        data: (reasons) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: reasons.map(
                    (reason) {
                      return EditAndDeleteListTile(
                        title: reason.reason,
                        editPage: ReasonEditPage(reason: reason),
                        onDeletePressed: () async {
                          action() async {
                            await ref
                                .read(reasonsNotifierProvider.notifier)
                                .deleteReason(reason);
                            navigator.pop();
                          }

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DeleteConfirmationDialog(
                                content: DeleteConfirmationDialogContent(
                                    reason: reason),
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
