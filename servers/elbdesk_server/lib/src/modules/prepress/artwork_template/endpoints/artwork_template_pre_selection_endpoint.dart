import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_pre_selection_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_pre_selection_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final artworkTemplatePreSelectionStreamController =
    StreamController<ArtworkTemplatePreSelectionDTO>.broadcast();

/// Artwork Template Pre Selection Endpoint
///
/// Used to manage the artwork template pre selection category
///
/// See [ArtworkTemplatePreSelectionDTO] for more information
///
class ArtworkTemplatePreSelectionEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<ArtworkTemplatePreSelectionDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* artworkTemplatePreSelectionStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<ArtworkTemplatePreSelectionDTO> watchPreSelection(
    Session session, {
    required int? customerId,
  }) async* {
    yield* artworkTemplatePreSelectionStreamController.stream
        .where((event) => event.customerId == customerId)
        .map((event) {
      return event;
    });
  }

  Future<ArtworkTemplatePreSelectionDTO> create(
    Session session, {
    required ArtworkTemplatePreSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return ArtworkTemplatePreSelectionHandler.create(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<ArtworkTemplatePreSelectionDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return ArtworkTemplatePreSelectionDTO.db.findById(
      session,
      id,
    );
  }

  Future<List<ArtworkTemplatePreSelectionDTO>> fetchAll(Session session) async {
    return ArtworkTemplatePreSelectionDTO.db.find(
      session,
      orderBy: (t) => t.description,
      orderDescending: false,
    );
  }

  Future<List<ArtworkTemplatePreSelectionDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField =
        ArtworkTemplatePreSelectionField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = ArtworkTemplatePreSelectionUtils.buildExpression(filter);

    return ArtworkTemplatePreSelectionDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy:
          ArtworkTemplatePreSelectionUtils.preSelectionOrderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<ArtworkTemplatePreSelectionDTO> update(
    Session session, {
    required ArtworkTemplatePreSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return ArtworkTemplatePreSelectionHandler.update(
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
    return ArtworkTemplatePreSelectionHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<ArtworkTemplatePreSelectionDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return ArtworkTemplatePreSelectionHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<List<ArtworkTemplatePreSelectionDTO>> fetchByCustomerId(
    Session session,
    int customerId,
  ) async {
    return ArtworkTemplatePreSelectionDTO.db.find(
      session,
      where: (t) => t.customerId.equals(
        customerId,
      ),
      orderBy: (t) => t.description,
      orderDescending: false,
    );
  }

  Future<List<ArtworkTemplatePreSelectionDTO>> fetchGlobal(
    Session session,
  ) async {
    return ArtworkTemplatePreSelectionDTO.db.find(
      session,
      where: (t) => t.customerId.equals(
        null,
      ),
      orderBy: (t) => t.description,
      orderDescending: false,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ArtworkTemplatePreSelectionDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: ArtworkTemplatePreSelectionUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
