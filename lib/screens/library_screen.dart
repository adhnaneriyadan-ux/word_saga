import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1C30),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'LEXICON',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 10, // Dummy count
        itemBuilder: (context, index) {
          return _buildWordCard(
            context,
            'MAGIC',
            'Noun',
            'The power of apparently influencing the course of events by using mysterious or supernatural forces.',
            index % 3 == 0,
          );
        },
      ),
    );
  }

  Widget _buildWordCard(BuildContext context, String word, String pos, String def, bool isFavorite) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isFavorite ? const Color(0xFFF1C40F).withOpacity(0.5) : Colors.white12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                word,
                style: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(
                isFavorite ? Icons.bookmark : Icons.bookmark_border,
                color: isFavorite ? const Color(0xFFF1C40F) : Colors.white54,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF5D3FD3).withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              pos,
              style: const TextStyle(
                fontFamily: 'Be Vietnam Pro',
                fontSize: 12,
                color: Color(0xFFD8CEFF),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            def,
            style: const TextStyle(
              fontFamily: 'Be Vietnam Pro',
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
