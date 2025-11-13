import 'package:flutter/material.dart';// Flutter Material Package
import 'package:font_awesome_flutter/font_awesome_flutter.dart';// For FontAwesome icons
import 'package:google_fonts/google_fonts.dart';// For Google Fonts
import 'package:url_launcher/url_launcher.dart';// For launching URLs

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  // Replace with your uncle's contact
  final String phoneNumber = '+923335132538';
  final String whatsappNumber = '+923335132538';
  final String emailAddress =
      'noordieselcompany@gmail.com'; // your company email
// whatsapp 
  Future<void> _launchWhatsApp() async {
    final Uri whatsappUrl = Uri.parse(
      "https://wa.me/$whatsappNumber?text=Hello%20Noor%20Diesel%20Engineering%20Company",// prefilled message
    );
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    }
  }
// call 
  Future<void> _launchCall() async {
    final Uri phoneUrl = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
    }
  }
// email

  Future<void> _launchEmail() async {
    final Uri emailUrl = Uri(
      scheme: 'mailto',
      path: emailAddress,
      query: 'subject=Inquiry from Website&body=Hello Noor Diesel Team,',
    );
    if (await canLaunchUrl(emailUrl)) {
      await launchUrl(emailUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      height: isMobile ? 550 : 600,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu-pPcjoDF9lBxyNyYOrZY37zQvMXJ1zwI9Q&s',// background image url
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF0A3D62).withOpacity(0.85),
              const Color(0xFF1E3A8A).withOpacity(0.6),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🔹 Title
                Text(
                  'NOOR DIESEL ENGINEERING COMPANY PAKISTAN',// title text  
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: isMobile ? 28 : 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Subtitle
                Text(
                  'Powering Your World with Reliable Diesel Generators ⚙️',// subtitle text
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 16 : 22,
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 40),

                // 🔹 Contact Buttons
                Wrap(
                  spacing: 15,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildContactButton(
                      icon: Icons.call,
                      label: "Call Us",
                      onPressed: _launchCall,
                      color: const Color(0xFFF59E0B),
                    ),
                    _buildContactButton(
                      icon: FontAwesomeIcons.whatsapp,
                      label: "WhatsApp",
                      onPressed: _launchWhatsApp,
                      color: Colors.greenAccent.shade700,
                    ),
                    _buildContactButton(
                      icon: Icons.email_outlined,
                      label: "Email",
                      onPressed: _launchEmail,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // Contact Button Widget

  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 4,
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 22),
      label: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
