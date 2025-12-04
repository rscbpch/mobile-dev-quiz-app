import 'package:flutter/material.dart';
import 'package:quizz_app/models/question.dart';
import 'package:quizz_app/ui/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final List<Question> questions;
  final List<String> userAnswers;
  final VoidCallback onRestart;
  const ResultScreen({super.key, required this.questions, required this.userAnswers, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Quiz Result',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, idx) {
                final q = questions[idx];
                final userAnswer = userAnswers.length > idx ? userAnswers[idx] : null;
                final isCorrect = userAnswer == q.correctAnswer;
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(q.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...q.choices.map((choice) {
                          if (choice == q.correctAnswer) {
                            return Row(
                              children: [
                                const Icon(Icons.check, color: Colors.green, size: 20),
                                const SizedBox(width: 6),
                                Text(choice, style: const TextStyle(color: Colors.green)),
                              ],
                            );
                          } else if (choice == userAnswer && !isCorrect) {
                            return Row(
                              children: [
                                const Icon(Icons.close, color: Colors.red, size: 20),
                                const SizedBox(width: 6),
                                Text(choice, style: const TextStyle(color: Colors.red)),
                              ],
                            );
                          } else {
                            return Text(choice);
                          }
                        }),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          AppButton('Restart Quiz', onTap: onRestart, icon: Icons.refresh),
        ],
      ),
    );
  }
}
