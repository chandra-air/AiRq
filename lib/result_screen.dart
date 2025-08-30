import 'package:flutter/material.dart';
import 'package:airq/models/question.dart';
import 'package:airq/models/headings.dart';
import 'package:airq/question_summary.dart';
import 'package:airq/models/body_text.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.quiz, this.ans, this.restartquiz, {super.key});
  final List<Question> quiz;
  final List<String> ans;
  final void Function() restartquiz;
  @override
  Widget build(BuildContext context) {
    var noCorrectans = 0;
    var totQuestions = ans.length;
    final List<Map<String, Object>> result = [];
    for (var i = 0; i < ans.length; i++) {
      if (quiz[i].answers[0] == ans[i]) noCorrectans++;
      result.add({
        'index': i,
        'question': quiz[i].text,
        'userAnswer': ans[i],
        'correctAnswer': quiz[i].answers[0],
      });
    }
    return Container(
      margin: const EdgeInsets.all(30),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Headings("You have answered $noCorrectans off $totQuestions"),
            const SizedBox(height: 60),
            QuestionSummary(result),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              onPressed: restartquiz,
              icon: Icon(Icons.replay_rounded, color: Colors.black),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 93, 173, 226),
                foregroundColor: Colors.black,
              ),
              label: BodyText('Retake Quiz', 16, FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
