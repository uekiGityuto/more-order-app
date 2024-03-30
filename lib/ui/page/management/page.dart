import 'package:flutter/material.dart';
import 'package:more_order/ui/component/app_bar/simple_bottom_app_bar.dart';
import 'package:more_order/ui/component/list_tile_navigation.dart';
import 'package:more_order/ui/layout/default_layout.dart';
import 'package:more_order/ui/page/management/component/menu_item.dart';
import 'package:more_order/ui/page/management/payment_method/add/page.dart';
import 'package:more_order/ui/page/management/payment_method/list/page.dart';
import 'package:more_order/ui/page/management/phrase/add/page.dart';
import 'package:more_order/ui/page/management/phrase/list/page.dart';
import 'package:more_order/ui/page/management/reason/add/page.dart';
import 'package:more_order/ui/page/management/reason/list/page.dart';
import 'package:more_order/ui/page/management/scene/add/page.dart';
import 'package:more_order/ui/page/management/scene/list/page.dart';
import 'package:more_order/ui/style/extension/list_space_between.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "メニュー",
      suppressBack: true,
      bottomAppBarOption: const BottomAppBarOption(
          currentLocation: NavigationItem.managementItem),
      body: ListView(
        children: [
          MenuItem(title: "フレーズ", options: [
            ListTileOption(title: "登録", nextPage: const PhraseAddPage()),
            ListTileOption(title: "編集/削除", nextPage: const PhraseListPage()),
          ]),
          MenuItem(title: "場面", options: [
            ListTileOption(title: "登録", nextPage: const SceneAddPage()),
            ListTileOption(title: "編集/削除", nextPage: const SceneListPage()),
          ]),
          MenuItem(title: "理由", options: [
            ListTileOption(title: "登録", nextPage: const ReasonAddPage()),
            ListTileOption(title: "編集/削除", nextPage: const ReasonListPage()),
          ]),
          MenuItem(title: "支払方法", options: [
            ListTileOption(title: "登録", nextPage: const PaymentMethodAddPage()),
            ListTileOption(
                title: "編集/削除", nextPage: const PaymentMethodListPage()),
          ]),
          MenuItem(
            title: "その他",
            options: [
              ListTileOption(
                title: "使い方",
                navigationType: NavigationType.webView,
                webURL:
                    "https://tin-chopper-b95.notion.site/08da88772b27489d82e7edd165829d50#6b1b1dd9f3db4d59866e6edb3e4a8431",
              ),
              ListTileOption(
                title: "利用規約",
                navigationType: NavigationType.webView,
                webURL:
                    "https://tin-chopper-b95.notion.site/4740156fca0c4969ada7921076b37558",
              ),
              ListTileOption(
                title: "プライバシーポリシー",
                navigationType: NavigationType.webView,
                webURL:
                    "https://tin-chopper-b95.notion.site/a639ca1a37f84d719f84a873e604041c",
              ),
            ],
          ),
        ].withSpaceBetween(height: 16.0),
      ),
    );
  }
}
