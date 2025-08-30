class Question {
  const Question(this.text, this.answers, this.fact, this.imgpath);
  final String text;
  final List<String> answers;
  final String fact;
  final String imgpath;

  List<String> getQuestions() {
    final ans = List.of(answers);
    ans.shuffle();
    return ans;
  }
}
