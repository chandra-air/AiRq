import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Headings extends StatelessWidget {
  const Headings(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w700),
    );
  }
}
