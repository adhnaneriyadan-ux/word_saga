import 'package:flutter/material.dart';

class VictoryScreen extends StatelessWidget {
  const VictoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'LEVEL COMPLETE!',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6BFE9C), // Vibrant Emerald glow
                  shadows: [
                    Shadow(color: Color(0xFF6BFE9C), blurRadius: 20),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Stars
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStar(true),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: _buildStar(true),
                  ),
                  _buildStar(false),
                ],
              ),
              const SizedBox(height: 50),

              // Rewards Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white24),
                ),
                child: Column(
                  children: [
                    _buildRewardRow('XP EARNED', '+125', Colors.purpleAccent),
                    const SizedBox(height: 16),
                    _buildRewardRow('COINS', '+50', const Color(0xFFF1C40F), icon: Icons.monetization_on),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/map'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6AAA64), // Emerald
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'CONTINUE',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 24,
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

  Widget _buildStar(bool filled) {
    return Icon(
      filled ? Icons.star : Icons.star_border,
      size: 80,
      color: filled ? const Color(0xFFF1C40F) : Colors.white30,
      shadows: filled ? const [Shadow(color: Color(0xFFF1C40F), blurRadius: 20)] : null,
    );
  }

  Widget _buildRewardRow(String label, String value, Color color, {IconData? icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Be Vietnam Pro',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
