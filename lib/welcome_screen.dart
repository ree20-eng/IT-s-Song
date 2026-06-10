import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/daftar.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<Color> colors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.pink,
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // smooth
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 🔥 FIX: sin jadi 0 - 1 biar ga negatif
  double normalize(double value) {
    return (value + 1) / 2; // dari -1..1 jadi 0..1
  }

  Widget _buildBar(double value, int index) {
    return Container(
      width: 6,
      height: 10 + (normalize(value) * 35), // ✅ AMAN
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: colors[index % colors.length],
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFEE0),
              Color(0xFFF5F5DC),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 40),

                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    double t = _controller.value * 2 * pi;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // kiri bars
                        _buildBar(sin(t), 0),
                        _buildBar(sin(t + 0.5), 1),
                        _buildBar(sin(t + 1), 2),

                        const SizedBox(width: 15),

                        // 💿 ICON MUTER
                        Transform.rotate(
                          angle: _controller.value * 2 * pi,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.black12,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.music_note,
                              size: 50,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        const SizedBox(width: 15),

                        // kanan bars
                        _buildBar(sin(t + 1.5), 3),
                        _buildBar(sin(t + 2), 4),
                        _buildBar(sin(t + 2.5), 0),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 35),

                const Text(
                  "IT'S SONG",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Temukan musik favoritmu\nsetiap hari 🎧",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 200),

                // BUTTON MASUK
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AlbumPage(),
                        ),
                      );
                    },
                    child: const Text("Masuk"),
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Daftar(),
                        ),
                      );
                    },
                    child: const Text(
                      "Daftar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
