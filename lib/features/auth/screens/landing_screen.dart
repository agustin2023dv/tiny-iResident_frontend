import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1F2A60), // fallback color
      body: Stack(
        children: [
          BackgroundDesign(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Enter personal details to your\nemployee account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
          _BottomAuthButtons(),
        ],
      ),
    );
  }
}

class _BottomAuthButtons extends StatelessWidget {
  const _BottomAuthButtons();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const VerticalDivider(
              width: 1,
              color: Colors.grey,
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text(
                'Sign up',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundDesign extends StatelessWidget {
  const BackgroundDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF7A9BD1), Color(0xFF283C8B)],
        ),
      ),
      child: const Stack(
        children: [
          Positioned(
            top: 80,
            left: 20,
            child: _Circle(size: 80, color: Colors.white, opacity: 0.3),
          ),
          Positioned(
            bottom: 200,
            right: 20,
            child: _Circle(size: 90, color: Colors.white, opacity: 0.5),
          ),
          Positioned(
            bottom: 40,
            left: 70,
            child: _Circle(
              size: 60,
              color: Color.fromARGB(255, 56, 54, 215),
              opacity: 1.0,
            ),
          ),
          Positioned(
            bottom: 90,
            left: 30,
            child: _Circle(size: 90, color: Colors.blue, opacity: 1.0),
          ),
        ],
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;

  const _Circle({required this.size, required this.color, this.opacity = 1.0});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 100),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
