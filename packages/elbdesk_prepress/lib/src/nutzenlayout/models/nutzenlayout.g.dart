// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutzenlayout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutzenlayoutImpl _$$NutzenlayoutImplFromJson(Map<String, dynamic> json) =>
    _$NutzenlayoutImpl(
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      description: json['description'] as String,
      drucklaenge: (json['drucklaenge'] as num).toDouble(),
      customerId: (json['customerId'] as num?)?.toInt(),
      cellX: (json['cellX'] as num).toDouble(),
      cellY: (json['cellY'] as num).toDouble(),
      columns: (json['columns'] as List<dynamic>)
          .map((e) => NutzenlayoutColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      formType: $enumDecode(_$NutzenlayoutFormTypeEnumMap, json['formType']),
      dimensions: (json['dimensions'] as List<dynamic>)
          .map((e) =>
              NutzenlayoutArtworkDimensions.fromJson(e as Map<String, dynamic>))
          .toSet(),
      leadingUnitSystem: $enumDecode(
          _$NutzenlayoutUnitSystemEnumMap, json['leadingUnitSystem']),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NutzenlayoutImplToJson(_$NutzenlayoutImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'description': instance.description,
      'drucklaenge': instance.drucklaenge,
      'customerId': instance.customerId,
      'cellX': instance.cellX,
      'cellY': instance.cellY,
      'columns': instance.columns,
      'formType': instance.formType,
      'dimensions': instance.dimensions.toList(),
      'leadingUnitSystem': instance.leadingUnitSystem,
      'id': instance.id,
    };

const _$NutzenlayoutFormTypeEnumMap = {
  NutzenlayoutFormType.einzelform: 'einzelform',
  NutzenlayoutFormType.sammelform: 'sammelform',
};

const _$NutzenlayoutUnitSystemEnumMap = {
  NutzenlayoutUnitSystem.millimeter: 'millimeter',
  NutzenlayoutUnitSystem.inch: 'inch',
  NutzenlayoutUnitSystem.teeth: 'teeth',
};
