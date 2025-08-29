import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/custom_entity_keys/custom_entiy_keys_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/utils/elb_exception_thrower.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:serverpod/serverpod.dart';

class ProductHandler {
  const ProductHandler._();

  static Future<ProductDTO?> fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ProductDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<ProductDTO> updateRow(
    Session session,
    ProductDTO entity,
    Transaction transaction,
  ) async {
    return ProductDTO.db.updateRow(session, entity, transaction: transaction);
  }

  /// Creates a new completly newproduct with a new product master
  static Future<ProductDTO> create(
    Session session, {
    required ProductMasterDTO productMaster,
    required int salesOrderId,
    required int customerId,
    required int userId,
    required DateTime now,
    required Transaction transaction,
  }) async {
    final initialSalesOrderProduct = ProductHandler.generateByProductMaster(
      productMaster: productMaster,
      salesOrderId: salesOrderId,
      customerId: customerId,
      userId: userId,
      now: now,
    );

    final product = await ProductDTO.db.insertRow(
      session,
      initialSalesOrderProduct,
      transaction: transaction,
    );
    return product;
  }

  static Future<ProductMasterDTO> createMaster(
    Session session, {
    required ArtworkPrintProcessType printProcessType,
    required ProductType productType,
    required int customerId,
    required int userId,
    required DateTime now,
    required int? serienId,
    required int serienIndex,
    required Transaction transaction,
  }) async {
    var productSerienId = serienId;
    productSerienId ??= await CustomEntityKeysHandler.getNextIntKeyTransaction(
      TableType.productMaster,
    );

    final initialProductMaster = generateNewMaster(
      printProcessType: printProcessType,
      productType: productType,
      customerId: customerId,
      userId: userId,
      now: now,
      serienId: productSerienId,
      serienIndex: serienIndex,
    );
    final productMaster = await ProductMasterDTO.db.insertRow(
      session,
      initialProductMaster,
      transaction: transaction,
    );
    return productMaster;
  }

  /// Check if a Serien Index is available
  static Future<bool> isSerienIndexAvailable(
    Session session, {
    required Transaction transaction,
    required int serienId,
    required int serienIndex,
    bool throwException = true,
  }) async {
    final productMastersWithSerieAndIndex = await ProductMasterDTO.db.find(
      session,
      where: (t) =>
          t.serienId.equals(serienId) &
          t.serienIndex.equals(serienIndex) &
          t.deletedAt.equals(null as DateTime?),
      transaction: transaction,
    );
    final isAvailable = productMastersWithSerieAndIndex.isEmpty;
    if (throwException && !isAvailable) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.serienIndexNotAvailable,
      );
    }
    return isAvailable;
  }

  static Future<ProductMasterDTO> validateMaster(
    Session session, {
    required int productMasterId,
    required Transaction transaction,
    bool throwException = true,
  }) async {
    final productMaster = await ProductMasterDTO.db.findById(
      session,
      productMasterId,
      include: ProductMasterDTO.include(
        customer: CustomerDTO.include(),
        artworks: ArtworkMasterDTO.includeList(),
      ),
      transaction: transaction,
    );
    if (throwException && productMaster == null) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.productMasterNotFound,
      );
    }
    return productMaster!;
  }

  /// Validate Product for adding a new product part
  static Future<ProductDTO> validateForAddingProductPart(
    Session session, {
    required int productId,
    required int salesOrderId,
    required Transaction transaction,
    bool throwException = true,
  }) async {
    final product = await ProductDTO.db.findById(
      session,
      productId,
      include: ProductDTO.include(
        productMaster: ProductMasterDTO.include(),
      ),
      transaction: transaction,
    );
    if (product == null) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.productNotFound,
      );
    }
    return product;
  }

  /// Validates if a product master is available for a sales order
  static Future<void> validateForSalesOrder(
    Session session, {
    required int productMasterId,
    required int salesOrderId,
    required Transaction transaction,
    bool throwException = true,
  }) async {
    final product = await ProductDTO.db.find(
      session,
      where: (t) =>
          t.productMasterId.equals(productMasterId) &
          t.salesOrderId.equals(salesOrderId) &
          t.deletedAt.equals(null as DateTime?),
      transaction: transaction,
    );
    if (throwException && product.isNotEmpty) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.productMasterAlreadyInSalesOrder,
      );
    }
  }

  static Future<bool> hasUnlockedArtworks(
    Session session, {
    required ProductMasterDTO productMaster,
    required Transaction transaction,
    bool throwException = true,
  }) async {
    var hasUnlockedArtwork = false;
    for (final artworkMaster in productMaster.artworks!) {
      final unlockedArtwork = await ArtworkDTO.db.findFirstRow(
        session,
        where: (t) =>
            t.artworkMasterId.equals(artworkMaster.id) &
            t.deletedAt.equals(null as DateTime?) &
            t.isLocked.equals(false),
        transaction: transaction,
      );

      if (unlockedArtwork != null) {
        hasUnlockedArtwork = true;
        break; // End the loop as soon as we find a locked artwork
      }
    }
    if (throwException && hasUnlockedArtwork) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message:
            ElbValidationError.unfinishedArtworksFromProductInOtherSalesOrder,
      );
    }
    return hasUnlockedArtwork;
  }

  /// Generates a product master by quarantine
  static ProductMasterDTO generateNewMaster({
    required ArtworkPrintProcessType printProcessType,
    required ProductType productType,
    required int customerId,
    required int userId,
    required DateTime now,
    required int serienId,
    required int serienIndex,
  }) {
    return ProductMasterDTO(
      serienIdString: serienId.toString(),
      printProcessType: printProcessType.name,
      customerReference: '',
      description: '',
      productType: productType.name,
      keywords: '',
      serienId: serienId,
      serienIndex: serienIndex,
      createdById: userId,
      createdAt: now,
      isDraft: false,
      customerId: customerId,
    );
  }

  /// Generates a product by product master
  /// typically used when creating a new product
  /// for a sales order
  static ProductDTO generateByProductMaster({
    required ProductMasterDTO productMaster,
    required int salesOrderId,
    required int customerId,
    required int userId,
    required DateTime now,
  }) {
    return ProductDTO(
      salesOrderId: salesOrderId,
      customerId: customerId,
      productMasterId: productMaster.id!,
      description: productMaster.description,
      keywords: productMaster.keywords,
      productType: productMaster.productType,
      printProcessType: productMaster.printProcessType,
      customerReference: productMaster.customerReference,
      serienId: productMaster.serienId,
      serienIndex: productMaster.serienIndex,
      serienIdString: productMaster.serienIdString,
      createdAt: now,
      isDraft: false,
      createdById: userId,
    );
  }
}
