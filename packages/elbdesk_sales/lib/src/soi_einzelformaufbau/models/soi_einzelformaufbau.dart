import 'dart:convert';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/src/sales_order/models/sales_order.dart';
import 'package:elbdesk_sales/src/sales_order_item/models/sales_order_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soi_einzelformaufbau.freezed.dart';
part 'soi_einzelformaufbau.g.dart';

@freezed
class SoiEinzelformaufbau with _$SoiEinzelformaufbau, HasMetaData {
  const factory SoiEinzelformaufbau({
    required Artwork artwork,
    required SalesOrder? salesOrder,
    required int salesOrderItemId,
    required int artworkMasterId,
    required SalesOrderItem? salesOrderItem,
    required int version,
    required DataMeta meta,
  }) = _SoiEinzelformaufbau;

  factory SoiEinzelformaufbau.fromJson(Map<String, Object?> json) =>
      _$SoiEinzelformaufbauFromJson(json);

  factory SoiEinzelformaufbau.fromDTO(SoiEinzelformaufbauDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return SoiEinzelformaufbau(
      artworkMasterId: dto.artworkMasterId,
      salesOrderItem: dto.salesOrderItem != null
          ? SalesOrderItem.fromDTO(dto.salesOrderItem!)
          : null,
      salesOrderItemId: dto.salesOrderItemId,
      artwork: Artwork.fromDTO(dto.artwork!),
      salesOrder: dto.salesOrderItem!.salesOrder != null
          ? SalesOrder.fromDTO(dto.salesOrderItem!.salesOrder!)
          : null,
      meta: dataMeta,
      version: dto.version,
    );
  }

  factory SoiEinzelformaufbau.forSalesOrder(
    SoiEinzelformaufbauDTO dto,
  ) {
    final dataMeta = DataMeta.fromDTO(dto);

    return SoiEinzelformaufbau(
      artworkMasterId: dto.artworkMasterId,
      salesOrderItemId: dto.salesOrderItemId,
      artwork: Artwork.fromDTO(dto.artwork!),
      salesOrder: null,
      salesOrderItem: dto.salesOrderItem != null
          ? SalesOrderItem.fromDTO(dto.salesOrderItem!)
          : null,
      meta: dataMeta,
      version: dto.version,
    );
  }

  const SoiEinzelformaufbau._();

  String get soiIdReadable => '${IdPrefixes.soi}-$salesOrderItemId';

  SoiEinzelformaufbauDTO toDTO() {
    return SoiEinzelformaufbauDTO(
      artworkMasterId: artworkMasterId,
      salesOrderItemId: salesOrderItemId,
      salesOrderItem: salesOrderItem?.toDTO(),
      id: meta.id,
      artworkId: artwork.meta.id!,
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      isDraft: meta.isDraft,
      version: version,
    );
  }
}

class SoiEinzelformaufbauAdditionalData implements AdditionalEntityData {
  const SoiEinzelformaufbauAdditionalData({
    required this.customerId,
    required this.artworkCustomId,
  });

  factory SoiEinzelformaufbauAdditionalData.fromJsonString(
    String jsonString,
  ) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return SoiEinzelformaufbauAdditionalData.fromJson(json);
  }

  factory SoiEinzelformaufbauAdditionalData.fromJson(
    Map<String, dynamic> json,
  ) {
    return SoiEinzelformaufbauAdditionalData(
      customerId: json['customerId'] as int,
      artworkCustomId: json['artworkCustomId'] as String,
    );
  }

  final int customerId;
  final String artworkCustomId;

  @override
  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'artworkCustomId': artworkCustomId,
    };
  }
}
