import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/payment_code/endpoints/payment_code_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/payment_code/payment_code_utils.dart';
import 'package:serverpod/serverpod.dart';

class PaymentCodeHandler {
  const PaymentCodeHandler._();

  static Future<PaymentCodeDTO> create(
    Session session, {
    required PaymentCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final initialEntity = PaymentCodeUtils.initialPaymentCode(
      userId: userId,
      sessionId: sessionId,
      entity: entity,
      release: release,
      now: now,
    );

    final code = await GenericCrud.create(
      session,
      PaymentCodeDTO.db.insertRow(session, initialEntity),
    );
    paymentCodeStreamController.add(code);
    return code;
  }

  static Future<PaymentCodeDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return PaymentCodeDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<PaymentCodeDTO> _updateRow(
    Session session,
    PaymentCodeDTO entity,
    Transaction transaction,
  ) async {
    return PaymentCodeDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<PaymentCodeDTO?> _deleteDraft(
    Session session,
    PaymentCodeDTO entity,
    Transaction transaction,
  ) async {
    return PaymentCodeDTO.db.deleteRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<PaymentCodeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<PaymentCodeDTO>(
      session,
      id: id,
      tableType: PaymentCodeUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: PaymentCodeDTOTable().tableName,
      streamController: paymentCodeStreamController,
    );
  }

  static Future<PaymentCodeDTO> update(
    Session session, {
    required PaymentCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final updated = await GenericCrud.update(
      session,
      fetchById: _fetchById,
      sessionId: sessionId,
      newEntity: entity,
      updateEntity: _updateRow,
      tableType: PaymentCodeUtils.tableType,
      streamController: paymentCodeStreamController,
      release: release,
    );

    return updated;
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<PaymentCodeDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: PaymentCodeUtils.tableType,
      streamController: paymentCodeStreamController,
      deleteDraft: _deleteDraft,
    );
  }
}
