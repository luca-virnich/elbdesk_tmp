import 'package:ahoi_file_storage/ahoi_file_storage.dart';
import 'package:serverpod/serverpod.dart';

class AhoiFileStorageEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  // @override
  // Set<Scope> get requiredScopes => {Scope.admin};

  Future<String?> getUploadDescription(Session session, String path) async {
    final uploadDescription =
        await session.storage.createDirectFileUploadDescription(
      // TODO(kz): figure out how public/private works and implement it
      storageId: 'private',
      path: path,
    );

    return uploadDescription;
  }

  Future<bool> verifyUpload(Session session, String path) async {
    return session.storage.verifyDirectFileUpload(
      storageId: 'private',
      path: path,
    );
  }

  Future<bool> deleteFile(Session session, String path) async {
    await session.storage.deleteFile(
      storageId: 'private',
      path: path,
    );

    final isDeleted = !await session.storage.fileExists(
      storageId: 'private',
      path: path,
    );

    return isDeleted;
  }

  Future<String?> getDownloadDescription(Session session, String path) async {
    final downloadDescription =
        await session.storage.createDirectFileDownloadDescription(
      session: session,
      storageId: 'private',
      path: path,
    );

    return downloadDescription;
  }

  Future<String> getDownloadUrl(Session session, String path) async {
    final downloadUrl = await session.storage.getPublicUrl(
      storageId: 'private',
      path: path,
    );
    final downloadUrlString = downloadUrl.toString();

    return downloadUrlString;
  }
}
