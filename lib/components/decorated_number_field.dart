import 'package:flutter/material.dart';

class DecoratedNumberField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const DecoratedNumberField({super.key, required this.label, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(label),
            hintText: hintText,
        ),
      ),
    );
  }
}
