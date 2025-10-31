import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uncle_website/screens/new_cards/GeneratorSalesPage.dart';
import 'package:uncle_website/screens/new_cards/batteries_page.dart';
import 'package:uncle_website/screens/new_cards/installation_page.dart';
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8FAFC), Color(0xFFE0F2FE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
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
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRezfvYxmRrPSi0O-uOnztnNuyC870ougkRnQ&s',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const GeneratorSalesPage(),
                              ),
                            ),
                          ),
                          ProductCard(
                            title: 'Generator Installation',
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfwaux7JtTkmpAEhgn8OdyTap9eWvmvGKJXA&s',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InstallationPage(),
                              ),
                            ),
                          ),
                          ProductCard(
                            title: 'Generator Rentals',
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGxN9h3oe206o2hVZoHi1XtsSja8hD46ag1g&s',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RentalPage(),
                              ),
                            ),
                          ),
                          ProductCard(
                            title: 'Spare Parts',
                            imageUrl:
                                'https://scontent.fpew1-1.fna.fbcdn.net/v/t39.30808-6/485144816_1053323096836276_5407812930324111287_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=127cfc&_nc_ohc=NW7G4bRn5GAQ7kNvwEH9JbW&_nc_oc=AdmSEEBG5O4bwDreRJXMB2MuESE_DHxE5uITeyLNNrQll5eyJa0225WPUXQ3IRCZIsY&_nc_zt=23&_nc_ht=scontent.fpew1-1.fna&_nc_gid=aIc7K-IFgR0jJDHsz8zPLw&oh=00_AffqQQah_fXwvYYlVtarmbNzBCKcwhxt4FI9pWYYNsZOTQ&oe=690A27B2',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PartsPage(),
                              ),
                            ),
                          ),
                          ProductCard(
                            title: 'Batteries',
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPyo_din2WnuIBygIKeqX2yeflPSI5OyLOpg&s',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BatteriesPage(),
                              ),
                            ),
                          ),
                        ]
                        .map(
                          (card) => SizedBox(
                            width: cardWidth,
                            height: cardWidth * 0.85, // nice visual ratio
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
  final String imageUrl;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.title,
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
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_hover ? 0.25 : 0.1),
                blurRadius: _hover ? 22 : 10,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // 🖼 Background Image
                AnimatedScale(
                  duration: const Duration(milliseconds: 350),
                  scale: _hover ? 1.05 : 1.0,
                  curve: Curves.easeInOut,
                  child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                ),

                // 🌈 Light gradient overlay (whole card)
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 350),
                  opacity: _hover ? 0.5 : 0.0, // 👈 semi-transparent
                  curve: Curves.easeInOut,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFF59E0B), // amber
                          Color(0xFFEF4444), // red
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),

                // 📝 Bottom text area
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.black.withOpacity(0.45),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
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
