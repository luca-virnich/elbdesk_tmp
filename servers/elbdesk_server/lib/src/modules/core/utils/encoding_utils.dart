import 'dart:convert';
import 'dart:io';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';

/// Utility class for handling various text encodings with automatic detection
class EncodingUtils {
  const EncodingUtils._();

  /// Automatically detects and reads a text file with the appropriate encoding
  static Future<String> readTextFileWithEncoding(String filePath) async {
    final file = File(filePath);
    if (!file.existsSync()) {
      throw ElbException(
        message: 'File not found',
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }

    try {
      // First try UTF-8 (most common, backward compatible)
      return await file.readAsString(encoding: utf8);
    } catch (e) {
      // If UTF-8 fails, try UTF-16 with BOM detection
      return _readAsUtf16(file);
    }
  }

  /// Reads a file as UTF-16 with automatic BOM detection
  static Future<String> _readAsUtf16(File file) async {
    final bytes = await file.readAsBytes();

    if (bytes.length < 2) {
      throw ElbException(
        message: 'File too short for UTF-16 encoding',
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }

    // Check for BOM (Byte Order Mark)
    if (bytes[0] == 0xFF && bytes[1] == 0xFE) {
      // UTF-16 Little Endian with BOM
      return _decodeUtf16Le(bytes.skip(2).toList());
    } else if (bytes[0] == 0xFE && bytes[1] == 0xFF) {
      // UTF-16 Big Endian with BOM
      return _decodeUtf16Be(bytes.skip(2).toList());
    } else {
      // No BOM detected, assume UTF-16 Little Endian
      return _decodeUtf16Le(bytes);
    }
  }

  /// Decodes UTF-16 Little Endian bytes to string
  static String _decodeUtf16Le(List<int> bytes) {
    final result = <int>[];
    for (var i = 0; i < bytes.length - 1; i += 2) {
      final lowByte = bytes[i];
      final highByte = bytes[i + 1];
      final codePoint = (highByte << 8) | lowByte;
      result.add(codePoint);
    }
    return String.fromCharCodes(result);
  }

  /// Decodes UTF-16 Big Endian bytes to string
  static String _decodeUtf16Be(List<int> bytes) {
    final result = <int>[];
    for (var i = 0; i < bytes.length - 1; i += 2) {
      final highByte = bytes[i];
      final lowByte = bytes[i + 1];
      final codePoint = (highByte << 8) | lowByte;
      result.add(codePoint);
    }
    return String.fromCharCodes(result);
  }
}
