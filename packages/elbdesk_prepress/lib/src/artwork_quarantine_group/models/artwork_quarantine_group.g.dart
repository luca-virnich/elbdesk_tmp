// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_quarantine_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkQuarantineGroupImpl _$$ArtworkQuarantineGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtworkQuarantineGroupImpl(
      customerId: (json['customerId'] as num?)?.toInt(),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      artworkType:
          $enumDecodeNullable(_$ArtworkTypeEnumMap, json['artworkType']),
      status:
          $enumDecode(_$ArtworkQuarantineGroupStatusEnumMap, json['status']),
      type: $enumDecodeNullable(
          _$ArtworkQuarantineGroupTypeEnumMap, json['type']),
      productType:
          $enumDecodeNullable(_$ProductTypeEnumMap, json['productType']),
      printProcessType: $enumDecodeNullable(
          _$ArtworkPrintProcessTypeEnumMap, json['printProcessType']),
      selectedProductSeriesId:
          (json['selectedProductSeriesId'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      cornerRadius: (json['cornerRadius'] as num?)?.toDouble(),
      outputPath: json['outputPath'] as String?,
      description: json['description'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => SystemFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      artworkQuarantines: (json['artworkQuarantines'] as List<dynamic>?)
          ?.map((e) => ArtworkQuarantine.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignedUser: json['assignedUser'] == null
          ? null
          : LightUser.fromJson(json['assignedUser'] as Map<String, dynamic>),
      sendToAeAt: json['sendToAeAt'] == null
          ? null
          : DateTime.parse(json['sendToAeAt'] as String),
      sendToAeBy: (json['sendToAeBy'] as num?)?.toInt(),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ArtworkQuarantineGroupImplToJson(
        _$ArtworkQuarantineGroupImpl instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'customer': instance.customer,
      'artworkType': instance.artworkType,
      'status': instance.status,
      'type': instance.type,
      'productType': instance.productType,
      'printProcessType': instance.printProcessType,
      'selectedProductSeriesId': instance.selectedProductSeriesId,
      'width': instance.width,
      'height': instance.height,
      'cornerRadius': instance.cornerRadius,
      'outputPath': instance.outputPath,
      'description': instance.description,
      'attachments': instance.attachments,
      'artworkQuarantines': instance.artworkQuarantines,
      'assignedUser': instance.assignedUser,
      'sendToAeAt': instance.sendToAeAt?.toIso8601String(),
      'sendToAeBy': instance.sendToAeBy,
      'meta': instance.meta,
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

const _$ArtworkQuarantineGroupTypeEnumMap = {
  ArtworkQuarantineGroupType.single: 'single',
  ArtworkQuarantineGroupType.multilayer: 'multilayer',
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
