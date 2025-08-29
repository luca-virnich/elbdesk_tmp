// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_quarantine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkQuarantineImpl _$$ArtworkQuarantineImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtworkQuarantineImpl(
      general: ArtworkQuarantineGeneral.fromJson(
          json['general'] as Map<String, dynamic>),
      analysisData: json['analysisData'] == null
          ? null
          : ArtworkQuarantineAnalysisData.fromJson(
              json['analysisData'] as Map<String, dynamic>),
      artworkData: ArtworkQuarantineArtworkData.fromJson(
          json['artworkData'] as Map<String, dynamic>),
      customerId: (json['customerId'] as num?)?.toInt(),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      groupId: (json['groupId'] as num?)?.toInt(),
      group: json['group'] == null
          ? null
          : ArtworkQuarantineGroup.fromJson(
              json['group'] as Map<String, dynamic>),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtworkQuarantineImplToJson(
        _$ArtworkQuarantineImpl instance) =>
    <String, dynamic>{
      'general': instance.general,
      'analysisData': instance.analysisData,
      'artworkData': instance.artworkData,
      'customerId': instance.customerId,
      'customer': instance.customer,
      'groupId': instance.groupId,
      'group': instance.group,
      'meta': instance.meta,
    };

_$ArtworkQuarantineGeneralImpl _$$ArtworkQuarantineGeneralImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtworkQuarantineGeneralImpl(
      description: json['description'] as String,
      quarantineUuid: json['quarantineUuid'] as String,
      keywords: json['keywords'] as String?,
      artworkId: (json['artworkId'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$ArtworkTypeEnumMap, json['type']),
      status:
          $enumDecode(_$ArtworkQuarantineGroupStatusEnumMap, json['status']),
      productType:
          $enumDecodeNullable(_$ProductTypeEnumMap, json['productType']),
      printProcessType: $enumDecodeNullable(
          _$ArtworkPrintProcessTypeEnumMap, json['printProcessType']),
    );

Map<String, dynamic> _$$ArtworkQuarantineGeneralImplToJson(
        _$ArtworkQuarantineGeneralImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'quarantineUuid': instance.quarantineUuid,
      'keywords': instance.keywords,
      'artworkId': instance.artworkId,
      'type': instance.type,
      'status': instance.status,
      'productType': instance.productType,
      'printProcessType': instance.printProcessType,
    };

const _$ArtworkTypeEnumMap = {
  ArtworkType.front: 'front',
  ArtworkType.back: 'back',
};

const _$ArtworkQuarantineGroupStatusEnumMap = {
  ArtworkQuarantineGroupStatus.open: 'open',
  ArtworkQuarantineGroupStatus.todo: 'todo',
  ArtworkQuarantineGroupStatus.inUse: 'inUse',
  ArtworkQuarantineGroupStatus.done: 'done',
  ArtworkQuarantineGroupStatus.canceled: 'canceled',
};

const _$ProductTypeEnumMap = {
  ProductType.vorderseite: 'vorderseite',
  ProductType.rueckseite: 'rueckseite',
  ProductType.deckel: 'deckel',
  ProductType.boden: 'boden',
  ProductType.banderole: 'banderole',
  ProductType.multilayer: 'multilayer',
  ProductType.kit: 'kit',
  ProductType.vorlageDigitaldruck: 'vorlageDigitaldruck',
};

const _$ArtworkPrintProcessTypeEnumMap = {
  ArtworkPrintProcessType.flexodruck: 'flexodruck',
  ArtworkPrintProcessType.siebdruck: 'siebdruck',
  ArtworkPrintProcessType.buchdruck: 'buchdruck',
  ArtworkPrintProcessType.digitaldruck: 'digitaldruck',
  ArtworkPrintProcessType.offsetdruck: 'offsetdruck',
};

_$ArtworkQuarantineAnalysisDataImpl
    _$$ArtworkQuarantineAnalysisDataImplFromJson(Map<String, dynamic> json) =>
        _$ArtworkQuarantineAnalysisDataImpl(
          fileName: json['fileName'] as String?,
          analysisDate: json['analysisDate'] == null
              ? null
              : DateTime.parse(json['analysisDate'] as String),
          note: json['note'] as String,
          colorSpecifications: (json['colorSpecifications'] as List<dynamic>?)
              ?.map((e) =>
                  ArtworkColorSpecification.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$ArtworkQuarantineAnalysisDataImplToJson(
        _$ArtworkQuarantineAnalysisDataImpl instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'analysisDate': instance.analysisDate?.toIso8601String(),
      'note': instance.note,
      'colorSpecifications': instance.colorSpecifications,
    };

_$ArtworkQuarantineArtworkDataImpl _$$ArtworkQuarantineArtworkDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtworkQuarantineArtworkDataImpl(
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      cornerRadius: (json['cornerRadius'] as num?)?.toDouble(),
      originalFilePath: json['originalFilePath'] as String?,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => ArtworkColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArtworkQuarantineArtworkDataImplToJson(
        _$ArtworkQuarantineArtworkDataImpl instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'cornerRadius': instance.cornerRadius,
      'originalFilePath': instance.originalFilePath,
      'colors': instance.colors,
    };
