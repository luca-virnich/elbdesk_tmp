import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/drucklayout/models/drucklayout.dart';

/// Repository for managing Drucklayout entities
class DrucklayoutRepository implements EntityRepository<Drucklayout> {
  DrucklayoutRepository({
    required this.endpoint,
  });

  /// Serverpod Endpoint
  final EndpointDrucklayout endpoint;

  /// * General CRUD *

  /// Create a new empty drucklayout entity
  Future<int> create({
    required String sessionId,
    required int? salesOrderId,
    required int? customerId,
    required bool release,
    required int preSelectionId,
    required int selectionId,
  }) async {
    final newEntity = await endpoint.create(
      sessionId: sessionId,
      release: release,
      salesOrderId: salesOrderId,
      customerId: customerId,
      preSelectionId: preSelectionId,
      selectionId: selectionId,
    );
    return newEntity.id!;
  }

  /// Create a new drucklayout entity
  @override
  Future<Drucklayout> createAndReturnEntity({
    required String sessionId,
    required Drucklayout entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  /// Update a drucklayout entity
  @override
  Future<Drucklayout> update({
    required Drucklayout entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedItem = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return Drucklayout.fromDTO(updatedItem);
  }

  /// Delete a drucklayout entity
  @override
  Future<bool> delete(int entityId, String sessionId) async {
    return endpoint.delete(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// * Fetching *

  /// Fetch all drucklayout entities
  @override
  Future<List<Drucklayout>> fetchAll() async {
    final items = await endpoint.find();
    return items.map(Drucklayout.fromDTO).toList();
  }

  /// Fetch a drucklayout entity by id
  @override
  Future<Drucklayout> fetchById(int id) async {
    final item = await endpoint.fetchById(id);
    return Drucklayout.fromDTO(item!);
  }

  /// Fetch a drucklayout entity by id
  @override
  Future<List<Drucklayout>> find({Sort? sort, Filter? filter}) async {
    final items = await endpoint.find(
      sort: sort,
      filter: filter,
    );
    return items.map(Drucklayout.fromDTO).toList();
  }

  /// Fetch Drucklayouts by Sales Order
  Future<List<Drucklayout>> fetchBySalesOrder(int salesOrderId) async {
    final items = await endpoint.fetchBySalesOrder(salesOrderId);
    return items.map(Drucklayout.fromDTO).toList();
  }

  /// Fetch Drucklayouts associated with a specific artwork in a sales order
  Future<List<Drucklayout>> fetchByArtworkAndSalesOrder({
    required int salesOrderId,
    required int artworkId,
  }) async {
    final items = await endpoint.fetchByArtworkAndSalesOrder(
      salesOrderId: salesOrderId,
      artworkId: artworkId,
    );
    return items.map(Drucklayout.fromDTO).toList();
  }

  /// Fetch a drucklayout entity by id
  /// and lock it for editing
  @override
  Future<Drucklayout?> fetchAndLock(
    int entityId,
    String sessionId,
  ) async {
    final item = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return item != null ? Drucklayout.fromDTO(item) : null;
  }

  /// * Other *

  /// Release a drucklayout entity
  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Assign Nutzenlayouts to a Drucklayout in a Sales Order
  Future<void> assignNutzenlayouts({
    required String sessionId,
    required int drucklayoutId,
    required int salesOrderId,
    required Set<int> nutzenlayoutIds,
  }) async {
    await endpoint.assignNutzenlayouts(
      sessionId: sessionId,
      drucklayoutId: drucklayoutId,
      salesOrderId: salesOrderId,
      nutzenlayoutIds: nutzenlayoutIds,
    );
  }

  /// Fetch all Nutzenlayouts assigned to a Drucklayout in a Sales Order
  Future<
      ({
        List<SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts,
        List<SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts,
      })> fetchAssignedNutzenlayouts({
    required int drucklayoutId,
    required int salesOrderId,
  }) async {
    return endpoint.fetchAssignedNutzenlayouts(
      drucklayoutId: drucklayoutId,
      salesOrderId: salesOrderId,
    );
  }

  /// Find Drucklayouts by Customer with sorting and filtering
  Future<List<Drucklayout>> findDrucklayoutsByCustomer({
    required int customerId,
    required String sessionId,
    Sort? sort,
    Filter? filter,
  }) async {
    final items = await endpoint.findDrucklayoutsByCustomer(
      customerId: customerId,
      sessionId: sessionId,
      sort: sort,
      filter: filter,
    );
    return items.map(Drucklayout.fromDTO).toList();
  }
}
