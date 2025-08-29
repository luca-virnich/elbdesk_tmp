import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';

extension SalesOrderItemExt on SalesOrderItem {}

extension SalesOrderItemListExt on List<SalesOrderItem> {
  List<SalesOrderItem> get ordered {
    final prepareArtworkItems =
        where((item) => item.type == SalesOrderItemType.prepareArtwork)
            .toList();
    final requestApprovalItems =
        where((item) => item.type == SalesOrderItemType.requestArtworkApproval)
            .toList();
    final consultingItems =
        where((item) => item.type == SalesOrderItemType.consulting).toList();
    final otherItems = where(
      (item) =>
          item.type != SalesOrderItemType.prepareArtwork &&
          item.type != SalesOrderItemType.requestArtworkApproval &&
          item.type != SalesOrderItemType.consulting,
    ).toList();

    return [
      ...prepareArtworkItems,
      ...requestApprovalItems,
      ...consultingItems,
      ...otherItems,
    ];
  }
}
