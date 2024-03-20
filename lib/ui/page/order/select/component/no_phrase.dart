import 'package:flutter/material.dart';
import 'package:more_order_app/ui/component/no_registered_data.dart';

class NoPhrase extends StatelessWidget {
  const NoPhrase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NoRegisteredData(
      message: '''「カフェラテ」、「お弁当の温め」など、注文したいフレーズを登録しましょう。''',
    );
  }
}
