import 'package:flutter/material.dart';

class Cablespage extends StatefulWidget {
  const Cablespage({super.key});

  @override
  State<Cablespage> createState() => _CablespageState();
}

class _CablespageState extends State<Cablespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Basic AppBar and Body for Cables Page
      appBar: AppBar(
        title: const Text('Cables Page'),
      ),
      body: const Center(
        child: Text('This is the Cables Page'),
      ),
    );
  }
}