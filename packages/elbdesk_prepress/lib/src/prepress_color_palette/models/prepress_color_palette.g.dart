// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prepress_color_palette.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrepressColorPaletteImpl _$$PrepressColorPaletteImplFromJson(
        Map<String, dynamic> json) =>
    _$PrepressColorPaletteImpl(
      paletteName: json['paletteName'] as String,
      description: json['description'] as String,
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => ArtworkColor.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PrepressColorPaletteImplToJson(
        _$PrepressColorPaletteImpl instance) =>
    <String, dynamic>{
      'paletteName': instance.paletteName,
      'description': instance.description,
      'colors': instance.colors,
      'meta': instance.meta,
      'customer': instance.customer,
    };
