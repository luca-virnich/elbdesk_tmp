import 'package:file_selector/file_selector.dart';

/// Extension on XFile to provide file existence checking functionality.
///
/// This extension adds an `exists` getter that checks if the file exists
/// and is accessible. It's web-compatible and handles errors gracefully.
extension XFileExtension on XFile {
  /// Checks if the file exists and is accessible.
  ///
  /// Returns `true` if the file exists and has content, `false` otherwise.
  /// This method is web-compatible and handles file system errors gracefully.
  ///
  /// Example:
  /// ```dart
  /// final file = XFile('/path/to/file.pdf');
  /// if (await file.exists) {
  ///   // File exists and is accessible
  /// }
  /// ```
  Future<bool> get exists async {
    try {
      final fileLength = await length();
      return fileLength > 0;
    } catch (e) {
      // File doesn't exist or is not accessible
      return false;
    }
  }
}
