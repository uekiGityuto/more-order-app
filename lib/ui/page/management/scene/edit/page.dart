import 'package:flutter/material.dart';
import 'package:smart_order_app/domain/entity/scene.dart';

class SceneEditPage extends StatelessWidget {
  final Scene scene;
  const SceneEditPage({Key? key, required this.scene}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("編集");
  }
}
