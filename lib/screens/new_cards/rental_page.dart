import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

class RentalPage extends StatelessWidget {
  const RentalPage({super.key});

  // 🔹 WhatsApp
  Future<void> _openWhatsApp() async {
    const phone = '+923335132538';
    final url = Uri.parse(
      'https://wa.me/$phone?text=Hi, I’m interested in your generator rental services.',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not open WhatsApp');
    }
  }

  // 🔹 Email
  Future<void> _openEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'noordieselengineering@gmail.com',
      query:
          'subject=Generator Rental Inquiry&body=Hi, I’d like to know more about your rental services.',
    );
    if (!await launchUrl(emailUri)) {
      throw Exception('Could not open Email');
    }
  }

  // 🔹 Phone Call
  Future<void> _openCall() async {
    final Uri callUri = Uri(scheme: 'tel', path: '+923335132538');
    if (!await launchUrl(callUri)) {
      throw Exception('Could not start Call');
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A0F24), Color(0xFF1A2238)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Header
              FadeInDown(
                duration: const Duration(milliseconds: 700),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    'Generator Rental Services',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      color: Colors.lightBlueAccent,
                      fontSize: 28,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),

              // 🔹 Hero Banner
              Stack(
                children: [
                  ClipRRect(
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyWXVz6NTajdIaJzTpdeohF2NEyLQ6CzM8Dg&s',
                      width: double.infinity,
                      height: 480,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 480,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.3),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeInDown(
                            duration: const Duration(milliseconds: 800),
                            child: Text(
                              "Power When You Need It",
                              style: GoogleFonts.montserrat(
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                color: Colors.lightBlueAccent,
                                letterSpacing: 1.3,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          FadeInUp(
                            duration: const Duration(milliseconds: 900),
                            child: Text(
                              "Reliable Diesel Generator Rentals by Noor Diesel",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // 🔹 Intro
              FadeInUp(
                duration: const Duration(milliseconds: 900),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        'Affordable & Flexible Generator Rentals',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'Need temporary power? Noor Diesel provides reliable rental generators for events, sites, and emergency use. '
                        'We deliver, install, and support — so you can focus on what matters most.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          height: 1.7,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // 🔹 Generator Cards
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 25,
                runSpacing: 25,
                children: generatorList.map((data) {
                  return ZoomIn(
                    duration: const Duration(milliseconds: 600),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.lightBlueAccent.withOpacity(0.3),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 12,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () => _showGeneratorDetails(context, data),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(18),
                                ),
                                child: Image.network(
                                  data['image'] as String,
                                  height: 160,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  data['title'] as String,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.lightBlueAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 70),

              // 🔹 Contact Buttons
              FadeInUp(
                duration: const Duration(milliseconds: 900),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  children: [
                    _contactButton(
                      Icons.call,
                      "Call Us",
                      _openCall,
                      Colors.blue,
                    ),
                    _contactButton(
                      Icons.email_outlined,
                      "Email",
                      _openEmail,
                      Colors.orangeAccent,
                    ),
                    _contactButton(
                      FontAwesomeIcons.whatsapp, // correct IconData
                      "WhatsApp",
                      _openWhatsApp,
                      Colors.green,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 80),
              FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  "© 2025 Noor Diesel Engineering | All Rights Reserved",
                  style: GoogleFonts.poppins(
                    color: Colors.white54,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Contact Button Helper
  Widget _contactButton(
    IconData icon,
    String title,
    VoidCallback onTap,
    Color color,
  ) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 6,
      ),
    );
  }

  // 🔹 Generator Details Bottom Sheet
  void _showGeneratorDetails(BuildContext context, Map<String, dynamic> data) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0A0F24),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      builder: (context) {
        return FadeInUp(
          duration: const Duration(milliseconds: 400),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white24,
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
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    data['desc'] as String,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      height: 1.7,
                      color: Colors.white70,
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
                  const SizedBox(height: 25),
                  Wrap(
                    spacing: 12,
                    children: [
                      _contactButton(
                        Icons.call,
                        "Call",
                        _openCall,
                        Colors.blue,
                      ),
                      _contactButton(
                        Icons.email_outlined,
                        "Email",
                        _openEmail,
                        Colors.orangeAccent,
                      ),
                      _contactButton(
                        FontAwesomeIcons.whatsapp, // correct IconData
                        "WhatsApp",
                        _openWhatsApp,
                        Colors.green,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
