// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomBuutton extends StatelessWidget {
   CustomBuutton({super.key,required this.text,this.textColor,required this.onPressed,required this.buttonColor});
  String text;
  Color? textColor;
  Color? buttonColor;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                ),
                onPressed: onPressed,
                child: Text(
                  text,
                  style: GoogleFonts.poppins(color: textColor),
                ),
              );
  }
}