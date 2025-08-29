// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_template_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkTemplateSelectionImpl _$$ArtworkTemplateSelectionImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtworkTemplateSelectionImpl(
      description: json['description'] as String,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      artworkTemplatePreSelectionId:
          (json['artworkTemplatePreSelectionId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ArtworkTemplateSelectionImplToJson(
        _$ArtworkTemplateSelectionImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'meta': instance.meta,
      'artworkTemplatePreSelectionId': instance.artworkTemplatePreSelectionId,
      'id': instance.id,
    };
