import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SoiConsultingUtils {
  const SoiConsultingUtils._();

  static const tableType = TableType.soiConsulting;

  static final tableInSalesOrderInclude = SoiConsultingDTO.include(
    salesOrderItem: SalesOrderItemDTO.include(),
  );

  static SoiConsultingDTOInclude get includeAll => SoiConsultingDTO.include(
        salesOrderItem: SalesOrderItemDTO.include(
          salesOrder: SalesOrderDTO.include(
            customer: CustomerDTO.include(
              contact: ContactDTO.include(),
            ),
          ),
          assignedUser: LightUserDTO.include(),
        ),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<SoiConsultingDTOTable, SoiConsultingField>(
      table: SoiConsultingDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          SoiConsultingField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(SoiConsultingDTOTable) orderBy(
    SoiConsultingField? sortByField,
  ) {
    if (sortByField == null) {
      return dbFieldFromEnum(SoiConsultingField.createdAt);
    }
    return dbFieldFromEnum(sortByField);
  }

  static Column<dynamic> Function(SoiConsultingDTOTable) dbFieldFromEnum(
    SoiConsultingField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case SoiConsultingField.assignedUser:
        return (SoiConsultingDTOTable t) => t.id;
      case SoiConsultingField.createdAt:
        return (SoiConsultingDTOTable t) => t.createdAt;
      case SoiConsultingField.salesOrderItemId:
        return (SoiConsultingDTOTable t) => t.salesOrderItem.id;

      case SoiConsultingField.createdBy:
        return (SoiConsultingDTOTable t) => t.createdById;
      case SoiConsultingField.lastModifiedBy:
        return (SoiConsultingDTOTable t) => t.lastModifiedById;
      case SoiConsultingField.deletedAt:
        return (SoiConsultingDTOTable t) => t.deletedAt;
      case SoiConsultingField.isDraft:
        return (SoiConsultingDTOTable t) => t.isDraft;
      case SoiConsultingField.lastModifiedAt:
        return (SoiConsultingDTOTable t) => t.lastModifiedAt;
      case SoiConsultingField.salesOrderId:
        return (SoiConsultingDTOTable t) => t.salesOrderItem.salesOrder.id;
      case SoiConsultingField.description:
        return (SoiConsultingDTOTable t) => t.salesOrderItem.description;
      case SoiConsultingField.billableTime:
        return (SoiConsultingDTOTable t) => t.salesOrderItem.billableTime;
    }
  }

  static SoiConsultingDTO initialSoiConsulting({
    required int userId,
    required DateTime now,
    required int salesOrderId,
    required int salesOrderItemId,
  }) {
    return SoiConsultingDTO(
      createdAt: now,
      createdById: userId,
      isDraft: false,
      salesOrderItemId: salesOrderItemId,
      text: '',
    );
  }
}
