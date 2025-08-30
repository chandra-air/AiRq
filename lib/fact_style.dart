import 'package:flutter/material.dart';
import 'package:airq/models/headings.dart';
import 'package:airq/models/body_text.dart';

class FactStyle extends StatelessWidget {
  const FactStyle(this.text, this.imgpath, {super.key});
  final String text;
  final String imgpath;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Headings('Fact Check!'),
        const SizedBox(height: 20),
        SizedBox(
          width: 400,
          height: 400,
          child: ClipRRect(child: Image.asset(imgpath, fit: BoxFit.contain)),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 100,
          child: SingleChildScrollView(
            child: BodyText(text, 16, FontWeight.w500),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
