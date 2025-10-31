import 'package:flutter/material.dart';
import 'package:uncle_website/screens/ProjectsSection.dart';
import 'package:uncle_website/screens/aboutsection.dart';
import 'package:uncle_website/screens/contact_us.dart';
import 'package:uncle_website/screens/fotter_Section.dart';
import 'package:uncle_website/screens/headersection.dart';
import 'package:uncle_website/screens/herosection.dart';
import 'package:uncle_website/screens/service_section.dart';

void main() {
  runApp(const GeneratorBusinessApp());
}

class GeneratorBusinessApp extends StatelessWidget {
  const GeneratorBusinessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noor Diesel Generators',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Each section gets a GlobalKey
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final servicesKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  // Smooth scroll helper
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with onNavItemTap callback
          HeaderSection(
            onNavItemTap: (section) {
              switch (section) {
                case 'home':
                  _scrollToSection(homeKey);
                  break;
                case 'about':
                  _scrollToSection(aboutKey);
                  break;
                case 'services':
                  _scrollToSection(servicesKey);
                  break;
                case 'projects':
                  _scrollToSection(projectsKey);
                  break;
                case 'contact':
                  _scrollToSection(contactKey);
                  break;
              }
            },
          ),

          // Scrollable body content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(key: homeKey, child: const HeroSection()),
                  Container(key: aboutKey, child: const AboutSection()),
                  Container(key: servicesKey, child: const ProductsSection()),
                  Container(key: projectsKey, child: const ProjectsSection()),
                  Container(key: contactKey, child: const ContactSection()),
                  const FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
