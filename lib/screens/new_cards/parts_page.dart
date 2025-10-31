import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PartsPage extends StatelessWidget {
  const PartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Header section
            Container(
              width: double.infinity,
              color: const Color(0xFF0A3D62),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Noor Diesel Engineering Company",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Get Quick Support: +92 333 35132538",
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Main section: Image + Content
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Side: Text
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "GENERATOR SPARE PARTS",
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF0A3D62),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "At Noor Diesel Engineering Company, we specialize in providing high-quality generator spare parts "
                          "and components for all leading brands. From filters and injectors to alternators and control panels, "
                          "our products ensure maximum reliability and long-lasting performance.",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.7,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "OUR RANGE INCLUDES:",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "• Diesel Engine Filters (Air, Fuel, Oil)\n"
                          "• Fuel Injectors & Pumps\n"
                          "• Alternators and AVR Units\n"
                          "• Piston Rings, Gaskets, Valves\n"
                          "• Control Modules and Sensors\n"
                          "• Radiators and Cooling Fans\n"
                          "• Starter Motors and Batteries",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black87,
                            height: 1.7,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "WHY CHOOSE US?",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "• Genuine and reliable spare parts\n"
                          "• Competitive prices and ready stock\n"
                          "• Technical assistance for part selection\n"
                          "• Nationwide delivery and installation support",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black87,
                            height: 1.7,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "CONTACT OUR SPARE PARTS TEAM",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "📞 +92 333 35132538\n"
                          "✉️ noordiesel@gmail.com.pk\n"
                          "🏢 Noor Diesel Engineering Company, Islambad, Pakistan",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.black87,
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 60),

                  // Right Side: Image
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "https://scontent.fpew1-1.fna.fbcdn.net/v/t39.30808-6/485144816_1053323096836276_5407812930324111287_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=127cfc&_nc_ohc=NW7G4bRn5GAQ7kNvwEH9JbW&_nc_oc=AdmSEEBG5O4bwDreRJXMB2MuESE_DHxE5uITeyLNNrQll5eyJa0225WPUXQ3IRCZIsY&_nc_zt=23&_nc_ht=scontent.fpew1-1.fna&_nc_gid=aIc7K-IFgR0jJDHsz8zPLw&oh=00_AffqQQah_fXwvYYlVtarmbNzBCKcwhxt4FI9pWYYNsZOTQ&oe=690A27B2",
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Footer
            Container(
              width: double.infinity,
              color: Colors.grey[900],
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Text(
                  "© 2025 Noor Diesel Engineering Company. All Rights Reserved.",
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
