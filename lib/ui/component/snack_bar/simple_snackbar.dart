import 'package:flutter/material.dart';

enum SnackBarType { success, failure }

class SimpleSnackBar extends SnackBar {
  SimpleSnackBar({
    Key? key,
    required String message,
    required SnackBarType type,
    required ScaffoldMessengerState scaffoldMessenger,
  }) : super(
          key: key,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(message)),
              GestureDetector(
                onTap: () => scaffoldMessenger.hideCurrentSnackBar(),
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ],
          ),
          backgroundColor:
              type == SnackBarType.success ? Colors.green : Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );

  static void show(
    ScaffoldMessengerState scaffoldMessenger, {
    required String message,
    required SnackBarType type,
  }) {
    scaffoldMessenger.showSnackBar(
      SimpleSnackBar(
        message: message,
        type: type,
        scaffoldMessenger: scaffoldMessenger,
      ),
    );
  }
}
