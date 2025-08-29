// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShippingMethodImpl _$$ShippingMethodImplFromJson(Map<String, dynamic> json) =>
    _$ShippingMethodImpl(
      code: json['code'] as String,
      description: json['description'] as String,
      isActive: json['isActive'] as bool,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ShippingMethodImplToJson(
        _$ShippingMethodImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'isActive': instance.isActive,
      'meta': instance.meta,
      'id': instance.id,
    };
