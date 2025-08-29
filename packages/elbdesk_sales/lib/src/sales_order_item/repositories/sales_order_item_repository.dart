import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';

class SalesOrderItemRepository {
  SalesOrderItemRepository({
    required this.endpoint,
  });

  final EndpointSalesOrderItem endpoint;

  Future<List<SalesOrderItem>> fetchSalesOrderItems(int salesOrderId) async {
    final items = await endpoint.findBySalesOrder(
      salesOrderId: salesOrderId,
    );
    return items.map(SalesOrderItem.fromDTO).toList();
  }

  Future<List<SalesOrderItem>> find({
    Sort? sort,
    Filter? filter,
  }) async {
    final items = await endpoint.find(
      sort: sort,
      filter: filter,
    );

    return items.map(SalesOrderItem.fromDTO).toList();
  }

  //findByArtworkId
  Future<List<SalesOrderItem>> findByArtworkId(int artworkId) async {
    final items = await endpoint.fetchByArtworkId(artworkId: artworkId);
    return items.map(SalesOrderItem.fromDTO).toList();
  }
}
