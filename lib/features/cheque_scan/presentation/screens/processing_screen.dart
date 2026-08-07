import 'dart:io';

import 'package:flutter/material.dart';

class ProcessingScreen extends StatefulWidget {
  final File image;

  const ProcessingScreen({super.key, required this.image});

  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _processImage();
  }

  Future<void> _processImage() async {
    // ML Kit will go here later.

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Temporary:
    // Go back until we implement the review screen.
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Processing')),

      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),

            SizedBox(height: 20),

            Text('Processing cheque...', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
