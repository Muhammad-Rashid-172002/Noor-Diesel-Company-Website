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
      },
      {
        "title": "Rental - Event Hall, Lahore",
        "type": "Rental",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEdI2qWZ02e-qNUawVzpAcF5ZjWunfLN0WbQ&s",
      },
      {
        "title": "Sales - Office Setup, Karachi",
        "type": "Sales",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLG05yUBevDAuonLFEKwUEIX47KGwo1O336g&s",
      },
    ];

    return Container(
      color: Colors.grey.shade50,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          Text(
            'Our Projects',
            style: GoogleFonts.montserrat(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: const Color(0xFF1E3A8A),
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
          const SizedBox(height: 40),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 24,
            children: projects
                .map(
                  (project) => _ProjectCard(
                    title: project['title']!,
                    type: project['type']!,
                    imageUrl: project['image']!,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String type;
  final String imageUrl;

  const _ProjectCard({
    required this.title,
    required this.type,
    required this.imageUrl,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 320,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: _isHovered ? 20 : 6,
              offset: _isHovered ? const Offset(0, 10) : const Offset(2, 2),
            ),
          ],
          border: Border.all(
            color: _isHovered
                ? Colors.blueAccent.withOpacity(0.5)
                : Colors.transparent,
            width: 2,
          ),
        ),
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.05))
            : Matrix4.identity(),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.imageUrl,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.type,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
