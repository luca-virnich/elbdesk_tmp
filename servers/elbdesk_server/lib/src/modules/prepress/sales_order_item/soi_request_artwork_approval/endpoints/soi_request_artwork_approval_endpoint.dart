import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_request_artwork_approval/soi_request_artwork_approval_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_request_artwork_approval/soi_request_artwork_approval_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final soiRequestArtworkApprovalStreamController =
    StreamController<SoiRequestArtworkApprovalDTO>.broadcast();

final removeRequestArtworkApprovalFromSalesOrderController =
    StreamController<int>.broadcast();

class SoiRequestArtworkApprovalEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<SoiRequestArtworkApprovalDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        SoiRequestArtworkApprovalHandler.release(
          session,
          entityId: entityId,
          sessionId: sessionId,
        );
      },
    );

    yield* soiRequestArtworkApprovalStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<SoiRequestArtworkApprovalDTO> watchByArtwork(
    Session session, {
    required int artworkId,
  }) async* {
    yield* soiRequestArtworkApprovalStreamController.stream
        .where((event) => event.artworkId == artworkId)
        .map((event) {
      return event;
    });
  }

  Stream<SoiRequestArtworkApprovalDTO> watchBySalesOrder(
    Session session, {
    required int salesOrderId,
  }) async* {
    yield* soiRequestArtworkApprovalStreamController.stream
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
    yield* removeRequestArtworkApprovalFromSalesOrderController.stream;
  }

  Future<void> createFromSalesOrderArtwork(
    Session session, {
    required int salesOrderId,
    required int artworkId,
    required int artworkMasterId,
    required int customerId,
  }) async {
    return SoiRequestArtworkApprovalHandler.create(
      session,
      customerId: customerId,
      salesOrderId: salesOrderId,
      artworkId: artworkId,
      artworkMasterId: artworkMasterId,
      increaseArtworkVersion: true,
    );
  }

  // Future<SoiPrepareArtworkDTO?> fetchForTable(Session session, int id) async {
  //   return SoiPrepareArtworkDTO.db.findById(
  //     session,
  //     id,
  //     include: SoiPrepareArtworkDTO.include(
  //       artwork: ArtworkDTO.include(),
  //     ),
  //   );
  // }

  // Future<bool> isArtworkInSoiPrepareArtwork(
  //   Session session, {
  //   required int artworkId,
  // }) async {
  //   final soiPrepareArtwork = await SoiPrepareArtworkDTO.db.find(
  //     session,
  //     where: (t) => t.artwork.id.equals(artworkId),
  //   );
  //   return soiPrepareArtwork.isNotEmpty;
  // }

  Future<SoiRequestArtworkApprovalDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return SoiRequestArtworkApprovalDTO.db.findById(
      session,
      id,
      include: SoiRequestArtworkApprovalUtils.includeAll,
    );
  }

  Future<List<SoiRequestArtworkApprovalDTO>> fetchForSalesOrder(
    Session session,
    int salesOrderId,
  ) async {
    return SoiRequestArtworkApprovalDTO.db.find(
      session,
      where: (t) =>
          t.salesOrderItem.salesOrder.id.equals(salesOrderId) &
          t.deletedAt.equals(null as DateTime?),
      include: SoiRequestArtworkApprovalUtils.tableInSalesOrderInclude,
    );
  }

  /// The update happens inside of the unsafeQuery method
  Future<SoiRequestArtworkApprovalDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return SoiRequestArtworkApprovalHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return SoiRequestArtworkApprovalHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  // * UPDATE
  Future<SoiRequestArtworkApprovalDTO> update(
    Session session, {
    required SoiRequestArtworkApprovalDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return SoiRequestArtworkApprovalHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<List<SoiRequestArtworkApprovalDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = SoiRequestArtworkApprovalField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = SoiRequestArtworkApprovalUtils.buildExpression(filter);

    return SoiRequestArtworkApprovalDTO.db.find(
      session,
      where: expression == null
          ? (t) => t.deletedAt.equals(null as DateTime?)
          : (t) => expression,
      orderBy: SoiRequestArtworkApprovalUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: SoiRequestArtworkApprovalUtils.includeAll,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await SoiRequestArtworkApprovalDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: SoiRequestArtworkApprovalUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
