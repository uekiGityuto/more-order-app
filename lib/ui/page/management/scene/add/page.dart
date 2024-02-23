import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_order_app/ui/component/base_drawer.dart';
import 'package:smart_order_app/ui/component/simple_app_bar.dart';
import 'package:smart_order_app/ui/component/snackBar/snackbar.dart';
import 'package:smart_order_app/usecase/result.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

class SceneAddPage extends HookConsumerWidget {
  const SceneAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String scene = '';
    return Scaffold(
        drawer: const BaseDrawer(),
        appBar: SimpleAppBar(title: '場面追加'),
        body: SafeArea(
            child: Column(children: [
          Expanded(
              child: Column(children: [
            TextField(
                decoration: const InputDecoration(
                  hintText: '場面を入力してください',
                ),
                onChanged: (text) {
                  scene = text;
                }),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(scenesNotifierProvider.notifier)
                    .addScene(scene)
                    .then((result) {
                  if (result == Result.success) {
                    showSnackbar(context, '追加しました');
                  }
                });
              },
              child: const Text('作成'),
            ),
          ]))
        ])));
  }
}
