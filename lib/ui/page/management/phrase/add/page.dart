import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';
import 'package:smart_order_app/ui/component/app_bar/simple_app_bar.dart';
import 'package:smart_order_app/ui/component/app_bar/simple_bottom_app_bar.dart';
import 'package:smart_order_app/ui/component/error_message.dart';
import 'package:smart_order_app/ui/component/loader.dart';
import 'package:smart_order_app/ui/component/simple_drawer.dart';
import 'package:smart_order_app/ui/error_handler_mixin.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

class PhraseAddPage extends HookConsumerWidget with ErrorHandlerMixin {
  const PhraseAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    String phrase = '';
    return Scaffold(
      appBar: const SimpleAppBar(title: 'フレーズ追加'),
      drawer: const SimpleDrawer(),
      bottomNavigationBar: const SimpleBottomAppBar(),
      body: DefaultLayout(
        child: scenesFuture.when(
          error: (e, s) => const ErrorMessage(),
          loading: () => const Loader(),
          data: (scenes) {
            final checkedStates = useState<Map<Id, bool>>(
              {for (var scene in scenes) scene.id: false},
            );
            return Column(children: [
              Expanded(
                child: ListView(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("◼️場面"),
                          ...scenes.map((scene) {
                            return CheckboxListTile(
                              value: checkedStates.value[scene.id],
                              onChanged: (bool? newValue) {
                                final newCheckedStates =
                                    Map<Id, bool>.from(checkedStates.value)
                                      ..[scene.id] = newValue ?? false;
                                checkedStates.value = newCheckedStates;
                              },
                              title: Text(scene.scene),
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                            );
                          }).toList(),
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
                              onChanged: (text) {
                                phrase = text;
                              }),
                        ]),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  action() =>
                      ref.read(scenesNotifierProvider.notifier).addPhrase(
                          phrase,
                          scenes
                              .where((s) => checkedStates.value[s.id] == true)
                              .toList());
                  await execute(
                    context,
                    action,
                    successMessage: "追加しました",
                  );
                },
                child: const Text('登録'),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
