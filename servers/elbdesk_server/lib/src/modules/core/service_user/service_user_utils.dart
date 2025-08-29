import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class ServiceUserUtils {
  const ServiceUserUtils._();

  static ServiceUserDTOInclude get includeAll => ServiceUserDTO.include(
        userInfo: UserInfo.include(),
        tokens: ServiceUserTokenDTO.includeList(
          include: ServiceUserTokenDTO.include(
            authKey: AuthKey.include(),
          ),
        ),
      );

  static Column<dynamic> Function(ServiceUserDTOTable) orderBy(
    ServiceUserField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(ServiceUserField.serviceName);
    }
    return dbFieldFromEnum(sortField);
  }

  static Expression<dynamic> buildExpression(
    Filter? filter,
  ) {
    final dontShowElbDeskAdminExp =
        ServiceUserDTOTable().userInfo.id.notEquals(1);

    final expression =
        buildFilterExpression<ServiceUserDTOTable, ServiceUserField>(
      table: ServiceUserDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          ServiceUserField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) =>
          ServiceUserUtils.dbFieldFromEnum(field)(table),
    );

    return expression == null
        ? dontShowElbDeskAdminExp
        : expression & dontShowElbDeskAdminExp;
  }

  static Column<dynamic> Function(ServiceUserDTOTable) dbFieldFromEnum(
    ServiceUserField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case ServiceUserField.id:
        return (ServiceUserDTOTable t) => t.id;
      case ServiceUserField.userInfoId:
        return (ServiceUserDTOTable t) => t.userInfo.id;
      case ServiceUserField.userIdentifier:
        return (ServiceUserDTOTable t) => t.userInfo.userIdentifier;
      case ServiceUserField.created:
        return (ServiceUserDTOTable t) => t.userInfo.created;
      case ServiceUserField.scopeNames:
        return (ServiceUserDTOTable t) => t.userInfo.scopeNames;
      case ServiceUserField.blocked:
        return (ServiceUserDTOTable t) => t.userInfo.blocked;
      case ServiceUserField.serviceName:
        return (ServiceUserDTOTable t) => t.serviceName;
      case ServiceUserField.serviceDescription:
        return (ServiceUserDTOTable t) => t.serviceDescription;
      case ServiceUserField.isActive:
        return (ServiceUserDTOTable t) => t.isActive;
      case ServiceUserField.createdAt:
        return (ServiceUserDTOTable t) => t.createdAt;
      case ServiceUserField.createdBy:
        return (ServiceUserDTOTable t) => t.createdById;
      case ServiceUserField.lastModifiedAt:
        return (ServiceUserDTOTable t) => t.lastModifiedAt;
      case ServiceUserField.lastModifiedBy:
        return (ServiceUserDTOTable t) => t.lastModifiedById;
      case ServiceUserField.deletedAt:
        return (ServiceUserDTOTable t) => t.deletedAt;
      case ServiceUserField.isDraft:
        return (ServiceUserDTOTable t) => t.isDraft;
    }
  }

  ServiceUserDTO getInitialServiceUser({
    required int? userInfoId,
    required UserInfo? userInfo,
    int? userId,
    String? sessionId,
  }) {
    return ServiceUserDTO(
      lastModifiedAt: null,
      createdAt: DateTime.now(),
      createdById: userId,
      isDraft: false,
      editingSince: sessionId == null
          ? null
          : userId == null
              ? null
              : DateTime.now(),
      editingById: sessionId == null ? null : userId,
      editingSession: sessionId,
      userInfoId: userInfoId,
      userInfo: userInfo,
      serviceName: '',
      serviceDescription: '',
      isActive: true,
    );
  }

  static String generateRandomString([int length = 32]) {
    final values =
        List<int>.generate(length, (int i) => Random.secure().nextInt(256));
    return base64Url.encode(values).substring(0, length);
  }

  List<LogField<ServiceUserDTO>> getLogFields() {
    return ServiceUserField.values
        .map((field) {
          switch (field) {
            case ServiceUserField.id:
              return LogField<ServiceUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.id?.toString() ?? '',
              );
            case ServiceUserField.userInfoId:
              return LogField<ServiceUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.userInfo?.id?.toString() ?? '',
              );
            case ServiceUserField.userIdentifier:
              return LogField<ServiceUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.userInfo?.userIdentifier ?? '',
              );
            case ServiceUserField.created:
              return LogField<ServiceUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.createdAt.toString(),
              );
            case ServiceUserField.scopeNames:
              return LogField<ServiceUserDTO>(
                fieldName: field.name,
                getValue: (entity) =>
                    entity.userInfo?.scopeNames.join(', ') ?? '',
              );
            case ServiceUserField.blocked:
              return LogField<ServiceUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.userInfo?.blocked.toString() ?? '',
              );
            case ServiceUserField.serviceName:
              return LogField<ServiceUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.serviceName,
              );
            case ServiceUserField.serviceDescription:
              return LogField<ServiceUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.serviceDescription,
              );
            case ServiceUserField.isActive:
              return LogField<ServiceUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.isActive.toString(),
              );
            case ServiceUserField.createdAt:
            case ServiceUserField.createdBy:
            case ServiceUserField.lastModifiedAt:
            case ServiceUserField.lastModifiedBy:
            case ServiceUserField.deletedAt:
            case ServiceUserField.isDraft:
              return null;
          }
        })
        .whereType<LogField<ServiceUserDTO>>()
        .toList();
  }
}
