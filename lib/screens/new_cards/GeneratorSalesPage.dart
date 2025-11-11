import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For custom fonts
import 'package:url_launcher/url_launcher.dart'; // For launching URLs
import 'package:animate_do/animate_do.dart';// For animations

class GeneratorSalesPage extends StatefulWidget {
  const GeneratorSalesPage({super.key});

  @override
  State<GeneratorSalesPage> createState() => _GeneratorSalesPageState();
}

class _GeneratorSalesPageState extends State<GeneratorSalesPage> {
  // ✅ WhatsApp
  Future<void> _openWhatsApp(String message) async {
    const phone = '+923335132538';
    final Uri url = Uri.parse(
      'https://wa.me/$phone?text=${Uri.encodeComponent(message)}',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not open WhatsApp');
    }
  }

  // ✅ Phone Call
  Future<void> _makePhoneCall() async {
    final Uri phoneUri = Uri.parse('tel:+923335132538');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  // ✅ Email
  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'noordiesel@gmail.com.pk',
      query: 'subject=Generator Sales Inquiry - Noor Diesel Engineering',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0F24),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 20 : 25,
                horizontal: isMobile ? 20 : 60,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0A3D62), Color(0xFF1B1F3B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Noor Diesel Engineering Company",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: isMobile ? 18 : 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: _makePhoneCall,
                    child: Text(
                      "📞 +92 333 35132538 (Tap to Call)",
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: isMobile ? 13 : 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Main Section
            Container(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 30 : 60,
                horizontal: isMobile ? 20 : 80,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0A0F24), Color(0xFF1A2238)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left side (Text)
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: FadeInLeft(
                      duration: const Duration(milliseconds: 800),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "GENERATOR SALES",
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 26 : 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Description Text
                          Text(
                            "At Noor Diesel Engineering Company, we provide premium-quality diesel and gas generators "
                            "from leading global brands. Our generator sets are designed for maximum durability, "
                            "fuel efficiency, and consistent power performance for both industrial and residential needs.",
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 14 : 16,
                              color: Colors.white70,
                              height: 1.7,
                            ),
                          ),
                          const SizedBox(height: 25),
                          _sectionTitle("OUR RANGE INCLUDES:"),
                          _bulletList([
                            "Diesel Generators (10 kVA – 1000 kVA)",
                            "Gas and Hybrid Power Systems",
                            "Silent Type Generators",
                            "Automatic Transfer Switches (ATS)",
                            "Generator Maintenance & Installation Services",
                          ]),
                          const SizedBox(height: 25),
                          _sectionTitle("WHY CHOOSE US?"),
                          _bulletList([
                            "High-performance generators from trusted brands",
                            "Competitive pricing and warranty support",
                            "Expert installation and after-sales services",
                            "24/7 technical and maintenance assistance",
                          ]),
                          const SizedBox(height: 25),
                          _sectionTitle("CONTACT OUR SALES TEAM"),
                          const SizedBox(height: 10),
                          _contactLink(
                            "📞 Call Us",
                            Colors.lightBlueAccent,
                            _makePhoneCall,
                          ),
                          _contactLink(
                            "✉️ Send Email",
                            Colors.orangeAccent,
                            _sendEmail,
                          ),
                          _contactLink("💬 WhatsApp", Colors.greenAccent, () {
                            _openWhatsApp(
                              "Hello Noor Diesel Team,\n\nI want to inquire about your generator sales.",
                            );
                          }),
                          const SizedBox(height: 10),
                          Text(
                            "🏢 Noor Diesel Engineering Company, Islamabad, Pakistan",
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 14 : 15,
                              color: Colors.white70,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: isMobile ? 0 : 50, height: isMobile ? 30 : 0),

                  // Right side (Image)
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: FadeInRight(
                      duration: const Duration(milliseconds: 900),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          "https://image.made-in-china.com/202f0j00yadBRoEKEOcU/Electrical-Generators-Perkin-150-kVA-Weatherproof-Diesel-Generator-1106A-70tag2-120kw-Power-Station.webp",
                          height: isMobile ? 250 : 420,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Footer
            Container(
              color: const Color(0xFF0A0F24),
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(
                "© 2025 Noor Diesel Engineering | All Rights Reserved",
                style: GoogleFonts.poppins(color: Colors.white54, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Helper widgets
  Widget _sectionTitle(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );

  Widget _bulletList(List<String> items) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: items
        .map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              "• $e",
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.white70,
                height: 1.6,
              ),
            ),
          ),
        )
        .toList(),
  );
// Contact Link Widget  
  Widget _contactLink(String text, Color color, VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: color,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
}
