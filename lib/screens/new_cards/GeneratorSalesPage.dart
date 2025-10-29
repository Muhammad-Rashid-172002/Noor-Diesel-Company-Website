import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart'; // Add this package for subtle animations

class GeneratorSalesPage extends StatefulWidget {
  const GeneratorSalesPage({super.key});

  @override
  State<GeneratorSalesPage> createState() => _GeneratorSalesPageState();
}

class _GeneratorSalesPageState extends State<GeneratorSalesPage> {
  final List<Map<String, String>> generatorItems = [
    {
      'path': 'assets/sells/2be8b3a4b95ac8f35fc5a9782747a455.jpeg',
      'desc':
          'Silent Diesel Generator - Reliable and Durable for Industrial Use. Designed for consistent performance, ideal for industries and construction sites.',
    },
    {
      'path':
          'assets/sells/50-kVA-Price-in-Pakistan-Silent-Generator-for-Home-Use.jpeg',
      'desc':
          '50 kVA Silent Generator – Perfect for homes, offices, and small businesses. Delivers quiet and efficient operation.',
    },
    {
      'path': 'assets/sells/Baudouin-generators-600x564.jpg',
      'desc':
          'Baudouin Generator – Built for high performance and energy efficiency with advanced European engineering.',
    },
  ];

  String? _selectedImage;

  Future<void> _contactOnWhatsApp() async {
    const phone = '+923335132538';
    const message =
        'Hello Noor Diesel Team, I am interested in your generators. Please share more details.';
    final url = 'https://wa.me/$phone?text=${Uri.encodeComponent(message)}';
    await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault);
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
        shadowColor: Colors.black45,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInDown(
                  duration: const Duration(milliseconds: 900),
                  child: Text(
                    'Premium Diesel Generators for Every Need',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1E3A8A),
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Alternating image + text layout
                for (int i = 0; i < generatorItems.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final bool isEven = i % 2 == 0;
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (isEven)
                              Expanded(
                                flex: 5,
                                child: FadeInUp(
                                  duration: const Duration(milliseconds: 900),
                                  child: _buildImage(
                                    context,
                                    generatorItems[i]['path']!,
                                  ),
                                ),
                              ),
                            if (isEven) const SizedBox(width: 40),
                            Expanded(
                              flex: 5,
                              child: FadeInDown(
                                duration: const Duration(milliseconds: 900),
                                child: _buildText(generatorItems[i]['desc']!),
                              ),
                            ),
                            if (!isEven) const SizedBox(width: 40),
                            if (!isEven)
                              Expanded(
                                flex: 5,
                                child: FadeInUp(
                                  duration: const Duration(milliseconds: 900),
                                  child: _buildImage(
                                    context,
                                    generatorItems[i]['path']!,
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),

                const SizedBox(height: 70),

                // Why Choose Section
                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  child: Text(
                    'Why Choose Noor Diesel?',
                    style: GoogleFonts.montserrat(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1E3A8A),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 25,
                  runSpacing: 25,
                  children: const [
                    _FeatureCard(
                      icon: Icons.bolt,
                      title: 'High Performance',
                      description:
                          'Generators engineered to deliver reliable and consistent power output.',
                    ),
                    _FeatureCard(
                      icon: Icons.eco,
                      title: 'Fuel Efficient',
                      description:
                          'Low fuel consumption without compromising on performance.',
                    ),
                    _FeatureCard(
                      icon: Icons.settings,
                      title: 'Low Maintenance',
                      description:
                          'Built for hassle-free operation with minimal upkeep.',
                    ),
                    _FeatureCard(
                      icon: Icons.verified,
                      title: 'Trusted Brands',
                      description:
                          'Partnered with global generator brands for assured quality.',
                    ),
                  ],
                ),

                const SizedBox(height: 80),

                // Call to Action
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
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1E3A8A),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Get expert guidance and a customized quote for your generator needs.',
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
                          icon: const Icon(Icons.chat_bubble_outline),
                          label: const Text('Contact on WhatsApp'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E3A8A),
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

          // Fullscreen Image Viewer
          if (_selectedImage != null)
            GestureDetector(
              onTap: () => setState(() => _selectedImage = null),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: Colors.black.withOpacity(0.9),
                child: Center(
                  child: Hero(
                    tag: _selectedImage!,
                    child: InteractiveViewer(
                      panEnabled: true,
                      minScale: 0.8,
                      maxScale: 4.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          _selectedImage!,
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.9,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, String path) {
    return GestureDetector(
      onTap: () => setState(() => _selectedImage = path),
      child: Hero(
        tag: path,
        child: Container(
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
            child: Image.asset(path, height: 320, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  Widget _buildText(String desc) {
    return Text(
      desc,
      textAlign: TextAlign.justify,
      style: GoogleFonts.poppins(
        fontSize: 17,
        color: Colors.grey.shade800,
        height: 1.8,
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
