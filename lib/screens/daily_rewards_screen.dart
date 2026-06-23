import 'package:flutter/material.dart';

class DailyRewardsView extends StatelessWidget {
  const DailyRewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1C30),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'DAILY QUESTS',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _buildDayCard('Day 1', '50 Coins', Icons.check_circle, Colors.grey, isClaimed: true)),
                const SizedBox(width: 16),
                Expanded(child: _buildDayCard('Day 2', '100 Coins', Icons.check_circle, Colors.grey, isClaimed: true)),
              ],
            ),
            const SizedBox(height: 16),
            _buildDayCard(
              'Day 3',
              '+1 Reveal',
              Icons.visibility,
              const Color(0xFF6BFE9C),
              isReady: true,
              fullWidth: true,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildDayCard('Day 4', '150 Coins', Icons.lock, Colors.white24)),
                const SizedBox(width: 16),
                Expanded(child: _buildDayCard('Day 5', '+1 Remove', Icons.lock, Colors.white24)),
              ],
            ),
            const SizedBox(height: 16),
            _buildDayCard('Day 6', '200 Coins', Icons.lock, Colors.white24, fullWidth: true),
            const SizedBox(height: 16),
            _buildDayCard(
              'Day 7',
              'Epic Chest',
              Icons.card_giftcard,
              const Color(0xFFF1C40F),
              fullWidth: true,
              isEpic: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayCard(String day, String reward, IconData icon, Color color,
      {bool isClaimed = false, bool isReady = false, bool fullWidth = false, bool isEpic = false}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isReady ? color : Colors.white12,
          width: isReady ? 2 : 1,
        ),
        boxShadow: isReady
            ? [BoxShadow(color: color.withOpacity(0.2), blurRadius: 20)]
            : null,
      ),
      child: Column(
        children: [
          Text(
            day,
            style: const TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 12),
          Icon(icon, size: isEpic ? 60 : 40, color: color),
          const SizedBox(height: 12),
          Text(
            reward,
            style: TextStyle(
              fontFamily: 'Be Vietnam Pro',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isClaimed ? Colors.white54 : Colors.white,
            ),
          ),
          if (isReady) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: fullWidth ? double.infinity : null,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('CLAIM'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
