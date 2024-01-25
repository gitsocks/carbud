import 'package:flutter/material.dart';

class DecoratedTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const DecoratedTextField({super.key, required this.label, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: TextField(
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
