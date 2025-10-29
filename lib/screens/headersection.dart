
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      color: const Color(0xFF1E3A8A), // deep professional blue
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🔹 Left side: Logo + Company Name
          Row(
            children: [
              // Company logo
              Image.asset('assets/noor_logo.png', height: 55),
              const SizedBox(width: 15),
              const Text(
                'Noor Diesel Engineering Company Pakistan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),

          // 🔹 Right side: Tagline
          const Text(
            'Reliable Power Solutions ⚡',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

