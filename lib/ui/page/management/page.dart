import 'package:flutter/material.dart';
import 'package:smart_order_app/ui/component/list_tile_navigation.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/management/component/menu_item.dart';
import 'package:smart_order_app/ui/page/management/phrase/add/page.dart';
import 'package:smart_order_app/ui/page/management/scene/add/page.dart';
import 'package:smart_order_app/ui/style/extension/list_space_between.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "管理メニュー",
      body: Column(
        children: [
          MenuItem(title: "フレーズ", options: [
            ListTileOption(title: "登録", nextPage: const PhraseAddPage())
          ]),
          MenuItem(title: "場面", options: [
            ListTileOption(title: "登録", nextPage: const SceneAddPage())
          ]),
        ].withSpaceBetween(height: 16.0),
      ),
    );
  }
}
