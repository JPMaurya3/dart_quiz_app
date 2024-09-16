class QuizQuestion {
  final String text;
  final List<String> answer;
  const QuizQuestion(this.text, this.answer);
// get shuffle answer
  List<String> getShuffleAnswer() {
    final shuffleAnswer = List.of(answer);
    shuffleAnswer.shuffle();
    return shuffleAnswer;
  }
}
