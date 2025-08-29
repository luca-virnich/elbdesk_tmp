import 'dart:async';

import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/drucklayout_handler.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

/// Stream controller for Drucklayout
///
/// This is used to broadcast updates to the client
/// Exposed through watch endpoints
final drucklayoutStreamController =
    StreamController<DrucklayoutDTO>.broadcast();

/// Endpoint for [DrucklayoutDTO]
///
/// This exposes the endpoints for Drucklayout
///
/// Used by the corresponding repository in the clients frontend
///
class DrucklayoutEndpoint extends Endpoint {
  /// Whether the endpoint requires a login
  @override
  bool get requireLogin => true;

  /// * General CRUD *

  /// Creates a new Drucklayout
  Future<DrucklayoutDTO> create(
    Session session, {
    required String sessionId,
    required bool release,
    required int? salesOrderId,
    required int? customerId,
    required int preSelectionId,
    required int selectionId,
  }) async {
    return DrucklayoutHandler.create(
      session,
      sessionId: sessionId,
      release: release,
      salesOrderId: salesOrderId,
      customerId: customerId,
      preSelectionId: preSelectionId,
      selectionId: selectionId,
    );
  }

  /// Updates a Drucklayout
  Future<DrucklayoutDTO> update(
    Session session, {
    required DrucklayoutDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return DrucklayoutHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  /// Deletes a Drucklayout
  Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return DrucklayoutHandler.delete(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// * Fetching *

  /// Fetches a single Drucklayout by id
  Future<DrucklayoutDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return DrucklayoutHandler.fetchById(
      session,
      id,
      null,
    );
  }

  /// Finds all Drucklayout entities
  ///
  /// Filtered and sorted by the given parameters
  /// These are usually defined through table settings in the client
  Future<List<DrucklayoutDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    return DrucklayoutHandler.find(
      session,
      sort: sort,
      filter: filter,
    );
  }

  /// Fetches and locks a single Drucklayout by id
  Future<DrucklayoutDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return DrucklayoutHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  /// Finds all Drucklayout entities by Sales Order
  Future<List<DrucklayoutDTO>> fetchBySalesOrder(
    Session session,
    int salesOrderId,
  ) async {
    return DrucklayoutHandler.fetchBySalesOrder(
      session,
      salesOrderId,
    );
  }

  /// Finds all Drucklayout entities by Customer with sorting and filtering
  Future<List<DrucklayoutDTO>> findDrucklayoutsByCustomer(
    Session session, {
    required int customerId,
    required String sessionId,
    Sort? sort,
    Filter? filter,
  }) async {
    return DrucklayoutHandler.findDrucklayoutsByCustomer(
      session,
      customerId: customerId,
      sessionId: sessionId,
      sort: sort,
      filter: filter,
    );
  }

  /// Fetches Drucklayouts associated with a specific artwork in a sales order
  Future<List<DrucklayoutDTO>> fetchByArtworkAndSalesOrder(
    Session session, {
    required int salesOrderId,
    required int artworkId,
  }) async {
    return DrucklayoutHandler.fetchDrucklayoutsByArtwork(
      session,
      salesOrderId: salesOrderId,
      artworkId: artworkId,
    );
  }

  /// * Streams *

  /// Watches updates for a single Drucklayout
  /// Watch changes to a specific drucklayout
  Stream<DrucklayoutDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    yield* DrucklayoutHandler.watchEntity(
      session,
      sessionId: sessionId,
      entityId: entityId,
    );
  }

  /// Watches Drucklayouts by Sales Order
  Stream<DrucklayoutDTO> watchBySalesOrder(
    Session session, {
    required int salesOrderId,
  }) async* {
    // Watch for changes in the junction table and related Drucklayouts
    yield* drucklayoutStreamController.stream
        .asyncMap((drucklayout) async {
          // Check if this Drucklayout is related to the sales order
          final junctionEntries = await DrucklayoutSalesOrderJT.db.find(
            session,
            where: (jt) =>
                jt.salesOrderId.equals(salesOrderId) &
                jt.drucklayoutId.equals(drucklayout.id),
          );

          if (junctionEntries.isNotEmpty) {
            // Fetch the entity with includes to ensure relations are populated
            final entityWithIncludes = await DrucklayoutHandler.fetchById(
              session,
              drucklayout.id!,
              null,
            );
            return entityWithIncludes;
          }
          return null;
        })
        .where((drucklayout) => drucklayout != null)
        .cast<DrucklayoutDTO>();
  }

  /// Watches Drucklayouts by Customer
  Stream<DrucklayoutDTO> watchByCustomer(
    Session session, {
    required int customerId,
  }) async* {
    // Watch for changes and filter by customerId
    yield* drucklayoutStreamController.stream
        .where((drucklayout) => drucklayout.customerId == customerId)
        .asyncMap((drucklayout) async {
      // Fetch the entity with includes to ensure relations are populated
      final entityWithIncludes =
          await DrucklayoutHandler.fetchById(session, drucklayout.id!, null);
      return entityWithIncludes!;
    });
  }

  /// * Other *

  /// Releases a Drucklayout
  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await DrucklayoutHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Finds all locked entities for Drucklayout
  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    return DrucklayoutHandler.findEntityLocks(session);
  }

  /// Assigns Nutzenlayouts to a Drucklayout in a Sales Order
  Future<void> assignNutzenlayouts(
    Session session, {
    required String sessionId,
    required int drucklayoutId,
    required int salesOrderId,
    required Set<int> nutzenlayoutIds,
  }) async {
    await DrucklayoutHandler.assignNutzenlayouts(
      session,
      sessionId: sessionId,
      drucklayoutId: drucklayoutId,
      salesOrderId: salesOrderId,
      nutzenlayoutIds: nutzenlayoutIds,
    );
  }

  /// Fetches all Nutzenlayouts assigned to a Drucklayout in a Sales Order
  Future<
      ({
        List<SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts,
        List<SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts,
      })> fetchAssignedNutzenlayouts(
    Session session, {
    required int drucklayoutId,
    required int salesOrderId,
  }) async {
    return DrucklayoutHandler.fetchAssignedNutzenlayouts(
      session,
      drucklayoutId: drucklayoutId,
      salesOrderId: salesOrderId,
    );
  }
}
