import 'package:flutter/material.dart';// Flutter Material Package
import 'package:font_awesome_flutter/font_awesome_flutter.dart';// For FontAwesome icons
import 'package:url_launcher/url_launcher.dart';// For launching URLs

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});
// 🟢 Contact Info
  final String phoneNumber = '+923335132538';
  final String email = 'noordiesel@gmail.com';
  final String whatsappNumber = '+923335132538';
  final String address = 'Blue Area, Islamabad';

// 🟢 Phone Contact Function
  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) await launchUrl(phoneUri);
  }
// 🟢 Email Contact Function
  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull(
        'subject=Inquiry&body=Hello Noor Diesel Engineering Company,\nI am interested in your products/services and would like more information.\n\nThank you.',
      ),
    );
    if (await canLaunchUrl(emailUri)) await launchUrl(emailUri);
  }
// 🟢 WhatsApp Contact Function
  Future<void> _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse(
      'https://wa.me/$whatsappNumber?text=Hello%20Noor%20Diesel%20Engineering%20Company,%0AI%20am%20interested%20in%20your%20products%20and%20would%20like%20more%20information.%0AThank%20you.',
    );
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0B132B), Color(0xFF1C2541), Color(0xFF3A506B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🔹 Title
          Text(
            'Contact Us',
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              shadows: [
                Shadow(
                  color: Colors.blueAccent.withOpacity(0.5),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 🌈 Title Underline
          Container(
            width: 130,
            height: 5,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
              ),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(height: 60),

          // 📞 Contact Cards
          Wrap(
            spacing: 40,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _ProfessionalContactCard(
                icon: Icons.location_on_rounded,
                title: 'Address',
                detail: address,
              ),
              _ProfessionalContactCard(
                icon: Icons.phone_rounded,
                title: 'Phone',
                detail: phoneNumber,
                onTap: _launchPhone,
              ),
              _ProfessionalContactCard(
                icon: Icons.email_rounded,
                title: 'Email',
                detail: email,
                onTap: _launchEmail,
              ),
              _ProfessionalContactCard(
                icon: FontAwesomeIcons.whatsapp,
                title: 'WhatsApp',
                detail: whatsappNumber,
                onTap: _launchWhatsApp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// Contact Card Widget
class _ProfessionalContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String detail;
  final VoidCallback? onTap;

  const _ProfessionalContactCard({
    required this.icon,
    required this.title,
    required this.detail,
    this.onTap,
  });

  @override
  State<_ProfessionalContactCard> createState() =>
      _ProfessionalContactCardState();
}

class _ProfessionalContactCardState extends State<_ProfessionalContactCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 270,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF1C2541),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovering
                  ? const Color(0xFF00B4DB)
                  : Colors.white.withOpacity(0.05),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovering
                    ? const Color(0xFF00B4DB).withOpacity(0.4)
                    : Colors.black.withOpacity(0.25),
                blurRadius: _isHovering ? 20 : 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isHovering
                      ? const Color(0xFF00B4DB)
                      : Colors.blueGrey.shade700,
                ),
                padding: const EdgeInsets.all(12),
                child: Icon(widget.icon, size: 28, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.detail,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 14,
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
}
