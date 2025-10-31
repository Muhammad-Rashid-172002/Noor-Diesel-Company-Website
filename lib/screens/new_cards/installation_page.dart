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
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      debugPrint('Error launching WhatsApp: $e');
    }
  }

  void _showImageDetail(
    BuildContext context,
    String imageUrl,
    String title,
    String desc,
  ) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, anim1, anim2) => Container(),
      transitionBuilder: (context, anim1, anim2, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: FadeTransition(
            opacity: CurvedAnimation(parent: anim1, curve: Curves.easeOut),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                padding: const EdgeInsets.all(22),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 5,
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          imageUrl,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E3A8A),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        desc,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontSize: 15.5,
                          height: 1.6,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              _contactOnWhatsApp(
                                'Hello Noor Diesel Team,\n\nI’m interested in **buying** the generator from "$title". Please share price and delivery details.',
                              );
                            },
                            icon: const Icon(Icons.shopping_cart_outlined),
                            label: const Text('Buy'),
                            style: _buttonStyle(const Color(0xFF1E3A8A)),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              _contactOnWhatsApp(
                                'Hello Noor Diesel Team,\n\nI’d like to **rent** the generator from "$title". Please share rental options and charges.',
                              );
                            },
                            icon: const Icon(Icons.handshake_outlined),
                            label: const Text('Rent'),
                            style: _buttonStyle(const Color(0xFF16A34A)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }

  static ButtonStyle _buttonStyle(Color color) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      textStyle: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
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
      backgroundColor: const Color(0xFFF3F6FC),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 800),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: // 🔹 Title ABOVE Image with Premium Look
                FadeInDown(
                  duration: const Duration(milliseconds: 800),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw0WMau1h92562xJ9SrDEhfBqzxjz5Hf4s3A&s',
                          height: 440,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Dark overlay for better text visibility
                      Container(
                        height: 440,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.55),
                            ],
                          ),
                        ),
                      ),

                      // Centered Title Text
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Professional Generator\nInstallation',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1,
                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.6),
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 120,
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color(0xFF25D366),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),

            FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: Text(
                'We specialize in complete generator installation for homes, businesses, hospitals, and factories across Pakistan. From load assessment to commissioning — we ensure quality, safety, and performance every step of the way.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 45),

            FadeInDown(
              duration: const Duration(milliseconds: 900),
              child: Text(
                'Recent Installation Projects',
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1E3A8A),
                ),
              ),
            ),
            const SizedBox(height: 25),

            Wrap(
              spacing: 20,
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
                  child: ZoomIn(
                    duration: const Duration(milliseconds: 700),
                    child: Container(
                      width: 320,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.18),
                            blurRadius: 14,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Image background
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.network(
                              data['image']!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // Dark gradient overlay
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),

                          // Title text at bottom
                          Positioned(
                            left: 14,
                            right: 14,
                            bottom: 14,
                            child: Text(
                              data['title']!,
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 8,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Subtle tap indicator
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.85),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.info_outline,
                                color: Color(0xFF1E3A8A),
                                size: 20,
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

            // 🔧 OUR INSTALLATION PROCESS SECTION (unchanged)
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

            // 💬 Contact Section
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
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
                      'Need Expert Installation?',
                      style: GoogleFonts.montserrat(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E3A8A),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Contact Noor Diesel for professional generator setup, consultation, and reliable post-installation support.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton.icon(
                      onPressed: () => _contactOnWhatsApp(
                        'Hello Noor Diesel Team, I’m interested in your generator installation services. Please share more details.',
                      ),
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
