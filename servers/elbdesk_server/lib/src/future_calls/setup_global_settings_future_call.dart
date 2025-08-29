import 'dart:convert';

import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

// Future calls are calls that will be invoked at a later time. An example is if
// you want to send a drip-email campaign after a user signs up. You can
// schedule a future call for a day, a week, or a month. The calls are stored in
// the database, so they will persist even if the server is restarted.
//
//  To add a future call to your server, you need to register it in the
//  `server.dart` file. Schedule the call using the
//  `session.serverpod.futureCallWithDelay` or
// `session.serverpod.futureCallAtTime`
//  methods. You can optionally pass a serializable object together with the
//  call.

class SetupGlobalSettingsFutureCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    // Check if global settings already exist
    final existing = await GlobalSettingsDTO.db.findFirstRow(session);
    if (existing != null) {
      return;
    }

    // Create default settings with empty JSON
    await GlobalSettingsDTO.db.insertRow(
      session,
      GlobalSettingsDTO(
        globalSettingsJson: jsonEncode({
          'aeEndpointPath': '',
          'dataImportFolderPath': '',
          'artworkFolderPath': '',
          'pdfViewerUrl': '',
        }),
        createdAt: DateTime.now(),
        isDraft: false,
      ),
    );
  }
}
