import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Background extends StatelessWidget {
  const Background(this.onTap, {super.key});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset('assets/icons/AiRq_hmescreen.png'),
        Text(
          'Test Your IQ with the AiRq',
          style: GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 93, 173, 226),
            foregroundColor: Colors.black,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start',
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 5),
              Icon(Icons.arrow_forward_rounded, color: Colors.black),
            ],
          ),
        ),
      ],
    );
  }
}
