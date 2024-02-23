import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/ui/component/error.dart';
import 'package:smart_order_app/ui/component/loader.dart';
import 'package:smart_order_app/ui/component/simple_app_bar.dart';
import 'package:smart_order_app/ui/page/order_support_selection/options.dart';
import 'package:smart_order_app/ui/page/phrase/addition.dart';
import 'package:smart_order_app/useCase/state/scenes.dart';

Widget createMainWidget(List<Phrase> phrases, WidgetRef ref) {
  return Column(
      children: [Expanded(child: Center(child: createOptions(phrases, ref)))]);
}

class OrderSupportSelectionPage extends ConsumerWidget {
  final String sceneName;

  const OrderSupportSelectionPage({Key? key, required this.sceneName})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    return Scaffold(
      appBar: SimpleAppBar(title: sceneName),
      body: SafeArea(
        child: scenesFuture.when(
            error: (e, s) => createErrorMessage(),
            loading: () => createProgressIndicator(context),
            data: (scenes) {
              final scene =
                  scenes.firstWhereOrNull((scene) => scene.scene == sceneName);
              if (scene == null) {
                return createErrorMessage();
              }
              return createMainWidget(scene.phrases, ref);
            }),
      ),
      floatingActionButton: scenesFuture.hasValue
          ? FloatingActionButton(
              onPressed: () {
                final scenes = scenesFuture.value;
                if (scenes == null) {
                  return;
                }
                final scene =
                    scenes.firstWhere((scene) => scene.scene == sceneName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhraseAdditionPage(scene: scene)),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
