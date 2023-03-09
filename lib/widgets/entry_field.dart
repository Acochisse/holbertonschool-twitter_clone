import 'package:flutter/material.dart';

class CustomEntryField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;

  const CustomEntryField({
    Key? key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.blue),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}