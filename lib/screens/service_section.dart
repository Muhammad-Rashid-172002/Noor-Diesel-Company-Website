import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uncle_website/screens/new_cards/GeneratorSalesPage.dart';
import 'package:uncle_website/screens/new_cards/installation_page.dart';
import 'package:uncle_website/screens/new_cards/maintenance_page.dart';
import 'package:uncle_website/screens/new_cards/rental_page.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          Text(
            'Our Services',
            style: GoogleFonts.montserrat(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E3A8A),
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFF59E0B), Color(0xFFEF4444)],
              ),
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
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GeneratorSalesPage(),
                  ),
                ),
              ),
              ServiceCard(
                title: 'Installation',
                icon: Icons.build,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InstallationPage(),
                  ),
                ),
              ),
              ServiceCard(
                title: 'Repair & Maintenance',
                icon: Icons.settings,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MaintenancePage(),
                  ),
                ),
              ),
              ServiceCard(
                title: 'Rental Services',
                icon: Icons.local_shipping,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RentalPage()),
                ),
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
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          width: 260,
          height: 220,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: _isHovering
                ? const LinearGradient(
                    colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: _isHovering ? null : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: _isHovering ? 20 : 8,
                offset: Offset(0, _isHovering ? 10 : 6),
              ),
            ],
          ),
          transform: _isHovering
              ? (Matrix4.identity()..scale(1.05))
              : Matrix4.identity(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 50,
                color: _isHovering
                    ? Colors.amberAccent
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
