import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1542273917363-3b1817f69a2d?auto=format&fit=crop&q=80'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Back Button
              Positioned(
                top: 20,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              // Level Nodes (Simplified)
              Positioned(
                bottom: 100,
                left: 100,
                child: _buildLevelNode(context, '1', true),
              ),
              Positioned(
                bottom: 200,
                right: 100,
                child: _buildLevelNode(context, '2', true),
              ),
              Positioned(
                bottom: 300,
                left: 150,
                child: _buildLevelNode(context, '3', false),
              ),
              Positioned(
                bottom: 450,
                right: 150,
                child: _buildLevelNode(context, '4', false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLevelNode(BuildContext context, String number, bool isUnlocked) {
    return GestureDetector(
      onTap: isUnlocked ? () => Navigator.pushNamed(context, '/game') : null,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isUnlocked ? const Color(0xFF5D3FD3) : Colors.grey,
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: isUnlocked
            ? Text(
                number,
                style: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.lock, color: Colors.white),
        ),
      ),
    );
  }
}
