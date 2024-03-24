import 'package:flutter/material.dart';
import 'package:more_order/ui/component/no_registered_data.dart';

class NoPhrase extends StatelessWidget {
  const NoPhrase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NoRegisteredData(
      message: '''「コーヒー」、「お弁当の温め」など、注文したいフレーズを登録しましょう。

フレーズ登録時にどの場面で使うかを選択できます。
登録したフレーズは場面ごとに表示されるため、場面を切り替えたい場合は、左下の「場面一覧」をタップして下さい。''',
    );
  }
}
