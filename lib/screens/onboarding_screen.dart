import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1C30),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'How to Play',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),

              // Rule: Correct
              _buildRuleRow(
                context,
                'Q',
                const Color(0xFF6AAA64), // Green
                'Correct letter, correct spot.',
              ),
              const SizedBox(height: 20),

              // Rule: Wrong Place
              _buildRuleRow(
                context,
                'U',
                const Color(0xFFC9B458), // Yellow
                'Correct letter, wrong spot.',
              ),
              const SizedBox(height: 20),

              // Rule: Wrong
              _buildRuleRow(
                context,
                'E',
                const Color(0xFF797586), // Gray
                'Letter not in the word.',
              ),

              const SizedBox(height: 60),

              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5D3FD3),
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Enter the Forest',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRuleRow(BuildContext context, String letter, Color color, String description) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white24, width: 2),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              letter,
              style: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(
              fontFamily: 'Be Vietnam Pro',
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}
