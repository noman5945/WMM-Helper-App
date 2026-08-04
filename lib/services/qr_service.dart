class QrService {
  static String sanitize(String input) {
    return input.trim();
  }

  static bool isValidUrl(String url) {
    final uri = Uri.tryParse(url);

    return uri != null &&
        uri.hasScheme &&
        (uri.scheme == 'http' || uri.scheme == 'https');
  }
}
