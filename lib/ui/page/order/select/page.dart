import 'package:flutter/material.dart';
import 'package:more_order/constants.dart';
import 'package:more_order/ui/component/app_bar/simple_bottom_app_bar.dart';
import 'package:more_order/ui/layout/default_layout.dart';
import 'package:more_order/ui/page/order/select/custom/page.dart';
import 'package:more_order/ui/page/order/select/registered/page.dart';
import 'package:more_order/ui/page/tutorial/page.dart';
import 'package:more_order/usecase/controller/shared_preferences.dart';

class OrderSelectPage extends StatelessWidget {
  final String sceneName;

  const OrderSelectPage({Key? key, required this.sceneName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await _showTutorial(context));

    return DefaultLayout(
        title: sceneName,
        suppressBack: true,
        bottomAppBarOption: sceneName == defaultScene
            ? const BottomAppBarOption(
                currentLocation: NavigationItem.defaultSceneItem)
            : null,
        body: sceneName == customScene
            ? const CustomOrderSelectPage()
            : RegisteredOrderSelectPage(sceneName: sceneName));
  }

  Future<void> _showTutorial(BuildContext context) async {
    final navigator = Navigator.of(context, rootNavigator: true);
    // 開発用。チュートリアルを表示したいときに使う。
    // await SharedPreferencesController.clear();
    final isTutorialDisplayed =
        await SharedPreferencesController.isTutorialDisplayed();
    if (!isTutorialDisplayed) {
      navigator.push(
        MaterialPageRoute(
          builder: (context) => const TutorialPage(),
        ),
      );
    }
  }
}
