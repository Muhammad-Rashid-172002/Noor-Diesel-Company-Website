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
  Future<void> _openWhatsApp(String message) async {
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
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 6,
        centerTitle: true,
        title: Text(
          'Generator Sales',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 800),
              child: Text(
                'Premium Power Systems',
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E3A8A),
                ),
              ),
            ),
            const SizedBox(height: 15),
            FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: Text(
                'Noor Diesel Engineering provides high-quality CAT® diesel and gas generators — built for performance, efficiency, and long-term reliability across all industries.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey.shade800,
                  height: 1.7,
                ),
              ),
            ),
            const SizedBox(height: 50),

            // 🔹 Generator 1
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: FadeInLeft(
                    duration: const Duration(milliseconds: 800),
                    child: _buildGeneratorImage(
                      "assets/sells/Baudouin-generators-600x564.jpg",
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  flex: 5,
                  child: FadeInRight(
                    duration: const Duration(milliseconds: 800),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Baudouin Diesel Generator",
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1E3A8A),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          "Engineered in Europe, Baudouin generators offer unmatched efficiency and durability for continuous industrial use. Designed for reliability in all weather conditions.",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton.icon(
                          onPressed: () {
                            _openWhatsApp(
                              'Hello Noor Diesel Team,\n\nI’m interested in Baudouin Diesel Generator. Please share details and pricing.',
                            );
                          },
                          icon: const Icon(Icons.shopping_cart_outlined),
                          label: const Text('Buy Now'),
                          style: _buttonStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            // 🔹 Generator 2
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: FadeInLeft(
                    duration: const Duration(milliseconds: 800),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CAT 50 kVA Silent Generator",
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1E3A8A),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          "A compact, fuel-efficient power solution perfect for homes, offices, and industries. Ensures quiet operation and steady power supply in every environment.",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton.icon(
                          onPressed: () {
                            _openWhatsApp(
                              'Hello Noor Diesel Team,\n\nI want to inquire about CAT 50 kVA Silent Generator.',
                            );
                          },
                          icon: const Icon(Icons.shopping_cart_outlined),
                          label: const Text('Buy Now'),
                          style: _buttonStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  flex: 5,
                  child: FadeInRight(
                    duration: const Duration(milliseconds: 800),
                    child: _buildGeneratorImage(
                      "assets/sells/CAT-DE50GC-50-kVA-Stand-by-Generator-Set-DPX-18205-Netherlands_3897_2790429851311.jpg",
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            // 🔹 CTA Section
            FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 25,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEFF3FF), Color(0xFFD9E2FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Looking for Reliable Power?",
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1E3A8A),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      "Get expert guidance on choosing the right generator for your business or home setup.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey.shade800,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton.icon(
                      onPressed: () => _openWhatsApp(
                        'Hello Noor Diesel Team,\n\nI need help selecting the best generator for my requirements.',
                      ),
                      icon: const Icon(Icons.chat_bubble_outline),
                      label: const Text('Contact on WhatsApp'),
                      style: _buttonStyle(),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50),
            Divider(thickness: 1.2, color: Colors.grey.shade300),
            const SizedBox(height: 20),

            // 🔹 Footer
            Center(
              child: Text(
                "© 2025 Noor Diesel Engineering | All Rights Reserved",
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade700,
                  fontSize: 13.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneratorImage(String path) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(
          path,
          height: 320,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF1E3A8A),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      textStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
    );
  }
}
