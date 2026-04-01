import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%2014%20Flutter/views/type_selection_screen.dart';

class SplashScreenPokemon extends StatefulWidget {
  const SplashScreenPokemon({super.key});

  @override
  State<SplashScreenPokemon> createState() => _SplashScreenPokemonState();
}

class _SplashScreenPokemonState extends State<SplashScreenPokemon> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _startAnimationAndNavigate();
  }

  Future<void> _startAnimationAndNavigate() async {
    setState(() => _isVisible = true);

    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 450),
        pageBuilder: (_, __, ___) => const TypeSelectionScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0A0F1F), Color(0xFF17223B), Color(0xFF1F4068)],
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            opacity: _isVisible ? 1 : 0,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.catching_pokemon, color: Color(0xFFFFCB05), size: 68),
                SizedBox(height: 12),
                Text(
                  'Pokemon',
                  style: TextStyle(
                    fontSize: 46,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                    color: Color(0xFFEAF2FF),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Trainer Battle Dex',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
