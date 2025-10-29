import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  // Replace with your uncle's contact
  final String phoneNumber = '+923335132538'; // Example: Pakistan number
  final String whatsappNumber = '+923335132538'; // Example WhatsApp

  void _contactUs() async {
    // Launch WhatsApp first, fallback to call if WhatsApp not installed
    final whatsappUrl = Uri.parse(
      "https://wa.me/$whatsappNumber?text=Hello%20Noor%20Diesel",
    );
    final phoneUrl = Uri.parse("tel:$phoneNumber");

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
    } else {
      debugPrint("Could not launch contact options");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu-pPcjoDF9lBxyNyYOrZY37zQvMXJ1zwI9Q&s',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.5),
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
                Text(
                  'NOOR DIESEL ENGINEERING COMPANY PAKISTAN',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Powering Your World with Reliable Diesel Generators',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF59E0B),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: _contactUs,
                  child: Text(
                    'Contact Us',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
