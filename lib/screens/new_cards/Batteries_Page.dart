import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

class BatteriesPage extends StatefulWidget {
  const BatteriesPage({super.key});

  @override
  State<BatteriesPage> createState() => _BatteriesPageState();
}

class _BatteriesPageState extends State<BatteriesPage> {
  // ✅ WhatsApp
  Future<void> _openWhatsApp() async {
    final Uri whatsappUrl = Uri.parse('https://wa.me/9233335132538');
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    }
  }

  // ✅ Phone Call
  Future<void> _makePhoneCall() async {
    final Uri phoneUri = Uri.parse('tel:+9233335132538');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  // ✅ Email
  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'noordiesel@gmail.com.pk',
      query: 'subject=Battery Inquiry - Noor Diesel Engineering Company',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Header
            Container(
              width: double.infinity,
              color: const Color(0xFF0A3D62),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 20 : 25,
                horizontal: isMobile ? 20 : 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Noor Diesel Engineering Company",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: isMobile ? 18 : 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Reliable Power Starts with Reliable Batteries",
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: isMobile ? 13 : 14,
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Main Section with Gradient Background
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0A0F24), Color(0xFF1A2238)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 30 : 60,
                  horizontal: isMobile ? 20 : 80,
                ),
                child: isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInUp(
                            duration: const Duration(milliseconds: 800),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw9coyl7A_I9A0ApTevPLVPhfH18GFvalUvA&s",
                                width: double.infinity,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          FadeInLeft(
                            duration: const Duration(milliseconds: 800),
                            child: _buildTextContent(isMobile),
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: FadeInLeft(
                              duration: const Duration(milliseconds: 800),
                              child: _buildTextContent(isMobile),
                            ),
                          ),
                          const SizedBox(width: 60),
                          Expanded(
                            flex: 1,
                            child: FadeInUp(
                              duration: const Duration(milliseconds: 800),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw9coyl7A_I9A0ApTevPLVPhfH18GFvalUvA&s",
                                  height: 500,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),

            // ✅ Footer
            Container(
              width: double.infinity,
              color: Colors.grey[900],
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Text(
                  "© 2025 Noor Diesel Engineering Company. All Rights Reserved.",
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Text Section with White Text
  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "GENERATOR BATTERIES",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        // Description Text
        Text(
          "At Noor Diesel Engineering Company, we supply premium-quality generator batteries designed for "
          "long-lasting performance and dependable power delivery. Whether for industrial, commercial, or home "
          "generators, our batteries guarantee smooth startups and reliable operation in all weather conditions.",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 14 : 16,
            color: Colors.white70,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          "OUR BATTERY RANGE INCLUDES:",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        // Bullet Point List
        Text(
          "• Lead Acid and Dry Batteries\n"
          "• Maintenance-Free Batteries\n"
          "• High Cranking Power Batteries\n"
          "• Long Life and Deep Cycle Batteries\n"
          "• Compatible with All Major Generator Brands",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 14 : 15,
            color: Colors.white70,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          "WHY CHOOSE US?",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        // Bullet Point List
        Text(
          "• 100% Genuine and Tested Batteries\n"
          "• Competitive Pricing and Fast Delivery\n"
          "• Expert Installation Support\n"
          "• Available in Multiple Capacities and Brands",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 14 : 15,
            color: Colors.white70,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          "CONTACT OUR BATTERY TEAM",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),

        // ✅ Clickable Contact Links with Animation
        FadeInLeft(
          duration: const Duration(milliseconds: 800),
          child: GestureDetector(
            onTap: _makePhoneCall,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.blueAccent,
                  size: isMobile ? 16 : 18,
                ),
                const SizedBox(width: 8),
                Text(
                  "+92 333 35132538",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 14 : 15,
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 5),
        FadeInLeft(
          duration: const Duration(milliseconds: 1000),
          child: GestureDetector(
            onTap: _sendEmail,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.email,
                  color: Colors.blueAccent,
                  size: isMobile ? 16 : 18,
                ),
                const SizedBox(width: 8),
                Text(
                  "noordiesel@gmail.com.pk",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 14 : 15,
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 5),
        FadeInLeft(
          duration: const Duration(milliseconds: 800),
          child: GestureDetector(
            onTap: _openWhatsApp,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.greenAccent,
                  size: isMobile ? 16 : 20,
                ),
                const SizedBox(width: 8),
                Text(
                  "Chat on WhatsApp",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 14 : 15,
                    color: Colors.greenAccent,
                    height: 1.7,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "🏢 Noor Diesel Engineering Company, Islamabad, Pakistan",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 14 : 15,
            color: Colors.white70,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}
