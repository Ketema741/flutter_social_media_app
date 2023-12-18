import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hintText,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
