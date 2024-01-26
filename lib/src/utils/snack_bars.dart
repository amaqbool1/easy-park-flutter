import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBars {
  static final SnackBars _instance = SnackBars._();

  factory SnackBars() => _instance;

  SnackBars._();

  static showSuccessSnackBar({
    required BuildContext context,
    required String successMessage,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: CupertinoColors.systemGreen,
        showCloseIcon: true,
        duration: const Duration(
          seconds: 1,
        ),
        margin: const EdgeInsets.all(8),
        behavior: SnackBarBehavior.floating,
        content: Text(
          successMessage,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static showErrorSnackBar({
    required BuildContext context,
    required String errorMessage,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: CupertinoColors.systemRed,
        showCloseIcon: true,
        margin: const EdgeInsets.all(8),
        duration: const Duration(
          seconds: 1,
        ),
        behavior: SnackBarBehavior.floating,
        content: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static showWarningSnackBar({
    required BuildContext context,
    required String errorMessage,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        margin: const EdgeInsets.all(8),
        duration: const Duration(
          seconds: 1,
        ),
        behavior: SnackBarBehavior.floating,
        content: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
