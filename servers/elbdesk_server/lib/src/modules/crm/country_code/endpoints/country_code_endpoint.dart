import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/crm/country_code/country_code_handler.dart';
import 'package:elbdesk_server/src/modules/crm/country_code/country_code_utils.dart';
import 'package:serverpod/serverpod.dart';

final countryCodeStreamController =
    StreamController<CountryCodeDTO>.broadcast();

class CountryCodeEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _tableType = TableType.countryCode;

  Stream<CountryCodeDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* countryCodeStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<CountryCodeDTO> watchAll(Session session) {
    return countryCodeStreamController.stream;
  }

  Future<CountryCodeDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return CountryCodeDTO.db.findById(
      session,
      id,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return CountryCodeHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<CountryCodeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return CountryCodeHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<CountryCodeDTO> create(
    Session session, {
    required CountryCodeDTO countryCode,
    required String sessionId,
    required bool release,
  }) async {
    return CountryCodeHandler.create(
      session,
      countryCode,
      sessionId,
      release,
    );
  }

  Future<List<CountryCodeDTO>> fetchAll(Session session) async {
    return CountryCodeDTO.db.find(
      session,
      orderBy: (t) => t.countryRegionName,
    );
  }

  Future<List<CountryCodeDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
    int? id,
  }) async {
    final sortByField = CountryCodeField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = CountryCodeUtils.buildExpression(filter);

    return CountryCodeDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: CountryCodeUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<CountryCodeDTO> update(
    Session session, {
    required CountryCodeDTO countryCode,
    required String sessionId,
    required bool release,
  }) async {
    return CountryCodeHandler.update(
      session,
      countryCode,
      sessionId,
      release,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await CountryCodeDTO.db.find(
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
