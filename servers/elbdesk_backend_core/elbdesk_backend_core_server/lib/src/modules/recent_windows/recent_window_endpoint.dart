import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_backend_core_server/src/utils/core_utils.dart';
import 'package:serverpod/serverpod.dart';

class RecentWindowEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<RecentWindowDTO>> fetchRecentWindows(
    Session session,
  ) async {
    final (:now, :userId) = await CoreUtils.getCurrentTimeAndUser(session);

    return RecentWindowDTO.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      orderBy: (t) => t.timestamp,
      orderDescending: true,
      limit: 30,
    );
  }

  Future<void> addRecentWindow(
    Session session, {
    required bool isInserted,
    required RecentWindowDTO dto,
  }) async {
    final (:now, :userId) = await CoreUtils.getCurrentTimeAndUser(session);

    final currentEntry = await RecentWindowDTO.db.findFirstRow(
      session,
      where: (t) =>
          t.entityId.equals(dto.entityId) &
          t.userId.equals(userId) &
          t.type.equals(dto.type),
    );

    if (currentEntry != null) {
      await RecentWindowDTO.db.updateRow(
        session,
        currentEntry.copyWith(
          timestamp: isInserted ? now : currentEntry.timestamp,
          label: dto.label,
          additionalData: dto.additionalData,
        ),
      );
    } else {
      await RecentWindowDTO.db.insertRow(
        session,
        dto.copyWith(
          userId: userId,
          timestamp: now,
        ),
      );
    }
  }
}
