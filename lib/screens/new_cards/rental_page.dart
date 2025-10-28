import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RentalPage extends StatelessWidget {
  const RentalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generator Rental Services'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1626206051134-96c55d15c5cf?auto=format&fit=crop&w=1200&q=80',
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            Text(
              'Affordable & Flexible Generator Rentals',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E3A8A),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Need temporary power? Noor Diesel offers generator rental solutions for events, construction sites, and emergency backup. '
              'Our fleet includes a wide range of diesel generators with flexible rental terms — delivered, installed, and maintained by professionals.',
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
