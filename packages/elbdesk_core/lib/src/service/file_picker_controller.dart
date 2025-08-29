import 'dart:io';

import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_picker_controller.g.dart';

@riverpod
FilePickerController filePickerController(
  Ref ref,
) {
  return FilePickerController(
    ref: ref,
  );
}

/// A controller for picking files using the file_selector package.
///
/// This controller provides methods to pick different types of files such as
/// PDFs and images. It uses the Riverpod package for state management.
class FilePickerController {
  /// Creates a [FilePickerController] with the given [ref].
  ///
  /// The [ref] parameter is required and is used to access other providers
  /// within the Riverpod framework.
  FilePickerController({required this.ref});

  final Ref ref;

  /// Picks a directory and returns its path
  ///
  /// [initialDirectory] Optional starting directory path
  /// Returns null if user cancels the operation
  Future<String?> pickDirectory({String? initialDirectory}) async {
    try {
      return await FilePicker.platform.getDirectoryPath(
        initialDirectory: initialDirectory,
      );
    } catch (e) {
      debugPrint('Error picking directory: $e');
      throw ElbException(
        message: 'Error picking directory: $e',
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
  }

  /// Validates and returns a default directory path
  ///
  /// Returns the default path '/Documents/COE'
  String getDefaultDirectoryPath() {
    return '/Documents/COE';
  }

  Future<XFile?> pickFile() async {
    const typeGroup = XTypeGroup(
      label: 'any',
      mimeTypes: <String>[
        // Images
        'image/png',
        // PDFs
        'application/pdf',
        'application/x-pdf',
        'application/acrobat',
        'applications/vnd.pdf',
        'text/pdf',
        'text/x-pdf',
      ],
      uniformTypeIdentifiers: <String>[
        'com.adobe.pdf',
        'public.pdf',
        'public.movie',
      ],
      extensions: <String>['png', 'pdf', 'mov'],
    );

    return openFile(acceptedTypeGroups: [typeGroup]);
  }

  Future<List<XFile>?> pickAnyFiles() async {
    return openFiles();
  }

  Future<XFile?> pickPngFile() async {
    const typeGroup = XTypeGroup(
      label: 'png',
      mimeTypes: <String>[
        // Images
        'image/png',
      ],
      uniformTypeIdentifiers: <String>[
        'public.png',
      ],
      extensions: <String>['png'],
    );

    return openFile(acceptedTypeGroups: [typeGroup]);
  }

  Future<XFile?> pickZipFile() async {
    const typeGroup = XTypeGroup(
      label: 'zip',
      mimeTypes: <String>[
        'application/zip',
      ],
      uniformTypeIdentifiers: <String>[
        'public.zip',
      ],
      extensions: <String>['zip'],
    );

    return openFile(acceptedTypeGroups: [typeGroup]);
  }

  Future<XFile?> pickPdfFile() async {
    const typeGroup = XTypeGroup(
      label: 'pdf',
      mimeTypes: <String>[
        // PDFs
        'application/pdf',
        'application/x-pdf',
        'application/acrobat',
        'applications/vnd.pdf',
        'text/pdf',
        'text/x-pdf',
      ],
      uniformTypeIdentifiers: <String>[
        'com.adobe.pdf',
        'public.pdf',
      ],
      extensions: <String>['pdf'],
    );

    return openFile(acceptedTypeGroups: [typeGroup]);
  }

  Future<List<XFile>?> pickPdfFiles() async {
    const typeGroup = XTypeGroup(
      label: 'pdf',
      mimeTypes: <String>[
        // PDFs
        'application/pdf',
        'application/x-pdf',
        'application/acrobat',
        'applications/vnd.pdf',
        'text/pdf',
        'text/x-pdf',
      ],
      uniformTypeIdentifiers: <String>[
        'com.adobe.pdf',
        'public.pdf',
      ],
      extensions: <String>['pdf'],
    );

    return openFiles(acceptedTypeGroups: [typeGroup]);
  }

  Future<XFile?> pickZipOrPdfFile() async {
    const typeGroup = XTypeGroup(
      label: 'zip or pdf',
      mimeTypes: <String>[
        'application/zip',
        'application/pdf',
        'application/x-pdf',
        'application/acrobat',
        'applications/vnd.pdf',
        'text/pdf',
        'text/x-pdf',
      ],
      uniformTypeIdentifiers: <String>[
        'com.adobe.pdf',
        'public.pdf',
        'public.zip',
      ],
      extensions: <String>['pdf', 'zip'],
    );

    return openFile(acceptedTypeGroups: [typeGroup]);
  }

  Future<List<XFile>?> pickZipOrPdfFiles() async {
    const typeGroup = XTypeGroup(
      label: 'zip or pdf',
      mimeTypes: <String>[
        'application/zip',
        'application/pdf',
      ],
      uniformTypeIdentifiers: <String>[
        'com.adobe.pdf',
        'public.pdf',
        'public.zip',
      ],
      extensions: <String>['pdf', 'zip'],
    );

    return openFiles(acceptedTypeGroups: [typeGroup]);
  }

  Future<XFile?> pickImageFile() async {
    XFile? file;
    if (!Platform.isIOS) {
      const typeGroup = XTypeGroup(
        label: 'images',
        extensions: <String>['jpg', 'png'],
      );
      file = await openFile(acceptedTypeGroups: [typeGroup]);
    } else {
      // final picker = ImagePicker();
      // file = await picker.pickImage(source: ImageSource.gallery);
    }
    return file;
  }

  Future<XFile?> pickCsvFile() async {
    const typeGroup = XTypeGroup(
      label: 'csv',
      mimeTypes: <String>[
        'text/csv',
        'application/csv',
      ],
      uniformTypeIdentifiers: <String>[
        'public.comma-separated-values-text',
      ],
      extensions: <String>['csv'],
    );

    return openFile(acceptedTypeGroups: [typeGroup]);
  }

  Future<List<XFile>?> pickCsvFiles() async {
    const typeGroup = XTypeGroup(
      label: 'csv',
      mimeTypes: <String>[
        'text/csv',
        'application/csv',
      ],
      uniformTypeIdentifiers: <String>[
        'public.comma-separated-values-text',
      ],
      extensions: <String>['csv'],
    );

    return openFiles(acceptedTypeGroups: [typeGroup]);
  }
}
