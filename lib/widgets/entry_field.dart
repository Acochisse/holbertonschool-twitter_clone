//create an entry field for the user to enter their email and password
// should replicate the twitter login page
// Inside entry_field.dart create a new stateless widget CustomEntryField with these attributes :

// hint : String
// controller : TextEditingController
// isPassword : bool (default false)

import 'package:flutter/material.dart';

class CustomEntryField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;

  const CustomEntryField(
    { Key ? key,
    required this.hint,
    required this.controller,
    required this.isPassword}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFFF1E6FF),
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}