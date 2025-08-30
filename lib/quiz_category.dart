import 'package:flutter/material.dart';
import 'package:airq/models/headings.dart';
import 'package:airq/data/categorydata.dart';
import 'package:airq/cat_style.dart';

class QuizCategory extends StatelessWidget {
  const QuizCategory(this.start, {super.key});
  final void Function(String text) start;
  @override
  Widget build(BuildContext context) {
    final catlist = categories;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 50),
          Headings('Select the Category'),
          const SizedBox(height: 50),
          Column(
            spacing: 20,
            children: [
              ...catlist.map((cat) {
                return CatStyle(cat, start);
              }),
            ],
          ),
        ],
      ),
    );
  }
}
