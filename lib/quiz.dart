import 'package:airq/data/anime.dart';
import 'package:airq/data/history.dart';
import 'package:airq/data/series.dart';
import 'package:airq/data/sports.dart';
import 'package:airq/models/question.dart';
import 'package:flutter/material.dart';
import 'package:airq/background.dart';
import 'package:airq/quiz_category.dart';
import 'package:airq/data/categorydata.dart';
import 'package:airq/question_screen.dart';
import 'package:airq/fact_screen.dart';
import 'package:airq/data/movies.dart';
import 'package:airq/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<Question> quiz = [];
  List<String> ans = [];
  Color intialbg = Colors.white;
  int index = 0;
  final catlist = categories;
  var activeScreen;
  @override
  void initState() {
    super.initState();
    activeScreen = Background(switchScreen);
  }

  void start(String cat) {
    setState(() {
      if (cat == 'Movies') {
        quiz = Movies().getQuestions();
      } else if (cat == 'Series') {
        quiz = Series().getQuestions();
      } else if (cat == 'Anime') {
        quiz = Anime().getQuestions();
      } else if (cat == 'Sports') {
        quiz = Sports().getQuestions();
      } else {
        quiz = History().getQuestions();
      }
      activeScreen = QuestionScreen(quiz, choseAnswer, index);
    });
  }

  void switchScreen() {
    index = 0;
    setState(() {
      activeScreen = QuizCategory(start);
    });
  }

  void nextques() {
    index++;
    setState(() {
      intialbg = Colors.white;
      if (quiz.length != index) {
        activeScreen = QuestionScreen(quiz, choseAnswer, index);
      } else {
        activeScreen = ResultScreen(quiz, ans, switchScreen);
        ans = [];
      }
    });
  }

  void choseAnswer(String text) {
    ans.add(text);
    setState(() {
      intialbg = (quiz[index].answers[0] == text) ? Colors.green : Colors.red;
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        activeScreen = FactScreen(nextques, index, quiz[index]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: activeScreen, backgroundColor: intialbg),
    );
  }
}
