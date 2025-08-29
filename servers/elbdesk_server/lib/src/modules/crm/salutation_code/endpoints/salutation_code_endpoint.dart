import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/crm/salutation_code/salutation_code_handler.dart';
import 'package:elbdesk_server/src/modules/crm/salutation_code/salutation_code_utils.dart';
import 'package:serverpod/serverpod.dart';

final salutationCodeStreamController =
    StreamController<SalutationCodeDTO>.broadcast();

/// Endpoint for [SalutationCodeDTO]
class SalutationCodeEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _tableType = TableType.salutationCode;

  Stream<SalutationCodeDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        SalutationCodeHandler.release(
          session,
          entityId: entityId,
          sessionId: sessionId,
        );
      },
    );

    yield* salutationCodeStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<SalutationCodeDTO> watchAll(Session session) {
    return salutationCodeStreamController.stream;
  }

  Future<SalutationCodeDTO> create(
    Session session, {
    required SalutationCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return SalutationCodeHandler.create(
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
    await SalutationCodeHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<SalutationCodeDTO?> fetchById(
    Session session,
    int entityId,
  ) async {
    return SalutationCodeDTO.db.findById(session, entityId);
  }

  Future<List<SalutationCodeDTO>> fetchAll(Session session) async {
    return SalutationCodeDTO.db.find(
      session,
      orderBy: SalutationCodeUtils.dbFieldFromEnum(
        SalutationCodeField.description,
      ),
      orderDescending: false,
    );
  }

  Future<List<SalutationCodeDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = SalutationCodeField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = SalutationCodeUtils.buildExpression(filter);

    return SalutationCodeDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: SalutationCodeUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<SalutationCodeDTO> update(
    Session session, {
    required SalutationCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return SalutationCodeHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<SalutationCodeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return SalutationCodeHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await SalutationCodeDTO.db.find(
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
