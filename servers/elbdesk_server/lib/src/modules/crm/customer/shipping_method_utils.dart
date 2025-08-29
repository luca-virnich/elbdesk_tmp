import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ShippingMethodUtils {
  static const tableType = TableType.shippingMethod;

  static Expression<dynamic>? buildExpression(
    Filter? filter,
  ) {
    return buildFilterExpression<ShippingMethodDTOTable, ShippingMethodField>(
      table: ShippingMethodDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => ShippingMethodField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(ShippingMethodDTOTable) orderBy(
    ShippingMethodField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(ShippingMethodField.code);
    }
    return dbFieldFromEnum(sortField);
  }

  static Column<dynamic> Function(ShippingMethodDTOTable) dbFieldFromEnum(
    ShippingMethodField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case ShippingMethodField.code:
        return (ShippingMethodDTOTable t) => t.code;
      case ShippingMethodField.id:
        return (ShippingMethodDTOTable t) => t.id;
      case ShippingMethodField.description:
        return (ShippingMethodDTOTable t) => t.description;
      case ShippingMethodField.isActive:
        return (ShippingMethodDTOTable t) => t.isActive;
      case ShippingMethodField.createdAt:
        return (ShippingMethodDTOTable t) => t.createdAt;
      case ShippingMethodField.createdBy:
        return (ShippingMethodDTOTable t) => t.createdById;
      case ShippingMethodField.lastModifiedAt:
        return (ShippingMethodDTOTable t) => t.lastModifiedAt;
      case ShippingMethodField.lastModifiedBy:
        return (ShippingMethodDTOTable t) => t.lastModifiedById;
      case ShippingMethodField.deletedAt:
        return (ShippingMethodDTOTable t) => t.deletedAt;
      case ShippingMethodField.isDraft:
        return (ShippingMethodDTOTable t) => t.isDraft;
    }
  }

  static ShippingMethodDTO initialShippingMethod({
    required int userId,
    required DateTime now,
    required String sessionId,
    required ShippingMethodDTO entity,
    required bool release,
  }) {
    return ShippingMethodDTO(
      code: entity.code,
      description: entity.description,
      isActive: entity.isActive,
      createdAt: now,
      isDraft: false,
      createdById: userId,
      editingSince: null,
      editingById: null,
      deletedAt: null,
      deletedById: null,
      lastModifiedAt: null,
      lastModifiedById: null,
      editingSession: release ? null : sessionId,
    );
  }
}
