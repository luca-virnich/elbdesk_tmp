// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_template_pre_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkTemplatePreSelectionImpl _$$ArtworkTemplatePreSelectionImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtworkTemplatePreSelectionImpl(
      description: json['description'] as String,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      customerId: (json['customerId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ArtworkTemplatePreSelectionImplToJson(
        _$ArtworkTemplatePreSelectionImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'meta': instance.meta,
      'customerId': instance.customerId,
      'id': instance.id,
    };
