import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(20),
      child: const Center(
        child: Text(
          '©️ 2025 Noor Diesel Engineering Company Pakistan | All Rights Reserved',
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ),
    );
  }
}
