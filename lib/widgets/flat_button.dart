// Inside flat_button.dart create a new stateless widget CustomFlatButton with these attributes :

// label: String
// onPressed : Function
// Complete the widget body to look as follows :

// Background color : default primaryColor
// Overlay color : default primaryColorDark
// Border radius : circular(30)
// Set the onPressed argument to the onPressed function pointer
// Set the button label to label
// Set the label font to mulish from “GoogleFonts”
// Set the label font size to 18 and font weight to FontWeight.w800

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFlatButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomFlatButton({Key ? key, required this.label, required this.onPressed}) : super(key: key);

  @override
// Requirements for the button
// Background color : default primaryColor
// Overlay color : default primaryColorDark
// Border radius : circular(30)
// Set the onPressed argument to the onPressed function pointer
// Set the button label to label
// Set the label font to mulish from “GoogleFonts”
// Set the label font size to 18 and font weight to FontWeight.w800
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      onPressed: () => onPressed(),
      child: Text(
        label,
        style: GoogleFonts.mulish(
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
      color: Theme.of(context).primaryColor,
      splashColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
  


void main() {
  runApp( MaterialApp(
    home: Scaffold(
      body: Center(
        child: CustomFlatButton(
          label: 'Submit',
          // ignore: avoid_print
          onPressed: () => print('Button Pressed!'),
        ),
      ),
    ),
  ));
}