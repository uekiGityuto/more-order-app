import 'package:flutter/material.dart';
import 'package:more_order_app/ui/component/button/navigation_button.dart';
import 'package:more_order_app/ui/component/no_registered_data.dart';
import 'package:more_order_app/ui/page/management/reason/add/page.dart';

class NoReason extends StatelessWidget {
  const NoReason({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NoRegisteredData(
      message: "理由が登録されていません",
      navigationButton: NavigationButton(
        nextPage: ReasonAddPage(),
        text: "理由を登録",
        isSecondary: true,
      ),
    );
  }
}
