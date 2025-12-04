import 'package:flutter/material.dart';
import 'package:quizz_app/models/question.dart';
import 'package:quizz_app/ui/widgets/app_button.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final void Function(String) onAnswer;
  const QuestionScreen({super.key, required this.question, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            question.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ...question.choices.map(
            (choice) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: AppButton(choice, onTap: () => onAnswer(choice), icon: Icons.question_answer),
            ),
          ),
        ],
      ),
    );
  }
}
