// // import 'dart:io';

// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:file_selector/file_selector.dart';
// import 'package:flutter/foundation.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'ahoi_file_storage_controller.g.dart';

// /// Image provider for testing download of images,
// /// could be removed when not needed.
// @riverpod
// class ImageFile extends _$ImageFile {
//   @override
//   Future<Uint8List?> build() async {
//     return null;

//     // return AsyncLoading();
//   }

//   /// Adds bytes to the state.
//   ///
//   /// The [bytes] parameter is the data to be added.
//   Future<void> addBytes(Uint8List bytes) async {
//     state = AsyncData(bytes);
//   }

//   /// Deletes the current state.
//   Future<void> delete() async {
//     state = const AsyncData(null);
//   }
// }

// /// Provides an instance of [AhoiFileStorageController].
// ///
// /// This provider creates an [AhoiFileStorageController] using the
// /// [serverpodClient].
// @riverpod
// AhoiFileStorageController ahoiFileStorageController(
//   Ref ref,
// ) {
//   return AhoiFileStorageController(serverpodClient);
// }

// /// A client for handling file storage operations with Ahoi.
// ///
// /// The [AhoiFileStorageController] class provides methods for uploading,
// /// downloading, and deleting files using the Serverpod client.
// class AhoiFileStorageController {
//   /// Creates an [AhoiFileStorageController] with the given [client].
//   ///
//   /// The [client] parameter is required and must be an instance of [Client].
//   AhoiFileStorageController(this.client);

//   /// The Serverpod client used for file storage operations.
//   final Client client;

//   /// Uploads a file to the server.
//   ///
//   /// The [file] parameter is the file to be uploaded.
//   ///
//   /// Returns the path of the uploaded file.
//   Future<String> upload(XFile file) async {
//     final length = await file.length();

//     final uploadDescription =
//         await client.ahoiFileStorage.getUploadDescription(file.name);

//     final uploader = AhoiFileUploader(uploadDescription!);

//     final response = await uploader
//         .upload(
//       stream: file.openRead() as Stream<List<int>>,
//       length: length,
//       onSendProgress: (sent, total) {
//         // Print the progress of the upload
//         debugPrint('Sent: $sent, Total: $total');
//       },
//     )
//         .whenComplete(() {
//       debugPrint('UPLOAD COMPLETE');
//     });

//     debugPrint('IS UPLOADED: $response');

//     await verifyUpload(response);

//     return response;
//   }

//   /// Verifies the upload of a file.
//   ///
//   /// The [path] parameter is the path of the uploaded file.
//   Future<void> verifyUpload(String path) async {
//     final uploadVerification = await client.ahoiFileStorage.verifyUpload(path);

//     uploadVerification
//         ? debugPrint('UPLOAD VERIFIED')
//         : debugPrint('UPLOAD NOT VERIFIED');
//   }

//   /// Downloads a file from the server.
//   ///
//   /// The [path] parameter is the path of the file to be downloaded.
//   ///
//   /// Returns the downloaded file as a [Uint8List].
//   Future<Uint8List> download(String path) async {
//     // final downloadDescription =
//     //     await client.ahoiFileStorage.getDownloadDescription(path);

//     // final downloader =
//     //     AhoiFileDownloader.fromDownloadDescription(downloadDescription!);

//     // final file = await downloader.download();

//     // return file;

//     final downloadUrl = await client.ahoiFileStorage.getDownloadUrl(path);

//     final uri = Uri.parse(downloadUrl);

//     final downloader = AhoiFileDownloader.fromSignedUrl(uri);

//     final file = await downloader.download();

//     return file;
//   }

//   /// Deletes a file from the server.
//   ///
//   /// The [path] parameter is the path of the file to be deleted.
//   Future<bool> delete(String path) async {
//     final isDeleted = await client.ahoiFileStorage.deleteFile(path);

//     return isDeleted;
//   }
// }
