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
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: () => onPressed(),
        borderRadius: BorderRadius.circular(30),
        splashColor: Theme.of(context).primaryColorDark,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.mulish(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
  