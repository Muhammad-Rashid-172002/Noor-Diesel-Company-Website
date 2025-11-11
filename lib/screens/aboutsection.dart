import 'package:flutter/material.dart';// Flutter Material Package
import 'package:google_fonts/google_fonts.dart';// Google Fonts Package

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  // For hover animation tracking
  int? hoveredServiceIndex;
  int? hoveredContactIndex;

  final List<Map<String, dynamic>> services = const [
    {"icon": Icons.engineering, "title": "Mechanical & Electrical Machinery"},
    {
      "icon": Icons.precision_manufacturing,
      "title": "Industry Machinery & Parts",
    },
    {"icon": Icons.book, "title": "Office Stationery & Books"},
    {"icon": Icons.electrical_services, "title": "Electrical Panels & Cabling"},
    {"icon": Icons.electric_bolt, "title": "AC/DC Motors & Control Panels"},
    {"icon": Icons.security, "title": "Security Cameras & Internet Systems"},
    {"icon": Icons.light, "title": "Industrial & Commercial Lighting"},
    {"icon": Icons.construction, "title": "Construction Material Supplies"},
    {"icon": Icons.power, "title": "Generators Sale & Purchase"},
    {
      "icon": Icons.build_circle,
      "title": "Generator Installation & Maintenance",
    },
    {
      "icon": Icons.local_shipping,
      "title": "Loading, Unloading & Transportation",
    },
    {
      "icon": Icons.settings,
      "title": "Diesel Generators on Rent (2KVA–1250KVA)",
    },
    {"icon": Icons.solar_power, "title": "Solar Panel Sales & Installation"},
    {"icon": Icons.sync_alt, "title": "Changeover & Auto Start Panels"},
    {"icon": Icons.shield, "title": "Earth Protection Systems"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B), Color(0xFF111827)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF38BDF8), Color(0xFF0EA5E9)],
            ).createShader(bounds),
            child: Text(
              'About Noor Diesel Engineering Company',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 120,
            height: 4,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFACC15), Color(0xFF38BDF8)],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 950;
              return Flex(
                direction: isWide ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: isWide ? 1 : 0, child: _aboutImage()),
                  SizedBox(width: isWide ? 50 : 0, height: isWide ? 0 : 30),
                  Expanded(flex: 1, child: _aboutContent()),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
  // About Image Widget

  Widget _aboutImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.4),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://5.imimg.com/data5/SELLER/Default/2025/4/499912647/MU/HJ/IU/24822239/silent-genset-for-construction-sites-in-nepal.jpeg',
          height: 480,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _aboutContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Description Text
        Text(
          'We specialize in the sales, rental, and maintenance of power and industrial equipment across Pakistan — delivering reliability, efficiency, and trust in every project.',
          style: GoogleFonts.poppins(
            fontSize: 17,
            height: 1.8,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 25),
        Text(
          'Our Services Include:',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF38BDF8),
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: List.generate(services.length, (index) {
            final service = services[index];
            final isHovered = hoveredServiceIndex == index;
            return MouseRegion(
              onEnter: (_) => setState(() => hoveredServiceIndex = index),
              onExit: (_) => setState(() => hoveredServiceIndex = null),
              cursor: SystemMouseCursors.click,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                constraints: const BoxConstraints(maxWidth: 320),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isHovered
                        ? const Color(0xFF38BDF8)
                        : const Color(0xFF38BDF8).withOpacity(0.25),
                    width: isHovered ? 1.5 : 1,
                  ),
                  boxShadow: [
                    if (isHovered)
                      BoxShadow(
                        color: const Color(0xFF38BDF8).withOpacity(0.5),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF38BDF8), Color(0xFF0EA5E9)],
                        ),
                      ),
                      child: Icon(
                        service['icon'],
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        service['title'],
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          height: 1.5,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 40),
        Text(
          'Contact Offices:',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFACC15),
          ),
        ),
        const SizedBox(height: 20),
        _buildContactCard(
          index: 0,
          title: 'Islamabad Office',
          detail:
              'Suite #306 Ginza Centre, 3rd Floor, Jinnah Avenue, Blue Area Islamabad, Pakistan\n📞 +92-51-2804188 | 📠 +92-51-2804188\n📱 +92-333-9091225\n✉️ noordiesel@gmail.com',
        ),
        const SizedBox(height: 18),
        _buildContactCard(
          index: 1,
          title: 'Peshawar Office',
          detail:
              'Meer Alam Market, Pabbi Nowshera, GT Road, Peshawar, Pakistan\n📞 +92-923-527585\n📱 +92-333-5132538 | +92-315-5132538\n👤 Zahid Ali - Branch Manager',
        ),
      ],
    );
  }

  Widget _buildContactCard({
    required int index,
    required String title,
    required String detail,
  }) {
    final isHovered = hoveredContactIndex == index;
    return MouseRegion(
      onEnter: (_) => setState(() => hoveredContactIndex = index),
      onExit: (_) => setState(() => hoveredContactIndex = null),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isHovered
                ? const Color(0xFFFACC15)
                : const Color(0xFF38BDF8).withOpacity(0.3),
            width: isHovered ? 1.6 : 1,
          ),
          boxShadow: [
            if (isHovered)
              BoxShadow(
                color: const Color(0xFFFACC15).withOpacity(0.4),
                blurRadius: 14,
                spreadRadius: 2,
              ),  
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: const Color(0xFF38BDF8),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              detail,
              style: GoogleFonts.poppins(
                fontSize: 15,
                height: 1.6,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
