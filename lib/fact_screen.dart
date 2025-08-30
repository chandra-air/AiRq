import 'package:airq/fact_style.dart';
import 'package:flutter/material.dart';
import 'package:airq/models/question.dart';
import 'package:airq/models/body_text.dart';

class FactScreen extends StatefulWidget {
  const FactScreen(this.nextques, this.index, this.question, {super.key});
  final void Function() nextques;
  final int index;
  final Question question;
  @override
  State<FactScreen> createState() {
    return _FactScreenState();
  }
}

class _FactScreenState extends State<FactScreen> {
  @override
  Widget build(BuildContext context) {
    final String text = widget.question.fact;
    final String path = widget.question.imgpath;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: FactStyle(text, path)),
              ElevatedButton(
                onPressed: widget.nextques,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 93, 173, 226),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BodyText('Next', 16, FontWeight.w500),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
