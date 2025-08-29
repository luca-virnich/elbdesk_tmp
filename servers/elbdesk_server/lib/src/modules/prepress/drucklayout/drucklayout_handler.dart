import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/drucklayout_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/endpoints/drucklayout_endpoint.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

/// Handler for Drucklayout
///
/// This class defines the business logic for the exposed endpoints in
/// DrucklayoutEndpoint.
///
/// It contains the logic for fetching, creating, updating, and deleting
/// Drucklayout entities
///
class DrucklayoutHandler {
  const DrucklayoutHandler._();

  /// * General CRUD *

  /// Creates a new Drucklayout entity
  static Future<DrucklayoutDTO> create(
    Session session, {
    required String sessionId,
    required bool release,
    required int? salesOrderId,
    required int? customerId,
    required int preSelectionId,
    required int selectionId,
  }) async {
    final (:createdEntity, :entityWithIncludes) =
        await session.db.transaction((transaction) async {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

      final entity = DrucklayoutUtils.initialDrucklayout(
        userId: userId,
        now: now,
        sessionId: sessionId,
        customerId: customerId,
        preSelectionId: preSelectionId,
        selectionId: selectionId,
      );

      final createdEntity = await GenericCrud.create(
        session,
        DrucklayoutDTO.db.insertRow(session, entity, transaction: transaction),
      );

      // Create junction table entry if salesOrderId is provided
      if (salesOrderId != null) {
        final junctionEntry = DrucklayoutSalesOrderJT(
          drucklayoutId: createdEntity.id!,
          salesOrderId: salesOrderId,
        );
        await DrucklayoutSalesOrderJT.db.insertRow(
          session,
          junctionEntry,
          transaction: transaction,
        );
      }

      // Fetch the entity with includes to ensure relations are populated
      final entityWithIncludes =
          await fetchById(session, createdEntity.id!, transaction);

      return (
        createdEntity: createdEntity,
        entityWithIncludes: entityWithIncludes
      );
    });

    // Add the entity with includes to the stream controller
    drucklayoutStreamController.add(entityWithIncludes!);
    return entityWithIncludes;
  }

  /// Updates a Drucklayout entity
  static Future<DrucklayoutDTO> update(
    Session session, {
    required DrucklayoutDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:updated) = await session.db.transaction((transaction) async {
      final updated = await GenericCrud.update(
        session,
        fetchById: fetchById,
        sessionId: sessionId,
        newEntity: entity,
        updateEntity: _updateRow,
        tableType: DrucklayoutUtils.tableType,
        streamController: drucklayoutStreamController,
        release: release,
        transaction: transaction,
      );

      return (updated: updated);
    });
    return updated;
  }

  /// Deletes a Drucklayout entity
  ///
  /// This soft deletes an entity by setting the deletedAt field to now()
  static Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return GenericCrud.markEntityAsDeleted<DrucklayoutDTO>(
      session,
      id: entityId,
      sessionId: sessionId,
      fetchWithoutRelations: _fetchWithoutRelations,
      updateRow: _updateRow,
      tableType: DrucklayoutUtils.tableType,
      streamController: drucklayoutStreamController,
    );
  }

  /// * Fetching *

  /// Fetches a single Drucklayout entity by id
  static Future<DrucklayoutDTO?> fetchById(
    Session session,
    int id,
    Transaction? transaction,
  ) async {
    return DrucklayoutDTO.db.findById(
      session,
      id,
      include: DrucklayoutUtils.includeAll,
      transaction: transaction,
    );
  }

  /// Fetches and locks a single Drucklayout entity by id
  ///
  /// The lock mechanism is implemented through the editSessionId of the entity
  static Future<DrucklayoutDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<DrucklayoutDTO>(
      session,
      id: id,
      tableType: DrucklayoutUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: fetchById,
      tableName: DrucklayoutDTOTable().tableName,
      streamController: drucklayoutStreamController,
    );
  }

  /// Finds all Drucklayout entities
  static Future<List<DrucklayoutDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = DrucklayoutField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    final expression = DrucklayoutUtils.buildExpression(filter);

    return DrucklayoutDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: DrucklayoutUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: DrucklayoutUtils.includeAll,
    );
  }

  /// Finds all Drucklayout entities by Customer with sorting and filtering
  static Future<List<DrucklayoutDTO>> findDrucklayoutsByCustomer(
    Session session, {
    required int customerId,
    required String sessionId,
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = DrucklayoutField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    // Create customer filter group that should always be applied
    final customerFilterGroup = FilterGroup(
      filters: [
        FilterField(
          fieldKey: DrucklayoutField.customerId.name,
          value: customerId.toString(),
          type: FilterType.equal,
          fieldType: FilterFieldType.number,
          uuid: const Uuid().v4(),
          filterOperator: FilterOperator.and,
        ),
      ],
      nextOperator: FilterOperator.and,
    );

    // Apply customer filter to existing filter or create new filter
    final customerFilter = filter?.copyWith(
          filterGroups: [...filter.filterGroups, customerFilterGroup],
        ) ??
        Filter(filterGroups: [customerFilterGroup]);

    final expression = DrucklayoutUtils.buildExpression(customerFilter);

    return DrucklayoutDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: DrucklayoutUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: DrucklayoutUtils.includeAll,
    );
  }

  /// Finds all Drucklayout entities by Sales Order Id
  static Future<List<DrucklayoutDTO>> fetchBySalesOrder(
    Session session,
    int salesOrderId,
  ) async {
    // Get Drucklayout IDs from the junction table
    final drucklayoutIds = await DrucklayoutSalesOrderJT.db.find(
      session,
      where: (jt) => jt.salesOrderId.equals(salesOrderId),
      include: DrucklayoutSalesOrderJT.include(
        drucklayout: DrucklayoutUtils.includeAll,
      ),
    );

    // Extract Drucklayout entities from the junction table results
    return drucklayoutIds
        .map((jt) => jt.drucklayout!)
        .where((drucklayout) => drucklayout.deletedAt == null)
        .toList();
  }

  /// Fetches a Drucklayout entity without relations
  static Future<DrucklayoutDTO?> _fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return DrucklayoutDTO.db.findById(session, id, transaction: transaction);
  }

  /// * Other *

  /// Releases a Drucklayout entity
  ///
  /// This clears the editingSessionId of the entity
  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<DrucklayoutDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: fetchById,
      updateEntity: _updateRow,
      tableType: DrucklayoutUtils.tableType,
      streamController: drucklayoutStreamController,
      deleteDraft: _deleteDraft,
    );
  }

  /// Finds all locked entities for Drucklayout
  static Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await DrucklayoutDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: DrucklayoutUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }

  /// Assigns Nutzenlayouts to a Drucklayout in a Sales Order
  static Future<void> assignNutzenlayouts(
    Session session, {
    required String sessionId,
    required int drucklayoutId,
    required int salesOrderId,
    required Set<int> nutzenlayoutIds,
  }) async {
    await session.db.transaction((transaction) async {
      // First, verify the Drucklayout exists
      final drucklayout = await DrucklayoutDTO.db.findById(
        session,
        drucklayoutId,
        transaction: transaction,
      );

      if (drucklayout == null) {
        throw ElbException(
          message: 'Drucklayout nicht gefunden',
          exceptionType: ElbExceptionType.validationFormError,
        );
      }

      // Check if the Drucklayout is already assigned to the Sales Order
      final drucklayoutSalesOrderJT =
          await DrucklayoutSalesOrderJT.db.findFirstRow(
        session,
        where: (jt) =>
            jt.drucklayoutId.equals(drucklayoutId) &
            jt.salesOrderId.equals(salesOrderId),
        transaction: transaction,
      );

      // If not assigned, create the assignment
      if (drucklayoutSalesOrderJT == null) {
        final newAssignment = DrucklayoutSalesOrderJT(
          drucklayoutId: drucklayoutId,
          salesOrderId: salesOrderId,
        );
        await DrucklayoutSalesOrderJT.db.insertRow(
          session,
          newAssignment,
          transaction: transaction,
        );
        session.log(
          'Assigned Drucklayout $drucklayoutId to Sales Order $salesOrderId',
        );
      }

      // Get all Single and Multi Nutzenlayouts for the sales order that match
      // the IDs
      final singleNutzenlayouts = await SalesOrderSingleNutzenlayoutDTO.db.find(
        session,
        where: (t) =>
            t.salesOrderId.equals(salesOrderId) &
            t.nutzenlayoutId.inSet(nutzenlayoutIds),
        transaction: transaction,
      );

      final multiNutzenlayouts = await SalesOrderMultiNutzenlayoutDTO.db.find(
        session,
        where: (t) =>
            t.salesOrderId.equals(salesOrderId) &
            t.nutzenlayoutId.inSet(nutzenlayoutIds),
        transaction: transaction,
      );

      // Verify that we found at least some Nutzenlayouts
      final totalFound = singleNutzenlayouts.length + multiNutzenlayouts.length;
      if (totalFound == 0) {
        throw ElbException(
          message:
              'None of the selected Nutzenlayouts were found in this order',
          exceptionType: ElbExceptionType.validationFormError,
        );
      }

      // Create junction entries for Single Nutzenlayouts
      for (final singleNutzenlayout in singleNutzenlayouts) {
        // Check if relationship already exists to avoid duplicates
        final existingJunction =
            await DrucklayoutSingleNutzenlayoutJT.db.findFirstRow(
          session,
          where: (jt) =>
              jt.drucklayoutId.equals(drucklayoutId) &
              jt.salesOrderSingleNutzenlayoutId.equals(singleNutzenlayout.id) &
              jt.salesOrderId.equals(salesOrderId),
          transaction: transaction,
        );

        if (existingJunction == null) {
          final junctionEntry = DrucklayoutSingleNutzenlayoutJT(
            drucklayoutId: drucklayoutId,
            salesOrderSingleNutzenlayoutId: singleNutzenlayout.id!,
            salesOrderId: salesOrderId,
          );
          await DrucklayoutSingleNutzenlayoutJT.db.insertRow(
            session,
            junctionEntry,
            transaction: transaction,
          );
        }
      }

      // Create junction entries for Multi Nutzenlayouts
      for (final multiNutzenlayout in multiNutzenlayouts) {
        // Check if relationship already exists to avoid duplicates
        final existingJunction =
            await DrucklayoutMultiNutzenlayoutJT.db.findFirstRow(
          session,
          where: (jt) =>
              jt.drucklayoutId.equals(drucklayoutId) &
              jt.salesOrderMultiNutzenlayoutId.equals(multiNutzenlayout.id) &
              jt.salesOrderId.equals(salesOrderId),
          transaction: transaction,
        );

        if (existingJunction == null) {
          final junctionEntry = DrucklayoutMultiNutzenlayoutJT(
            drucklayoutId: drucklayoutId,
            salesOrderMultiNutzenlayoutId: multiNutzenlayout.id!,
            salesOrderId: salesOrderId,
          );
          await DrucklayoutMultiNutzenlayoutJT.db.insertRow(
            session,
            junctionEntry,
            transaction: transaction,
          );
        }
      }

      // Log successful assignment
      session.log(
        'Successfully assigned ${singleNutzenlayouts.length} '
        'Single Nutzenlayouts and ${multiNutzenlayouts.length} '
        'Multi Nutzenlayouts to Drucklayout $drucklayoutId '
        'in Sales Order $salesOrderId',
      );
    });

    // Trigger stream update for the Drucklayout
    final updatedDrucklayout = await fetchById(session, drucklayoutId, null);
    if (updatedDrucklayout != null) {
      drucklayoutStreamController.add(updatedDrucklayout);
    }
  }

  /// Fetches all Nutzenlayouts assigned to a Drucklayout in a Sales Order
  static Future<
      ({
        List<SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts,
        List<SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts,
      })> fetchAssignedNutzenlayouts(
    Session session, {
    required int drucklayoutId,
    required int salesOrderId,
  }) async {
    // Get Single Nutzenlayouts assigned to this Drucklayout
    final singleJunctions = await DrucklayoutSingleNutzenlayoutJT.db.find(
      session,
      where: (jt) =>
          jt.drucklayoutId.equals(drucklayoutId) &
          jt.salesOrderId.equals(salesOrderId),
      include: DrucklayoutSingleNutzenlayoutJT.include(
        salesOrderSingleNutzenlayout: SalesOrderSingleNutzenlayoutDTO.include(
          nutzenlayout: NutzenlayoutDTO.include(),
          artworks: SalesOrderSingleNutzenlayoutArtworkJT.includeList(
            include: SalesOrderSingleNutzenlayoutArtworkJT.include(
              artwork: ArtworkDTO.include(),
            ),
          ),
        ),
      ),
    );

    // Get Multi Nutzenlayouts assigned to this Drucklayout
    final multiJunctions = await DrucklayoutMultiNutzenlayoutJT.db.find(
      session,
      where: (jt) =>
          jt.drucklayoutId.equals(drucklayoutId) &
          jt.salesOrderId.equals(salesOrderId),
      include: DrucklayoutMultiNutzenlayoutJT.include(
        salesOrderMultiNutzenlayout: SalesOrderMultiNutzenlayoutDTO.include(
          nutzenlayout: NutzenlayoutDTO.include(),
          artworks: SalesOrderMultiNutzenlayoutArtworkJT.includeList(
            include: SalesOrderMultiNutzenlayoutArtworkJT.include(
              artwork: ArtworkDTO.include(),
            ),
          ),
        ),
      ),
    );

    return (
      singleNutzenlayouts: singleJunctions
          .map((jt) => jt.salesOrderSingleNutzenlayout!)
          .toList(),
      multiNutzenlayouts:
          multiJunctions.map((jt) => jt.salesOrderMultiNutzenlayout!).toList(),
    );
  }

  /// Fetches Drucklayouts associated with a specific artwork in a sales order
  /// This method efficiently finds drucklayouts by following the relationship
  /// chain:
  /// Artwork -> SalesOrderNutzenlayout -> DrucklayoutNutzenlayoutJT
  /// -> Drucklayout
  static Future<List<DrucklayoutDTO>> fetchDrucklayoutsByArtwork(
    Session session, {
    required int salesOrderId,
    required int artworkId,
  }) async {
    // Find drucklayouts through single nutzenlayouts
    final singleDrucklayouts = await DrucklayoutSingleNutzenlayoutJT.db.find(
      session,
      where: (jt) =>
          jt.salesOrderId.equals(salesOrderId) &
          jt.salesOrderSingleNutzenlayout.artworks.any(
            (artwork) => artwork.artworkId.equals(artworkId),
          ),
      include: DrucklayoutSingleNutzenlayoutJT.include(
        drucklayout: DrucklayoutDTO.include(
          drucklayoutPreSelection: DrucklayoutPreSelectionDTO.include(),
          drucklayoutSelection: DrucklayoutSelectionDTO.include(),
        ),
      ),
    );

    // Find drucklayouts through multi nutzenlayouts
    final multiDrucklayouts = await DrucklayoutMultiNutzenlayoutJT.db.find(
      session,
      where: (jt) =>
          jt.salesOrderId.equals(salesOrderId) &
          jt.salesOrderMultiNutzenlayout.artworks.any(
            (artwork) => artwork.artworkId.equals(artworkId),
          ),
      include: DrucklayoutMultiNutzenlayoutJT.include(
        drucklayout: DrucklayoutDTO.include(
          drucklayoutPreSelection: DrucklayoutPreSelectionDTO.include(),
          drucklayoutSelection: DrucklayoutSelectionDTO.include(),
        ),
      ),
    );

    // Combine and deduplicate drucklayouts
    final allDrucklayouts = <DrucklayoutDTO>[];
    final seenIds = <int>{};

    // Add single drucklayouts
    for (final junction in singleDrucklayouts) {
      final drucklayout = junction.drucklayout!;
      if (!seenIds.contains(drucklayout.id)) {
        allDrucklayouts.add(drucklayout);
        seenIds.add(drucklayout.id!);
      }
    }

    // Add multi drucklayouts (avoiding duplicates)
    for (final junction in multiDrucklayouts) {
      final drucklayout = junction.drucklayout!;
      if (!seenIds.contains(drucklayout.id)) {
        allDrucklayouts.add(drucklayout);
        seenIds.add(drucklayout.id!);
      }
    }

    return allDrucklayouts;
  }

  /// * Streams *

  /// Watches updates for a single Drucklayout entity
  /// Watch changes to a specific drucklayout
  static Stream<DrucklayoutDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    // Yield initial entity if it exists
    final initialEntity = await fetchById(session, entityId, null);
    if (initialEntity != null) {
      yield initialEntity;
    }

    yield* drucklayoutStreamController.stream
        .where((event) => event.id == entityId)
        .asyncMap((event) async {
      // Fetch the entity with includes to ensure relations are populated
      final entityWithIncludes = await fetchById(session, event.id!, null);
      return entityWithIncludes!;
    });
  }

  /// * Private *

  /// Updates a Drucklayout entity
  static Future<DrucklayoutDTO> _updateRow(
    Session session,
    DrucklayoutDTO entity,
    Transaction transaction,
  ) async {
    return DrucklayoutDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  /// Deletes a draft Drucklayout entity
  static Future<DrucklayoutDTO?> _deleteDraft(
    Session session,
    DrucklayoutDTO entity,
    Transaction transaction,
  ) async {
    return DrucklayoutDTO.db.deleteRow(
      session,
      entity,
      transaction: transaction,
    );
  }
}
