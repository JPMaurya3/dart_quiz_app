import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';

import 'start_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> selectedAnswer = [];
  String activeScreen = 'start-screen';
  // @override
  // initState() {
  //   // activeScreen = StartScreen(strartQuiz: switchScreen);
  //   activeScreen = 'start-screen';
  //   super.initState();
  // }

  /*The instance member 'switchScreen' can't be accessed in an initializer.
Try replacing the reference to the instance member with a different expression */
// swtich function user
  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    //end of the question we back to start screen
    if (selectedAnswer.length == questions.length) {
      setState(() {
        // selectedAnswer = [];
        // activeScreen = 'start-screen';
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(
      strartQuiz: switchScreen,
    );
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSlelectedAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswer,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color.fromARGB(255, 78, 13, 151),
                  Color.fromARGB(255, 107, 15, 168),
                ])),
            child:
                screenWidget //activeScreen() the expression does not evaluate to a function so it can't invoke
            ),
      ),
    );
  }
}
