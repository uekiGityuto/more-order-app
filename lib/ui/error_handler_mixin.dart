import 'package:flutter/material.dart';
import 'package:more_order/domain/errors/error.dart';
import 'package:more_order/ui/component/snack_bar/simple_snackbar.dart';

mixin ErrorHandlerMixin {
  Future<void> execute(
    BuildContext context,
    Future<void> Function() action, {
    required String successMessage,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await action();
      SimpleSnackBar.show(
        scaffoldMessenger,
        message: successMessage,
        type: SnackBarType.success,
      );
    } on DomainException catch (e) {
      SimpleSnackBar.show(
        scaffoldMessenger,
        message: e.toString(),
        type: SnackBarType.failure,
      );
    } catch (_) {
      SimpleSnackBar.show(
        scaffoldMessenger,
        message: ErrorType.unexpected.message,
        type: SnackBarType.failure,
      );
    }
  }
}
