import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample gallery data
    final galleryData = [
      {
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTtF3Z7sQ_ymj4pdtrjOkEk1fdgNSGTLwoBg&s',
        'title': 'Diesel Generator – 50 kVA',
        'description':
            'A heavy-duty 50 kVA diesel generator, ideal for commercial and industrial applications. Provides consistent power and efficiency during long operations.',
      },
      {
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNuvKLb67m9lhBjuuDnncYIB1yK-3aJ565Kg&s',
        'title': 'Portable Generator – 10 kVA',
        'description':
            'Compact and portable 10 kVA generator suitable for home and small business use. Easy to transport and fuel-efficient.',
      },
      {
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc6dCRLhLV66tx1Bj16JF909yDJtQ_fXsVvg&s',
        'title': 'Standby Generator – 25 kVA',
        'description':
            'A standby 25 kVA generator designed for automatic backup power during outages. Low noise and reliable performance.',
      },
      {
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW8RCIWqbWpr8IRA-oTRyTnyaBYG-9LqRqvw&s',
        'title': 'Industrial Generator – 100 kVA',
        'description':
            'High-capacity 100 kVA generator built for continuous industrial use. Delivers stable power output for large-scale operations.',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        title: Text(
          'Repair & Maintenance',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        centerTitle: true,
        elevation: 6,
        shadowColor: Colors.black26,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🖼 Header Image
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc6dCRLhLV66tx1Bj16JF909yDJtQ_fXsVvg&s',
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Reliable Generator Maintenance & Repairs',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 💬 Description
            Text(
              'Keep your generator performing at its best with Noor Diesel’s expert maintenance and repair services. '
              'Our certified technicians handle everything from oil and filter changes to diagnostics and component repairs '
              'ensuring your generator remains efficient, safe, and ready whenever you need it.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16.8,
                height: 1.7,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),

            // ⚙️ Features
            Text(
              'Our Key Maintenance Services',
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E3A8A),
              ),
            ),
            const SizedBox(height: 25),

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 25,
              runSpacing: 25,
              children: [
                _serviceFeature(Icons.settings, "Full Diagnostics"),
                _serviceFeature(Icons.oil_barrel, "Oil & Filter Changes"),
                _serviceFeature(Icons.bolt, "Electrical System Check"),
                _serviceFeature(Icons.handyman, "Component Repairs"),
              ],
            ),
            const SizedBox(height: 45),

            // 🖼 Gallery
            Text(
              'Maintenance in Action',
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E3A8A),
              ),
            ),
            const SizedBox(height: 25),

            Wrap(
              spacing: 18,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: galleryData.map((item) {
                return GestureDetector(
                  onTap: () => _showBottomSheet(context, item),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 360,
                      height: 220,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Image.network(item['image']!, fit: BoxFit.cover),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 55),

            // 💬 Contact Button
            ElevatedButton.icon(
              onPressed: () {
                _openWhatsApp(
                  'Hello Noor Diesel Team, I want to know more about your maintenance services.',
                );
              },
              icon: const Icon(Icons.chat, color: Colors.white),
              label: Text(
                'Contact for Service',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF16A34A),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 📱 Bottom Sheet for generator details
  void _showBottomSheet(BuildContext context, Map<String, String> item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  item['image']!,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                item['title']!,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1E3A8A),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item['description']!,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 15.5,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _openWhatsApp(
                        'Hello Noor Diesel Team, I want to BUY the ${item['title']}. Please provide details.',
                      );
                    },
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    label: const Text(
                      'Buy on WhatsApp',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _openWhatsApp(
                        'Hello Noor Diesel Team, I want to RENT the ${item['title']}. Please provide details.',
                      );
                    },
                    icon: const Icon(Icons.repeat, color: Colors.white),
                    label: const Text(
                      'Rent on WhatsApp',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF16A34A),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  // 🧩 Reusable feature widget
  Widget _serviceFeature(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 150,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFEFF3FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF1E3A8A), size: 38),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 15.5,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // 📞 WhatsApp contact launcher
  Future<void> _openWhatsApp(String message) async {
    const phone = '+923335132538'; // Noor Diesel number
    final url = Uri.parse(
      'https://wa.me/$phone?text=${Uri.encodeComponent(message)}',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
