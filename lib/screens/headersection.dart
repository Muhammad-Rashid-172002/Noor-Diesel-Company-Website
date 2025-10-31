import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSection extends StatefulWidget {
  final Function(String section)? onNavItemTap;

  const HeaderSection({super.key, this.onNavItemTap});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800;

    return Container(
      width: double.infinity,
      color: const Color(0xFF1E3A8A),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🔹 Top Section (Logo + Title + Nav/Menu)
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 🔹 Logo + Title (Responsive)
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/noor_logo-removebg-preview.png',
                          height: 45,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            'Noor Diesel Engineering Company Pakistan',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: isMobile ? 14 : 20,
                              fontWeight: FontWeight.bold,
                              // fontFamilyFallback: const ['NotoSans', 'Arial'],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 🔹 Desktop Navigation
                  if (!isMobile)
                    Wrap(
                      alignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        _navItem('Home', 'home'),
                        _navItem('About', 'about'),
                        _navItem('Services', 'services'),
                        _navItem('Projects', 'projects'),
                        _navItem('Contact', 'contact'),
                        const Text(
                          'Reliable Power Solutions ⚡',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamilyFallback: ['NotoSans', 'Arial'],
                          ),
                        ),
                      ],
                    ),

                  // 🔹 Mobile Menu Button
                  if (isMobile)
                    IconButton(
                      icon: Icon(
                        _isMenuOpen ? Icons.close : Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () =>
                          setState(() => _isMenuOpen = !_isMenuOpen),
                    ),
                ],
              );
            },
          ),

          // 🔹 Mobile Dropdown Menu
          if (isMobile && _isMenuOpen)
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _navItem('Home', 'home'),
                  _navItem('About', 'about'),
                  _navItem('Services', 'services'),
                  _navItem('Projects', 'projects'),
                  _navItem('Contact', 'contact'),
                  const SizedBox(height: 8),
                  const Text(
                    'Reliable Power Solutions ⚡',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamilyFallback: ['NotoSans', 'Arial'],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _navItem(String label, String section) {
    return GestureDetector(
      onTap: () {
        widget.onNavItemTap?.call(section);
        setState(() => _isMenuOpen = false);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            // fontFamilyFallback: const ['NotoSans', 'Arial'],
          ),
        ),
      ),
    );
  }
}
