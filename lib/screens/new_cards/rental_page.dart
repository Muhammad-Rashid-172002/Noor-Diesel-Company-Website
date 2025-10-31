import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class RentalPage extends StatelessWidget {
  const RentalPage({super.key});

  Future<void> _openWhatsApp() async {
    const phone = '+923335132538';
    final url = Uri.parse(
      'https://wa.me/$phone?text=Hi, I’m interested in your generator rental services.',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not open WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    final generatorList = [
      {
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlEhQchD6GPn2GvYG5KwqLhqokdbkdpPAriA&s',
        'title': '30 KVA Silent Diesel Generator',
        'desc':
            'Perfect for weddings, corporate events, and construction sites. Provides consistent power with low noise and fuel efficiency.',
        'extra': [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuAwch2Fs1dEERn6zZnWNoC0x2QO6FYYsaeA&s',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLLfTKbYagHCP72rq7awksGw8aQpmHF1nHJg&s',
        ],
      },
      {
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV5QFi2GdwY4if6XVNlgp37z9IE_ChgDrcBw&s',
        'title': '125 KVA Industrial Generator',
        'desc':
            'Heavy-duty generator suitable for factories and large-scale sites. Ensures uninterrupted energy for demanding operations.',
        'extra': [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOOZvRp5G7mZ1ineelfrrh9ftj6FjQlhZZbQ&s',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDTKBDlUiRNHIA_PDFHN29qNmsD93WG2RFNQ&s',
        ],
      },
      {
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZudgbX05rRkXM6vk77mFDjAvnsipWvabcxA&s',
        'title': '15 KVA Portable Generator',
        'desc':
            'Compact, efficient, and perfect for small-scale events or home backup. Easy setup and fuel-efficient design.',
        'extra': [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzzH0Ho4Id2axMiJInci9yTSQCF1GNgmyysg&s',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWLLt6J_vHcORA9rQ5vKhHKEq9yB7kRb2_CA&s',
        ],
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          'Generator Rental Services',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 8,
        shadowColor: Colors.blueAccent.withOpacity(0.3),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 Hero Banner
            Stack(
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyWXVz6NTajdIaJzTpdeohF2NEyLQ6CzM8Dg&s',
                  width: double.infinity,
                  height: 540,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 340,
                  color: Colors.black.withOpacity(0.45),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Power When You Need It",
                          style: GoogleFonts.montserrat(
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Reliable Diesel Generator Rentals by Noor Diesel",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // 🔹 Section Intro
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Affordable & Flexible Generator Rentals',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1E3A8A),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Need temporary power? Noor Diesel provides reliable rental generators for events, sites, and emergency use. We deliver, install, and support — so you can focus on what matters.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      height: 1.7,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 45),

            // 🔹 Rental Feature Cards
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 25,
              runSpacing: 25,
              children: [
                _rentalFeature(Icons.event_available, "Event Power Supply"),
                _rentalFeature(Icons.construction, "Construction Support"),
                _rentalFeature(Icons.home, "Home Backup Generators"),
                _rentalFeature(Icons.factory, "Industrial-Grade Units"),
              ],
            ),

            const SizedBox(height: 60),

            // 🔹 Generator List Section
            Container(
              width: double.infinity,
              color: const Color(0xFFF1F5F9),
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "Available Generators",
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1E3A8A),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 25,
                    runSpacing: 30,
                    alignment: WrapAlignment.center,
                    children: generatorList.map((data) {
                      return InkWell(
                        onTap: () => _showGeneratorDetails(context, data),
                        hoverColor: Colors.transparent,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: 240,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.08),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(18),
                                ),
                                child: Image.network(
                                  data['image'] as String,
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14),
                                child: Text(
                                  data['title'] as String,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF1E3A8A),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),

            // 🔹 CTA Button
            ElevatedButton.icon(
              onPressed: _openWhatsApp,
              icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
              label: Text(
                'Contact for Rental',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF16A34A),
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                shadowColor: Colors.green.withOpacity(0.4),
                elevation: 6,
              ),
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _rentalFeature(IconData icon, String title) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(22),
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1E3A8A).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(14),
            child: Icon(icon, color: const Color(0xFF1E3A8A), size: 32),
          ),
          const SizedBox(height: 14),
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

  void _showGeneratorDetails(BuildContext context, Map<String, dynamic> data) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    data['image'] as String,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  data['title'] as String,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1E3A8A),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  data['desc'] as String,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    height: 1.7,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 25),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: (data['extra'] as List<String>).map((img) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        img,
                        width: 140,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () async {
                    const phone = '+923335132538';
                    final url = Uri.parse(
                      'https://wa.me/$phone?text=Hi, I’d like details about this generator.',
                    );
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                  icon: const Icon(Icons.message, color: Colors.white),
                  label: Text(
                    'Contact on WhatsApp',
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF16A34A),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 5,
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        );
      },
    );
  }
}
