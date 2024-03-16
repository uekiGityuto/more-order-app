import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_order_app/constants.dart';
import 'package:smart_order_app/ui/page/order/select/page.dart';
import 'package:smart_order_app/usecase/controller/shared_preferences.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  TutorialPageState createState() => TutorialPageState();
}

class TutorialPageState extends State<TutorialPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  // TODO: デザイン修正。特に画像をつくる。
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context, rootNavigator: true);
    final List<SimplePageModel> pages = [
      SimplePageModel(
        title: '生活するとは\n"注文する"こと',
        imageAssetPath: "assets/images/app_icon.png",
        body: '''
からあげ棒下さい。
お冷ください。
袋に入れてください。
PayPayで払います。

私たちの便利な生活は、
注文することで成り立っています。
''',
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      SimplePageModel(
        title: '注文したいけど\n注文できない',
        imageAssetPath: "assets/images/app_icon.png",
        body: '''
吃音症、場面緘黙症、人見知り、難聴。

様々な理由で、
私たちは注文したくてもできません。
食べたいものが食べられない、
欲しいものを伝えられない。
そんなもどかしい思いをしてばかりです。
''',
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      SimplePageModel(
        title: 'でも"More Order"\nがあります',
        imageAssetPath: "assets/images/app_icon.png",
        body: '''
使い方は簡単。
注文したい「場面」と「フレーズ」を登録して、店員に見せるだけ。
わけを説明する「理由」や「支払方法」も登録できます。
''',
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      SimplePageModel(
        title: "さあ、今こそ世の中の便利を享受しよう！",
        imageAssetPath: "assets/images/app_icon.png",
        body: '''
諦めるのは今ここで最後にしましょう。
"More Order"を使えば、
私たちの好きなものが注文できます。

さあ、今こそ世の中の便利を享受しよう！
''',
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
    ];

    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        allowScroll: true,
        pages: pages,
        showBullets: true,
        inactiveBulletColor: Colors.grey.shade400,
        activeBulletColor: Theme.of(context).colorScheme.primary,
        buttonColor: Theme.of(context).colorScheme.primary,
        skipText: "SKIP",
        nextText: "NEXT",
        finishText: "FINISH",
        skipCallback: () async {
          await SharedPreferencesController.setTutorialDone();
          // OrderSelectPage以外のページから遷移するようにする場合は、popにする。
          // （popにするとWidget Stackが積み重なって開発しづらいのでpushAndRemoveUntilにしている）
          navigator.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const OrderSelectPage(
                sceneName: defaultScene,
              ),
            ),
            (_) => false,
          );
        },
        finishCallback: () async {
          await SharedPreferencesController.setTutorialDone();
          // OrderSelectPage以外のページから遷移するようにする場合は、popにする。
          // （popにするとWidget Stackが積み重なって開発しづらいのでpushAndRemoveUntilにしている）
          navigator.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const OrderSelectPage(
                sceneName: defaultScene,
              ),
            ),
            (_) => false,
          );
        },
      ),
    );
  }
}

class SimplePageModel extends PageModel {
  SimplePageModel({
    required String title,
    required String imageAssetPath,
    required String body,
    required Color backgroundColor,
  }) : super(
          color: backgroundColor,
          imageAssetPath: imageAssetPath,
          title: title,
          titleColor: Colors.black,
          body: body,
          bodyColor: Colors.black,
          doAnimateImage: true,
        );
}

void _setTutorialDone() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isFirst', true);
}
