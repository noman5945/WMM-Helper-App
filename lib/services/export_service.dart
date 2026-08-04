import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class ExportService {
  static Future<String> exportAsPng(ScreenshotController scController) async {
    final imageBytes = await scController.capture();
    if (imageBytes == null) {
      throw Exception("Screenshot failed");
    }
    final directory = await getApplicationDocumentsDirectory();
    final path =
        "${directory.path}/vat_card_${DateTime.now().millisecondsSinceEpoch}.png";
    final file = File(path);
    await file.writeAsBytes(imageBytes);
    return path;
  }
}
