class QuizQuestion {
  const QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> getShuffledAnswers() {
    // List.of(answer).shuffle();
    // of listeyi kopyalar, chaining, ancak asil listede degisiklik yaparsan kopyalanmis liste degismez.

    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
