import 'package:gallery_saver_plus/gallery_saver.dart';

class StorageService {
  static Future<bool> saveImage(String imagePath) async {
    final result = await GallerySaver.saveImage(
      imagePath,
      albumName: "WMM helper",
    );
    return result ?? false;
  }
}
