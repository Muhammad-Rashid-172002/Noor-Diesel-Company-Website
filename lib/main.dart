import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uncle_website/screens/new_cards/GeneratorSalesPage.dart';
import 'package:uncle_website/screens/new_cards/installation_page.dart';
import 'package:uncle_website/screens/new_cards/maintenance_page.dart';
import 'package:uncle_website/screens/new_cards/rental_page.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      color: const Color(0xFF1E3A8A), // deep professional blue
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🔹 Left side: Logo + Company Name
          Row(
            children: [
              // Company logo
              Image.asset('assets/noor_logo.png', height: 55),
              const SizedBox(width: 15),
              const Text(
                'Noor Diesel Engineering Company Pakistan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),

          // 🔹 Right side: Tagline
          const Text(
            'Reliable Power Solutions ⚡',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8,
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
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        children: [
          Text(
            'Our Services',
            style: GoogleFonts.montserrat(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E3A8A),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFF59E0B),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 50),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 30,
            runSpacing: 30,
            children: [
              ServiceCard(
                title: 'Generator Sales',
                icon: Icons.bolt,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GeneratorSalesPage(),
                    ),
                  );
                },
              ),
              ServiceCard(
                title: 'Installation',
                icon: Icons.build,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InstallationPage(),
                    ),
                  );
                },
              ),
              ServiceCard(
                title: 'Repair & Maintenance',
                icon: Icons.settings,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MaintenancePage(),
                    ),
                  );
                },
              ),
              ServiceCard(
                title: 'Rental Services',
                icon: Icons.local_shipping,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RentalPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 260,
          height: 220,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: _isHovering ? const Color(0xFF1E3A8A) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _isHovering ? Colors.black26 : Colors.black12,
                blurRadius: _isHovering ? 12 : 6,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 50,
                color: _isHovering
                    ? const Color(0xFFF59E0B)
                    : const Color(0xFF1E3A8A),
              ),
              const SizedBox(height: 20),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: _isHovering ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- CONTACT ----------------

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;

    return Container(
      width: double.infinity,
      color: Colors.blue.shade50,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contact Us',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 30),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 40,
            runSpacing: 20,
            children: [
              _ContactItem(
                icon: Icons.location_on,
                title: 'Address',
                detail: 'Blue Area, Islamabad',
              ),
              _ContactItem(
                icon: Icons.phone,
                title: 'Phone',
                detail: '+92 333 5132538',
              ),
              _ContactItem(
                icon: Icons.email,
                title: 'Email',
                detail: 'noordiesel@gmail.com',
              ),
              _ContactItem(
                icon: Icons.access_time,
                title: 'Working Hours',
                detail: 'Mon - Sat, 9:00 AM - 6:00 PM',
              ),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () {
              // Add link to contact page or email
            },
            icon: const Icon(Icons.send),
            label: const Text('Get in Touch'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String detail;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue.shade700, size: 30),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 4),
        Text(
          detail,
          style: TextStyle(color: Colors.grey.shade700),
        ),
      ],
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
          '©️ 2025 Noor Diesel Engineering Company Pakistan | All Rights Reserved',
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ),
    );
  }
}
