import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EPTextWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const EPTextWidget({
    Key? key,
    required this.text,
    required this.textSize,
    required this.textColor,
    required this.fontWeight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.urbanist(
        fontSize: textSize,
        color: textColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
