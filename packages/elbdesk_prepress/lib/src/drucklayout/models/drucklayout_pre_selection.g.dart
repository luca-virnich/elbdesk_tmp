// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drucklayout_pre_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DrucklayoutPreSelectionImpl _$$DrucklayoutPreSelectionImplFromJson(
        Map<String, dynamic> json) =>
    _$DrucklayoutPreSelectionImpl(
      description: json['description'] as String,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      customerId: (json['customerId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DrucklayoutPreSelectionImplToJson(
        _$DrucklayoutPreSelectionImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'meta': instance.meta,
      'customerId': instance.customerId,
      'id': instance.id,
    };
