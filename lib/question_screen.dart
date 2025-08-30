import 'package:airq/models/headings.dart';
import 'package:flutter/material.dart';
import 'package:airq/models/body_text.dart';
import 'package:airq/models/question.dart';
import 'package:airq/models/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.quiz, this.fact, this.index, {super.key});
  final List<Question> quiz;
  final void Function(String text) fact;
  final int index;
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currindex = 0;

  @override
  void initState() {
    super.initState();
    currindex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    final currques = widget.quiz[currindex];
    final tra = currindex + 1;
    final totques = widget.quiz.length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 120, 20, 110),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Headings('$tra off $totques')),
            const SizedBox(height: 170),
            BodyText(currques.text, 19, FontWeight.w600),
            const SizedBox(height: 20),
            ...currques.getQuestions().map((item) {
              return AnswerButton(item, widget.fact);
            }),
          ],
        ),
      ),
    );
  }
}
