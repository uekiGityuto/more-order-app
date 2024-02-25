import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_order_app/constants.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/ui/page/management/phrase/add/page.dart';
import 'package:smart_order_app/ui/page/management/scene/add/page.dart';
import 'package:smart_order_app/ui/page/order/display/page.dart';
import 'package:smart_order_app/ui/page/order/select/page.dart';

// TODO: orderDisplayはorderSelectの下にしたいがエラーになるので、一旦これで。
enum RouteConfigs {
  orderSelect('/', 'order-select'),
  orderDisplay('/display', 'order-display'),
  phraseAdd('/management/phrase/add', 'phrase-add'),
  sceneAdd('/management/scene/add', 'scene-add'),
  ;

  const RouteConfigs(this.path, this.name);
  final String path;
  final String name;
}

// TODO: errorPageBuilderの設定した方が良いかも
final routerConfigProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RouteConfigs.orderSelect.path,
        name: RouteConfigs.orderSelect.name,
        builder: (BuildContext context, GoRouterState state) {
          final sceneName = state.extra as String? ?? defaultScene;
          return OrderSelectPage(
            sceneName: sceneName,
          );
        },
      ),
      GoRoute(
        path: RouteConfigs.orderDisplay.path,
        name: RouteConfigs.orderDisplay.name,
        builder: (BuildContext context, GoRouterState state) {
          final args = state.extra as Map<String, dynamic>;
          return OrderDisplayPage(
            sceneName: args['sceneName'] as String,
            phrases: args['phrases'] as List<Phrase>,
          );
        },
      ),
      GoRoute(
        path: RouteConfigs.phraseAdd.path,
        name: RouteConfigs.phraseAdd.name,
        builder: (BuildContext context, GoRouterState state) =>
            const PhraseAddPage(),
      ),
      GoRoute(
        path: RouteConfigs.sceneAdd.path,
        name: RouteConfigs.sceneAdd.name,
        builder: (BuildContext context, GoRouterState state) =>
            const SceneAddPage(),
      ),
    ],
  ),
);
