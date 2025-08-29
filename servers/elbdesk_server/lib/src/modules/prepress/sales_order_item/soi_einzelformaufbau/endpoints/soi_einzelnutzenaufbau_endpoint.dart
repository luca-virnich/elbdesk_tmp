import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_einzelformaufbau/soi_einzelformaufbau_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_einzelformaufbau/soi_einzelformaufbau_utils.dart';
import 'package:serverpod/serverpod.dart';

final soiEinzelformaufbauStreamController =
    StreamController<SoiEinzelformaufbauDTO>.broadcast();

class SoiEinzelformaufbauEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<SoiEinzelformaufbauDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        SoiEinzelformaufbauHandler.release(
          session,
          entityId: entityId,
          sessionId: sessionId,
        );
      },
    );

    yield* soiEinzelformaufbauStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<SoiEinzelformaufbauDTO> watchByArtwork(
    Session session, {
    required int artworkId,
  }) async* {
    yield* soiEinzelformaufbauStreamController.stream
        .where((event) => event.artworkId == artworkId)
        .map((event) {
      return event;
    });
  }

  Stream<SoiEinzelformaufbauDTO> watchBySalesOrder(
    Session session, {
    required int salesOrderId,
  }) async* {
    yield* soiEinzelformaufbauStreamController.stream
        .where(
      (event) => event.salesOrderItem?.salesOrder?.id == salesOrderId,
    )
        .map((event) {
      return event;
    });
  }

  Future<void> createFromSalesOrderArtwork(
    Session session, {
    required int salesOrderId,
    required int artworkId,
    required int artworkMasterId,
    required int customerId,
  }) async {
    return SoiEinzelformaufbauHandler.create(
      session,
      salesOrderId: salesOrderId,
      artworkId: artworkId,
      artworkMasterId: artworkMasterId,
      increaseEinzelformVersion: true,
      customerId: customerId,
    );
  }

  Future<SoiEinzelformaufbauDTO?> fetchForTable(Session session, int id) async {
    return SoiEinzelformaufbauDTO.db.findById(
      session,
      id,
      include: SoiEinzelformaufbauDTO.include(
        artwork: ArtworkDTO.include(),
      ),
    );
  }

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

  Future<SoiEinzelformaufbauDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return SoiEinzelformaufbauDTO.db.findById(
      session,
      id,
      include: SoiEinzelformaufbauUtils.includeAll,
    );
  }

  Future<List<SoiEinzelformaufbauDTO>> fetchForSalesOrder(
    Session session,
    int salesOrderId,
  ) async {
    return SoiEinzelformaufbauDTO.db.find(
      session,
      where: (t) =>
          t.salesOrderItem.salesOrder.id.equals(salesOrderId) &
          t.deletedAt.equals(null as DateTime?),
      include: SoiEinzelformaufbauUtils.tableInSalesOrderInclude,
    );
  }

  /// The update happens inside of the unsafeQuery method
  Future<SoiEinzelformaufbauDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return SoiEinzelformaufbauHandler.fetchAndLock(
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
    return SoiEinzelformaufbauHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  // * UPDATE
  Future<SoiEinzelformaufbauDTO> update(
    Session session, {
    required SoiEinzelformaufbauDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return SoiEinzelformaufbauHandler.update(
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

  Future<List<SoiEinzelformaufbauDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = SoiEinzelformaufbauField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = SoiEinzelformaufbauUtils.buildExpression(filter);

    return SoiEinzelformaufbauDTO.db.find(
      session,
      where: expression == null
          ? (t) => t.deletedAt.equals(null as DateTime?)
          : (t) => expression,
      orderBy: SoiEinzelformaufbauUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: SoiEinzelformaufbauUtils.includeAll,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await SoiEinzelformaufbauDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: SoiEinzelformaufbauUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
