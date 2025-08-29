// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_mats_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MigrationMatsPersonImpl _$$MigrationMatsPersonImplFromJson(
        Map<String, dynamic> json) =>
    _$MigrationMatsPersonImpl(
      data: MigrationMatsPersonData.fromJson(
          json['data'] as Map<String, dynamic>),
      isMigrated: json['isMigrated'] as bool,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MigrationMatsPersonImplToJson(
        _$MigrationMatsPersonImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'isMigrated': instance.isMigrated,
      'meta': instance.meta,
    };

_$MigrationMatsPersonDataImpl _$$MigrationMatsPersonDataImplFromJson(
        Map<String, dynamic> json) =>
    _$MigrationMatsPersonDataImpl(
      idContact: json['idContact'] as String?,
      nameFirst: json['nameFirst'] as String?,
      nameLast: json['nameLast'] as String?,
      anrede: json['anrede'] as String?,
      titel: json['titel'] as String?,
      department: json['department'] as String?,
      position: json['position'] as String?,
      anredeLang: json['anredeLang'] as String?,
      idAccount: json['idAccount'] as String?,
      primaryStreet1: json['primaryStreet1'] as String?,
      primaryStreet2: json['primaryStreet2'] as String?,
      primaryPostalCode: json['primaryPostalCode'] as String?,
      primaryCity: json['primaryCity'] as String?,
      primaryCountry: json['primaryCountry'] as String?,
      primaryState: json['primaryState'] as String?,
      telefon1: json['telefon1'] as String?,
      telefon2: json['telefon2'] as String?,
      mobilTelefon: json['mobilTelefon'] as String?,
      fax: json['fax'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String?,
      wK: json['wK'] as String?,
      wWf: json['wWf'] as String?,
      wFp: json['wFp'] as String?,
      contactInfor: json['contactInfor'] as String?,
      isPerson: json['isPerson'] as bool,
    );

Map<String, dynamic> _$$MigrationMatsPersonDataImplToJson(
        _$MigrationMatsPersonDataImpl instance) =>
    <String, dynamic>{
      'idContact': instance.idContact,
      'nameFirst': instance.nameFirst,
      'nameLast': instance.nameLast,
      'anrede': instance.anrede,
      'titel': instance.titel,
      'department': instance.department,
      'position': instance.position,
      'anredeLang': instance.anredeLang,
      'idAccount': instance.idAccount,
      'primaryStreet1': instance.primaryStreet1,
      'primaryStreet2': instance.primaryStreet2,
      'primaryPostalCode': instance.primaryPostalCode,
      'primaryCity': instance.primaryCity,
      'primaryCountry': instance.primaryCountry,
      'primaryState': instance.primaryState,
      'telefon1': instance.telefon1,
      'telefon2': instance.telefon2,
      'mobilTelefon': instance.mobilTelefon,
      'fax': instance.fax,
      'email': instance.email,
      'status': instance.status,
      'wK': instance.wK,
      'wWf': instance.wWf,
      'wFp': instance.wFp,
      'contactInfor': instance.contactInfor,
      'isPerson': instance.isPerson,
    };
