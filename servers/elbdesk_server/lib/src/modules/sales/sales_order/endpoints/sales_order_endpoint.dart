import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/spotlight/spotlight_constants.dart';
import 'package:elbdesk_server/src/modules/sales/sales_order/sales_order_handler.dart';
import 'package:elbdesk_server/src/modules/sales/sales_order/sales_order_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final salesOrderStreamController = StreamController<SalesOrderDTO>.broadcast();

/// Sales Order Endpoint
///
/// Handles all the endpoint methods for the Sales Order entity
class SalesOrderEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<SalesOrderDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* salesOrderStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) => event);
  }

  /// Create a new sales order
  ///
  /// Creates a new sales order with the given customer ID
  ///
  /// [sessionId] The session ID of the current user window
  /// [customerId] The ID of the customer to create the sales order for
  Future<SalesOrderDTO> create(
    Session session, {
    required String? sessionId,
    required int? customerId,
  }) async {
    return SalesOrderHandler.create(
      session,
      sessionId: sessionId,
      customerId: customerId,
    );
  }

  /// Fetch a single sales order by ID
  Future<SalesOrderDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return SalesOrderDTO.db.findById(
      session,
      id,
      include: SalesOrderUtils.includeAll,
    );
  }

  /// Find a list of SalesOrders for Spotlight search
  /// Items will be returned wrapped as a SpotlightItem
  ///
  /// It checks the query for a valid Sales Order ID first
  /// If no valid Sales Order ID is found it will also check if the query
  /// contains a valid Customer Name
  /// -> It then returns SalesOrder related to this Customer
  Future<List<SpotlightItem>> findSpotlight(
    Session session, {
    required String query,
  }) async {
    // Check if the query is a valid Sales Order ID
    final parsedSalesOrderId = extractCustomIdInt(query);

    // If the query is a valid int, the user is probably searching for a
    // specific SalesOrder by its customId:
    if (parsedSalesOrderId != null) {
      // Fetch the Sales Order by ID
      final salesOrders = await SalesOrderDTO.db.find(
        session,
        where: (t) => t.customIdString.ilike('%$parsedSalesOrderId%'),
        include: SalesOrderDTO.include(
          customer: CustomerDTO.include(
            contact: ContactDTO.include(),
          ),
        ),
        limit: SpotlightConstants.spotlightLimit,
      );

      // Map the Sales Order to a SpotlightItem
      final spotlightItems = salesOrders.map(
        (e) => SpotlightItem(
          primaryKey: e.id!,
          title: 'VA-${e.customId}',
          description: e.customer?.contact?.fullName ?? '',
          type: SpotlightType.salesOrder,
        ),
      );
      return spotlightItems.toList();
    }

    // If no valid Sales Order ID is found it will also check if the query
    // contains a valid Customer Name
    // -> It then returns SalesOrder related to this Customer
    final salesOrders = await SalesOrderDTO.db.find(
      session,
      where: (t) => t.customer.contact.fullName.ilike('%$query%'),
      orderBy: (t) => t.customId,
      orderDescending: true,
      include: SalesOrderDTO.include(
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
      ),
      limit: SpotlightConstants.spotlightLimit,
    );
    final spotlightItems = salesOrders.map(
      (e) => SpotlightItem(
        primaryKey: e.id!,
        title: 'VA-${e.customId}',
        description: e.customer?.contact?.fullName ?? '',
        type: SpotlightType.salesOrder,
      ),
    );
    return spotlightItems.toList();
  }

  /// Extracts the numeric part from a customId string like "VA-1234567".
  /// Returns the int if possible, otherwise null.
  int? extractCustomIdInt(String query) {
    // Try parsing directly
    final direct = int.tryParse(query);
    if (direct != null) return direct;

    // Remove "VA-" prefix (case-insensitive), trim, and try again
    final cleaned =
        query.replaceFirst(RegExp('^VA-', caseSensitive: false), '').trim();
    return int.tryParse(cleaned);
  }

  /// Find a list of SalesOrders for a given filter
  ///
  /// It will also handle the sorting and filtering of the SalesOrders
  ///
  /// [sort] The sorting of the SalesOrders
  /// [filter] The filter of the SalesOrders
  Future<List<SalesOrderDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = SalesOrderField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = SalesOrderUtils.buildExpression(filter);
    return SalesOrderDTO.db.find(
      session,
      where: expression == null
          ? (t) => t.deletedAt.equals(null as DateTime?)
          : (t) => expression & t.deletedAt.equals(null as DateTime?),
      orderBy: SalesOrderUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? true,
      include: SalesOrderUtils.includeAll,
    );
  }

  Future<List<SalesOrderDTO>> findByCustomerId(
    Session session, {
    required int customerId,
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = SalesOrderField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    session.log('findByCustomerId: $customerId');
    session.log('filter: $filter');

    final customerFilter = SalesOrderDTOTable().customerId.equals(customerId);

    final expression = SalesOrderUtils.buildExpression(filter);

    return SalesOrderDTO.db.find(
      session,
      where: expression == null
          ? (t) => customerFilter
          : (t) => expression & customerFilter,
      orderBy: SalesOrderUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? true,
      include: SalesOrderUtils.includeAll,
    );
  }

  /// Fetch and lock a single sales order by ID
  ///
  /// [id] The ID of the sales order to fetch and lock
  /// [editingSessionId] The ID of the editing session of the window
  Future<SalesOrderDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return SalesOrderHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  /// Update a sales order
  ///
  /// [entity] The sales order with the updated values
  /// [sessionId] The session ID of the current user window
  /// [release] Whether to release the sales order after updating
  Future<SalesOrderDTO> update(
    Session session, {
    required SalesOrderDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return SalesOrderHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  /// Release a sales order for editing
  ///
  /// [entityId] The ID of the sales order to release
  /// [sessionId] The session ID of the current user window
  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return SalesOrderHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Delete a sales order
  ///
  /// [entityId] The ID of the sales order to delete
  /// [sessionId] The session ID of the current user window
  Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return SalesOrderHandler.delete(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Find all entity locks for a sales order
  /// Means all SalesOrders that are currently being edited by another user or
  /// were left in that state through app errors or crashes
  ///
  /// [session] The session to find the entity locks for
  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await SalesOrderDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: SalesOrderUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
