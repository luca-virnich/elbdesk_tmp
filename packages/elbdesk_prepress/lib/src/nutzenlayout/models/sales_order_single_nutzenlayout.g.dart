// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_single_nutzenlayout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrderSingleNutzenLayoutImpl _$$SalesOrderSingleNutzenLayoutImplFromJson(
        Map<String, dynamic> json) =>
    _$SalesOrderSingleNutzenLayoutImpl(
      salesOrderId: (json['salesOrderId'] as num).toInt(),
      nutzenlayout:
          Nutzenlayout.fromJson(json['nutzenlayout'] as Map<String, dynamic>),
      artworks: (json['artworks'] as List<dynamic>)
          .map((e) => Artwork.fromJson(e as Map<String, dynamic>))
          .toList(),
      salesOrder:
          SalesOrder.fromJson(json['salesOrder'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$$SalesOrderSingleNutzenLayoutImplToJson(
        _$SalesOrderSingleNutzenLayoutImpl instance) =>
    <String, dynamic>{
      'salesOrderId': instance.salesOrderId,
      'nutzenlayout': instance.nutzenlayout,
      'artworks': instance.artworks,
      'salesOrder': instance.salesOrder,
      'id': instance.id,
    };
