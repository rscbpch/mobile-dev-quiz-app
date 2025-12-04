class Question {
  final String id;
  final String title;
  List<String> choices;
  final String correctAnswer;
  final int points;

  Question({required this.id, required this.title, required this.choices, required this.correctAnswer, this.points = 1});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'], 
      title: json['title'], 
      choices: List<String>.from(json['choices']), 
      correctAnswer: json['correctAnswer'], 
      points: json['points'] ?? 1
    );
  }
}
