import 'package:quizz_app/models/answer.dart';
import 'package:quizz_app/models/question.dart';

class Quiz {
  final String id;
  final String name;
  List<Question> questions = [];
  List<Answer> answers = [];

  Quiz({required this.id, required this.name});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    List<Question> q = (json['questions'] as List).map((data) => Question.fromJson(data)).toList();
    print('Loaded questions:');
    for (var question in q) {
      print('  Question id: \'${question.id}\', title: \'${question.title}\'');
    }

    List<Answer> a = (json['answers'] as List).map((data) {
      print('Parsing answer for questionId: \'${data['questionId']}\'');
      return Answer.fromJson(data, q);
    }).toList();

    return Quiz(
      id: json['id'], 
      name: json['name']
    ) ..questions = q ..answers = a;
  }

  int getScore() {
    int totalScore = 0;
    for (Answer answer in answers) {
      if (answer.isCorrect()) {
        totalScore += answer.question.points;
      }
    }
    return totalScore;
  }
}
