import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

class GeneratorSalesPage extends StatefulWidget {
  const GeneratorSalesPage({super.key});

  @override
  State<GeneratorSalesPage> createState() => _GeneratorSalesPageState();
}

class _GeneratorSalesPageState extends State<GeneratorSalesPage> {
  final List<Map<String, String>> generatorItems = [
    {
      'path': 'assets/sells/2be8b3a4b95ac8f35fc5a9782747a455.jpeg',
      'title': 'Silent Diesel Generator',
      'desc':
          'Reliable and durable for industrial use. Designed for consistent performance — perfect for factories and construction sites.',
    },
    {
      'path':
          'assets/sells/CAT-DE50GC-50-kVA-Stand-by-Generator-Set-DPX-18205-Netherlands_3897_2790429851311.jpg',
      'title': 'CAT 50 kVA Silent Generator',
      'desc':
          'Ideal for homes, offices, and small businesses. Delivers quiet and efficient operation for long hours of use.',
    },
    {
      'path': 'assets/sells/Baudouin-generators-600x564.jpg',
      'title': 'Baudouin Diesel Generator',
      'desc':
          'Built with advanced European engineering for high performance, reliability, and fuel efficiency.',
    },
  ];

  // 🔹 Custom WhatsApp Function
  Future<void> _contactOnWhatsApp(String message) async {
    const phone = '+923335132538';
    final Uri url = Uri.parse(
      'https://wa.me/$phone?text=${Uri.encodeComponent(message)}',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not open WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A),
        title: Text(
          'Generator Sales',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        elevation: 8,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Column(
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 900),
              child: Text(
                'Premium Diesel Generators for Every Need',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E3A8A),
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // 🔹 Generator List
            ...List.generate(generatorItems.length, (i) {
              final gen = generatorItems[i];
              final isEven = i % 2 == 0;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (isEven)
                      Expanded(
                        flex: 5,
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 900),
                          child: _buildImage(gen['path']!),
                        ),
                      ),
                    if (isEven) const SizedBox(width: 30),
                    Expanded(
                      flex: 5,
                      child: FadeInDown(
                        duration: const Duration(milliseconds: 900),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              gen['title']!,
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF1E3A8A),
                              ),
                            ),
                            const SizedBox(height: 10),
                            _buildText(gen['desc']!),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _contactOnWhatsApp(
                                      'Hello Noor Diesel Team,\n\nI am interested in **buying** the ${gen['title']}.\nPlease share price and availability details.\n\nThank you!',
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.shopping_cart_outlined,
                                  ),
                                  label: const Text('Buy'),
                                  style: _buttonStyle(const Color(0xFF1E3A8A)),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _contactOnWhatsApp(
                                      'Hello Noor Diesel Team,\n\nI would like to **rent** the ${gen['title']}.\nPlease provide rental duration options and pricing.\n\nThank you!',
                                    );
                                  },
                                  icon: const Icon(Icons.handshake_outlined),
                                  label: const Text('Rent'),
                                  style: _buttonStyle(const Color(0xFF16A34A)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            TextButton(
                              onPressed: () {
                                _showDetailsBottomSheet(
                                  context,
                                  gen['path']!,
                                  gen['title']!,
                                  gen['desc']!,
                                );
                              },
                              child: Text(
                                'View Details',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF1E3A8A),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!isEven) const SizedBox(width: 30),
                    if (!isEven)
                      Expanded(
                        flex: 5,
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 900),
                          child: _buildImage(gen['path']!),
                        ),
                      ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 60),

            // 🔹 Why Choose Section
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: Text(
                'Why Choose Noor Diesel?',
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
              children: const [
                _FeatureCard(
                  icon: Icons.bolt,
                  title: 'High Performance',
                  description:
                      'Engines engineered to deliver consistent, reliable power output.',
                ),
                _FeatureCard(
                  icon: Icons.eco,
                  title: 'Fuel Efficient',
                  description:
                      'Low fuel consumption without compromising power.',
                ),
                _FeatureCard(
                  icon: Icons.settings,
                  title: 'Low Maintenance',
                  description:
                      'Built for long-term performance and durability.',
                ),
                _FeatureCard(
                  icon: Icons.verified,
                  title: 'Trusted Brands',
                  description:
                      'Partnered with top international generator suppliers.',
                ),
              ],
            ),
            const SizedBox(height: 70),

            // 🔹 Call to Action
            FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: Container(
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEEF2FF), Color(0xFFDDE7FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Need a Generator?',
                      style: GoogleFonts.montserrat(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E3A8A),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Get expert advice or a custom quote today!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton.icon(
                      onPressed: () => _contactOnWhatsApp(
                        'Hello Noor Diesel Team,\n\nI need help choosing the right generator.',
                      ),
                      icon: const Icon(Icons.chat_bubble_outline),
                      label: const Text('Contact on WhatsApp'),
                      style: _buttonStyle(const Color(0xFF1E3A8A)),
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

  // 🔹 Button Style
  ButtonStyle _buttonStyle(Color color) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 5,
      textStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
    );
  }

  // 🔹 Image Builder
  Widget _buildImage(String path) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(
          path,
          height: 350,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 🔹 Text Builder
  Widget _buildText(String desc) {
    return Text(
      desc,
      textAlign: TextAlign.justify,
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.grey.shade800,
        height: 1.7,
      ),
    );
  }

  // 🔹 Bottom Sheet Detail View
  void _showDetailsBottomSheet(
    BuildContext context,
    String imagePath,
    String title,
    String desc,
  ) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, anim1, anim2) => const SizedBox.shrink(),
      transitionBuilder: (context, anim1, anim2, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: SlideTransition(
            position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .animate(
                  CurvedAnimation(parent: anim1, curve: Curves.easeOutCubic),
                ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // 🔹 Full Image Banner
                        Stack(
                          children: [
                            Image.asset(
                              imagePath,
                              width: double.infinity,
                              height: 330,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 20,
                              right: 20,
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // 🔹 Title
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1E3A8A),
                          ),
                        ),

                        const SizedBox(height: 14),

                        // 🔹 Description
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '$desc\n\nThis generator provides top-notch performance, perfect for continuous operations in industries, construction sites, and commercial buildings. It features low fuel consumption, high durability, and advanced soundproof technology for quiet performance.\n\nKey Highlights:\n• High efficiency and low maintenance\n• Ideal for industrial and domestic setups\n• Weather-resistant enclosure\n• Easy-to-service design',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              fontSize: 15.5,
                              height: 1.7,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // 🔹 Action Buttons
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  _contactOnWhatsAppCustom(
                                    'Hello Noor Diesel Team,\n\nI want to **buy** the $title. Please share price and delivery options.',
                                  );
                                },
                                icon: const Icon(Icons.shopping_cart_outlined),
                                label: const Text('Buy'),
                                style: _buttonStyle(const Color(0xFF1E3A8A)),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  _contactOnWhatsAppCustom(
                                    'Hello Noor Diesel Team,\n\nI would like to **rent** the $title. Please share rental details.',
                                  );
                                },
                                icon: const Icon(Icons.handshake_outlined),
                                label: const Text('Rent'),
                                style: _buttonStyle(const Color(0xFF16A34A)),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
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

  Future<void> _contactOnWhatsAppCustom(String message) async {
    const phone = '+923335132538';
    final url = 'https://wa.me/$phone?text=${Uri.encodeComponent(message)}';
    await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault);
  }

  ButtonStyle buttonStyle(Color color) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      textStyle: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      elevation: 6,
    );
  }
}

// 🔹 Feature Card Widget
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 270,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 48, color: const Color(0xFF1E3A8A)),
            const SizedBox(height: 14),
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E3A8A),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14.5,
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
