import 'dart:convert';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/src/sales_order/models/sales_order.dart';
import 'package:elbdesk_sales/src/sales_order_item/models/sales_order_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soi_prepare_artwork.freezed.dart';
part 'soi_prepare_artwork.g.dart';

@freezed
class SoiPrepareArtwork with _$SoiPrepareArtwork, HasMetaData {
  const factory SoiPrepareArtwork({
    required Artwork artwork,
    required SalesOrder? salesOrder,
    required int salesOrderItemId,
    required int artworkMasterId,
    required SalesOrderItem? salesOrderItem,
    required EyeCStatus? eyeCStatus,
    required SoiPrepareArtworkDifficultyLevel? difficultyLevel,
    required DataMeta meta,
  }) = _SoiPrepareArtwork;

  factory SoiPrepareArtwork.fromJson(Map<String, Object?> json) =>
      _$SoiPrepareArtworkFromJson(json);

  factory SoiPrepareArtwork.fromDTO(SoiPrepareArtworkDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return SoiPrepareArtwork(
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
      eyeCStatus: Parser.enumFromString(EyeCStatus.values, dto.eyeCStatus),
      difficultyLevel: Parser.enumFromString(
        SoiPrepareArtworkDifficultyLevel.values,
        dto.difficultyLevel,
      ),
    );
  }

  factory SoiPrepareArtwork.forSalesOrder(SoiPrepareArtworkDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return SoiPrepareArtwork(
      artworkMasterId: dto.artworkMasterId,
      eyeCStatus: Parser.enumFromString(EyeCStatus.values, dto.eyeCStatus),
      difficultyLevel: Parser.enumFromString(
        SoiPrepareArtworkDifficultyLevel.values,
        dto.difficultyLevel,
      ),
      salesOrderItemId: dto.salesOrderItemId,
      artwork: Artwork.fromDTO(dto.artwork!),
      salesOrder: null,
      salesOrderItem: dto.salesOrderItem != null
          ? SalesOrderItem.fromDTO(dto.salesOrderItem!)
          : null,
      meta: dataMeta,
    );
  }

  const SoiPrepareArtwork._();

  String get soiIdReadable => '${IdPrefixes.soi}-$salesOrderItemId';

  SoiPrepareArtworkDTO toDTO() {
    return SoiPrepareArtworkDTO(
      artworkMasterId: artworkMasterId,
      salesOrderItemId: salesOrderItemId,
      salesOrderItem: salesOrderItem?.toDTO(),
      id: meta.id,
      artworkId: artwork.meta.id!,
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      isDraft: meta.isDraft,
      eyeCStatus: eyeCStatus?.name ?? '',
      difficultyLevel: difficultyLevel?.name ?? '',
    );
  }
}

class SoiPrepareArtworkAdditionalData implements AdditionalEntityData {
  const SoiPrepareArtworkAdditionalData({
    required this.customerId,
    required this.artworkCustomId,
    this.status,
    this.artworkWidth,
    this.artworkHeight,
  });

  factory SoiPrepareArtworkAdditionalData.fromJson(Map<String, dynamic> json) {
    return SoiPrepareArtworkAdditionalData(
      customerId:
          json[SoiPrepareArtworkAdditionalDataField.customerId.name] as int?,
      artworkCustomId:
          json[SoiPrepareArtworkAdditionalDataField.artworkCustomId.name]
              as String,
      status: json[SoiPrepareArtworkAdditionalDataField.status.name] as String?,
      artworkWidth: json[SoiPrepareArtworkAdditionalDataField.artworkWidth.name]
          as double?,
      artworkHeight:
          json[SoiPrepareArtworkAdditionalDataField.artworkHeight.name]
              as double?,
    );
  }

  factory SoiPrepareArtworkAdditionalData.fromJsonString(
    String jsonString,
  ) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>?;
    if (json == null) {
      return const SoiPrepareArtworkAdditionalData(
        artworkCustomId: '',
        customerId: null,
        artworkWidth: null,
        artworkHeight: null,
      );
    }
    return SoiPrepareArtworkAdditionalData.fromJson(json);
  }

  final int? customerId;
  final String artworkCustomId;
  final String? status;
  final double? artworkWidth;
  final double? artworkHeight;
  @override
  Map<String, dynamic> toJson() {
    return {
      SoiPrepareArtworkAdditionalDataField.customerId.name: customerId,
      SoiPrepareArtworkAdditionalDataField.artworkCustomId.name:
          artworkCustomId,
      SoiPrepareArtworkAdditionalDataField.status.name: status,
      SoiPrepareArtworkAdditionalDataField.artworkWidth.name: artworkWidth,
      SoiPrepareArtworkAdditionalDataField.artworkHeight.name: artworkHeight,
    };
  }
}
