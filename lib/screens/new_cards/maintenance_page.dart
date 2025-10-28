import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: Text(
          'Repair & Maintenance',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu-pPcjoDF9lBxyNyYOrZY37zQvMXJ1zwI9Q&s',
                height: 280,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Reliable Generator Maintenance & Repairs',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E3A8A),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Keep your generator performing at its best with Noor Diesel’s expert maintenance and repair services. '
              'Our certified technicians handle everything — from oil and filter changes to diagnostics and component repairs — '
              'ensuring your generator remains efficient, safe, and ready whenever you need it.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 17,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 35),

            // Service Highlights
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 25,
              runSpacing: 25,
              children: [
                _serviceFeature(Icons.settings, "Full Diagnostics"),
                _serviceFeature(Icons.oil_barrel, "Oil & Filter Changes"),
                _serviceFeature(Icons.bolt, "Electrical System Check"),
                _serviceFeature(Icons.handyman, "Component Repairs"),
              ],
            ),

            const SizedBox(height: 40),

            // Contact Button
            ElevatedButton.icon(
              onPressed: () {
                // WhatsApp or contact logic can be added here
              },
              icon: Icon(Icons.chat, color: Colors.white),
              label: Text(
                'Contact for Service',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF16A34A),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _serviceFeature(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF1E3A8A), size: 36),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
