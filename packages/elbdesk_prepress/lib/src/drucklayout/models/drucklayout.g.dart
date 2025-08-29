// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drucklayout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DrucklayoutImpl _$$DrucklayoutImplFromJson(Map<String, dynamic> json) =>
    _$DrucklayoutImpl(
      title: json['title'] as String,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      drucklayoutPreSelection: DrucklayoutPreSelection.fromJson(
          json['drucklayoutPreSelection'] as Map<String, dynamic>),
      drucklayoutSelection: DrucklayoutSelection.fromJson(
          json['drucklayoutSelection'] as Map<String, dynamic>),
      preSelectionId: (json['preSelectionId'] as num?)?.toInt(),
      selectionId: (json['selectionId'] as num?)?.toInt(),
      description: json['description'] as String?,
      customerId: (json['customerId'] as num?)?.toInt(),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DrucklayoutImplToJson(_$DrucklayoutImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'meta': instance.meta,
      'drucklayoutPreSelection': instance.drucklayoutPreSelection,
      'drucklayoutSelection': instance.drucklayoutSelection,
      'preSelectionId': instance.preSelectionId,
      'selectionId': instance.selectionId,
      'description': instance.description,
      'customerId': instance.customerId,
      'customer': instance.customer,
      'id': instance.id,
    };
