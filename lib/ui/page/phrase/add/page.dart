import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';
import 'package:smart_order_app/ui/component/base_drawer.dart';
import 'package:smart_order_app/ui/component/error.dart';
import 'package:smart_order_app/ui/component/loader.dart';
import 'package:smart_order_app/ui/component/simple_app_bar.dart';
import 'package:smart_order_app/ui/component/snackBar/snackbar.dart';
import 'package:smart_order_app/usecase/result.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

class PhraseAddPage extends HookConsumerWidget {
  const PhraseAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    String phrase = '';
    return Scaffold(
      drawer: const BaseDrawer(),
      appBar: SimpleAppBar(title: 'フレーズ追加'),
      body: SafeArea(
        child: scenesFuture.when(
          error: (e, s) => createErrorMessage(),
          loading: () => createProgressIndicator(context),
          data: (scenes) {
            final checkedStates = useState<Map<Id, bool>>(
              {for (var scene in scenes) scene.id: false},
            );
            return Column(children: [
              Expanded(
                child: ListView(
                  children: scenes.map((scene) {
                    return CheckboxListTile(
                      value: checkedStates.value[scene.id],
                      onChanged: (bool? newValue) {
                        final newCheckedStates =
                            Map<Id, bool>.from(checkedStates.value)
                              ..[scene.id] = newValue ?? false;
                        checkedStates.value = newCheckedStates;
                      },
                      title: Text(scene.scene),
                    );
                  }).toList(),
                ),
              ),
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'フレーズを入力してください',
                  ),
                  onChanged: (text) {
                    phrase = text;
                  }),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(scenesNotifierProvider.notifier)
                      .addPhrase(
                          phrase,
                          scenes
                              .where((s) => checkedStates.value[s.id] == true)
                              .toList())
                      .then((result) {
                    if (result == Result.success) {
                      showSnackbar(context, '追加しました');
                    }
                  });
                },
                child: const Text('作成'),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
