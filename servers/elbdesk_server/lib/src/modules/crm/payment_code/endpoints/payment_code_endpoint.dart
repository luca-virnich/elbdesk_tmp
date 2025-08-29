import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/crm/payment_code/payment_code_handler.dart';
import 'package:elbdesk_server/src/modules/crm/payment_code/payment_code_utils.dart';
import 'package:serverpod/serverpod.dart';

final paymentCodeStreamController =
    StreamController<PaymentCodeDTO>.broadcast();

class PaymentCodeEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _tableType = TableType.paymentCode;

  Stream<PaymentCodeDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        PaymentCodeHandler.release(
          session,
          entityId: entityId,
          sessionId: sessionId,
        );
      },
    );

    yield* paymentCodeStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<PaymentCodeDTO> watchAll(
    Session session,
  ) {
    return paymentCodeStreamController.stream;
  }

  Future<PaymentCodeDTO?> fetchById(Session session, int id) async {
    return PaymentCodeDTO.db.findById(
      session,
      id,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await PaymentCodeHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<PaymentCodeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return PaymentCodeHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<PaymentCodeDTO> create(
    Session session, {
    required PaymentCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return PaymentCodeHandler.create(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<List<PaymentCodeDTO>> fetchAll(Session session) async {
    return PaymentCodeDTO.db.find(
      session,
    );
  }

  Future<List<PaymentCodeDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
    int? id,
  }) async {
    final sortByField = PaymentCodeField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = PaymentCodeUtils.buildExpression(filter);
    return PaymentCodeDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: PaymentCodeUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<PaymentCodeDTO> update(
    Session session, {
    required PaymentCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return PaymentCodeHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await PaymentCodeDTO.db.find(
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
