import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) onSlelectedAnswer;
  const QuestionsScreen({super.key, required this.onSlelectedAnswer});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String sleectedAnswer) {
    widget.onSlelectedAnswer(sleectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),

              // const TextStyle(
              //     color: Colors.white, decoration: TextDecoration.none),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffleAnswer().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onPressed: () {
                    answerQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
