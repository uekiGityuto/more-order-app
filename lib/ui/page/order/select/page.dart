import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';
import 'package:smart_order_app/ui/component/base_drawer.dart';
import 'package:smart_order_app/ui/component/error.dart';
import 'package:smart_order_app/ui/component/loader.dart';
import 'package:smart_order_app/ui/component/simple_app_bar.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/order/display/page.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

class OrderSelectPage extends HookConsumerWidget {
  final String sceneName;

  const OrderSelectPage({Key? key, required this.sceneName}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    return Scaffold(
      appBar: SimpleAppBar(title: sceneName),
      drawer: const BaseDrawer(),
      body: DefaultLayout(
        child: scenesFuture.when(
            error: (e, s) => buildErrorMessage(),
            loading: () => buildProgressIndicator(context),
            data: (scenes) {
              final scene =
                  scenes.firstWhereOrNull((scene) => scene.scene == sceneName);
              if (scene == null) {
                return buildErrorMessage();
              }
              final checkedStates = useState<Map<Id, bool>>(
                {for (var phrase in scene.phrases) phrase.id: false},
              );
              return Column(children: [
                Expanded(
                  child: ListView(
                    children: scene.phrases.map((phrase) {
                      return CheckboxListTile(
                        value: checkedStates.value[phrase.id],
                        onChanged: (bool? newValue) {
                          final newCheckedStates =
                              Map<Id, bool>.from(checkedStates.value)
                                ..[phrase.id] = newValue ?? false;
                          checkedStates.value = newCheckedStates;
                        },
                        title: Text(phrase.phrase),
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      );
                    }).toList(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDisplay(
                              sceneName: sceneName,
                              phrases: scene.phrases
                                  .where(
                                      (p) => checkedStates.value[p.id] == true)
                                  .toList())),
                    );
                  },
                  child: const Text('OK'),
                ),
              ]);
            }),
      ),
    );
  }
}
