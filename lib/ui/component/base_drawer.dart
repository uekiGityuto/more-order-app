import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/useCase/state/scenes.dart';

class BaseDrawer extends ConsumerWidget {
  const BaseDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    return Drawer(
      child: ListView(
        children: [
          const ListTile(title: Text("◼️場面選択")),
          ListTile(
            title: const Text("◼️フレーズ登録"),
            onTap: () {
              Navigator.pushNamed(context, '/terms_of_service');
            },
          ),
          ListTile(
            title: const Text("◼️言い訳登録"),
            onTap: () {
              Navigator.pushNamed(context, '/privacy_policy');
            },
          ),
        ],
      ),
    );
  }
}
