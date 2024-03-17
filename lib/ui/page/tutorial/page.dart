import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:smart_order_app/constants.dart';
import 'package:smart_order_app/ui/page/order/select/page.dart';
import 'package:smart_order_app/ui/page/tutorial/component/page_model_child.dart';
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

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context, rootNavigator: true);
    final List<PageModel> pages = [
      PageModel.withChild(
        color: Theme.of(context).colorScheme.onPrimary,
        child: const PageModelChild(
          title: '生活するとは"注文する"こと',
          imageAssetPath: "assets/images/tutorial/ordinary_order.png",
          body: '''
からあげ棒下さい。
袋に入れて下さい。
PayPayで払います。

私たちの便利な生活は、
注文することで成り立っています。
''',
        ),
      ),
      PageModel.withChild(
        color: Theme.of(context).colorScheme.onPrimary,
        child: const PageModelChild(
          title: '注文したいけど注文できない',
          imageAssetPath: "assets/images/tutorial/cannot_speak.png",
          body: '''
吃音症、場面緘黙症、人見知り、難聴。

様々な理由で、
私たちは注文したくてもできません。
食べたいものが食べられない、
欲しいものを伝えられない。
そんなもどかしい思いをしてばかりです。
''',
        ),
      ),
      PageModel.withChild(
        color: Theme.of(context).colorScheme.onPrimary,
        child: const PageModelChild(
          title: 'でも"More Order"があります',
          imageAssetPath: "assets/images/tutorial/order_with_app.png",
          body: '''
使い方は簡単。
使いたい「場面」と注文したい「フレーズ」を登録。
後はそれらを選択して店員に見せるだけ。

このアプリで注文する「理由」や「支払方法」も
登録すれば店員に見せることができます。
''',
        ),
      ),
      PageModel.withChild(
        color: Theme.of(context).colorScheme.onPrimary,
        child: const PageModelChild(
          title: "さあ、今こそ世の中の便利を享受しよう！",
          imageAssetPath: "assets/images/tutorial/more_order.png",
          body: '''
諦めるのは今ここで最後にしましょう。
"More Order"を使えば、
私たちの好きなものが注文できます。

さあ、今こそ世の中の便利を享受しよう！
''',
        ),
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
