import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork/models/artwork.dart';
import 'package:elbdesk_prepress/src/product/extensions/product_type_extension.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

/// Product
///
/// This is the app side Product model. It is used to store information
/// for a Product during runtime. The ProductDTO is fetched from the server and
/// converted to a Product object.
///
/// To parse the ProductDTO to and from a Product object, the fromDTO and
/// toDTO methods are used.
///
@freezed
class Product with _$Product, HasMetaData {
  /// Product constructor
  const factory Product({
    required String description,
    required String keywords,
    required int serienId,
    required int serienIndex,
    required int? productMasterId,
    required DataMeta meta,
    required List<Artwork> artworks,
    required Customer? customer,
    required SalesOrder? salesOrder,
    required ProductType? productType,
    required ArtworkPrintProcessType? printProcessType,
    required String customerReference,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);

  /// Product from DTO
  factory Product.fromDTO(ProductDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return Product(
      printProcessType: Parser.enumFromString(
        ArtworkPrintProcessType.values,
        dto.printProcessType,
      ),
      customerReference: dto.customerReference,
      customer: dto.customer != null ? Customer.fromDTO(dto.customer!) : null,
      salesOrder:
          dto.salesOrder != null ? SalesOrder.fromDTO(dto.salesOrder!) : null,
      productType: Parser.enumFromString(
        ProductType.values,
        dto.productType,
      ),
      meta: dataMeta,
      description: dto.description,
      keywords: dto.keywords,
      serienId: dto.serienId,
      serienIndex: dto.serienIndex,
      productMasterId: dto.productMasterId,
      artworks: dto.artworks?.map(Artwork.fromDTO).toList() ?? [],
    );
  }

  factory Product.fromMasterDTO(ProductMasterDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    return Product(
      printProcessType: Parser.enumFromString(
        ArtworkPrintProcessType.values,
        dto.printProcessType,
      ),
      customerReference: dto.customerReference,
      productType: Parser.enumFromString(
        ProductType.values,
        dto.productType,
      ),
      customer: dto.customer != null ? Customer.fromDTO(dto.customer!) : null,
      salesOrder: null,
      meta: dataMeta,
      description: dto.description,
      keywords: dto.keywords,
      serienId: dto.serienId,
      serienIndex: dto.serienIndex,
      productMasterId: dto.id,
      artworks: dto.artworks?.map(Artwork.fromArtworkMaster).toList() ?? [],
    );
  }

  String get productId => '${IdPrefixes.product}-$serienId';
  String get productIndex => serienIndex.toString().padLeft(3, '0');

  String get fullProductId {
    return '$productId-${productIndex}_${productType?.shortReadable ?? ''}';
  }

  String fullProductPartId(ArtworkType artworkType, int selectedLayerId) {
    final layerId = selectedLayerId == 0
        ? IdPrefixes.bearer
        : '${IdPrefixes.layer}$selectedLayerId';

    return '$productId-${productIndex}_'
        '${productType?.shortReadable ?? ''}_'
        '${layerId}_${artworkType.shortReadable}';
  }

  ProductDTO toDTO() {
    return ProductDTO(
      serienIdString: serienId.toString(),
      printProcessType:
          printProcessType?.name ?? ArtworkPrintProcessType.flexodruck.name,
      customerReference: customerReference,
      productType: productType?.name ?? ProductType.vorderseite.name,
      customerId: customer!.id!,
      salesOrderId: salesOrder!.meta.id!,
      productMasterId: productMasterId!,
      createdAt: meta.createdAt!,
      isDraft: false,
      id: meta.id,
      description: description,
      keywords: keywords,
      serienId: serienId,
      serienIndex: serienIndex,
    );
  }
}

class ProductMasterAdditionalData implements AdditionalEntityData {
  const ProductMasterAdditionalData({
    required this.salesOrderId,
    required this.customSalesOrderId,
    required this.productId,
  });

  factory ProductMasterAdditionalData.fromJson(Map<String, dynamic> json) {
    return ProductMasterAdditionalData(
      salesOrderId: json['salesOrderId'] as int,
      customSalesOrderId: json['customSalesOrderId'] as String,
      productId: json['productId'] as int?,
    );
  }

  final int salesOrderId;
  final String customSalesOrderId;
  final int? productId;
  @override
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'salesOrderId': salesOrderId,
      'customSalesOrderId': customSalesOrderId,
    };
  }
}
