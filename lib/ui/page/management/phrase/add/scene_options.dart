import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/domain/entity/scene.dart';

Widget buildSceneOptions(List<Scene> scenes, WidgetRef ref) {
  return ListView.builder(
    itemCount: scenes.length,
    itemBuilder: (context, index) {
      final scene = scenes[index];
      return Text(scene.scene);
    },
  );
}
