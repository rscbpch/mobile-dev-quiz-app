import 'package:quizz_app/models/question.dart';

class Answer {
  final String id;
  final String answerChoice;
  Question question;

  Answer({required this.id, required this.answerChoice, required this.question});

  factory Answer.fromJson(Map<String, dynamic> json, List<Question> allQuestions) {
    final linkedQuestion = allQuestions.firstWhere((q) => q.id == json['questionId']);

    return Answer(
      id: json['id'], 
      answerChoice: json['answerChoice'], 
      question: linkedQuestion
    );
  }

  bool isCorrect() {
    return answerChoice == question.correctAnswer;
  }
}
