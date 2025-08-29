import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class AppUserUtils {
  const AppUserUtils._();

  static AppUserDTOInclude get includeAll => AppUserDTO.include(
        userInfo: UserInfo.include(),
        department: DepartmentCodeDTO.include(),
        countryCode: CountryCodeDTO.include(),
      );

  static Column<dynamic> Function(AppUserDTOTable) orderBy(
    AppUserField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(AppUserField.fullName);
    }
    return dbFieldFromEnum(sortField);
  }

  static Expression<dynamic> buildExpression(
    Filter? filter,
  ) {
    final dontShowElbDeskAdminExp = AppUserDTOTable().userInfo.id.notEquals(1);

    final expression = buildFilterExpression<AppUserDTOTable, AppUserField>(
      table: AppUserDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          AppUserField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => AppUserUtils.dbFieldFromEnum(field)(table),
    );

    return expression == null
        ? dontShowElbDeskAdminExp
        : expression & dontShowElbDeskAdminExp;
  }

  static Column<dynamic> Function(AppUserDTOTable) dbFieldFromEnum(
    AppUserField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case AppUserField.id:
        return (AppUserDTOTable t) => t.id;
      case AppUserField.userInfoId:
        return (AppUserDTOTable t) => t.userInfo.id;
      case AppUserField.userIdentifier:
        return (AppUserDTOTable t) => t.userInfo.userIdentifier;
      case AppUserField.userName:
        return (AppUserDTOTable t) => t.userInfo.userName;
      case AppUserField.fullName:
        return (AppUserDTOTable t) => t.userInfo.fullName;
      case AppUserField.email:
        return (AppUserDTOTable t) => t.userInfo.email;
      case AppUserField.created:
        return (AppUserDTOTable t) => t.userInfo.created;
      case AppUserField.imageUrl:
        return (AppUserDTOTable t) => t.userInfo.imageUrl;
      case AppUserField.scopeNames:
        return (AppUserDTOTable t) => t.userInfo.scopeNames;
      case AppUserField.blocked:
        return (AppUserDTOTable t) => t.userInfo.blocked;
      case AppUserField.firstName:
        return (AppUserDTOTable t) => t.firstName;
      case AppUserField.lastName:
        return (AppUserDTOTable t) => t.lastName;
      case AppUserField.initials:
        return (AppUserDTOTable t) => t.initials;
      case AppUserField.address:
        return (AppUserDTOTable t) => t.address;
      case AppUserField.address2:
        return (AppUserDTOTable t) => t.address2;

      case AppUserField.postCode:
        return (AppUserDTOTable t) => t.postCode;
      case AppUserField.city:
        return (AppUserDTOTable t) => t.city;
      case AppUserField.state:
        return (AppUserDTOTable t) => t.state;
      case AppUserField.country:
        return (AppUserDTOTable t) => t.countryCode.id;
      case AppUserField.phone:
        return (AppUserDTOTable t) => t.phone;
      case AppUserField.mobile:
        return (AppUserDTOTable t) => t.mobile;
      case AppUserField.employeeNumber:
        return (AppUserDTOTable t) => t.employeeNumber;
      case AppUserField.entryDate:
        return (AppUserDTOTable t) => t.entryDate;
      case AppUserField.terminationDate:
        return (AppUserDTOTable t) => t.terminationDate;
      case AppUserField.department:
        return (AppUserDTOTable t) => t.department.description;
      case AppUserField.position:
        return (AppUserDTOTable t) => t.position;
      case AppUserField.costCenter:
        return (AppUserDTOTable t) => t.costCenter;
      case AppUserField.isActive:
        return (AppUserDTOTable t) => t.isActive;
      case AppUserField.createdAt:
        return (AppUserDTOTable t) => t.createdAt;
      case AppUserField.createdBy:
        return (AppUserDTOTable t) => t.createdById;
      case AppUserField.lastModifiedAt:
        return (AppUserDTOTable t) => t.lastModifiedAt;
      case AppUserField.lastModifiedBy:
        return (AppUserDTOTable t) => t.lastModifiedById;
      case AppUserField.deletedAt:
        return (AppUserDTOTable t) => t.deletedAt;
      case AppUserField.isDraft:
        return (AppUserDTOTable t) => t.isDraft;
      case AppUserField.privateEmail:
        return (AppUserDTOTable t) => t.privateEmail;
    }
  }

  AppUserDTO getInitialUser({
    required int? userInfoId,
    required UserInfo? userInfo,
    int? userId,
    String? sessionId,
  }) {
    return AppUserDTO(
      privateEmail: '',
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
      firstName: '',
      lastName: '',
      initials: '',
      address: '',
      address2: '',
      postCode: '',
      city: '',
      state: '',
      phone: '',
      mobile: '',
      employeeNumber: '',
      position: '',
      costCenter: '',
      isActive: true,
    );
  }

  static String generateRandomString([int length = 32]) {
    final values =
        List<int>.generate(length, (int i) => Random.secure().nextInt(256));
    return base64Url.encode(values).substring(0, length);
  }

  List<LogField<AppUserDTO>> getLogFields() {
    return AppUserField.values
        .map((field) {
          switch (field) {
            case AppUserField.id:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.id?.toString() ?? '',
              );
            case AppUserField.userInfoId:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.userInfo?.id?.toString() ?? '',
              );
            case AppUserField.userIdentifier:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.userInfo?.userIdentifier ?? '',
              );
            case AppUserField.userName:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.userInfo?.userName ?? '',
              );
            case AppUserField.email:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.userInfo?.email ?? '',
              );
            case AppUserField.created:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.createdAt.toString(),
              );
            case AppUserField.imageUrl:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.userInfo?.imageUrl ?? '',
              );
            case AppUserField.scopeNames:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) =>
                    entity.userInfo?.scopeNames.join(', ') ?? '',
              );
            case AppUserField.blocked:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.userInfo?.blocked.toString() ?? '',
              );
            case AppUserField.firstName:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.firstName,
              );
            case AppUserField.lastName:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.lastName,
              );
            case AppUserField.fullName:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.userInfo?.fullName,
              );
            case AppUserField.initials:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.initials,
              );
            case AppUserField.address:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.address,
              );
            case AppUserField.address2:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.address2,
              );

            case AppUserField.postCode:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.postCode,
              );
            case AppUserField.city:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.city,
              );
            case AppUserField.state:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.state,
              );
            case AppUserField.country:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.countryCode?.code,
              );
            case AppUserField.phone:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.phone,
              );
            case AppUserField.mobile:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.mobile,
              );
            case AppUserField.employeeNumber:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.employeeNumber,
              );
            case AppUserField.entryDate:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.entryDate?.toString() ?? '',
              );
            case AppUserField.terminationDate:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.terminationDate?.toString() ?? '',
              );
            case AppUserField.department:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.department ?? '',
              );
            case AppUserField.position:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.position,
              );
            case AppUserField.costCenter:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.costCenter,
              );
            case AppUserField.isActive:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.isActive.toString(),
              );
            case AppUserField.privateEmail:
              return LogField<AppUserDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.privateEmail,
              );
            case AppUserField.createdAt:
            case AppUserField.createdBy:
            case AppUserField.lastModifiedAt:
            case AppUserField.lastModifiedBy:
            case AppUserField.deletedAt:
            case AppUserField.isDraft:
              return null;
          }
        })
        .whereType<LogField<AppUserDTO>>()
        .toList();
  }
}
