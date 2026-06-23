import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate database initialization
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0B1C30), // Deep indigo
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF5D3FD3),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF6BFE9C), // Green glow
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.menu_book,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Word Saga',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 40),
              // Loading Bar
              Container(
                width: 200,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                     // Animate this in a real app
                    return Container(
                      width: constraints.maxWidth * 0.7,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6BFE9C),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Initializing Magic...',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
