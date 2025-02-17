import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function() strartQuiz;
  const StartScreen({super.key, required this.strartQuiz});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/image.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text('Learn Flutter the fun way!',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 24)
              // TextStyle(
              //   decoration: TextDecoration.none,
              //   color: Color.fromARGB(255, 237, 223, 252),
              //   fontSize: 24,
              // ),
              ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: strartQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
