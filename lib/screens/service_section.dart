import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uncle_website/screens/new_cards/CablesPage.dart';
import 'package:uncle_website/screens/new_cards/GeneratorSalesPage.dart';
import 'package:uncle_website/screens/new_cards/batteries_page.dart';
import 'package:uncle_website/screens/new_cards/installation_page.dart';
import 'package:uncle_website/screens/new_cards/maintenance_page.dart';
import 'package:uncle_website/screens/new_cards/parts_page.dart';
import 'package:uncle_website/screens/new_cards/rental_page.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Our Products',
            style: GoogleFonts.montserrat(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E3A8A),
              letterSpacing: 1.1,
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
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 700;
              final isTablet = constraints.maxWidth < 1100;

              double cardWidth;
              if (isMobile) {
                cardWidth = constraints.maxWidth / 1.2;
              } else if (isTablet) {
                cardWidth = constraints.maxWidth / 2.3;
              } else {
                cardWidth = constraints.maxWidth / 3.5;
              }

              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children:
                    [
                          ProductCard(
                            title: 'Generator Sales',
                            description:
                                'High-quality diesel & petrol generators for industrial and home use.',
                            imageUrl:
                                'https://images.unsplash.com/photo-1581091870627-3a07c8a5b8a0?w=600',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const GeneratorSalesPage(),
                              ),
                            ),
                          ),
                          ProductCard(
                            title: 'Generator Installation Kits',
                            description:
                                'Complete installation kits and professional setup for new generators.',
                            imageUrl:
                                'https://images.unsplash.com/photo-1581091870630-bc4a85a62f87?w=600',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InstallationPage(),
                              ),
                            ),
                          ),
                          ProductCard(
                            title: 'Repair & Maintenance Tools',
                            description:
                                'All essential tools and accessories for generator servicing.',
                            imageUrl:
                                'https://images.unsplash.com/photo-1581091012184-7a26b89f1b49?w=600',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MaintenancePage(),
                              ),
                            ),
                          ),
                          ProductCard(
                            title: 'Generator Rentals',
                            description:
                                'Affordable rental generators for events, industries & emergencies.',
                            imageUrl:
                                'https://images.unsplash.com/photo-1509395176047-4a66953fd231?w=600',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RentalPage(),
                              ),
                            ),
                          ),
                          ProductCard(
                            title: 'Spare Parts',
                            description:
                                'Wide range of genuine generator parts and accessories available.',
                            imageUrl:
                                'https://images.unsplash.com/photo-1602526216432-5f7e7d9c3d11?w=600',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PartsPage(),
                              ),
                            ),
                          ),
                          ProductCard(
                            title: 'Batteries',
                            description:
                                'Reliable batteries for standby power and generator startups.',
                            imageUrl:
                                'https://images.unsplash.com/photo-1618661098250-4c8b5cdd7301?w=600',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BatteriesPage(),
                              ),
                            ),
                          ),
                          ProductCard(
                            title: 'Cables & Connectors',
                            description:
                                'Durable electrical cables and connectors for safe installation.',
                            imageUrl:
                                'https://images.unsplash.com/photo-1616627988556-f69c4b4e6b19?w=600',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Cablespage(),
                              ),
                            ),
                          ),
                        ]
                        .map(
                          (card) => SizedBox(
                            width: cardWidth,
                            height: cardWidth, // make it square
                            child: card,
                          ),
                        )
                        .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: _hover ? 20 : 8,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 250),
            scale: _hover ? 0.97 : 1.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(widget.imageUrl, fit: BoxFit.cover),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    color: _hover
                        ? Colors.lightBlueAccent.withOpacity(0.4)
                        : Colors.black.withOpacity(0.4),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.description,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
