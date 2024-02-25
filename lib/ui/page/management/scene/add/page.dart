import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_order_app/ui/component/base_drawer.dart';
import 'package:smart_order_app/ui/error_handler_mixin.dart';
import 'package:smart_order_app/ui/component/simple_app_bar.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

class SceneAddPage extends HookConsumerWidget with ErrorHandlerMixin {
  const SceneAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String scene = '';
    return Scaffold(
      drawer: const BaseDrawer(),
      appBar: SimpleAppBar(title: '場面追加'),
      body: DefaultLayout(
        child: Column(children: [
          Expanded(
            child: TextField(
                decoration: const InputDecoration(
                  hintText: '場面を入力してください',
                ),
                onChanged: (text) {
                  scene = text;
                }),
          ),
          ElevatedButton(
            onPressed: () async {
              action() =>
                  ref.read(scenesNotifierProvider.notifier).addScene(scene);
              await execute(
                context,
                action,
                successMessage: "追加しました",
              );
            },
            child: const Text('登録'),
          ),
        ]),
      ),
    );
  }
}
