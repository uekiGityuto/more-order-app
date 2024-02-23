import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/domain/errors/error.dart';
import 'package:smart_order_app/usecase/state/error.dart';

Future<void> showErrorSnackbar(
    BuildContext context, WidgetRef ref, String message) {
  final snackBar = SnackBar(
    backgroundColor: Theme.of(context).colorScheme.error,
    content: Text(message),
    duration: const Duration(seconds: 10),
    action: SnackBarAction(
      label: 'close',
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then(
    (_) {
      ref.read(errorNotifierProvider.notifier).updateState(ErrorType.none);
    },
  );
}
