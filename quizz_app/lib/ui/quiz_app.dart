import 'package:flutter/material.dart';
import 'package:quizz_app/ui/screens/question_screen.dart';
import 'package:quizz_app/ui/screens/welcome_screen.dart';
import 'package:quizz_app/ui/screens/result_screen.dart';
import 'package:quizz_app/models/quiz.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

enum QuizStage { welcome, question, result }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizStage stage = QuizStage.welcome;
  Quiz? quiz;
  int currentIndex = 0;
  List<String> userAnswers = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadQuiz();
  }

  Future<void> _loadQuiz() async {
    final jsonString = await rootBundle.loadString('assets/data/quiz.json');
    final jsonData = jsonDecode(jsonString);
    setState(() {
      quiz = Quiz.fromJson(jsonData);
      loading = false;
    });
  }

  void _startQuiz() {
    setState(() {
      stage = QuizStage.question;
      currentIndex = 0;
      userAnswers = [];
    });
  }

  void _answerQuestion(String answer) {
    setState(() {
      userAnswers.add(answer);
      if (quiz != null && currentIndex < quiz!.questions.length - 1) {
        currentIndex++;
      } else {
        stage = QuizStage.result;
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      stage = QuizStage.welcome;
      currentIndex = 0;
      userAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: loading ? const Center(child: CircularProgressIndicator()) : _buildStage()),
    );
  }

  Widget _buildStage() {
    switch (stage) {
      case QuizStage.welcome:
        return WelcomeScreen(onStart: _startQuiz);
      case QuizStage.question:
        return QuestionScreen(question: quiz!.questions[currentIndex], onAnswer: _answerQuestion);
      case QuizStage.result:
        return ResultScreen(questions: quiz!.questions, userAnswers: userAnswers, onRestart: _restartQuiz);
    }
  }
}
