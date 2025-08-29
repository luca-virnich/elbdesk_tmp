// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drucklayout_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DrucklayoutSelectionImpl _$$DrucklayoutSelectionImplFromJson(
        Map<String, dynamic> json) =>
    _$DrucklayoutSelectionImpl(
      description: json['description'] as String,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      drucklayoutPreSelectionId:
          (json['drucklayoutPreSelectionId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DrucklayoutSelectionImplToJson(
        _$DrucklayoutSelectionImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'meta': instance.meta,
      'drucklayoutPreSelectionId': instance.drucklayoutPreSelectionId,
      'id': instance.id,
    };
