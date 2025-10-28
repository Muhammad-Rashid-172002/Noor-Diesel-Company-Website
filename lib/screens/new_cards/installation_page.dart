import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class InstallationPage extends StatelessWidget {
  const InstallationPage({super.key});

  Future<void> _contactOnWhatsApp() async {
    const phone = '+923335132538';
    const message =
        'Hello Noor Diesel Team, I’m interested in your generator installation services.';
    final url = Uri.parse('https://wa.me/$phone?text=${Uri.encodeComponent(message)}');

    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      debugPrint('Error launching WhatsApp: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('Installation Services'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Hero Image
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

            // Main Title
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

            // Description
            Text(
              'At Noor Diesel, we specialize in complete generator installation services. '
              'From site surveys and load assessments to wiring, exhaust design, and safety compliance — our experts handle it all. '
              'We ensure your generator runs efficiently and safely for years to come.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 50),

            // Features section
            Text(
              'Our Installation Process Includes:',
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
                  icon: Icons.engineering,
                  title: 'Site Inspection',
                  description:
                      'We carefully assess your site and power requirements before installation.',
                ),
                _FeatureCard(
                  icon: Icons.flash_on,
                  title: 'Electrical Wiring',
                  description:
                      'All connections are handled by certified electricians ensuring safety.',
                ),
                _FeatureCard(
                  icon: Icons.shield,
                  title: 'Testing & Safety',
                  description:
                      'Each generator is tested for performance, grounding, and load handling.',
                ),
                _FeatureCard(
                  icon: Icons.support_agent,
                  title: 'After-Sales Support',
                  description:
                      'We offer maintenance and technical assistance whenever you need it.',
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Call-to-Action Section
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Need Installation Help?',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E3A8A),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Contact our installation team today to schedule an appointment or request a quote.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _contactOnWhatsApp,
                    icon: const Icon(Icons.chat),
                    label: const Text('Contact on WhatsApp'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF25D366),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
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
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blue.shade700),
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
