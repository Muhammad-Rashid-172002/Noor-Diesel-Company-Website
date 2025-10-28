import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/test_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class RentalPage extends StatelessWidget {
  const RentalPage({super.key});

  Future<void> _openWhatsApp() async {
    const phone =
        '+923335132538'; // 👈 Replace with your uncle’s WhatsApp number
    final url = Uri.parse(
      'https://wa.me/$phone?text=Hi, I’m interested in your generator rental services.',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not open WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: Text(
          'Generator Rental Services',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu-pPcjoDF9lBxyNyYOrZY37zQvMXJ1zwI9Q&s',
                height: 280,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Affordable & Flexible Generator Rentals',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E3A8A),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Need temporary power? Noor Diesel offers generator rental solutions for events, construction sites, and emergency backup. '
              'Choose from a range of diesel generators with flexible rental durations, delivery, setup, and on-site support — all handled by our professional team.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 17,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 35),

            // Rental Features Section
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 25,
              runSpacing: 25,
              children: [
                _rentalFeature(Icons.event, "Event Power Supply"),
                _rentalFeature(Icons.construction, "Construction Support"),
                _rentalFeature(Icons.home_filled, "Home Backup Generators"),
                _rentalFeature(Icons.bolt, "Industrial-Grade Units"),
              ],
            ),

            const SizedBox(height: 40),

            // Contact Button
            ElevatedButton.icon(
              onPressed: _openWhatsApp,
              icon: const Icon(Icons.message, color: Colors.white),
              label: Text(
                'Contact for Rental',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF16A34A),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rentalFeature(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF1E3A8A), size: 36),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
