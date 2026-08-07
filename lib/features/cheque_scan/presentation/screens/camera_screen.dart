import 'dart:io';

import 'package:daily_helper_app/features/cheque_scan/presentation/screens/preview_screen.dart';
import 'package:daily_helper_app/services/camera_service.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  CameraScreen({super.key});

  final CameraService cameraService = CameraService();

  Future<void> openCamera(BuildContext context) async {
    final File? image = await cameraService.captureCheque();
    if (image == null || !context.mounted) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PreviewScreen(image: image)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan Cheque")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => openCamera(context),
          child: const Text("Open Camera"),
        ),
      ),
    );
  }
}
