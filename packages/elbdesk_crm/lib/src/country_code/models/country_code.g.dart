// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryCodeImpl _$$CountryCodeImplFromJson(Map<String, dynamic> json) =>
    _$CountryCodeImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      isoCode: json['isoCode'] as String,
      numericIsoCode: (json['numericIsoCode'] as num?)?.toInt(),
      addressFormat: $enumDecodeNullable(
          _$CountryCodeAddressFormatEnumMap, json['addressFormat']),
      contactAddressFormat: $enumDecodeNullable(
          _$CountryCodeContactAddressFormatEnumMap,
          json['contactAddressFormat']),
      showState: json['showState'] as bool,
      isPrimary: json['isPrimary'] as bool,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      federalRegion: json['federalRegion'] as String?,
      euCode: json['euCode'] as String?,
      intrastatCode: json['intrastatCode'] as String?,
      taxScheme: json['taxScheme'] as String?,
    );

Map<String, dynamic> _$$CountryCodeImplToJson(_$CountryCodeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'isoCode': instance.isoCode,
      'numericIsoCode': instance.numericIsoCode,
      'addressFormat': instance.addressFormat,
      'contactAddressFormat': instance.contactAddressFormat,
      'showState': instance.showState,
      'isPrimary': instance.isPrimary,
      'meta': instance.meta,
      'id': instance.id,
      'federalRegion': instance.federalRegion,
      'euCode': instance.euCode,
      'intrastatCode': instance.intrastatCode,
      'taxScheme': instance.taxScheme,
    };

const _$CountryCodeAddressFormatEnumMap = {
  CountryCodeAddressFormat.postCode_city: 'postCode_city',
  CountryCodeAddressFormat.city_postCode: 'city_postCode',
  CountryCodeAddressFormat.city_country_postCode: 'city_country_postCode',
  CountryCodeAddressFormat.blank_postCode_city: 'blank_postCode_city',
};

const _$CountryCodeContactAddressFormatEnumMap = {
  CountryCodeContactAddressFormat.first: 'first',
  CountryCodeContactAddressFormat.afterCompanyName: 'afterCompanyName',
  CountryCodeContactAddressFormat.last: 'last',
};
