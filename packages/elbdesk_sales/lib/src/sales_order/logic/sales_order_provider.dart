import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/sales_order/repositories/sales_order_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sales_order_provider.g.dart';

/// Fetch Sales Orders Provider
///
/// This provider is used to fetch a list of Sales Orders from the server.
///
/// The sessionId is needed to differentiate between different tables. One
/// table could have filters enabled and another one not. The sessionId is used
/// to be able to fetch both lists with the same provider.
///
@riverpod
Future<List<SalesOrder>> findSalesOrders(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.salesOrder.name,
    ),
  );

  final repo = ref.watch(salesOrderRepositoryProvider);

  return repo.find(sort: sort, filter: filter);
}

@riverpod
Future<List<SalesOrder>> findSalesOrdersByCustomerId(
  Ref ref,
  String sessionId,
  int customerId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.salesOrderByCustomer.name,
    ),
  );

  final repo = ref.watch(salesOrderRepositoryProvider);

  return repo.findByCustomerId(customerId, sort: sort, filter: filter);
}

@riverpod
Future<List<SpotlightItem>> findSalesOrdersSpotlight(
  Ref ref,
  String query,
) async {
  final repo = ref.watch(salesOrderRepositoryProvider);
  final items = await repo.findSpotlight(query);
  return items;
}

/// Fetch Sales Order Provider
///
/// This provider is used to fetch a single Sales Order from the server.
///
/// The sessionId is needed to differentiate between different opened cards with
/// the same SalesOrder. Only the first one to fetch the SalesOrder is able
/// to edit it.
@riverpod
Future<SalesOrder?> fetchSalesOrder(
  Ref ref,
  int id,
  String sessionId,
) async {
  final repo = ref.watch(salesOrderRepositoryProvider);
  return repo.fetchAndLock(id, sessionId);
}

/// Fetch Sales Order Repository Provider
@riverpod
SalesOrderRepository salesOrderRepository(Ref ref) {
  return SalesOrderRepository(
    ref: ref,
    endpoint: serverpodClient.salesOrder,
  );
}

@riverpod
Stream<SalesOrder> watchSalesOrder(
  Ref ref, {
  required String sessionId,
  required int salesOrderId,
}) async* {
  final streamHelper = ServerpodStreamManager<SalesOrder, SalesOrderDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.salesOrder.watch(
      sessionId: sessionId,
      entityId: salesOrderId,
    ),
    convertDtoToModel: SalesOrder.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamSalesOrder: $error');
    },
  );
}
