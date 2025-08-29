import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class DeeplinkHandler {
  const DeeplinkHandler._();
  static Future<String?> getContacType(
    Session session,
    int contactId,
  ) async {
    final contact = await ContactDTO.db.findById(session, contactId);
    if (contact == null) return null;
    return contact.type;
  }

  static Future<int?> getArtworkCustomerId(
    Session session,
    int artworkId,
  ) async {
    final artwork = await ArtworkDTO.db.findById(
      session,
      artworkId,
      include: ArtworkDTO.include(
        customer: CustomerDTO.include(),
      ),
    );
    if (artwork == null) return null;
    return artwork.customer!.id!;
  }

  static Future<int?> getSalesOrderCustomerId(
    Session session,
    int salesOrderId,
  ) async {
    final salesOrder = await SalesOrderDTO.db.findById(
      session,
      salesOrderId,
      include: SalesOrderDTO.include(
        customer: CustomerDTO.include(),
      ),
    );
    if (salesOrder == null) return null;
    return salesOrder.customer!.id!;
  }

  static Future<(int? customerId, int? salesOrderId)>
      getSoiCustomerIdAndSalesOrderId(
    Session session,
    int soiTypePrimaryKey,
    SalesOrderItemType soiType,
  ) async {
    final soi = await SalesOrderItemDTO.db.findFirstRow(
      session,
      where: (t) =>
          t.type.equals(soiType.name) &
          t.soiTypePrimaryKey.equals(soiTypePrimaryKey),
      include: SalesOrderItemDTO.include(
        salesOrder: SalesOrderDTO.include(
          customer: CustomerDTO.include(),
        ),
      ),
    );
    if (soi == null) {
      return (null, null);
    }
    return (soi.salesOrder!.customer!.id, soi.salesOrder!.id);
  }
}
