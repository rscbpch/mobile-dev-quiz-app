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
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers.length > i && userAnswers[i] == questions[i].correctAnswer) {
        score += questions[i].points;
      }
    }
    int total = questions.fold(0, (sum, q) => sum + q.points);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Quiz Result',
            style: TextStyle(
              fontSize: 26, 
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Score: $score / $total',
            style: const TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.w600, 
              color: Color.fromRGBO(74, 112, 169, 100)
            ),
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
                    title: Text(
                      q.title, 
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 18
                      )
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...q.choices.map((choice) {
                          Widget? iconWidget;
                          TextStyle textStyle = const TextStyle(fontSize: 16);
                          if (choice == q.correctAnswer) {
                            iconWidget = const Icon(Icons.check, color: Colors.green, size: 20);
                            textStyle = const TextStyle(color: Colors.green, fontSize: 16);
                          } else if (choice == userAnswer && !isCorrect) {
                            iconWidget = const Icon(Icons.close, color: Colors.red, size: 20);
                            textStyle = const TextStyle(color: Colors.red, fontSize: 16);
                          }
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 28, child: iconWidget),
                              const SizedBox(width: 6),
                              Expanded(child: Text(choice, style: textStyle)),
                            ],
                          );
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
