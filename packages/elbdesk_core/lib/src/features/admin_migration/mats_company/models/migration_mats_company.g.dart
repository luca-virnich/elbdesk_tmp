// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_mats_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MigrationMatsCompanyImpl _$$MigrationMatsCompanyImplFromJson(
        Map<String, dynamic> json) =>
    _$MigrationMatsCompanyImpl(
      data: MigrationMatsCompanyData.fromJson(
          json['data'] as Map<String, dynamic>),
      isMigrated: json['isMigrated'] as bool,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MigrationMatsCompanyImplToJson(
        _$MigrationMatsCompanyImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'isMigrated': instance.isMigrated,
      'meta': instance.meta,
    };

_$MigrationMatsCompanyDataImpl _$$MigrationMatsCompanyDataImplFromJson(
        Map<String, dynamic> json) =>
    _$MigrationMatsCompanyDataImpl(
      idAccount: json['idAccount'] as String?,
      account: json['account'] as String?,
      account2: json['account2'] as String?,
      idAramis: json['idAramis'] as String?,
      idStaff: json['idStaff'] as String?,
      idAvVerantw: json['idAvVerantw'] as String?,
      standort: json['standort'] as String?,
      shippingStreet1: json['shippingStreet1'] as String?,
      shippingStreet2: json['shippingStreet2'] as String?,
      shippingPostalCode: json['shippingPostalCode'] as String?,
      shippingCity: json['shippingCity'] as String?,
      shippingState: json['shippingState'] as String?,
      shippingCountry: json['shippingCountry'] as String?,
      phone1: json['phone1'] as String?,
      phone2: json['phone2'] as String?,
      fax: json['fax'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$$MigrationMatsCompanyDataImplToJson(
        _$MigrationMatsCompanyDataImpl instance) =>
    <String, dynamic>{
      'idAccount': instance.idAccount,
      'account': instance.account,
      'account2': instance.account2,
      'idAramis': instance.idAramis,
      'idStaff': instance.idStaff,
      'idAvVerantw': instance.idAvVerantw,
      'standort': instance.standort,
      'shippingStreet1': instance.shippingStreet1,
      'shippingStreet2': instance.shippingStreet2,
      'shippingPostalCode': instance.shippingPostalCode,
      'shippingCity': instance.shippingCity,
      'shippingState': instance.shippingState,
      'shippingCountry': instance.shippingCountry,
      'phone1': instance.phone1,
      'phone2': instance.phone2,
      'fax': instance.fax,
      'email': instance.email,
      'website': instance.website,
    };
