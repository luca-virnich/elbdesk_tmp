// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutzenlayout_column.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutzenlayoutColumnImpl _$$NutzenlayoutColumnImplFromJson(
        Map<String, dynamic> json) =>
    _$NutzenlayoutColumnImpl(
      offset: (json['offset'] as num).toDouble(),
      cells: (json['cells'] as List<dynamic>)
          .map((e) => NutzenlayoutCell.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NutzenlayoutColumnImplToJson(
        _$NutzenlayoutColumnImpl instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'cells': instance.cells,
    };
