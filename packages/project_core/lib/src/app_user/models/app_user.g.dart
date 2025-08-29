// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      userInfo: UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      general: AppUserGeneral.fromJson(json['general'] as Map<String, dynamic>),
      communication: AppUserCommunication.fromJson(
          json['communication'] as Map<String, dynamic>),
      address: AppUserAddress.fromJson(json['address'] as Map<String, dynamic>),
      employee:
          AppUserEmployee.fromJson(json['employee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'userInfo': instance.userInfo,
      'general': instance.general,
      'communication': instance.communication,
      'address': instance.address,
      'employee': instance.employee,
    };

_$AppUserGeneralImpl _$$AppUserGeneralImplFromJson(Map<String, dynamic> json) =>
    _$AppUserGeneralImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      initials: json['initials'] as String,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$$AppUserGeneralImplToJson(
        _$AppUserGeneralImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'initials': instance.initials,
      'birthDate': instance.birthDate?.toIso8601String(),
    };

_$AppUserCommunicationImpl _$$AppUserCommunicationImplFromJson(
        Map<String, dynamic> json) =>
    _$AppUserCommunicationImpl(
      phone: json['phone'] as String,
      mobile: json['mobile'] as String,
      privateEmail: json['privateEmail'] as String,
    );

Map<String, dynamic> _$$AppUserCommunicationImplToJson(
        _$AppUserCommunicationImpl instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'mobile': instance.mobile,
      'privateEmail': instance.privateEmail,
    };

_$AppUserAddressImpl _$$AppUserAddressImplFromJson(Map<String, dynamic> json) =>
    _$AppUserAddressImpl(
      address: json['address'] as String,
      address2: json['address2'] as String,
      postCode: json['postCode'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      countryCode: json['countryCode'] == null
          ? null
          : CountryCode.fromJson(json['countryCode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppUserAddressImplToJson(
        _$AppUserAddressImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address2': instance.address2,
      'postCode': instance.postCode,
      'city': instance.city,
      'state': instance.state,
      'countryCode': instance.countryCode,
    };

_$AppUserEmployeeImpl _$$AppUserEmployeeImplFromJson(
        Map<String, dynamic> json) =>
    _$AppUserEmployeeImpl(
      employeeNumber: json['employeeNumber'] as String,
      entryDate: json['entryDate'] == null
          ? null
          : DateTime.parse(json['entryDate'] as String),
      terminationDate: json['terminationDate'] == null
          ? null
          : DateTime.parse(json['terminationDate'] as String),
      department: json['department'] == null
          ? null
          : DepartmentCode.fromJson(json['department'] as Map<String, dynamic>),
      position: json['position'] as String,
      costCenter: json['costCenter'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$AppUserEmployeeImplToJson(
        _$AppUserEmployeeImpl instance) =>
    <String, dynamic>{
      'employeeNumber': instance.employeeNumber,
      'entryDate': instance.entryDate?.toIso8601String(),
      'terminationDate': instance.terminationDate?.toIso8601String(),
      'department': instance.department,
      'position': instance.position,
      'costCenter': instance.costCenter,
      'isActive': instance.isActive,
    };
