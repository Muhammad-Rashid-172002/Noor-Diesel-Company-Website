import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

class InstallationPage extends StatelessWidget {
  const InstallationPage({super.key});

  Future<void> _contactOnWhatsApp(String message) async {
    const phone = '+923335132538';
    final url = Uri.parse(
      'https://wa.me/$phone?text=${Uri.encodeComponent(message)}',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final installations = [
      {
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0ZbpNG7cEqgCRbA4F1egm-GgDACkjFMGfNA&s',
        'title': 'Industrial 100kVA Installation – Karachi',
        'desc':
            'Full-scale installation for a textile factory including load balancing, underground cabling, and vibration isolation system for noise control.',
      },
      {
        'image':
            'https://www.drcgc.com/hs-fs/hubfs/blog/generator-installation-cropped.jpg?width=857&name=generator-installation-cropped.jpg',
        'title': 'Hospital Backup System – Lahore',
        'desc':
            'Installed twin generators with ATS ensuring uninterrupted power for critical departments. Includes soundproof enclosure and ventilation system.',
      },
      {
        'image':
            'https://5.imimg.com/data5/SELLER/Default/2024/8/445065484/JO/LX/IX/227450229/generator-installation-services-500x500.jpg',
        'title': 'Residential Standby Unit – Islamabad',
        'desc':
            'Installed a 25kVA backup generator with smart control panel for a gated home. Features fuel efficiency optimization and remote monitoring setup.',
      },
      {
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBKsG0vig6QA0fVSQLhqutFvdYdPDWPP0WBA&s',
        'title': 'Corporate Office Power Setup – Multan',
        'desc':
            'Dual generator system with synchronization and load-sharing for smooth power transitions during outages.',
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A0F24), Color(0xFF1A2238)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: Column(
            children: [
              // 🔹 Header Section (Text + Right Image)
              FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Professional Generator Installation',
                            style: GoogleFonts.montserrat(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF66FCF1),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We provide end-to-end generator installation across Pakistan. From site inspection and wiring to testing and final commissioning — ensuring reliable, safe, and efficient power setups for any scale.',
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.white70,
                              height: 1.7,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton.icon(
                            onPressed: () => _contactOnWhatsApp(
                              'Hello Noor Diesel Team, I’m interested in your generator installation services.',
                            ),
                            icon: const Icon(Icons.chat, color: Colors.white),
                            label: Text(
                              "Contact on WhatsApp",
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF25D366),
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
                    const SizedBox(width: 30),
                    Expanded(
                      flex: 5,
                      child: ZoomIn(
                        duration: const Duration(milliseconds: 900),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw0WMau1h92562xJ9SrDEhfBqzxjz5Hf4s3A&s',
                            height: 350,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // 🔹 Installation Cards
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'Recent Installation Projects',
                  style: GoogleFonts.montserrat(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF66FCF1),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Wrap(
                spacing: 22,
                runSpacing: 25,
                alignment: WrapAlignment.center,
                children: installations.map((data) {
                  return GestureDetector(
                    onTap: () => _showImageDetail(
                      context,
                      data['image']!,
                      data['title']!,
                      data['desc']!,
                    ),
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F2833),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 10,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.network(
                                data['image']!,
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14),
                              child: Text(
                                data['title']!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF66FCF1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 60),

              // 🔹 Installation Process
              FadeInUp(
                duration: const Duration(milliseconds: 900),
                child: Text(
                  'Our Installation Process',
                  style: GoogleFonts.montserrat(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF66FCF1),
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
                        'Certified wiring and panel configuration by professionals.',
                  ),
                  _FeatureCard(
                    icon: Icons.shield,
                    title: 'Testing & Safety',
                    description:
                        'We conduct vibration, grounding, and load tests for reliability.',
                  ),
                  _FeatureCard(
                    icon: Icons.support_agent,
                    title: 'Post-Installation Support',
                    description:
                        'Ongoing maintenance and customer support for long-term use.',
                  ),
                ],
              ),

              const SizedBox(height: 70),

              // 🔹 Contact Section
              FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 40,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F2833),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Need Expert Installation?',
                        style: GoogleFonts.montserrat(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF66FCF1),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Contact Noor Diesel for reliable installation and power solutions.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white70,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton.icon(
                        onPressed: () => _contactOnWhatsApp(
                          'Hello Noor Diesel Team, I’m interested in your installation services.',
                        ),
                        icon: const FaIcon(FontAwesomeIcons.whatsapp),
                        label: const Text('Chat on WhatsApp'),
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
      ),
    );
  }

  void _showImageDetail(
    BuildContext context,
    String imageUrl,
    String title,
    String desc,
  ) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: const Color(0xFF1F2833),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF66FCF1),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                desc,
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Feature Card Widget
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
        width: 250,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF0B0C10),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 42, color: const Color(0xFF66FCF1)),
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14.5,
                color: Colors.white70,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
