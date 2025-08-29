// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkTemplateImpl _$$ArtworkTemplateImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtworkTemplateImpl(
      description: json['description'] as String,
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      artworkTemplatePreSelection: ArtworkTemplatePreSelection.fromJson(
          json['artworkTemplatePreSelection'] as Map<String, dynamic>),
      artworkTemplateSelection: ArtworkTemplateSelection.fromJson(
          json['artworkTemplateSelection'] as Map<String, dynamic>),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      trapping: Trapping.fromJson(json['trapping'] as Map<String, dynamic>),
      anschnitt: (json['anschnitt'] as num).toDouble(),
      colors: (json['colors'] as List<dynamic>)
          .map((e) => ArtworkColor.fromJson(e as Map<String, dynamic>))
          .toList(),
      layers: (json['layers'] as List<dynamic>)
          .map((e) => ArtworkLayer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArtworkTemplateImplToJson(
        _$ArtworkTemplateImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'customer': instance.customer,
      'artworkTemplatePreSelection': instance.artworkTemplatePreSelection,
      'artworkTemplateSelection': instance.artworkTemplateSelection,
      'meta': instance.meta,
      'trapping': instance.trapping,
      'anschnitt': instance.anschnitt,
      'colors': instance.colors,
      'layers': instance.layers,
    };
