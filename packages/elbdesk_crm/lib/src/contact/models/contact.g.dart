// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      general: ContactGeneral.fromJson(json['general'] as Map<String, dynamic>),
      address: ContactAddress.fromJson(json['address'] as Map<String, dynamic>),
      communication: ContactCommunication.fromJson(
          json['communication'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      customId: (json['customId'] as num?)?.toInt(),
      migrationMatsPersonId: (json['migrationMatsPersonId'] as num?)?.toInt(),
      migrationMatsCompanyId: (json['migrationMatsCompanyId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'general': instance.general,
      'address': instance.address,
      'communication': instance.communication,
      'customer': instance.customer,
      'meta': instance.meta,
      'customId': instance.customId,
      'migrationMatsPersonId': instance.migrationMatsPersonId,
      'migrationMatsCompanyId': instance.migrationMatsCompanyId,
    };

_$ContactGeneralImpl _$$ContactGeneralImplFromJson(Map<String, dynamic> json) =>
    _$ContactGeneralImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      initials: json['initials'] as String,
      name: json['name'] as String,
      languageCode: json['languageCode'] == null
          ? null
          : LanguageCode.fromJson(json['languageCode'] as Map<String, dynamic>),
      type: $enumDecodeNullable(_$ContactTypeEnumMap, json['type']),
      salutationCode: json['salutationCode'] == null
          ? null
          : SalutationCode.fromJson(
              json['salutationCode'] as Map<String, dynamic>),
      importantNote: json['importantNote'] as String,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$$ContactGeneralImplToJson(
        _$ContactGeneralImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'initials': instance.initials,
      'name': instance.name,
      'languageCode': instance.languageCode,
      'type': instance.type,
      'salutationCode': instance.salutationCode,
      'importantNote': instance.importantNote,
      'birthDate': instance.birthDate?.toIso8601String(),
    };

const _$ContactTypeEnumMap = {
  ContactType.company: 'company',
  ContactType.person: 'person',
};

_$ContactCommunicationImpl _$$ContactCommunicationImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactCommunicationImpl(
      phone: json['phone'] as String,
      mobile: json['mobile'] as String,
      email: json['email'] as String,
      website: json['website'] as String,
    );

Map<String, dynamic> _$$ContactCommunicationImplToJson(
        _$ContactCommunicationImpl instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'mobile': instance.mobile,
      'email': instance.email,
      'website': instance.website,
    };

_$ContactAddressImpl _$$ContactAddressImplFromJson(Map<String, dynamic> json) =>
    _$ContactAddressImpl(
      address: json['address'] as String,
      address2: json['address2'] as String,
      address3: json['address3'] as String,
      postCode: json['postCode'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      countryCode: json['countryCode'] == null
          ? null
          : CountryCode.fromJson(json['countryCode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContactAddressImplToJson(
        _$ContactAddressImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address2': instance.address2,
      'address3': instance.address3,
      'postCode': instance.postCode,
      'city': instance.city,
      'state': instance.state,
      'countryCode': instance.countryCode,
    };
