// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      description: json['description'] as String,
      keywords: json['keywords'] as String,
      serienId: (json['serienId'] as num).toInt(),
      serienIndex: (json['serienIndex'] as num).toInt(),
      productMasterId: (json['productMasterId'] as num?)?.toInt(),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      artworks: (json['artworks'] as List<dynamic>)
          .map((e) => Artwork.fromJson(e as Map<String, dynamic>))
          .toList(),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      salesOrder: json['salesOrder'] == null
          ? null
          : SalesOrder.fromJson(json['salesOrder'] as Map<String, dynamic>),
      productType:
          $enumDecodeNullable(_$ProductTypeEnumMap, json['productType']),
      printProcessType: $enumDecodeNullable(
          _$ArtworkPrintProcessTypeEnumMap, json['printProcessType']),
      customerReference: json['customerReference'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'keywords': instance.keywords,
      'serienId': instance.serienId,
      'serienIndex': instance.serienIndex,
      'productMasterId': instance.productMasterId,
      'meta': instance.meta,
      'artworks': instance.artworks,
      'customer': instance.customer,
      'salesOrder': instance.salesOrder,
      'productType': instance.productType,
      'printProcessType': instance.printProcessType,
      'customerReference': instance.customerReference,
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
