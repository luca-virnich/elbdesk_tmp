// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_color_specification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkColorSpecificationImpl _$$ArtworkColorSpecificationImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtworkColorSpecificationImpl(
      name: json['name'] as String?,
      type: json['type'] as String?,
      book: json['book'] as String?,
      egname: json['egname'] as String?,
      frequency: (json['frequency'] as num?)?.toDouble(),
      angle: (json['angle'] as num?)?.toDouble(),
      dotshape: json['dotshape'] as String?,
      r: (json['r'] as num?)?.toDouble(),
      g: (json['g'] as num?)?.toDouble(),
      b: (json['b'] as num?)?.toDouble(),
      attribute: json['attribute'] as String?,
      printingmethod: json['printingmethod'] as String?,
      databaseColor: json['databaseColor'] == null
          ? null
          : ArtworkColor.fromJson(
              json['databaseColor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtworkColorSpecificationImplToJson(
        _$ArtworkColorSpecificationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'book': instance.book,
      'egname': instance.egname,
      'frequency': instance.frequency,
      'angle': instance.angle,
      'dotshape': instance.dotshape,
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
      'attribute': instance.attribute,
      'printingmethod': instance.printingmethod,
      'databaseColor': instance.databaseColor,
    };

_$LayerInfoImpl _$$LayerInfoImplFromJson(Map<String, dynamic> json) =>
    _$LayerInfoImpl(
      name: json['name'] as String,
      printable: json['printable'] as bool,
      locked: json['locked'] as bool,
    );

Map<String, dynamic> _$$LayerInfoImplToJson(_$LayerInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'printable': instance.printable,
      'locked': instance.locked,
    };

_$FontInfoImpl _$$FontInfoImplFromJson(Map<String, dynamic> json) =>
    _$FontInfoImpl(
      name: json['name'] as String,
      type: json['type'] as String,
      location: json['location'] as String,
      protection: json['protection'] as bool,
      fontFile: json['fontFile'] as String?,
    );

Map<String, dynamic> _$$FontInfoImplToJson(_$FontInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'location': instance.location,
      'protection': instance.protection,
      'fontFile': instance.fontFile,
    };
