import 'package:flutter/material.dart';
import 'package:smart_order_app/domain/errors/error.dart';
import 'package:smart_order_app/ui/component/snackBar/failure_snackbar.dart';
import 'package:smart_order_app/ui/component/snackBar/success_snackbar.dart';

mixin ErrorHandlerMixin {
  Future<void> execute(
    BuildContext context,
    Future<void> Function() action, {
    required String successMessage,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await action();
      SuccessSnackBar.show(
        scaffoldMessenger,
        message: successMessage,
      );
    } on DomainException catch (e) {
      FailureSnackBar.show(
        scaffoldMessenger,
        message: e.toString(),
      );
    } catch (_) {
      FailureSnackBar.show(
        scaffoldMessenger,
        message: ErrorType.unexpected.message,
      );
    }
  }
}
