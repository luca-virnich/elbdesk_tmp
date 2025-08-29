import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_prepare_artwork/soi_prepare_artwork_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_prepare_artwork/soi_prepare_artwork_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final soiPrepareArtworkStreamController =
    StreamController<SoiPrepareArtworkDTO>.broadcast();

final removePrepareArtworkFromSalesOrderController =
    StreamController<int>.broadcast();

class SoiPrepareArtworkEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<SoiPrepareArtworkDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        SoiPrepareArtworkHandler.release(
          session,
          entityId: entityId,
          sessionId: sessionId,
        );
      },
    );

    yield* soiPrepareArtworkStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  /// we want to watch for changes to the SoiPrepareArtworkDTO with the
  /// specified artworkId, so we can see if the artwork has a S
  /// SoiPrepareArtwork with the correct status

  Stream<SoiPrepareArtworkDTO> watchByArtwork(
    Session session, {
    required int artworkId,
  }) async* {
    yield* soiPrepareArtworkStreamController.stream
        .where((event) => event.artworkId == artworkId)
        .map((event) {
      return event;
    });

    // yield* soiPrepareArtworkStreamController.stream
    //     .where((event) => event.artworkId == artworkId)
    //     .asyncMap((event) async {
    //   // Refetch the complete object with all includes
    //   final refetched = await fetchById(session, event.id!);
    //   if (refetched == null) {
    //     throw Exception(
    //       'Failed to refetch SoiPrepareArtwork with id: ${event.id}',
    //     );
    //   }
    //   return refetched;
    // });
  }

  Stream<SoiPrepareArtworkDTO> watchBySalesOrder(
    Session session, {
    required int salesOrderId,
  }) async* {
    yield* soiPrepareArtworkStreamController.stream
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
    yield* removePrepareArtworkFromSalesOrderController.stream;
  }

  Future<void> createFromSalesOrderArtwork(
    Session session, {
    required int salesOrderId,
    required int artworkId,
    required int artworkMasterId,
    required int customerId,
  }) async {
    return SoiPrepareArtworkHandler.create(
      session,
      salesOrderId: salesOrderId,
      artworkId: artworkId,
      artworkMasterId: artworkMasterId,
      increaseArtworkVersion: true,
      customerId: customerId,
    );
  }

  Future<SoiPrepareArtworkDTO?> fetchForTable(Session session, int id) async {
    return SoiPrepareArtworkDTO.db.findById(
      session,
      id,
      include: SoiPrepareArtworkDTO.include(
        artwork: ArtworkDTO.include(),
      ),
    );
  }

  Future<bool> isArtworkInSoiPrepareArtwork(
    Session session, {
    required int artworkId,
  }) async {
    final soiPrepareArtwork = await SoiPrepareArtworkDTO.db.find(
      session,
      where: (t) => t.artwork.id.equals(artworkId),
    );
    return soiPrepareArtwork.isNotEmpty;
  }

  Future<SoiPrepareArtworkDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return SoiPrepareArtworkDTO.db.findById(
      session,
      id,
      include: SoiPrepareArtworkUtils.includeAll,
    );
  }

  Future<List<SoiPrepareArtworkDTO>> fetchForSalesOrder(
    Session session,
    int salesOrderId,
  ) async {
    return SoiPrepareArtworkDTO.db.find(
      session,
      where: (t) =>
          t.salesOrderItem.salesOrder.id.equals(salesOrderId) &
          t.deletedAt.equals(null as DateTime?),
      include: SoiPrepareArtworkUtils.tableInSalesOrderInclude,
    );
  }

  // Future<List<SoiPrepareArtworkDTO>> fetchBySalesOrderId(
  //   Session session,
  //   int salesOrderId,
  // ) async {
  //   return SoiPrepareArtworkDTO.db.find(
  //     session,
  //     where: (t) =>
  //         t.salesOrderId.equals(salesOrderId) &
  //         t.deletedAt.equals(null as DateTime?),
  //     include: SoiPrepareArtworkDTO.include(
  //       artwork: ArtworkDTO.include(
  //         customer: CustomerDTO.include(
  //           contact: ContactDTO.include(),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// The update happens inside of the unsafeQuery method
  Future<SoiPrepareArtworkDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return SoiPrepareArtworkHandler.fetchAndLock(
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
    return SoiPrepareArtworkHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  // * UPDATE
  Future<SoiPrepareArtworkDTO> update(
    Session session, {
    required SoiPrepareArtworkDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return SoiPrepareArtworkHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  // * DELETE

  // Future<bool> delete(
  //   Session session, {
  //   required int entityId,
  //   required String sessionId,
  // }) async {
  //   return session.db.transaction((transaction) async {
  //     // First fetch the SoiPrepareArtwork to get the salesOrderItemId
  //     final soiPrepareArtwork = await fetchById(
  //       session,
  //       entityId,
  //       transaction,
  //     );
  //     if (soiPrepareArtwork == null) {
  //       throw Exception('SoiPrepareArtwork not found');
  //     }

  //     // Delete the parent SalesOrderItem first
  //     await SalesOrderItemEndpoint().delete(
  //       session,
  //       entityId: soiPrepareArtwork.salesOrderItemId,
  //       sessionId: sessionId,
  //     );

  //     // Then delete the SoiPrepareArtwork
  //     return GenericCrud.markEntityAsDeleted<SoiPrepareArtworkDTO>(
  //       session,
  //       id: entityId,
  //       sessionId: sessionId,
  //       fetchWithoutRelations: SoiPrepareArtworkHandler.fetchWithoutRelations,
  //       updateRow: SoiPrepareArtworkHandler.updateRow,
  //       tableType: _tableType,
  //       streamController: soiPrepareArtworkStreamController,
  //     );
  //   });
  // }

  Future<List<SoiPrepareArtworkDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = SoiPrepareArtworkField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = SoiPrepareArtworkUtils.buildExpression(filter);

    return SoiPrepareArtworkDTO.db.find(
      session,
      where: expression == null
          ? (t) => t.deletedAt.equals(null as DateTime?)
          : (t) => expression,
      orderBy: SoiPrepareArtworkUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: SoiPrepareArtworkUtils.includeAll,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await SoiPrepareArtworkDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: SoiPrepareArtworkUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
