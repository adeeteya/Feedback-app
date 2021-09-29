class Question {
  String question;
  int rating;
  Question(this.question, {this.rating = 0});
}

List<Question> questions = [
  Question("How do you like our service?"),
  Question("How do you appreciate the sanitization?"),
  Question("How was the sound quality?"),
  Question("How was the lighting?"),
  Question("How likely are you to recommend us to your friends?"),
  Question("How likely are you to come back here?")
];
int total(List<Question> questions) {
  int sum = 0;
  questions.map((q) {
    sum = sum + q.rating;
  });
  return sum;
}
