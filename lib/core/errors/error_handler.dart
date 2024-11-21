import 'package:flutter/material.dart';

class ErrorHandler {
  static void showError(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error', style: TextStyle(color: Colors.red)),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static void handleUnknownError(BuildContext context, Object error) {
    debugPrint('Unknown Error: $error');
    showError(context, 'An unexpected error occurred. Please try again later.');
  }

  static void handleApiError(
      BuildContext context, int statusCode, String? message) {
    debugPrint('API Error [Status Code: $statusCode]: $message');
    showError(
      context,
      message ?? 'An error occurred while communicating with the server.',
    );
  }

  static void handleValidationError(BuildContext context, String message) {
    debugPrint('Validation Error: $message');
    showError(context, message);
  }
}
