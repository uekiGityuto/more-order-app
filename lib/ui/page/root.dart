import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/constants.dart';
import 'package:smart_order_app/domain/errors/error.dart';
import 'package:smart_order_app/ui/component/loader.dart';
import 'package:smart_order_app/ui/component/snackBar/error_snackbar.dart';
import 'package:smart_order_app/ui/page/order/select/page.dart';
import 'package:smart_order_app/usecase/state/error.dart';

class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ErrorType>(errorNotifierProvider, (previous, next) {
      if (next != ErrorType.none) {
        showErrorSnackbar(context, ref, next.message);
      }
    });
    // エラーハンドリングし続けるためにこのページを消したくない。
    // そのため、このページを残しつつOrderSupportSelectPageに遷移するようにしている。
    // FIXME: もっと良い方法あれば修正する。
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => const OrderSelectPage(sceneName: defaultScene)),
        (_) => false,
      );
    });
    return Scaffold(
      body: Center(child: buildProgressIndicator(context)),
    );
  }
}
