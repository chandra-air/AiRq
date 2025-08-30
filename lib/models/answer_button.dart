import 'package:airq/models/body_text.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.text, this.fun, {super.key});
  final String text;
  final void Function(String text) fun;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        fun(text);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 93, 173, 226),
        foregroundColor: Colors.black,
      ),
      child: BodyText(text, 17, FontWeight.normal),
    );
  }
}
