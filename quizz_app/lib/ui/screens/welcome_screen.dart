import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  const WelcomeScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Welcome Screen", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),
          ElevatedButton.icon(icon: const Icon(Icons.play_arrow), label: const Text('Start Quiz'), onPressed: onStart),
        ],
      ),
    );
  }
}
