import 'package:flutter/material.dart';
import 'package:smart_order_app/ui/component/navigation_button.dart';
import 'package:smart_order_app/ui/component/no_registered_data.dart';
import 'package:smart_order_app/ui/page/management/phrase/add/page.dart';

class NoPhrase extends StatelessWidget {
  const NoPhrase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NoRegisteredData(
      message: "フレーズが登録されていません",
      navigationButton: NavigationButton(
        nextPage: PhraseAddPage(),
        text: "フレーズを登録",
        isSecondary: true,
      ),
    );
  }
}