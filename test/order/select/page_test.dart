import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_order_app/constants.dart';
import 'package:smart_order_app/domain/repository/repository.dart';
import 'package:smart_order_app/ui/page/order/select/page.dart';

import '../../fake_repository.dart';

void main() {
  testWidgets('タスク一覧が空の時にメッセージが表示されること', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
          overrides: [
            repositoryProvider
                .overrideWithValue(FakeRepository(scenes: [], reasons: []))
          ],
          child: const MaterialApp(
              home: OrderSelectPage(
            sceneName: defaultScene,
          ))),
    );

    await tester.pumpAndSettle();

    // expect(find.text('タスクを追加して下さい。'), findsOneWidget);
  });
}
