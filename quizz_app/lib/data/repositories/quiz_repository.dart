import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:quizz_app/models/quiz.dart';

class QuizRepository {
  Future<Quiz> readQuiz(String assetPath) async {
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final jsonData = jsonDecode(jsonString);
      return Quiz.fromJson(jsonData);
    } catch (e) {
      throw Exception('Error reading quiz file: $e');
    }
  }
}
