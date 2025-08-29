import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_selection_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_selection_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final artworkTemplateSelectionStreamController =
    StreamController<ArtworkTemplateSelectionDTO>.broadcast();

/// Artwork Template Selection Endpoint
///
/// Used to manage the artwork template selection category
///
/// See [ArtworkTemplateSelectionDTO] for more information
///
class ArtworkTemplateSelectionEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _tableType = TableType.artworkTemplateSelection;

  Stream<ArtworkTemplateSelectionDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* artworkTemplateSelectionStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<ArtworkTemplateSelectionDTO> watchSelection(
    Session session, {
    required int preSelectionId,
  }) async* {
    yield* artworkTemplateSelectionStreamController.stream
        .where((event) => event.artworkTemplatePreSelectionId == preSelectionId)
        .map((event) {
      return event;
    });
  }

  Future<ArtworkTemplateSelectionDTO> create(
    Session session, {
    required ArtworkTemplateSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return ArtworkTemplateSelectionHandler.create(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<ArtworkTemplateSelectionDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return ArtworkTemplateSelectionDTO.db.findById(
      session,
      id,
    );
  }

  Future<List<ArtworkTemplateSelectionDTO>> fetchAll(Session session) async {
    return ArtworkTemplateSelectionDTO.db.find(
      session,
      orderBy: ArtworkTemplateSelectionUtils.orderBy(
        ArtworkTemplateSelectionField.description,
      ),
      orderDescending: false,
    );
  }

  Future<List<ArtworkTemplateSelectionDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ArtworkTemplateSelectionField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = ArtworkTemplateSelectionUtils.buildExpression(filter);

    return ArtworkTemplateSelectionDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: ArtworkTemplateSelectionUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<ArtworkTemplateSelectionDTO> update(
    Session session, {
    required ArtworkTemplateSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return ArtworkTemplateSelectionHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return ArtworkTemplateSelectionHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<ArtworkTemplateSelectionDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return ArtworkTemplateSelectionHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<List<ArtworkTemplateSelectionDTO>> fetchFromPreSelection(
    Session session,
    int preSelectionId,
  ) async {
    return ArtworkTemplateSelectionDTO.db.find(
      session,
      where: (t) => t.artworkTemplatePreSelectionId.equals(preSelectionId),
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ArtworkTemplateSelectionDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: _tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
