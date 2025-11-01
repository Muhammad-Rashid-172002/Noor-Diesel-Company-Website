import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        "title": "Installation - Blue Area, Islamabad",
        "type": "Installation",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxUpJ7ZROKtfjp7JPeqv33_OBakRCMvRGIaA&s",
        "description":
            "We installed a high-capacity generator setup in Blue Area, Islamabad, ensuring uninterrupted power supply for commercial offices. Our expert team managed the entire process from delivery to testing.",
      },
      {
        "title": "Rental - Event Hall, Lahore",
        "type": "Rental",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEdI2qWZ02e-qNUawVzpAcF5ZjWunfLN0WbQ&s",
        "description":
            "Provided premium diesel generators for a large-scale corporate event in Lahore, ensuring smooth operation throughout the event with full technical support.",
      },
      {
        "title": "Sales - Office Setup, Karachi",
        "type": "Sales",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLG05yUBevDAuonLFEKwUEIX47KGwo1O336g&s",
        "description":
            "Delivered and installed brand-new diesel generators for a top-tier office setup in Karachi, focusing on efficiency, reliability, and long-term performance.",
      },
    ];

    return Container(
      width: double.infinity,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Our Projects',
            style: GoogleFonts.montserrat(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
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
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 800;
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: isWide ? 30 : 16,
                runSpacing: 24,
                children: projects
                    .map(
                      (project) => _DarkProjectCard(
                        title: project['title']!,
                        type: project['type']!,
                        imageUrl: project['image']!,
                        description: project['description']!,
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

class _DarkProjectCard extends StatefulWidget {
  final String title;
  final String type;
  final String imageUrl;
  final String description;

  const _DarkProjectCard({
    required this.title,
    required this.type,
    required this.imageUrl,
    required this.description,
  });

  @override
  State<_DarkProjectCard> createState() => _DarkProjectCardState();
}

class _DarkProjectCardState extends State<_DarkProjectCard> {
  bool _isHovered = false;

  void _showDetailsDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFF1E293B),
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: 520,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFF0F172A),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.network(
                  widget.imageUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.type.toUpperCase(),
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFF38BDF8),
                        fontSize: 14,
                        letterSpacing: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.description,
                      style: GoogleFonts.openSans(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF38BDF8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Close"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 340,
        height: 320,
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? const Color(0xFF38BDF8).withOpacity(0.35)
                  : Colors.black54,
              blurRadius: _isHovered ? 25 : 12,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(
            color: _isHovered
                ? const Color(0xFF38BDF8).withOpacity(0.4)
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.04))
            : Matrix4.identity(),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: _isHovered ? 0.9 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Image.network(widget.imageUrl, fit: BoxFit.cover),
              ),
            ),
            if (_isHovered)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: Colors.black.withOpacity(0.45),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black87, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.type.toUpperCase(),
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFF38BDF8),
                        fontSize: 14,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedOpacity(
                      opacity: _isHovered ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: ElevatedButton(
                        onPressed: _showDetailsDialog,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFACC15),
                          foregroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('View Details'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
