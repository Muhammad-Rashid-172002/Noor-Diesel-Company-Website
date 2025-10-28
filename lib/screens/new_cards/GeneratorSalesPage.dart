import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneratorSalesPage extends StatelessWidget {
  const GeneratorSalesPage({super.key});

  Future<void> _contactOnWhatsApp() async {
    const phone = '+923335132538';
    const message =
        'Hello Noor Diesel Team, I am interested in your generators. Please share more details.';
    final webUrl = 'https://wa.me/$phone?text=${Uri.encodeComponent(message)}';
    // On web, just use launchUrlString
    await launchUrl(Uri.parse(webUrl), mode: LaunchMode.platformDefault);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('Generator Sales'),
        backgroundColor: const Color(0xFF1E3A8A),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu-pPcjoDF9lBxyNyYOrZY37zQvMXJ1zwI9Q&s',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),

            // Main Heading
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

            // Description
            Text(
              'Noor Diesel provides top-of-the-line diesel generators designed for reliability, efficiency, and durability. '
              'Whether you need a small backup generator for your home or a large industrial power solution, we’ve got you covered. '
              'Our experts ensure smooth installation, maintenance, and 24/7 support for all your power needs.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),

            // Features Section
            Text(
              'Why Choose Noor Diesel?',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 40,
              runSpacing: 30,
              children: const [
                _FeatureCard(
                  icon: Icons.bolt,
                  title: 'High Performance',
                  description:
                      'Our generators deliver consistent, uninterrupted power for homes and industries.',
                ),
                _FeatureCard(
                  icon: Icons.eco,
                  title: 'Fuel Efficient',
                  description:
                      'Built to minimize fuel consumption while maximizing power output.',
                ),
                _FeatureCard(
                  icon: Icons.settings,
                  title: 'Low Maintenance',
                  description:
                      'Designed for easy operation with minimal maintenance costs.',
                ),
                _FeatureCard(
                  icon: Icons.verified,
                  title: 'Trusted Brands',
                  description:
                      'Partnered with leading manufacturers ensuring quality and reliability.',
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Call-to-Action Section
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF8FAFC), Color(0xFFE0E7FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Need a Generator?',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E3A8A),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Contact our sales team today to get a personalized quote or learn more about our products.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton.icon(
                    onPressed: _contactOnWhatsApp,
                    icon: const Icon(Icons.chat),
                    label: const Text('Contact on WhatsApp'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A8A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 16,
                      ),
                      textStyle: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 260,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 42, color: Colors.blue.shade700),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
