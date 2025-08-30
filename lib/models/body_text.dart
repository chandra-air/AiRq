import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyText extends StatelessWidget {
  const BodyText(this.text, this.size, this.weight, {super.key});
  final String text;
  final double size;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.manrope(
        fontSize: size,
        fontWeight: weight,
        color: Colors.black,
      ),
    );
  }
}
