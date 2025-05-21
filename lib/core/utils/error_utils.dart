import 'package:flutter/material.dart';

class ErrorUtils {
  static void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void handleError(Exception e, BuildContext context) {
    String errorMessage = 'Something went wrong. Please try again.';
    errorMessage = e.toString();
      showErrorDialog(context, errorMessage);
  }
}
