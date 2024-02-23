import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/ui/component/base_drawer.dart';
import 'package:smart_order_app/ui/component/error.dart';
import 'package:smart_order_app/ui/component/loader.dart';
import 'package:smart_order_app/ui/component/simple_app_bar.dart';
import 'package:smart_order_app/ui/page/order/select/options.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

Widget buildMainWidget(List<Phrase> phrases, WidgetRef ref) {
  return Column(
      children: [Expanded(child: Center(child: buildOptions(phrases, ref)))]);
}

class OrderSelectPage extends ConsumerWidget {
  final String sceneName;

  const OrderSelectPage({Key? key, required this.sceneName}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    return Scaffold(
      appBar: SimpleAppBar(title: sceneName),
      drawer: const BaseDrawer(),
      body: SafeArea(
        child: scenesFuture.when(
            error: (e, s) => buildErrorMessage(),
            loading: () => buildProgressIndicator(context),
            data: (scenes) {
              final scene =
                  scenes.firstWhereOrNull((scene) => scene.scene == sceneName);
              if (scene == null) {
                return buildErrorMessage();
              }
              return buildMainWidget(scene.phrases, ref);
            }),
      ),
    );
  }
}
