import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repair & Maintenance'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1606227064307-58a4b4f42d0e?auto=format&fit=crop&w=1200&q=80',
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            Text(
              'Reliable Generator Maintenance & Repairs',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E3A8A),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'To keep your generator running at peak performance, Noor Diesel offers complete maintenance and repair services. '
              'From oil changes and filter replacements to diagnostics and part repairs — our expert team ensures your power source remains dependable year-round.',
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
