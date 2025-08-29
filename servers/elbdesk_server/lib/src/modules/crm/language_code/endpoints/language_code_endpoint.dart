import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/crm/language_code/language_code_handler.dart';
import 'package:elbdesk_server/src/modules/crm/language_code/language_code_utils.dart';
import 'package:serverpod/serverpod.dart';

final languageCodeStreamController =
    StreamController<LanguageCodeDTO>.broadcast();

class LanguageCodeEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _tableType = TableType.languageCode;

  Stream<LanguageCodeDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        LanguageCodeHandler.release(
          session,
          entityId: entityId,
          sessionId: sessionId,
        );
      },
    );

    yield* languageCodeStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<LanguageCodeDTO> watchAll(Session session) {
    return languageCodeStreamController.stream;
  }

  Future<LanguageCodeDTO?> fetchById(Session session, int id) async {
    return LanguageCodeDTO.db.findById(
      session,
      id,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await LanguageCodeHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<LanguageCodeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return LanguageCodeHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<LanguageCodeDTO> create(
    Session session, {
    required LanguageCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return LanguageCodeHandler.create(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<List<LanguageCodeDTO>> fetchAll(Session session) async {
    return LanguageCodeDTO.db.find(
      session,
      orderBy: (t) => t.languageName,
    );
  }

  Future<List<LanguageCodeDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = LanguageCodeField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = LanguageCodeUtils.buildExpression(filter);

    return LanguageCodeDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: LanguageCodeUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<LanguageCodeDTO> update(
    Session session, {
    required LanguageCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return LanguageCodeHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await LanguageCodeDTO.db.find(
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
