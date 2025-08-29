import 'dart:ui';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_print_process_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork/models/artwork_layer.dart';
import 'package:elbdesk_prepress/src/artwork/models/trapping.dart';
import 'package:elbdesk_prepress/src/artwork_code/models/artwork_code.dart';
import 'package:elbdesk_prepress/src/product/extensions/product_type_extension.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artwork.freezed.dart';
part 'artwork.g.dart';

@freezed
class Artwork with _$Artwork, HasMetaData {
  const factory Artwork({
    required String description,
    required Customer? customer,
    required DataMeta meta,
    required Trapping trapping,
    required double cornerRadius,

    /// En: Bleed
    required double anschnitt,
    required int productId,
    required double width,
    required double height,
    required List<ArtworkColor> colors,
    required List<ArtworkLayer> layers,
    required int? artworkMasterId,
    required SalesOrder? salesOrder,
    required int? salesOrderId,
    required ArtworkType? artworkType,
    required Product? product,
    required int layerId,
    required ArtworkPrintProcessType? printProcessType,
    required int? artworkQuarantineId,
    required List<ArtworkCode> codes,
    required int version,
    required bool isLocked,
    required int abzug,
    required String reference,
    required ArtworkDieCutterType? dieCutterType,
    int? id,
  }) = _Artwork;

  factory Artwork.fromJson(Map<String, Object?> json) =>
      _$ArtworkFromJson(json);

  /// From DTO with nullable sales order
  factory Artwork.fromDTO(ArtworkDTO dto) {
    final meta = DataMeta.fromDTO(dto);

    return Artwork(
      version: dto.version,
      reference: dto.reference,
      abzug: dto.abzug,
      isLocked: dto.isLocked,
      cornerRadius: dto.cornerRadius ?? 0,
      id: dto.id,
      product: dto.product != null ? Product.fromDTO(dto.product!) : null,
      artworkType: Parser.enumFromString(ArtworkType.values, dto.artworkType) ??
          ArtworkType.front,
      layerId: dto.layerId,
      printProcessType: Parser.enumFromString(
            ArtworkPrintProcessType.values,
            dto.printProcessType,
          ) ??
          ArtworkPrintProcessType.flexodruck,
      artworkQuarantineId: dto.artworkQuarantineId,
      productId: dto.productId!,
      artworkMasterId: dto.artworkMasterId,
      salesOrder:
          dto.salesOrder != null ? SalesOrder.fromDTO(dto.salesOrder!) : null,
      salesOrderId: dto.salesOrderId,
      layers: dto.layers.map(ArtworkLayer.fromDTO).toList(),
      description: dto.description,
      customer: dto.customer != null ? Customer.fromDTO(dto.customer!) : null,
      trapping: Trapping.fromDTO(dto.trapping),
      colors: dto.colors.map(ArtworkColor.fromDTO).toList(),
      codes: dto.codes.map(ArtworkCode.fromDTO).toList(),
      meta: meta,
      dieCutterType: Parser.enumFromString(
        ArtworkDieCutterType.values,
        dto.dieCutterType,
      ),
      anschnitt: dto.anschnitt,
      width: dto.width,
      height: dto.height,
    );
  }

  factory Artwork.fromArtworkMaster(ArtworkMasterDTO dto) {
    return Artwork(
      isLocked: false,
      version: dto.version,
      cornerRadius: dto.cornerRadius ?? 0,
      abzug: 1,
      id: dto.id,
      reference: dto.reference,
      product: dto.product != null ? Product.fromMasterDTO(dto.product!) : null,
      layerId: dto.layerId,
      printProcessType: Parser.enumFromString(
        ArtworkPrintProcessType.values,
        dto.printProcessType,
      ),
      dieCutterType: Parser.enumFromString(
        ArtworkDieCutterType.values,
        dto.dieCutterType,
      ),
      artworkQuarantineId: dto.artworkQuarantineId,
      artworkType: Parser.enumFromString(ArtworkType.values, dto.artworkType) ??
          ArtworkType.front,
      productId: dto.productId!,
      description: dto.description,
      customer: dto.customer != null ? Customer.fromDTO(dto.customer!) : null,
      trapping: Trapping.fromDTO(dto.trapping),
      colors: dto.colors.map(ArtworkColor.fromDTO).toList(),
      codes: dto.codes.map(ArtworkCode.fromDTO).toList(),
      meta: DataMeta.fromDTO(dto),
      anschnitt: dto.anschnitt,
      width: dto.width,
      height: dto.height,
      artworkMasterId: dto.id,
      layers: dto.layers.map(ArtworkLayer.fromDTO).toList(),
      salesOrder: null,
      salesOrderId: 0,
    );
  }

  /// Constructor
  const Artwork._();

  Size get size => Size(width, height);

  String formattedDimensions(String locale) =>
      '${width.formatted(locale)} x ${height.formatted(locale)} mm';

  ArtworkDTO toDTO() {
    return ArtworkDTO(
      reference: reference,
      version: version,
      abzug: abzug,
      dieCutterType: dieCutterType?.name,
      isLocked: isLocked,
      cornerRadius: cornerRadius,
      layerId: layerId,
      printProcessType:
          printProcessType?.name ?? ArtworkPrintProcessType.flexodruck.name,
      artworkQuarantineId: artworkQuarantineId,
      artworkType: artworkType?.name ?? ArtworkType.front.name,
      productId: productId,
      artworkMasterId: artworkMasterId!,
      salesOrderId: salesOrderId!,
      customer: customer!.toDTO(),
      id: meta.id,
      createdAt: meta.createdAt!,
      isDraft: meta.isDraft,
      lastModifiedAt: meta.lastModifiedAt,
      description: description,
      customerId: customer!.id!,
      layers: layers.map((e) => e.toDTO()).toList(),
      colors: colors.map((e) => e.toDTO()).toList(),
      codes: codes.map((e) => e.toDTO()).toList(),
      trapping: trapping.toDTO(),
      anschnitt: anschnitt,
      width: width,
      height: height,
    );
  }

  String fullArtworkIdWithProduct(Product product) {
    late final String layerIdString;
    if (layerId == 0) {
      layerIdString = IdPrefixes.bearer;
    } else {
      layerIdString = '${IdPrefixes.layer}$layerId';
    }

    return '${product.productId}-${product.productIndex}_'
        '${product.productType?.shortReadable ?? ''}_'
        '${printProcessType?.shortReadable ?? ''}_${layerIdString}_'
        '${artworkType?.shortReadable ?? ''}';
  }
}

class ArtworkAdditionalData implements AdditionalEntityData {
  const ArtworkAdditionalData({
    required this.customerId,
    required this.customSalesOrderId,
    required this.artworkId,
    required this.width,
    required this.height,
  });

  factory ArtworkAdditionalData.fromJson(Map<String, dynamic> json) {
    return ArtworkAdditionalData(
      customerId: json[ArtworkAdditionalDataField.customerId.name] as int?,
      customSalesOrderId:
          json[ArtworkAdditionalDataField.customSalesOrderId.name] as String?,
      artworkId: json[ArtworkAdditionalDataField.artworkId.name] as int?,
      width: json[ArtworkAdditionalDataField.width.name] as double?,
      height: json[ArtworkAdditionalDataField.height.name] as double?,
    );
  }

  final int? customerId;
  final String? customSalesOrderId;
  final int? artworkId;
  final double? width;
  final double? height;
  @override
  Map<String, dynamic> toJson() {
    return {
      ArtworkAdditionalDataField.customerId.name: customerId,
      ArtworkAdditionalDataField.customSalesOrderId.name: customSalesOrderId,
      ArtworkAdditionalDataField.artworkId.name: artworkId,
      ArtworkAdditionalDataField.width.name: width,
      ArtworkAdditionalDataField.height.name: height,
    };
  }
}
