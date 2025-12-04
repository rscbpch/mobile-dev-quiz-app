import 'package:flutter/material.dart';
import 'package:quizz_app/ui/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  const WelcomeScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/computer.png', 
            width: 160, 
            height: 160
          ),
          const SizedBox(height: 24),
          const Text(
            "Welcome to Quizz App", 
            style: TextStyle(
              fontSize: 28, 
              fontWeight: FontWeight.bold
            )
          ),
          const SizedBox(height: 32),
          AppButton(
            'Start Quiz', 
            onTap: onStart, 
            icon: Icons.play_arrow
          ),
        ],
      ),
    );
  }
}
