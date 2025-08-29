import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_consulting/soi_consulting_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_consulting/soi_consulting_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final soiConsultingStreamController =
    StreamController<SoiConsultingDTO>.broadcast();

final removeConsultingFromSalesOrderController =
    StreamController<int>.broadcast();

class SoiConsultingEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<SoiConsultingDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* soiConsultingStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<SoiConsultingDTO> watchBySalesOrder(
    Session session, {
    required int salesOrderId,
  }) async* {
    yield* soiConsultingStreamController.stream
        .where(
      (event) => event.salesOrderItem?.salesOrder?.id == salesOrderId,
    )
        .map((event) {
      return event;
    });
  }

  Stream<int> watchDeletionsForSalesOrder(
    Session session, {
    required int salesOrderId,
  }) async* {
    yield* removeConsultingFromSalesOrderController.stream;
  }

  Future<SoiConsultingDTO?> fetchForTable(Session session, int id) async {
    return SoiConsultingDTO.db.findById(
      session,
      id,
      include: SoiConsultingDTO.include(),
    );
  }

  Future<SoiConsultingDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return SoiConsultingDTO.db.findById(
      session,
      id,
      include: SoiConsultingUtils.includeAll,
    );
  }

  Future<List<SoiConsultingDTO>> fetchForSalesOrder(
    Session session,
    int salesOrderId,
  ) async {
    return SoiConsultingDTO.db.find(
      session,
      where: (t) =>
          t.salesOrderItem.salesOrder.id.equals(salesOrderId) &
          t.deletedAt.equals(null as DateTime?),
      include: SoiConsultingUtils.tableInSalesOrderInclude,
    );
  }

  /// The update happens inside of the unsafeQuery method
  Future<SoiConsultingDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return SoiConsultingHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  // * UPDATE
  Future<SoiConsultingDTO> update(
    Session session, {
    required SoiConsultingDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    // Update both the SoiPrepareArtwork and its parent SalesOrderItem in a
    return SoiConsultingHandler.update(
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
    return SoiConsultingHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<int> createFromSalesOrder(
    Session session, {
    required int salesOrderId,
    required int customerId,
  }) async {
    return SoiConsultingHandler.createFromSalesOrder(
      session,
      salesOrderId: salesOrderId,
      customerId: customerId,
    );
  }

  // * DELETE
  Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return SoiConsultingHandler.delete(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<List<SoiConsultingDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = SoiConsultingField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = SoiConsultingUtils.buildExpression(filter);

    return SoiConsultingDTO.db.find(
      session,
      where: expression == null
          ? (t) => t.deletedAt.equals(null as DateTime?)
          : (t) => expression,
      orderBy: SoiConsultingUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: SoiConsultingUtils.includeAll,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await SoiConsultingDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: SoiConsultingUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
