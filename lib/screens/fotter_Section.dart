import 'package:flutter/material.dart';// Flutter Material Package
import 'package:font_awesome_flutter/font_awesome_flutter.dart';// For FontAwesome icons
import 'package:url_launcher/url_launcher.dart';// For launching URLs

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});
// 🟢 Launch WhatsApp Function
  Future<void> _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse(
      'https://wa.me/+923335132538?text=Hello%20Noor%20Diesel%20Engineering%20Company,%20I%20would%20like%20to%20inquire%20about%20your%20services.',
    );
    await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
  }
// 🟢 Launch Email Function
  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'noordiesel@gmail.com',
      query: Uri.encodeFull('subject=Inquiry&body=Hello Noor Diesel Team,'),
    );
    await launchUrl(emailUri);
  }
// 🟢 Launch Phone Function
  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+923335132538');
    await launchUrl(phoneUri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A192F), Color(0xFF112240)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: Column(
        children: [
          const Text(
            'Noor Diesel Engineering Company',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Providing reliable generator sales, rental, and installation services across Pakistan.',// description text
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 25),

          // Contact icons
          Wrap(
            spacing: 25,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              _FooterIcon(
                icon: Icons.phone,
                tooltip: 'Call Us',
                onTap: _launchPhone,
              ),
              _FooterIcon(
                icon: FontAwesomeIcons.whatsapp,
                tooltip: 'WhatsApp',
                onTap: _launchWhatsApp,
              ),
              _FooterIcon(
                icon: Icons.email,
                tooltip: 'Email',
                onTap: _launchEmail,
              ),
              _FooterIcon(
                icon: FontAwesomeIcons.facebook,
                tooltip: 'Facebook',
                onTap: () => launchUrl(
                  Uri.parse('https://facebook.com'),
                  mode: LaunchMode.externalApplication,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),
          const Divider(color: Colors.white24, thickness: 0.5),
          const SizedBox(height: 10),

          const Text(
            '©️ 2025 Noor Diesel Engineering Company Pakistan | All Rights Reserved',
            style: TextStyle(color: Colors.white60, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
// Footer Icon Widget

class _FooterIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _FooterIcon({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  State<_FooterIcon> createState() => _FooterIconState();
}
// Footer Icon State
class _FooterIconState extends State<_FooterIcon> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _hover ? Colors.blue.shade700 : Colors.white10,
            shape: BoxShape.circle,
          ),
          child: Tooltip(
            message: widget.tooltip,
            child: Icon(
              widget.icon,
              color: _hover ? Colors.white : Colors.white70,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
