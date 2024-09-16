import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswer;
  const ResultScreen({super.key, required this.chosenAnswer});

  List<Map<String, Object>> getSummmary() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      print("choosen answer value is ${chosenAnswer.toList()}");
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct-answer': questions[i].answer[0],
        'user_answer': chosenAnswer[i]
      });
      print("value of summary ${summary}");
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummmary();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("You answered $numTotalQuestions out of $numCorrectQuestions questions correctly!"),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            // const Text("List of Answer and Questions"),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Restart Quiz!",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
