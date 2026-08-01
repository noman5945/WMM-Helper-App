import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const VatCardApp());
}

class VatCardApp extends StatelessWidget {
  const VatCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VAT Card Generator',
      home: const HomeScreen(),
    );
  }
}
