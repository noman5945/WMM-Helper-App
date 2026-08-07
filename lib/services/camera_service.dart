import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CameraService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> captureCheque() async {
    final image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 90,
    );

    if (image == null) {
      return null;
    }

    return File(image.path);
  }
}
