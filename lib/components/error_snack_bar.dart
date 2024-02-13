import 'package:flutter/material.dart';

class ErrorSnackBar extends StatelessWidget {
  final String message;

  const ErrorSnackBar({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    var snackbar = SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).colorScheme.error,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    
    return snackbar;
  }
}