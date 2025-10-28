import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const GeneratorBusinessApp());
}

class GeneratorBusinessApp extends StatelessWidget {
  const GeneratorBusinessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noor Diesel Generators',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            HeaderSection(),
            HeroSection(),
            AboutSection(),
            ServicesSection(),
            ContactSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

// ---------------- HEADER ----------------
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 60),
      color: Colors.blueAccent,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Noor diesel Electric Generators',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Reliable Power Solutions',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

// ---------------- HERO ----------------

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu-pPcjoDF9lBxyNyYOrZY37zQvMXJ1zwI9Q&s', // Generator image
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
                  'NOOR DIESEL COMPANY',
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
                    backgroundColor: const Color(0xFFF59E0B), // Amber
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Add navigation to contact page
                  },
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

// ---------------- ABOUT ----------------

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About Noor Diesel',
            style: GoogleFonts.montserrat(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E3A8A), // Navy blue
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFF59E0B), // Amber line
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 800
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu-pPcjoDF9lBxyNyYOrZY37zQvMXJ1zwI9Q&s',
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(flex: 1, child: _aboutText()),
                      ],
                    )
                  : Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu-pPcjoDF9lBxyNyYOrZY37zQvMXJ1zwI9Q&s',
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 30),
                        _aboutText(),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget _aboutText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivering Trusted Power Solutions Since 2010',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Noor Diesel is a leading provider of premium diesel generators and energy solutions. '
          'With over a decade of experience, we specialize in the sales, installation, and maintenance of reliable power systems for homes, businesses, and industries. '
          'Our mission is to keep your world running with efficiency, reliability, and exceptional service.',
          textAlign: TextAlign.justify,
          style: GoogleFonts.poppins(
            fontSize: 18,
            height: 1.7,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '💡 We believe in powering progress through quality, innovation, and customer satisfaction.',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}

// ---------------- SERVICES ----------------
class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Text(
            'Our Services',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: const [
              ServiceCard(title: 'Generator Sales', icon: Icons.bolt),
              ServiceCard(title: 'Installation', icon: Icons.build),
              ServiceCard(title: 'Repair & Maintenance', icon: Icons.settings),
              ServiceCard(title: 'Rental Services', icon: Icons.local_shipping),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ServiceCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blueAccent),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// ---------------- CONTACT ----------------
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      padding: const EdgeInsets.all(50),
      child: Column(
        children: const [
          Text(
            'Contact Us',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text('📍 Address: blue Area, Islambad'),
          Text('📞 Phone: +92 333 5132538'),
          Text('✉️ Email: noordiesel@gmail.com'),
          SizedBox(height: 10),
          Text('Working Hours: Mon - Sat, 9:00 AM - 6:00 PM'),
        ],
      ),
    );
  }
}

// ---------------- FOOTER ----------------
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(20),
      child: const Center(
        child: Text(
          '©️ 2025 Noor Diesel Electric Generators | All Rights Reserved',
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ),
    );
  }
}
