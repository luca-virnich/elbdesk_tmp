import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/deeplink/deeplink_handler.dart';
import 'package:serverpod/serverpod.dart';

class DeeplinkEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<String?> getContactType(
    Session session, {
    required int contactId,
  }) async {
    return DeeplinkHandler.getContacType(session, contactId);
  }

  Future<int?> getArtworkCustomerId(
    Session session, {
    required int artworkId,
  }) async {
    return DeeplinkHandler.getArtworkCustomerId(session, artworkId);
  }

  Future<int?> getSalesOrderCustomerId(
    Session session, {
    required int salesOrderId,
  }) async {
    return DeeplinkHandler.getSalesOrderCustomerId(session, salesOrderId);
  }

  Future<(int? customerId, int? salesOrderId)> getSoiCustomerIdAndSalesOrderId(
    Session session, {
    required int soiTypePrimaryKey,
    required SalesOrderItemType soiType,
  }) async {
    return DeeplinkHandler.getSoiCustomerIdAndSalesOrderId(
      session,
      soiTypePrimaryKey,
      soiType,
    );
  }
}
