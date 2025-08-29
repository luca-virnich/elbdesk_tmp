import 'dart:io';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:file_selector/file_selector.dart';
import 'package:path/path.dart' as p;

class FileUtils {
  static String formatFileSize(int bytes) {
    return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  /// Copy File
  ///
  /// Copies a file from the source path to the destination path.
  static Future<void> copyFile(
    String sourcePath,
    String destinationPath,
  ) async {
    try {
      await File(sourcePath).copy(destinationPath);
    } catch (e) {
      throw ElbException(
        message: 'Failed to copy file: $e',
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
  }

  /// Delete file
  static Future<bool> deleteFile(String path) async {
    try {
      final file = File(path);
      final fileExists = file.existsSync();
      if (fileExists) {
        await file.delete();
        return true;
      }
      return false;
    } catch (e) {
      throw ElbException(
        message: 'Error removing file: $e',
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
  }

  /// Get Folder Contents
  ///
  /// Retrieves the contents of a folder based on the provided UUID.
  static Future<List<FileSystemEntity>> getFolderContents(String? uuid) async {
    if (uuid == null) return [];

    try {
      final directory = Directory(p.join(uuid, 'Artwork'));
      final directoryExists = directory.existsSync();

      if (directoryExists) {
        return directory
            .list(recursive: true)
            .where((entity) => entity is File)
            .toList();
      }
    } catch (e) {
      throw ElbException(
        message: 'Failed to get folder contents: $e',
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
    return [];
  }

  /// Creates directory if it doesn't exist
  static Future<void> ensureDirectoryExists(String path) async {
    try {
      final directory = Directory(path);
      if (!directory.existsSync()) {
        await directory.create(recursive: true);
      }
    } catch (e) {
      throw ElbException(
        message: 'Cannot create directory at $path: $e',
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
  }

  /// Copy multiple files with progress tracking
  static Future<void> copyFiles(
    List<({String source, String destination})> files,
  ) async {
    final errors = <String>[];

    for (final file in files) {
      try {
        await copyFile(file.source, file.destination);
      } catch (e) {
        errors.add('Failed to copy ${file.source}: $e');
      }
    }

    if (errors.isNotEmpty) {
      throw ElbException(
        message: errors.join('\n'),
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
  }

  /// Delete multiple files
  static Future<void> deleteFiles(List<String> paths) async {
    final errors = <String>[];

    for (final path in paths) {
      try {
        final success = await deleteFile(path);
        if (!success) {
          errors.add('File not found: $path');
        }
      } catch (e) {
        errors.add('Failed to delete $path: $e');
      }
    }

    if (errors.isNotEmpty) {
      throw ElbException(
        message: errors.join('\n'),
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
  }

  /// Get file size
  static Future<int> getFileSize(String filePath) async {
    final file = XFile(filePath);
    return file.length();
  }
}
