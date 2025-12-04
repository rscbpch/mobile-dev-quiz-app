import 'package:flutter/material.dart';
import 'package:quizz_app/data/repositories/quiz_repository.dart';
import 'package:quizz_app/models/quiz.dart';
import 'ui/quiz_app.dart';

late Quiz quiz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 1 - Load the quiz data
  final quizRepo = QuizRepository();
  quiz = await quizRepo.readQuiz('assets/data/quiz.json');

  // 2 - Display the quiz
  runApp(QuizApp());
}
