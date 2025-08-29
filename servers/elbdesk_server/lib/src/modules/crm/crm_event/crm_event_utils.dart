import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class CrmEventUtils {
  static const tableType = TableType.crmEvent;

  static CrmEventDTOInclude get includeAll => CrmEventDTO.include(
        contacts: CrmEventContactJT.includeList(
          include: CrmEventContactJT.include(
            contact: ContactDTO.include(),
          ),
        ),
      );

  static Expression<dynamic>? buildExpression(
    Filter? filter,
  ) {
    return buildFilterExpression<CrmEventDTOTable, CrmEventField>(
      table: CrmEventDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          CrmEventField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(CrmEventDTOTable) orderBy(
    CrmEventField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(CrmEventField.startDate);
    }
    return dbFieldFromEnum(sortField);
  }

  static Column<dynamic> Function(CrmEventDTOTable) dbFieldFromEnum(
    CrmEventField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case CrmEventField.name:
        return (CrmEventDTOTable t) => t.name;
      case CrmEventField.description:
        return (CrmEventDTOTable t) => t.description;
      case CrmEventField.startDate:
        return (CrmEventDTOTable t) => t.startDate;
      case CrmEventField.endDate:
        return (CrmEventDTOTable t) => t.endDate;
      case CrmEventField.executionDate:
        return (CrmEventDTOTable t) => t.executionDate;
      case CrmEventField.status:
        return (CrmEventDTOTable t) => t.status;
      case CrmEventField.id:
        return (CrmEventDTOTable t) => t.id;
      case CrmEventField.createdAt:
        return (CrmEventDTOTable t) => t.createdAt;
      case CrmEventField.createdBy:
        return (CrmEventDTOTable t) => t.createdById;
      case CrmEventField.lastModifiedAt:
        return (CrmEventDTOTable t) => t.lastModifiedAt;
      case CrmEventField.lastModifiedBy:
        return (CrmEventDTOTable t) => t.lastModifiedById;
      case CrmEventField.deletedAt:
        return (CrmEventDTOTable t) => t.deletedAt;
      case CrmEventField.isDraft:
        return (CrmEventDTOTable t) => t.isDraft;
    }
  }

  static List<LogField<CrmEventDTO>> getLogFields() {
    return CrmEventField.values
        .map((field) {
          switch (field) {
            case CrmEventField.name:
              return LogField<CrmEventDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.name,
              );
            case CrmEventField.description:
              return LogField<CrmEventDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.description,
              );
            case CrmEventField.startDate:
              return LogField<CrmEventDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.startDate,
              );
            case CrmEventField.endDate:
              return LogField<CrmEventDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.endDate,
              );
            case CrmEventField.executionDate:
              return LogField<CrmEventDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.executionDate,
              );
            case CrmEventField.status:
              return LogField<CrmEventDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.status,
              );
            case CrmEventField.createdAt:
              return LogField<CrmEventDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.createdAt,
              );
            case CrmEventField.createdBy:
              return LogField<CrmEventDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.createdById,
              );
            case CrmEventField.lastModifiedAt:
              return LogField<CrmEventDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.lastModifiedAt,
              );
            case CrmEventField.lastModifiedBy:
              return LogField<CrmEventDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.lastModifiedById,
              );
            case CrmEventField.deletedAt:
              return LogField<CrmEventDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.deletedAt,
              );
            // Fields we don't want to log
            case CrmEventField.id:
            case CrmEventField.isDraft:
              return null;
          }
        })
        .whereType<LogField<CrmEventDTO>>()
        .toList();
  }

  static CrmEventDTO initialEvent({
    required int userId,
    required String sessionId,
    required CrmEventDTO entity,
    required bool release,
    required DateTime now,
  }) {
    return CrmEventDTO(
      name: entity.name,
      description: entity.description,
      startDate: entity.startDate,
      endDate: entity.endDate,
      executionDate: entity.executionDate,
      status: entity.status,
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
