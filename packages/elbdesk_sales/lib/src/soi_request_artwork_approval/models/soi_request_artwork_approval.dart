import 'dart:convert';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/src/sales_order/models/sales_order.dart';
import 'package:elbdesk_sales/src/sales_order_item/models/sales_order_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soi_request_artwork_approval.freezed.dart';
part 'soi_request_artwork_approval.g.dart';

@freezed
class SoiRequestArtworkApproval with _$SoiRequestArtworkApproval, HasMetaData {
  const factory SoiRequestArtworkApproval({
    required Artwork artwork,
    required SalesOrder? salesOrder,
    required int salesOrderItemId,
    required int artworkMasterId,
    required SalesOrderItem? salesOrderItem,
    required SoiRequestArtworkApprovalType? type,
    required DataMeta meta,
  }) = _SoiRequestArtworkApproval;

  factory SoiRequestArtworkApproval.fromJson(Map<String, Object?> json) =>
      _$SoiRequestArtworkApprovalFromJson(json);

  factory SoiRequestArtworkApproval.fromDTO(SoiRequestArtworkApprovalDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return SoiRequestArtworkApproval(
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
      type: Parser.enumFromString(
        SoiRequestArtworkApprovalType.values,
        dto.approvalType,
      ),
    );
  }

  factory SoiRequestArtworkApproval.forSalesOrder(
    SoiRequestArtworkApprovalDTO dto,
  ) {
    final dataMeta = DataMeta.fromDTO(dto);

    return SoiRequestArtworkApproval(
      artworkMasterId: dto.artworkMasterId,
      type: Parser.enumFromString(
        SoiRequestArtworkApprovalType.values,
        dto.approvalType,
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

  const SoiRequestArtworkApproval._();

  String get soiIdReadable => '${IdPrefixes.soi}-$salesOrderItemId';

  SoiRequestArtworkApprovalDTO toDTO() {
    return SoiRequestArtworkApprovalDTO(
      artworkMasterId: artworkMasterId,
      salesOrderItemId: salesOrderItemId,
      salesOrderItem: salesOrderItem?.toDTO(),
      id: meta.id,
      artworkId: artwork.meta.id!,
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      isDraft: meta.isDraft,
      approvalType: type?.name ?? '',
    );
  }
}

class SoiRequestArtworkApprovalAdditionalData implements AdditionalEntityData {
  const SoiRequestArtworkApprovalAdditionalData({
    required this.customerId,
    required this.artworkCustomId,
    required this.status,
  });

  factory SoiRequestArtworkApprovalAdditionalData.fromJsonString(
    String jsonString,
  ) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return SoiRequestArtworkApprovalAdditionalData.fromJson(json);
  }

  factory SoiRequestArtworkApprovalAdditionalData.fromJson(
    Map<String, dynamic> json,
  ) {
    return SoiRequestArtworkApprovalAdditionalData(
      customerId:
          json[SoiRequestArtworkApprovalAdditionalDataField.customerId.name]
              as int,
      artworkCustomId: json[SoiRequestArtworkApprovalAdditionalDataField
          .artworkCustomId.name] as String,
      status: json[SoiRequestArtworkApprovalAdditionalDataField.status.name]
          as String?,
    );
  }

  final int customerId;
  final String artworkCustomId;
  final String? status;

  @override
  Map<String, dynamic> toJson() {
    return {
      SoiRequestArtworkApprovalAdditionalDataField.customerId.name: customerId,
      SoiRequestArtworkApprovalAdditionalDataField.artworkCustomId.name:
          artworkCustomId,
      SoiRequestArtworkApprovalAdditionalDataField.status.name: status,
    };
  }
}
