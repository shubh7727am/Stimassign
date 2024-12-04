class Question {
  final String question;
  final String answer;
  final int day;
  final int exercise;
  final List<String> options;
  final int? attemptScore;

  Question({
    required this.day,
    required this.exercise,
    required this.question,
    required this.answer,
    required this.options,
    this.attemptScore,
  });
}