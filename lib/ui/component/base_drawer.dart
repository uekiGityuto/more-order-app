import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/ui/component/error.dart';
import 'package:smart_order_app/ui/component/loader.dart';
import 'package:smart_order_app/ui/page/management/phrase/add/page.dart';
import 'package:smart_order_app/ui/page/management/scene/add/page.dart';
import 'package:smart_order_app/ui/page/order/select/page.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

class BaseDrawer extends ConsumerWidget {
  const BaseDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    return Drawer(
      child: ListView(
        children: [
          const ListTile(title: Text("◼️場面選択")),
          scenesFuture.when(
            error: (e, s) => buildErrorMessage(),
            loading: () => buildProgressIndicator(context),
            data: (scenes) {
              return Column(
                children: scenes.map((scene) {
                  return ListTile(
                    title: Text(scene.scene),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OrderSelectPage(sceneName: scene.scene)),
                      );
                    },
                  );
                }).toList(),
              );
            },
          ),
          ListTile(
            title: const Text("◼️フレーズ登録"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PhraseAddPage()),
              );
            },
          ),
          ListTile(
            title: const Text("◼️場面登録"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SceneAddPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
