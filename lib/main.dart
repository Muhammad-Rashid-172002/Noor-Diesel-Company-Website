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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            HeaderSection(),
            HeroSection(),
            AboutSection(),
            ServicesSection(),
            ProjectsSection(),
            ContactSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
