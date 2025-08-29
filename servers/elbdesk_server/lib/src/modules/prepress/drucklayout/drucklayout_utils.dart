import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

/// Utils for Drucklayout
///
/// This class defines util methods for the Drucklayout entity.
///
/// It contains the logic for building expressions, ordering, and initializing
/// entities.
///
class DrucklayoutUtils {
  const DrucklayoutUtils._();

  /// Table type
  static const tableType = TableType.drucklayout;

  /// Include all fields
  static DrucklayoutDTOInclude get includeAll => DrucklayoutDTO.include(
        customer: CustomerDTO.include(),
        drucklayoutPreSelection: DrucklayoutPreSelectionDTO.include(),
        drucklayoutSelection: DrucklayoutSelectionDTO.include(),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    final expression =
        buildFilterExpression<DrucklayoutDTOTable, DrucklayoutField>(
      table: DrucklayoutDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          DrucklayoutField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  /// Order by field
  static Column<dynamic> Function(DrucklayoutDTOTable) orderBy(
    DrucklayoutField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(DrucklayoutField.title);
    }
    return dbFieldFromEnum(sortField);
  }

  /// Get the database field from the enum
  static Column<dynamic> Function(DrucklayoutDTOTable) dbFieldFromEnum(
    DrucklayoutField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case DrucklayoutField.id:
        return (DrucklayoutDTOTable t) => t.id;
      case DrucklayoutField.title:
        return (DrucklayoutDTOTable t) => t.title;
      case DrucklayoutField.description:
        return (DrucklayoutDTOTable t) => t.description;
      case DrucklayoutField.customerId:
        return (DrucklayoutDTOTable t) => t.customerId;
      case DrucklayoutField.drucklayoutPreSelection:
        return (DrucklayoutDTOTable t) => t.drucklayoutPreSelectionId;
      case DrucklayoutField.drucklayoutSelection:
        return (DrucklayoutDTOTable t) => t.drucklayoutSelectionId;
      case DrucklayoutField.createdAt:
        return (DrucklayoutDTOTable t) => t.createdAt;
      case DrucklayoutField.createdBy:
        return (DrucklayoutDTOTable t) => t.createdById;
      case DrucklayoutField.lastModifiedAt:
        return (DrucklayoutDTOTable t) => t.lastModifiedAt;
      case DrucklayoutField.lastModifiedBy:
        return (DrucklayoutDTOTable t) => t.lastModifiedById;
      case DrucklayoutField.isDraft:
        return (DrucklayoutDTOTable t) => t.isDraft;
      case DrucklayoutField.deletedAt:
        return (DrucklayoutDTOTable t) => t.deletedAt;
    }
  }

  /// Initializes a new empty Drucklayout entity
  static DrucklayoutDTO initialDrucklayout({
    required int userId,
    required String sessionId,
    required DateTime now,
    required int? customerId,
    required int preSelectionId,
    required int selectionId,
  }) {
    return DrucklayoutDTO(
      title: '',
      customerId: customerId,
      description: '',
      createdAt: now,
      createdById: userId,
      isDraft: true,
      drucklayoutPreSelectionId: preSelectionId,
      drucklayoutSelectionId: selectionId,
    );
  }

  /// Get the log fields for the Drucklayout entity
  static List<LogField<DrucklayoutDTO>> getLogFields() {
    return DrucklayoutField.values
        .map((field) {
          switch (field) {
            case DrucklayoutField.id:
              return LogField<DrucklayoutDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.id?.toString() ?? '',
              );
            case DrucklayoutField.title:
              return LogField<DrucklayoutDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.title,
              );
            case DrucklayoutField.description:
              return LogField<DrucklayoutDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.description ?? '',
              );
            case DrucklayoutField.customerId:
            case DrucklayoutField.drucklayoutPreSelection:
            case DrucklayoutField.drucklayoutSelection:
            case DrucklayoutField.createdAt:
            case DrucklayoutField.createdBy:
            case DrucklayoutField.lastModifiedAt:
            case DrucklayoutField.lastModifiedBy:
            case DrucklayoutField.isDraft:
            case DrucklayoutField.deletedAt:
              return null;
          }
        })
        .whereType<LogField<DrucklayoutDTO>>()
        .toList();
  }
}
