import 'package:flutter/material.dart';

class ExpandedElevatedButton extends StatelessWidget {
  final Function onPressed;

  const ExpandedElevatedButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              onPressed();
            },
            child: const Text('Save'),
          ),
        ),
      ],
    );
  }
}
