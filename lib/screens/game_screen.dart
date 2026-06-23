import 'package:flutter/material.dart';

class GameScreenUI extends StatelessWidget {
  const GameScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0B1C30)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Level 42',
          style: TextStyle(
            fontFamily: 'Quicksand',
            color: Color(0xFF0B1C30),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb_outline, color: Color(0xFFF1C40F)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Game Board (Dummy Grid)
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: 30, // 6 attempts * 5 letters
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFC9C4D7), width: 2),
                      ),
                      child: Center(
                        child: Text(
                          index < 5 ? 'A' : '', // Dummy text
                          style: const TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0B1C30),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Keyboard (Dummy Layout)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            color: Colors.white,
            child: Column(
              children: [
                _buildKeyboardRow(['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P']),
                const SizedBox(height: 8),
                _buildKeyboardRow(['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L']),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildKey('ENTER', flex: 2, color: const Color(0xFF5D3FD3)),
                    const SizedBox(width: 6),
                    Expanded(
                      flex: 7,
                      child: _buildKeyboardRow(['Z', 'X', 'C', 'V', 'B', 'N', 'M']),
                    ),
                    const SizedBox(width: 6),
                    _buildKey('DEL', flex: 2, icon: Icons.backspace),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyboardRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: keys.map((key) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: _buildKey(key),
        );
      }).toList(),
    );
  }

  Widget _buildKey(String label, {int flex = 1, Color? color, IconData? icon}) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color ?? const Color(0xFFEFF4FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: icon != null
              ? Icon(icon, size: 20, color: const Color(0xFF0B1C30))
              : Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Be Vietnam Pro',
                    fontWeight: FontWeight.bold,
                    color: color != null ? Colors.white : const Color(0xFF0B1C30),
                  ),
                ),
        ),
      ),
    );
  }
}
