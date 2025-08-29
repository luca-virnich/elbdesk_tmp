import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';

class SalesOrderItemUtils {
  const SalesOrderItemUtils._();

  static SalesOrderItemStatus getSalesOrderItemStatus(String statusString) {
    return SalesOrderItemStatus.values.firstWhere(
      (status) => status.name == statusString,
      orElse: () => SalesOrderItemStatus.preperation,
    );
  }

  static SalesOrderItemDTOInclude get includeAll => SalesOrderItemDTO.include(
        salesOrder: SalesOrderDTO.include(),
        assignedUser: LightUserDTO.include(),
      );
}
