import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Sales Order Repository
///
/// Defines all the methods to interact with the Sales Order Endpoint
class SalesOrderRepository implements EntityRepository<SalesOrder> {
  /// Sales Order Repository constructor
  SalesOrderRepository({
    required this.ref,
    required this.endpoint,
  });

  /// Riverpod Ref
  final Ref ref;

  /// Serverpod Endpoint
  final EndpointSalesOrder endpoint;

  /// Create a new sales order with basic initialization
  Future<int> create({
    required String sessionId,
    required int? customerId,
  }) async {
    final newSalesOrder = await endpoint.create(
      sessionId: sessionId,
      customerId: customerId,
    );
    return newSalesOrder.id!;
  }

  @override
  Future<SalesOrder> createAndReturnEntity({
    required String sessionId,
    required SalesOrder entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    return endpoint.delete(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  Future<List<SalesOrder>> fetchAll() async {
    final salesOrders = await endpoint.find();
    return salesOrders.map(SalesOrder.fromDTO).toList();
  }

  @override
  Future<SalesOrder> fetchById(int id) async {
    final salesOrder = await endpoint.fetchById(id);
    return SalesOrder.fromDTO(salesOrder!);
  }

  @override
  Future<List<SalesOrder>> find({Sort? sort, Filter? filter}) async {
    final salesOrders = await endpoint.find(
      sort: sort,
      filter: filter,
    );
    return salesOrders.map(SalesOrder.fromDTO).toList();
  }

  Future<List<SalesOrder>> findByCustomerId(
    int customerId, {
    Sort? sort,
    Filter? filter,
  }) async {
    final salesOrders = await endpoint.findByCustomerId(
      customerId: customerId,
      sort: sort,
      filter: filter,
    );
    return salesOrders.map(SalesOrder.fromDTO).toList();
  }

  @override
  Future<SalesOrder?> fetchAndLock(int entityId, String sessionId) async {
    final salesOrder = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return salesOrder != null ? SalesOrder.fromDTO(salesOrder) : null;
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  Future<SalesOrder> update({
    required SalesOrder entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedSalesOrder = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return SalesOrder.fromDTO(updatedSalesOrder);
  }

  Future<List<SpotlightItem>> findSpotlight(String query) async {
    final salesOrders = await endpoint.findSpotlight(
      query: query,
    );
    return salesOrders;
  }
}
