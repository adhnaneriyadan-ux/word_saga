import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _music = true;
  bool _sfx = true;
  bool _haptics = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1C30),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'PROFILE & SETTINGS',
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
            // Profile Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white24),
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF5D3FD3),
                    ),
                    child: const Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adhnan',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Level 12 • Master Lexiconist',
                        style: TextStyle(
                          fontFamily: 'Be Vietnam Pro',
                          fontSize: 14,
                          color: Color(0xFF6BFE9C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Settings
            _buildSettingsGroup(
              'Preferences',
              [
                _buildToggle('Music', _music, (val) => setState(() => _music = val)),
                _buildToggle('Sound Effects', _sfx, (val) => setState(() => _sfx = val)),
                _buildToggle('Haptic Feedback', _haptics, (val) => setState(() => _haptics = val)),
                _buildToggle('Dark Mode', _darkMode, (val) => setState(() => _darkMode = val)),
              ],
            ),
            const SizedBox(height: 32),

            // Account
            _buildSettingsGroup(
              'Account',
              [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFBA1A1A).withOpacity(0.2),
                      foregroundColor: const Color(0xFFFFDAD6),
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Color(0xFFBA1A1A)),
                      ),
                    ),
                    child: const Text(
                      'Factory Reset Progress',
                      style: TextStyle(
                        fontFamily: 'Be Vietnam Pro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white12),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildToggle(String label, bool value, ValueChanged<bool> onChanged) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Be Vietnam Pro',
          color: Colors.white,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF6BFE9C),
        activeTrackColor: const Color(0xFF6BFE9C).withOpacity(0.3),
      ),
    );
  }
}
