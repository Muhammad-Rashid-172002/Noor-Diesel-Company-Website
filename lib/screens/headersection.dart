import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSection extends StatelessWidget {
  final Function(String section)? onNavItemTap;

  const HeaderSection({super.key, this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      color: const Color(0xFF1E3A8A),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🔹 Logo + Title
          Row(
            children: [
              Image.asset('assets/noor_logo-removebg-preview.png', height: 55),
              const SizedBox(width: 15),
              const Text(
                'Noor Diesel Engineering Company Pakistan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),

          // 🔹 Navigation Menu
          Row(
            children: [
              _navItem('Home', 'home'),
              _navItem('About', 'about'),
              _navItem('Services', 'services'),
              _navItem('Projects', 'projects'),
              _navItem('Contact', 'contact'),
              const SizedBox(width: 25),
              const Text(
                'Reliable Power Solutions ⚡',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🌐 Nav Item Widget
  Widget _navItem(String label, String section) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onNavItemTap?.call(section),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
