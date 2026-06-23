import 'package:flutter/material.dart';

class WordInfoScreen extends StatelessWidget {
  const WordInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1C30),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ADVENTURE',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    '/ədˈven(t)SHər/',
                    style: TextStyle(
                      fontFamily: 'Be Vietnam Pro',
                      fontSize: 18,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.volume_up, color: Color(0xFF5D3FD3)),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF5D3FD3).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF5D3FD3)),
                ),
                child: const Text(
                  'Noun / Verb',
                  style: TextStyle(
                    fontFamily: 'Be Vietnam Pro',
                    color: Color(0xFFD8CEFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Definition',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6BFE9C),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'An unusual and exciting, typically hazardous, experience or activity.',
                style: TextStyle(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Etymology',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6BFE9C),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Middle English: from Old French aventure (noun), avenir (verb), from Latin advenire "arrive".',
                style: TextStyle(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
