import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:more_order/constants.dart';
import 'package:more_order/domain/repository/repository.dart';
import 'package:more_order/ui/page/order/select/page.dart';

import '../../fake_repository.dart';

void main() {
  testWidgets('TODO: 必要なテストを書く', (WidgetTester tester) async {
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

    // TODO: 必要なテストを書く
    // expect(find.text('〇〇'), findsOneWidget);
  });
}
