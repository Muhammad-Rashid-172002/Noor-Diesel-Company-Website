import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneratorSalesPage extends StatelessWidget {
  const GeneratorSalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generator Sales'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu-pPcjoDF9lBxyNyYOrZY37zQvMXJ1zwI9Q&s',
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            Text(
              'High-Quality Diesel Generators for Every Need',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E3A8A),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Noor Diesel offers a complete range of reliable diesel generators suitable for homes, offices, and industries. '
              'We partner with top manufacturers to provide energy-efficient, durable, and high-performance generators. '
              'Our team ensures professional installation and continuous maintenance for smooth, long-term operation.',
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
