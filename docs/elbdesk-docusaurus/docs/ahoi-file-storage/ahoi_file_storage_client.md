---
sidebar_position: 2
title: Ahoi File Storage Client
---

# How to deploy an Ahoi File Storage Server

![Hetzner](/img/ahoi_file_storage_client.png)

## Introduction

To use Ahoi File Storage Client we need include it and initialize it in our Serverpod project.

## Adding ahoi_file_storage_client dependency to generated Serverpod client

In your generated client's `pubspec.yaml` file add `ahoi_file_storage_client` dependency from git, make sure to use the commit ref to pin the version in place in order for dependency to stay fixed in your generated client package even if it changes in its Git repository.

```yaml
dependencies:
  ahoi_file_storage_client:
    git:
      url: https://github.com/App-Ahoi/ahoi_file_storage_client.git
      ref: eac440d28a8a670b43cadc5f6e41f172d99159f5
```

## Export ahoi_file_storage_client from the generated client package

In order for the `ahoi_file_storage_client` to be available to our flutter app trough the Serverpod's generated client package we need to export it from our generated client's entry file like so:

```dart
export 'package:ahoi_file_storage_client/ahoi_file_storage_client.dart';
```

Now the `ahoi_file_storage_client` and it's classes are available to our flutter apps trough our Serverpod's generated client.

## AhoiFileStorageClient usage

If we have imported our Serverpod project's generated client into our flutter app, we now have access to two classes from `AhoiFileStorageClient` and those are:

- **AhoiFileUploader** - used to upload a file given the file stream and an upload ddescription

- **AhoiFileDownloader** - used to download the file given the signed resource url or a download description.

### Uploading a file

The following snippet gives an example of a file upload via `ahoi_file_storage_client`:

```dart

/// Uploads a file to the server.
///
/// The [file] parameter is the file to be uploaded.
///
/// Returns the path of the uploaded file.
Future<String> upload(XFile file) async {
  final length = await file.length();

  // Fetch the upload description from the Serverpod server
  final uploadDescription =
      await client.ahoiFileStorage.getUploadDescription(file.name);

  // Initialize the AhoiFileUploader with the upload description
  final uploader = AhoiFileUploader(uploadDescription!);

  // Give the uploader the file stream, its byte length
  final response = await uploader
      .upload(
    stream: file.openRead() as Stream<List<int>>,
    length: length,
    // A usefull upload progress callback method
    onSendProgress: (sent, total) {
      // Print the progress of the upload
      debugPrint('Sent: $sent, Total: $total');
    },
  )
      .whenComplete(() {
    debugPrint('UPLOAD COMPLETE');
  });

  debugPrint('IS UPLOADED: $response');

  // Optionally verify the upload success trough our Serverpod server
  await verifyUpload(response);

  // Returns the path of the file in the following structure:
  // /bucket/timestamp_filename.ext
  return response;
}
```

### Downloading a file

There are two ways to download a file but we'll focus on the currently recomended way by Serverpod team and that is trough a signed URL to the requested resource/file.

The following snippet gives an example of a file download via `ahoi_file_storage_client`:

```dart
  /// Downloads a file from the server.
  ///
  /// The [path] parameter is the path of the file to be downloaded.
  ///
  /// Returns the downloaded file as a [Uint8List].
  Future<Uint8List> download(String path) async {
    // request the download url tot he resource given its relative path
    // /bucket/timestamp_file_name.ext
    // The getDownloadUrl() will return the full url with the host and query path parameters as String:
    // https://fs.coe.elbdesk.cloud/bucket/timestamp_file_name.ext?...query&path&params..
    final downloadUrl = await client.ahoiFileStorage.getDownloadUrl(path);

    // Parse the url string into the Uri
    final uri = Uri.parse(downloadUrl);

    // Initialize the AhoiFileDownloader.fromSignedUrl() with the Uri
    final downloader = AhoiFileDownloader.fromSignedUrl(uri);

    // Execute the fetching of the resource by calling download() method on the instance of the initialised AhoiFileDownloader.
    // If successfull, we'll end up with a Uint8List of our requested file's bytes with which we can then work with.
    final file = await downloader.download();

    return file;
  }

```

### Deleting a file

This is not directly a part of our `ahoi_file_storage_client` but rather a Serverpod server's endpoint that we have to create but it's worth repeating that a file can only be deleted with a call to the `ahoi_file_storage_server` trough the Serverpod server by calling the endpoint that we've constructed:

```dart
  /// Deletes a file from the server.
  ///
  /// The [path] parameter is the path of the file to be deleted.
  Future<void> delete(String path) async {
    /// The Serverpod client used for accessing Serverpod endpoints
    final Client client = serverpodClient;

    final isDeleted = await client.ahoiFileStorage.deleteFile(path);

    isDeleted ? debugPrint('FILE DELETED') : debugPrint('FILE NOT DELETED');
  }
```
