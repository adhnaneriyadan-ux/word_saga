import 'package:flutter/material.dart';

class AchievementsView extends StatelessWidget {
  const AchievementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1C30),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'ACHIEVEMENTS',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildAchievementCard(
            context,
            'The Word Smith',
            'Found 50 words.',
            Icons.menu_book,
            true, // unlocked
            true, // claimable
            1.0,
          ),
          _buildAchievementCard(
            context,
            'Streak Master',
            'Maintain a 7-day win streak.',
            Icons.local_fire_department,
            false,
            false,
            4 / 7,
            progressText: '4/7',
          ),
          _buildAchievementCard(
            context,
            'Lexicon Scholar',
            'Unlock 100 definitions.',
            Icons.school,
            false,
            false,
            0.84,
            progressText: '84/100',
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(
    BuildContext context,
    String title,
    String desc,
    IconData icon,
    bool isUnlocked,
    bool isClaimable,
    double progress, {
    String? progressText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isClaimable ? const Color(0xFF6BFE9C).withOpacity(0.5) : Colors.white12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isUnlocked ? const Color(0xFF5D3FD3) : Colors.white12,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      desc,
                      style: const TextStyle(
                        fontFamily: 'Be Vietnam Pro',
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (isClaimable)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.monetization_on, color: Color(0xFFF1C40F)),
                label: const Text('CLAIM +100'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6AAA64),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (progressText != null)
                  Text(
                    progressText,
                    style: const TextStyle(
                      fontFamily: 'Be Vietnam Pro',
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white12,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isUnlocked ? const Color(0xFF6BFE9C) : const Color(0xFF5D3FD3),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
