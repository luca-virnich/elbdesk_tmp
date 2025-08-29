import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final artworkTemplateStreamController =
    StreamController<ArtworkTemplateDTO>.broadcast();

/// Artwork Template Endpoint
///
/// Used to manage artwork templates
///
/// See [ArtworkTemplateDTO] for more information
///
class ArtworkTemplateEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<ArtworkTemplateDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* artworkTemplateStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<ArtworkTemplateDTO> watchCustomerUpdates(
    Session session,
    Stream<ArtworkTemplateDTO> stream, {
    required int customerId,
  }) async* {
    yield* artworkTemplateStreamController.stream
        .where((event) => event.customerId == customerId);
  }

  Future<ArtworkTemplateDTO> create(
    Session session, {
    required int? customerId,
    required int preSelectionId,
    required int selectionId,
    required String sessionId,
  }) async {
    return ArtworkTemplateHandler.create(
      session,
      customerId: customerId,
      preSelectionId: preSelectionId,
      selectionId: selectionId,
      sessionId: sessionId,
    );
  }

  Future<ArtworkTemplateDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return ArtworkTemplateDTO.db.findById(
      session,
      id,
      include: ArtworkTemplateUtils.includeAll,
    );
  }

  Future<List<ArtworkTemplateDTO>> fetchAll(Session session) async {
    return ArtworkTemplateDTO.db.find(
      session,
      orderBy: ArtworkTemplateUtils.orderBy(ArtworkTemplateField.description),
      orderDescending: false,
      include: ArtworkTemplateUtils.includeAll,
    );
  }

  Future<List<ArtworkTemplateDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ArtworkTemplateField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = ArtworkTemplateUtils.buildExpression(filter);

    return ArtworkTemplateDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      include: ArtworkTemplateUtils.includeAll,
      orderBy: ArtworkTemplateUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<List<ArtworkTemplateDTO>> findByCustomer(
    Session session, {
    int? customerId,
    Sort? sort,
    Filter? filter,
    bool includeGeneralTemplates = false,
  }) async {
    final sortByField = ArtworkTemplateField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final customerExpression =
        ArtworkTemplateDTOTable().customerId.equals(customerId);

    final generalTemplateExpression =
        ArtworkTemplateDTOTable().customerId.equals(null);

    // Final Expression depending on wether to exclude general templates
    final combinedExpression = includeGeneralTemplates
        ? customerExpression | generalTemplateExpression
        : customerExpression;

    final filterExpression = ArtworkTemplateUtils.buildExpression(filter);

    return ArtworkTemplateDTO.db.find(
      session,
      where: (t) => filterExpression == null
          ? combinedExpression
          : filterExpression & combinedExpression,
      include: ArtworkTemplateUtils.includeAll,
      orderBy: ArtworkTemplateUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<ArtworkTemplateDTO> update(
    Session session, {
    required ArtworkTemplateDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return ArtworkTemplateHandler.update(
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
    return ArtworkTemplateHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<ArtworkTemplateDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return ArtworkTemplateHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ArtworkTemplateDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: ArtworkTemplateUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
