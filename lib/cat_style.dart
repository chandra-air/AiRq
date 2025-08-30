import 'package:flutter/material.dart';
import 'package:airq/models/body_text.dart';
import 'package:airq/models/categories.dart';

class CatStyle extends StatefulWidget {
  const CatStyle(this.cat, this.start, {super.key});
  final Categories cat;
  final void Function(String text) start;
  @override
  State<CatStyle> createState() {
    return _CatStyleState();
  }
}

class _CatStyleState extends State<CatStyle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        ClipOval(
          child: SizedBox(height: 100, width: 100, child: widget.cat.img),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              widget.start(widget.cat.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 93, 173, 226),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BodyText(widget.cat.text, 21, FontWeight.w600),
                Icon(Icons.arrow_forward_rounded, color: Colors.black),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
