import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AppClientUtils {
  const AppClientUtils._();

  static AppClientDTOInclude get includeAll => AppClientDTO.include(
        contact: ContactDTO.include(),
        // employees: AppUserDTO.includeList(),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    final expression = buildFilterExpression<AppClientDTOTable, AppClientField>(
      table: AppClientDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          AppClientField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  static Column<dynamic> Function(AppClientDTOTable) orderBy(
    AppClientField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(AppClientField.description);
    }
    return dbFieldFromEnum(sortField);
  }

  static Column<dynamic> Function(AppClientDTOTable) dbFieldFromEnum(
    AppClientField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case AppClientField.description:
        return (AppClientDTOTable t) => t.description;
      case AppClientField.id:
        return (AppClientDTOTable t) => t.id;
      case AppClientField.contact:
        return (AppClientDTOTable t) => t.contactId;
      case AppClientField.automationEngine:
        return (AppClientDTOTable t) => t.automationEngine;
      case AppClientField.employees:
        return (AppClientDTOTable t) => t.id;
      case AppClientField.createdAt:
        return (AppClientDTOTable t) => t.createdAt;
      case AppClientField.createdBy:
        return (AppClientDTOTable t) => t.createdById;
      case AppClientField.lastModifiedAt:
        return (AppClientDTOTable t) => t.lastModifiedAt;
      case AppClientField.lastModifiedBy:
        return (AppClientDTOTable t) => t.lastModifiedById;
      case AppClientField.deletedAt:
        return (AppClientDTOTable t) => t.deletedAt;
      case AppClientField.isDraft:
        return (AppClientDTOTable t) => t.isDraft;
    }
  }

  static AppClientDTO getInitialAppClient({
    required int userId,
    required String sessionId,
    required DateTime now,
  }) {
    return AppClientDTO(
      contactId: null,
      description: '',
      automationEngine: '',
      createdAt: now,
      isDraft: true,
      createdById: userId,
      editingSince: null,
      editingById: null,
      deletedAt: null,
      deletedById: null,
      lastModifiedAt: null,
      lastModifiedById: null,
      editingSession: null,
    );
  }
}
