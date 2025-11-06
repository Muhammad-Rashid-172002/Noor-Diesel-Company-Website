import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

class PartsPage extends StatelessWidget {
  const PartsPage({super.key});

  // ✅ Launch WhatsApp
  Future<void> _openWhatsApp() async {
    final Uri whatsappUrl = Uri.parse('https://wa.me/9233335132538');
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    }
  }

  // ✅ Launch Phone Dialer
  Future<void> _makePhoneCall() async {
    final Uri phoneUri = Uri.parse('tel:+9233335132538');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  // ✅ Launch Email
  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'noordiesel@gmail.com.pk',
      query: 'subject=Generator Spare Parts Inquiry',
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
      backgroundColor: const Color(0xFF1A2238),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 25 : 40,
                horizontal: isMobile ? 20 : 80,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0A0F24), Color(0xFF1A2238)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInDown(
                    duration: const Duration(milliseconds: 900),
                    child: Text(
                      "Noor Diesel Engineering Company",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: isMobile ? 22 : 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInUp(
                    duration: const Duration(milliseconds: 900),
                    child: Text(
                      "Get Quick Support: +92 333 35132538",
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Main Section
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: FadeInLeft(
                              duration: const Duration(milliseconds: 1000),
                              child: Image.network(
                                "https://scontent.fpew1-1.fna.fbcdn.net/v/t39.30808-6/485144816_1053323096836276_5407812930324111287_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=127cfc&_nc_ohc=NW7G4bRn5GAQ7kNvwEH9JbW&_nc_oc=AdmSEEBG5O4bwDreRJXMB2MuESE_DHxE5uITeyLNNrQll5eyJa0225WPUXQ3IRCZIsY&_nc_zt=23&_nc_ht=scontent.fpew1-1.fna&_nc_gid=aIc7K-IFgR0jJDHsz8zPLw&oh=00_AffqQQah_fXwvYYlVtarmbNzBCKcwhxt4FI9pWYYNsZOTQ&oe=690A27B2",
                                width: double.infinity,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          _buildTextContent(
                            isMobile,
                            _makePhoneCall,
                            _openWhatsApp,
                            _sendEmail,
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: _buildTextContent(
                              isMobile,
                              _makePhoneCall,
                              _openWhatsApp,
                              _sendEmail,
                            ),
                          ),
                          const SizedBox(width: 60),
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: FadeInRight(
                                duration: const Duration(milliseconds: 1000),
                                child: Image.network(
                                  "https://scontent.fpew1-1.fna.fbcdn.net/v/t39.30808-6/485144816_1053323096836276_5407812930324111287_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=127cfc&_nc_ohc=NW7G4bRn5GAQ7kNvwEH9JbW&_nc_oc=AdmSEEBG5O4bwDreRJXMB2MuESE_DHxE5uITeyLNNrQll5eyJa0225WPUXQ3IRCZIsY&_nc_zt=23&_nc_ht=scontent.fpew1-1.fna&_nc_gid=aIc7K-IFgR0jJDHsz8zPLw&oh=00_AffqQQah_fXwvYYlVtarmbNzBCKcwhxt4FI9pWYYNsZOTQ&oe=690A27B2",
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
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0A0F24), Color(0xFF1A2238)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
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

  // ✅ Text Section
  Widget _buildTextContent(
    bool isMobile,
    Future<void> Function() callNumber,
    Future<void> Function() openWhatsApp,
    Future<void> Function() sendEmail,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          child: Text(
            "GENERATOR SPARE PARTS",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 22 : 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Description Text
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: Text(
            "At Noor Diesel Engineering Company, we specialize in providing high-quality generator spare parts "
            "and components for all leading brands. From filters and injectors to alternators and control panels, "
            "our products ensure maximum reliability and long-lasting performance.",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 16,
              color: Colors.white70,
              height: 1.7,
            ),
          ),
        ),
        const SizedBox(height: 30),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: Text(
            "OUR RANGE INCLUDES:",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          // Bullet Point List
          child: Text(
            "• Diesel Engine Filters (Air, Fuel, Oil)\n"
            "• Fuel Injectors & Pumps\n"
            "• Alternators and AVR Units\n"
            "• Piston Rings, Gaskets, Valves\n"
            "• Control Modules and Sensors\n"
            "• Radiators and Cooling Fans\n"
            "• Starter Motors and Batteries",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 15,
              color: Colors.white70,
              height: 1.7,
            ),
          ),
        ),
        const SizedBox(height: 30),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: Text(
            "WHY CHOOSE US?",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: Text(
            "• Genuine and reliable spare parts\n"
            "• Competitive prices and ready stock\n"
            "• Technical assistance for part selection\n"
            "• Nationwide delivery and installation support",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 15,
              color: Colors.white70,
              height: 1.7,
            ),
          ),
        ),
        const SizedBox(height: 30),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: Text(
            "CONTACT OUR SPARE PARTS TEAM",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
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
            onTap: openWhatsApp,
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
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: Text(
            "🏢 Noor Diesel Engineering Company, Islamabad, Pakistan",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 15,
              color: Colors.white70,
              height: 1.7,
            ),
          ),
        ),
      ],
    );
  }
}
