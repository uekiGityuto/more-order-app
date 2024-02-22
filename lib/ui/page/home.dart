import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/constants.dart';
import 'package:smart_order_app/domain/errors/error.dart';
import 'package:smart_order_app/ui/component/snackBar/error_snackbar.dart';
import 'package:smart_order_app/ui/page/order_support_selection/page.dart';
import 'package:smart_order_app/useCase/state/error.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ErrorType>(errorNotifierProvider, (previous, next) {
      if (next != ErrorType.none) {
        showErrorSnackbar(context, ref, next.message);
      }
    });
    return const OrderSupportSelectionPage(sceneName: defaultScene);
  }
}
