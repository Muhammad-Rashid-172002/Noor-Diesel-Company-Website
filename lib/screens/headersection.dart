import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderSection extends StatefulWidget {
  final Function(String section)? onNavItemTap;

  const HeaderSection({super.key, this.onNavItemTap});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  bool _isMenuOpen = false;

  // 🎨 Industrial Blue Theme Colors
  final Color darkBlue = const Color(0xFF0A3D62); // deep diesel blue
  final Color mediumBlue = const Color(0xFF1E3A8A); // accent navy
  final Color lightBlue = const Color(0xFF3ABEF9); // bright highlight

  Future<void> _openWhatsApp() async {
    const phone = '+923335132538';
    final url = Uri.parse(
      'https://wa.me/$phone?text=Hello%20Noor%20Diesel%20Team!',
    );
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Future<void> _makeCall() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+923335132538');
    await launchUrl(phoneUri);
  }

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'noordiesel@gmail.com',
      query:
          'subject=Inquiry%20from%20Website&body=Hello%20Noor%20Diesel%20Team,',
    );
    await launchUrl(emailUri);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 900;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [darkBlue, mediumBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Top Row: Logo + Title + Contact Options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 🔹 Logo + Title
              Row(
                children: [
                  Image.asset(
                    'assets/noor_logo-removebg-preview.png',
                    height: 45,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Noor Diesel Engineering Company',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: isMobile ? 15 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // 🔹 Desktop: Navigation + Contact Buttons
              if (!isMobile)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _navItem('Home', 'home'),
                    _navItem('About', 'about'),
                    _navItem('Services', 'services'),
                    _navItem('Projects', 'projects'),
                    _navItem('Contact', 'contact'),
                    const SizedBox(width: 30),
                    _contactButtons(),
                  ],
                ),

              // 🔹 Mobile Menu Toggle
              if (isMobile)
                IconButton(
                  icon: Icon(
                    _isMenuOpen ? Icons.close : Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () => setState(() => _isMenuOpen = !_isMenuOpen),
                ),
            ],
          ),

          // 🔹 Mobile Dropdown Menu
          if (isMobile && _isMenuOpen)
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [mediumBlue, darkBlue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _navItem('Home', 'home'),
                  _navItem('About', 'about'),
                  _navItem('Services', 'services'),
                  _navItem('Projects', 'projects'),
                  _navItem('Contact', 'contact'),
                  const Divider(color: Colors.white24, thickness: 1),
                  _contactButtons(isMobile: true),
                ],
              ),
            ),
        ],
      ),
    );
  }
  // 🔹 Navigation Item Widget

  Widget _navItem(String label, String section) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          widget.onNavItemTap?.call(section);
          setState(() => _isMenuOpen = false);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _contactButtons({bool isMobile = false}) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 14,
      children: [
        Tooltip(
          message: 'Chat on WhatsApp',
          child: InkWell(
            onTap: _openWhatsApp,
            child: const Icon(
              FontAwesomeIcons.whatsapp,
              color: Colors.greenAccent,
              size: 26,
            ),
          ),
        ),
        Tooltip(
          message: 'Call Now',
          child: InkWell(
            onTap: _makeCall,
            child: const Icon(Icons.call, color: Colors.amberAccent, size: 26),
          ),
        ),
        Tooltip(
          message: 'Send Email',
          child: InkWell(
            onTap: _sendEmail,
            child: const Icon(
              Icons.email,
              color: Colors.lightBlueAccent,
              size: 26,
            ),
          ),
        ),
      ],
    );
  }
}
