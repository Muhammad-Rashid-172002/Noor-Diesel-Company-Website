import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstallationPage extends StatelessWidget {
  const InstallationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Installation Services'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1621905251918-0935d4f03f52?auto=format&fit=crop&w=1200&q=80',
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            Text(
              'Professional Generator Installation',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E3A8A),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Our certified technicians ensure safe and reliable installation of diesel generators for homes, offices, and industries. '
              'We handle site inspection, load assessment, wiring, and testing — all to guarantee smooth power delivery and compliance with safety standards.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
