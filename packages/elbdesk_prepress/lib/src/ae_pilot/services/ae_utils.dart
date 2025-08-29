import 'package:elbdesk_core/elbdesk_core.dart';

class AEUtils {
  const AEUtils._();

  /// Opens a PDF file in the AE viewer or falls back to default viewer
  static Future<bool> openPdfInAEViewer(
    String filePath,
    String? pdfViewerUrl,
  ) async {
    // Open PDF view in AE web Viewer
    if (pdfViewerUrl != null && pdfViewerUrl.isNotEmpty) {
      // Clean url path
      final cleanFilePath = _cleanFilePath(filePath);
      final url = pdfViewerUrl + cleanFilePath;

      return UriLauncher.launchInBrowser(url);
    }
    // Fallback to local viewer if AE viewer not configured
    else {
      return UriLauncher.openFilePath(filePath);
    }
  }

  /// Cleans a file path for use in URLs by replacing slashes with URL encoding
  static String _cleanFilePath(String filePath) {
    final uri = Uri.file(filePath);

    final encodedPath = Uri.encodeComponent(uri.toString());

    return encodedPath;
    // return filePath.replaceAll('/', '%2F').replaceAll(r'\', '%2F');
  }
}
