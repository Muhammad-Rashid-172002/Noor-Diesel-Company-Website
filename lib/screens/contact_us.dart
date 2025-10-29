import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  final String phoneNumber = '+923335132538';
  final String email = 'noordiesel@gmail.com';
  final String whatsappNumber = '+923335132538';
  final String address = 'Blue Area, Islamabad';

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) await launchUrl(phoneUri);
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull(
        'subject=Inquiry&body=Hello Noor Diesel Engineering Company,\nI am interested in your products/services and would like more information. Please assist me.\nThank you.',
      ),
    );
    if (await canLaunchUrl(emailUri)) await launchUrl(emailUri);
  }

  Future<void> _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse(
      'https://wa.me/$whatsappNumber?text=Hello%20Noor%20Diesel%20Engineering%20Company,%0AI%20am%20interested%20in%20your%20products/services%20and%20would%20like%20more%20information.%0AThank%20you.',
    );
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contact Us',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _ProfessionalContactCard(
                icon: Icons.location_on,
                title: 'Address',
                detail: address,
              ),
              _ProfessionalContactCard(
                icon: Icons.phone,
                title: 'Phone',
                detail: phoneNumber,
                onTap: _launchPhone,
              ),
              _ProfessionalContactCard(
                icon: Icons.email,
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
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 250,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: _isHovering ? 12 : 6,
                offset: const Offset(0, 6),
              ),
            ],
            border: Border.all(
              color: _isHovering ? Colors.blue.shade700 : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(widget.icon, size: 36, color: Colors.blue.shade700),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.detail,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
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
