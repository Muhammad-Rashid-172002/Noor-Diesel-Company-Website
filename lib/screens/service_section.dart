import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // for google fonts 
import 'package:uncle_website/screens/new_cards/GeneratorSalesPage.dart';// for genrator 
import 'package:uncle_website/screens/new_cards/batteries_page.dart';// for batteries
import 'package:uncle_website/screens/new_cards/installation_page.dart';// for installation
import 'package:uncle_website/screens/new_cards/parts_page.dart';// for parts
import 'package:uncle_website/screens/new_cards/rental_page.dart';// for rental

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
          colors: [
            Color(0xFF0B1120), // deep navy
            Color(0xFF1E293B), // slate blue
            Color(0xFF0F172A), // near black
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🏷️ Section Title
          Text(
            'Our Products',
            style: GoogleFonts.montserrat(
              fontSize: 42,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.blueAccent.withOpacity(0.5),
                  blurRadius: 12,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 🌈 Title Underline
          Container(
            width: 120,
            height: 4,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFACC15), Color(0xFF38BDF8)],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 50),

          // 🧱 Product Cards
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 700;
              final isTablet = constraints.maxWidth < 1100;

              double cardWidth;
              if (isMobile) {
                cardWidth = constraints.maxWidth / 1.1;
              } else if (isTablet) {
                cardWidth = constraints.maxWidth / 2.2;
              } else {
                cardWidth = constraints.maxWidth / 3.4;
              }
              // 🧩 Responsive Wrap of ProductCards
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 25,
                runSpacing: 25,
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
                            height: cardWidth * 0.85,
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

// 💎 PRODUCT CARD WIDGET
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
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hover ? -8 : 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _hover
                  ? const Color(0xFF00B4DB).withOpacity(0.6)
                  : Colors.white10,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _hover
                    ? const Color(0xFF00B4DB).withOpacity(0.6)
                    : Colors.black.withOpacity(0.3),
                blurRadius: _hover ? 25 : 10,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // 🖼 Image
                AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: _hover ? 1.05 : 1.0,
                  child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                ),

                // 🌈 Overlay
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _hover ? 0.6 : 0.25,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),

                // 📝 Bottom Label
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    color: Colors.black.withOpacity(0.55),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
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
