import 'dart:io';

import 'package:daily_helper_app/features/cheque_scan/presentation/screens/processing_screen.dart';
import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  final File image;

  const PreviewScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview')),

      body: Column(
        children: [
          Expanded(child: Image.file(image, fit: BoxFit.contain)),

          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Redo'),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProcessingScreen(image: image),
                          ),
                        );
                      },
                      child: const Text('Continue'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
