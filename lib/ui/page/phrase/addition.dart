import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/ui/component/simple_app_bar.dart';
import 'package:smart_order_app/ui/component/snackBar/snackbar.dart';
import 'package:smart_order_app/useCase/result.dart';
import 'package:smart_order_app/useCase/state/scenes.dart';

class PhraseAdditionPage extends ConsumerWidget {
  final Scene scene;

  const PhraseAdditionPage({Key? key, required this.scene}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String phrase = '';
    return Scaffold(
      appBar: SimpleAppBar(title: 'フレーズ追加'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(children: [
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
                        .addPhrase(phrase, scene)
                        .then((result) {
                      if (result == Result.success) {
                        showSnackbar(context, '追加しました');
                      }
                    });
                  },
                  child: const Text('作成'),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
