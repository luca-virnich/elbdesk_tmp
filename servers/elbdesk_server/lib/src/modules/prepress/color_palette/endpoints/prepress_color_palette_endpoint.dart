import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/color_palette/endpoints/prepress_color_palette_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/color_palette/endpoints/prepress_color_palette_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final prepressColorPaletteStreamController =
    StreamController<PrepressColorPaletteDTO>.broadcast();

/// ColorBook Endpoint
///
/// Used to manage the ColorBook Table of the database
class PrepressColorPaletteEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<PrepressColorPaletteDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* prepressColorPaletteStreamController.stream
        .where((event) => event.id == entityId && event.deletedAt == null)
        .map((event) => event);
  }

  Future<PrepressColorPaletteDTO?> fetchById(
    Session session,
    int id,
  ) async {
    // Fetching directly without transaction as this is a read-only operation
    return PrepressColorPaletteDTO.db.findById(
      session,
      id,
      include: PrepressColorPaletteUtils.includeAll,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return PrepressColorPaletteHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<PrepressColorPaletteDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return PrepressColorPaletteHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<PrepressColorPaletteDTO> create(
    Session session, {
    required String sessionId,
    required int? customerId,
  }) async {
    return PrepressColorPaletteHandler.create(
      session,
      sessionId: sessionId,
      customerId: customerId,
    );
  }

  Future<List<PrepressColorPaletteDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = PrepressColorPaletteField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = PrepressColorPaletteUtils.buildExpression(filter);

    return PrepressColorPaletteDTO.db.find(
      session,
      where: expression == null
          ? (t) => t.deletedAt.equals(null as DateTime?)
          : (t) => expression,
      orderBy: PrepressColorPaletteUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<List<PrepressColorPaletteDTO>> fetchGlobalAndCustomerColorBooks(
    Session session, {
    required int customerId,
  }) async {
    // This specific query logic remains in the endpoint as it's a specialized fetch
    return PrepressColorPaletteDTO.db.find(
      session,
      where: (t) =>
          (t.customerId.equals(customerId) | t.customerId.equals(null)) &
          t.isDraft.equals(false) &
          t.deletedAt.equals(null),
      // Include needs to be specified here
      include: PrepressColorPaletteUtils.includeAll,
    );
  }

  Future<PrepressColorPaletteDTO> update(
    Session session, {
    required PrepressColorPaletteDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return PrepressColorPaletteHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<bool> colorBookExists(
    Session session, {
    required String paletteName,
  }) async {
    return PrepressColorPaletteHandler.colorBookExists(
      session,
      paletteName: paletteName,
    );
  }

  Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return PrepressColorPaletteHandler.delete(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await PrepressColorPaletteDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: PrepressColorPaletteUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
