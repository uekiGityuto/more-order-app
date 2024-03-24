import 'package:flutter/material.dart';
import 'package:more_order/ui/component/no_registered_data.dart';

class NoReason extends StatelessWidget {
  const NoReason({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NoRegisteredData(
      message: '''注文時に「喉が痛いので声が出せません」、「話すことが苦手なのでこちらで注文します」などの理由を表示することができます。

非表示にすることもできるので、何かしら登録してみることをおすすめします。''',
    );
  }
}
