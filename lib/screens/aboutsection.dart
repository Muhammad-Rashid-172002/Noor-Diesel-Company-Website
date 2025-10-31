import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      "icon": Icons.engineering,
      "title": "Mechanical & Electrical Earth Moving Machinery",
    },
    {
      "icon": Icons.precision_manufacturing,
      "title": "Industry Machinery & Parts",
    },
    {"icon": Icons.book, "title": "Office Stationery & Books"},
    {"icon": Icons.electrical_services, "title": "Electrical Panels & Cabling"},
    {
      "icon": Icons.electric_bolt,
      "title": "AC, DC Motors & Motor Control Panels",
    },
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
    {"icon": Icons.sunny, "title": "Solar Panel Sales & Installation"},
    {
      "icon": Icons.sync_alt,
      "title": "Diesel Generator Panels, Changeover & Auto Start",
    },
    {"icon": Icons.shield, "title": "Earth Protection Systems"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        children: [
          Text(
            'About Noor Diesel Engineering Company',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 100,
            height: 4,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFF59E0B), Color(0xFFEF4444)],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900;
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

  Widget _aboutImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://5.imimg.com/data5/SELLER/Default/2025/4/499912647/MU/HJ/IU/24822239/silent-genset-for-construction-sites-in-nepal.jpeg',
        height: 500,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _aboutContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'We specialize in sales, rental, and maintenance of power and industrial equipment across Pakistan — delivering reliability, efficiency, and trust in every project.',
          style: GoogleFonts.poppins(
            fontSize: 17,
            height: 1.7,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 25),
        Text(
          'Our Services Include:',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.blue.shade900,
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: services.map((service) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 300),
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(service['icon'], color: Colors.blue.shade800, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      service['title'],
                      style: GoogleFonts.poppins(fontSize: 15, height: 1.5),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 30),
        Text(
          'Contact Addresses:',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.blue.shade900,
          ),
        ),
        const SizedBox(height: 16),
        _contactCard(
          'Islamabad Office',
          'Suite #306 Ginza Centre, 3rd Floor, Jinnah Avenue, Blue Area Islamabad, Pakistan\nTel: +92-51-2804188\nFax: +92-51-2804188\nCell: +92-333-9091225\nEmail: noordiesel@gmail.com',
        ),
        const SizedBox(height: 16),
        _contactCard(
          'Peshawar Office',
          'Meer Alam Market, Pabbi Nowshera, GT Road, Peshawar, Pakistan\nTel: +92-923-527585\nMob: +92-333-5132538\nCell: +92-315-5132538\nZahid Ali - Branch Manager',
        ),
      ],
    );
  }

  Widget _contactCard(String title, String detail) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
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
                fontSize: 16,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 8),
            Text(detail, style: GoogleFonts.poppins(fontSize: 15, height: 1.6)),
          ],
        ),
      ),
    );
  }
}
