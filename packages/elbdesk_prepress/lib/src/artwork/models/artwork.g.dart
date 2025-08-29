// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkImpl _$$ArtworkImplFromJson(Map<String, dynamic> json) =>
    _$ArtworkImpl(
      description: json['description'] as String,
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      trapping: Trapping.fromJson(json['trapping'] as Map<String, dynamic>),
      cornerRadius: (json['cornerRadius'] as num).toDouble(),
      anschnitt: (json['anschnitt'] as num).toDouble(),
      productId: (json['productId'] as num).toInt(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      colors: (json['colors'] as List<dynamic>)
          .map((e) => ArtworkColor.fromJson(e as Map<String, dynamic>))
          .toList(),
      layers: (json['layers'] as List<dynamic>)
          .map((e) => ArtworkLayer.fromJson(e as Map<String, dynamic>))
          .toList(),
      artworkMasterId: (json['artworkMasterId'] as num?)?.toInt(),
      salesOrder: json['salesOrder'] == null
          ? null
          : SalesOrder.fromJson(json['salesOrder'] as Map<String, dynamic>),
      salesOrderId: (json['salesOrderId'] as num?)?.toInt(),
      artworkType:
          $enumDecodeNullable(_$ArtworkTypeEnumMap, json['artworkType']),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      layerId: (json['layerId'] as num).toInt(),
      printProcessType: $enumDecodeNullable(
          _$ArtworkPrintProcessTypeEnumMap, json['printProcessType']),
      artworkQuarantineId: (json['artworkQuarantineId'] as num?)?.toInt(),
      codes: (json['codes'] as List<dynamic>)
          .map((e) => ArtworkCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: (json['version'] as num).toInt(),
      isLocked: json['isLocked'] as bool,
      abzug: (json['abzug'] as num).toInt(),
      reference: json['reference'] as String,
      dieCutterType: $enumDecodeNullable(
          _$ArtworkDieCutterTypeEnumMap, json['dieCutterType']),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ArtworkImplToJson(_$ArtworkImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'customer': instance.customer,
      'meta': instance.meta,
      'trapping': instance.trapping,
      'cornerRadius': instance.cornerRadius,
      'anschnitt': instance.anschnitt,
      'productId': instance.productId,
      'width': instance.width,
      'height': instance.height,
      'colors': instance.colors,
      'layers': instance.layers,
      'artworkMasterId': instance.artworkMasterId,
      'salesOrder': instance.salesOrder,
      'salesOrderId': instance.salesOrderId,
      'artworkType': instance.artworkType,
      'product': instance.product,
      'layerId': instance.layerId,
      'printProcessType': instance.printProcessType,
      'artworkQuarantineId': instance.artworkQuarantineId,
      'codes': instance.codes,
      'version': instance.version,
      'isLocked': instance.isLocked,
      'abzug': instance.abzug,
      'reference': instance.reference,
      'dieCutterType': instance.dieCutterType,
      'id': instance.id,
    };

const _$ArtworkTypeEnumMap = {
  ArtworkType.front: 'front',
  ArtworkType.back: 'back',
};

const _$ArtworkPrintProcessTypeEnumMap = {
  ArtworkPrintProcessType.flexodruck: 'flexodruck',
  ArtworkPrintProcessType.siebdruck: 'siebdruck',
  ArtworkPrintProcessType.buchdruck: 'buchdruck',
  ArtworkPrintProcessType.digitaldruck: 'digitaldruck',
  ArtworkPrintProcessType.offsetdruck: 'offsetdruck',
};

const _$ArtworkDieCutterTypeEnumMap = {
  ArtworkDieCutterType.circle: 'circle',
  ArtworkDieCutterType.square: 'square',
  ArtworkDieCutterType.custom: 'custom',
};
