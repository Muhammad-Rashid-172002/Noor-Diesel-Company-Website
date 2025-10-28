import 'package:flutter/material.dart';

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
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
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
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1603791440384-56cd371ee9a7', // Replace with generator image
          ),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
        color: Colors.black87,
      ),
      child: Column(
        children: const [
          Text(
            'Powering Your World with Reliable Generators',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Sales • Installation • Maintenance • Rentals',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- ABOUT ----------------
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: const [
          Text(
            'About Us',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'We specialize in high-quality electric generators for homes, offices, and industries. '
            'With years of experience, we provide installation, maintenance, and 24/7 support for all generator types.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, height: 1.5),
          ),
        ],
      ),
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
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2))
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