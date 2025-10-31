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
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Our Projects',
            style: GoogleFonts.montserrat(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 90,
            height: 4,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2563EB), Color(0xFF60A5FA)],
              ),
              borderRadius: BorderRadius.circular(4),
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
                      (project) => _ModernProjectCard(
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

class _ModernProjectCard extends StatefulWidget {
  final String title;
  final String type;
  final String imageUrl;
  final String description;

  const _ModernProjectCard({
    required this.title,
    required this.type,
    required this.imageUrl,
    required this.description,
  });

  @override
  State<_ModernProjectCard> createState() => _ModernProjectCardState();
}

class _ModernProjectCardState extends State<_ModernProjectCard> {
  bool _isHovered = false;

  void _showDetailsDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
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
                        color: Colors.blueAccent,
                        fontSize: 14,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.description,
                      style: GoogleFonts.openSans(
                        color: Colors.grey.shade700,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
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
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? Colors.blueAccent.withOpacity(0.25)
                  : Colors.black12,
              blurRadius: _isHovered ? 25 : 8,
              offset: const Offset(0, 8),
            ),
          ],
          border: Border.all(
            color: _isHovered
                ? Colors.blueAccent.withOpacity(0.3)
                : Colors.transparent,
            width: 2,
          ),
        ),
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.05))
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
                color: Colors.black.withOpacity(0.4),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
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
                        color: Colors.white70,
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
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
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
