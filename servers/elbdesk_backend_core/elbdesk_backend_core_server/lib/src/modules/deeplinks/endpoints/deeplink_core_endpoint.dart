import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_backend_core_server/src/modules/deeplinks/sqids.dart';
import 'package:serverpod/serverpod.dart';

class DeeplinkCoreEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<String> createDeeplink(
    Session session, {
    required String floatingWindowType,
    required int primaryId,
  }) async {
    final runMode = pod.runMode;
    final projectName = pod.getPassword('projectName');
    late String scheme;
    if (runMode == 'production') {
      scheme = 'https://$projectName.elbdesk.link/';
    } else {
      scheme = 'https://$runMode.$projectName.elbdesk.link/';
    }

    // check if deeplink already exists
    final existing = await Deeplink.db.findFirstRow(
      session,
      where: (t) =>
          t.floatingWindowType.equals(floatingWindowType) &
          t.primaryId.equals(primaryId),
    );

    if (existing != null) {
      return scheme + Sqids().encode([existing.id!]);
    }

    final newDeeplink = Deeplink(
      createdAt: DateTime.now(),
      floatingWindowType: floatingWindowType,
      primaryId: primaryId,
    );
    final inserted = await Deeplink.db.insertRow(session, newDeeplink);
    // final publicId = CoreUtils.encodeBase62(inserted.id!);
    final encoded = Sqids().encode([inserted.id!]);

    final url = scheme + encoded;

    return url;
  }

  Future<Deeplink?> getDeeplink(
    Session session, {
    required String path,
  }) async {
    final id = Sqids().decode(path).first;

    // final decoded = CoreUtils.decodeBase62(path);

    return Deeplink.db.findById(
      session,
      id,
    );
  }
}
