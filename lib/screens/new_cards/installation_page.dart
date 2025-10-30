import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

class InstallationPage extends StatelessWidget {
  const InstallationPage({super.key});

  Future<void> _contactOnWhatsApp() async {
    const phone = '+923335132538';
    const message =
        'Hello Noor Diesel Team, I’m interested in your generator installation services.';
    final url = Uri.parse(
      'https://wa.me/$phone?text=${Uri.encodeComponent(message)}',
    );
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
    final installationImages = [
      'https://www.albahar.com/wp-content/uploads/2018/08/A007537.jpg',
      'https://www.drcgc.com/hs-fs/hubfs/blog/generator-installation-cropped.jpg?width=857&name=generator-installation-cropped.jpg',
      'https://5.imimg.com/data5/SELLER/Default/2024/8/445065484/JO/LX/IX/227450229/generator-installation-services-500x500.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBKsG0vig6QA0fVSQLhqutFvdYdPDWPP0WBA&s',
      'https://opplumbingandheating.ca/wp-content/uploads/2019/02/generator.png',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FC),
      appBar: AppBar(
        title: const Text('Installation Services'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 6,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 800),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/installations/main_installation.jpg',
                  height: 360,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Title
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: Text(
                'Professional Generator Installation',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E3A8A),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Description
            FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: Text(
                'Noor Diesel provides end-to-end generator installation services across Pakistan. '
                'Our skilled engineers handle everything — site inspection, load analysis, electrical wiring, exhaust setup, and safety testing. '
                'We ensure your generator performs optimally and operates safely for long-term reliability.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 50),

            // 💡 Installation Gallery
            FadeInDown(
              duration: const Duration(milliseconds: 900),
              child: Text(
                'Recent Installation Projects',
                style: GoogleFonts.montserrat(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1E3A8A),
                ),
              ),
            ),
            const SizedBox(height: 25),

            Wrap(
              spacing: 25,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              children: installationImages
                  .map(
                    (img) => ZoomIn(
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        width: 320,
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(img, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 60),

            // Features Section
            FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: Text(
                'Our Installation Process Includes:',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E3A8A),
                ),
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
                      'We assess the site and calculate optimal generator placement.',
                ),
                _FeatureCard(
                  icon: Icons.bolt,
                  title: 'Electrical Setup',
                  description:
                      'Safe and certified electrical wiring by expert technicians.',
                ),
                _FeatureCard(
                  icon: Icons.shield,
                  title: 'Testing & Safety',
                  description:
                      'Load tests, grounding, and vibration checks for safe performance.',
                ),
                _FeatureCard(
                  icon: Icons.support_agent,
                  title: 'Post-Installation Support',
                  description:
                      'Regular maintenance and customer support you can rely on.',
                ),
              ],
            ),

            const SizedBox(height: 70),

            // CTA Section
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 40,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEFF3FF), Color(0xFFDDE8FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Need Professional Installation?',
                      style: GoogleFonts.montserrat(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E3A8A),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Get a free site visit and consultation with our experts. Let’s ensure your power setup is done right the first time.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton.icon(
                      onPressed: _contactOnWhatsApp,
                      icon: const FaIcon(FontAwesomeIcons.whatsapp),
                      label: const Text('Contact on WhatsApp'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF25D366),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 35,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: GoogleFonts.montserrat(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
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
    return ZoomIn(
      duration: const Duration(milliseconds: 700),
      child: Container(
        width: 260,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.18),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 42, color: const Color(0xFF1E3A8A)),
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
                fontSize: 14.5,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
