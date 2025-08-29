import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/customer/endpoints/shipping_method_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/customer/shipping_method_utils.dart';
import 'package:serverpod/serverpod.dart';

class ShippingMethodHandler {
  const ShippingMethodHandler._();

  static Future<ShippingMethodDTO> create(
    Session session, {
    required ShippingMethodDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final initialEntity = ShippingMethodUtils.initialShippingMethod(
      userId: userId,
      sessionId: sessionId,
      entity: entity,
      release: release,
      now: now,
    );
    final shippingMethod = await GenericCrud.create(
      session,
      ShippingMethodDTO.db.insertRow(session, initialEntity),
    );
    shippingMethodStreamController.add(shippingMethod);
    return shippingMethod;
  }

  static Future<ShippingMethodDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ShippingMethodDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<ShippingMethodDTO> _updateRow(
    Session session,
    ShippingMethodDTO entity,
    Transaction transaction,
  ) async {
    return ShippingMethodDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<ShippingMethodDTO?> _deleteDraft(
    Session session,
    ShippingMethodDTO entity,
    Transaction transaction,
  ) async {
    return ShippingMethodDTO.db.deleteRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<ShippingMethodDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<ShippingMethodDTO>(
      session,
      id: id,
      tableType: ShippingMethodUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: ShippingMethodDTOTable().tableName,
      streamController: shippingMethodStreamController,
    );
  }

  static Future<ShippingMethodDTO> update(
    Session session, {
    required ShippingMethodDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final updated = await GenericCrud.update(
      session,
      fetchById: _fetchById,
      sessionId: sessionId,
      newEntity: entity,
      updateEntity: _updateRow,
      tableType: ShippingMethodUtils.tableType,
      streamController: shippingMethodStreamController,
      release: release,
    );

    return updated;
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<ShippingMethodDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: ShippingMethodUtils.tableType,
      streamController: shippingMethodStreamController,
      deleteDraft: _deleteDraft,
    );
  }
}
