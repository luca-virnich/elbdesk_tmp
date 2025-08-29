import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/core/utils/elb_exception_thrower.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/artwork_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/endpoints/artwork_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine/artwork_quarantine_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine/endpoints/artwork_quarantine_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine_group/endpoints/artwork_quarantine_group_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/nutzenlayout/nutzenlayout_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/product/endpoints/product_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/product/product_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/endpoints/sales_order_item_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_prepare_artwork/endpoints/soi_prepare_artwork_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_prepare_artwork/soi_prepare_artwork_handler.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:serverpod/serverpod.dart';

class ProductArtworkHandler {
  const ProductArtworkHandler._();

  // * Create

  // *  From Artwork Quarantine
  // We create a
  // Product and ProductMaster
  // Artwork and ArtworkMaster

  static Future<ProductDTO> createProductAndArtworkByArtworkQuarantine(
    Session session, {
    // origin, artwork quarantine and artwork template
    required int artworkQuarantineId,
    required int artworkTemplateId,

    // target, sales order and customer
    required int salesOrderId,
    required int customerId,

    // Product Settings
    required ProductType productType,
    required int? serienId,
    required int serienIndex,

    // Artwork Settings
    required ArtworkType artworkType,
    required ArtworkPrintProcessType printProcessType,
    required int layerId,

    // Optional transaction for nested operations
    Transaction? transaction,
  }) async {
    try {
      if (transaction != null) {
        final (
          :finalProduct,
          :salesOrderItem,
          :prepareArtworkSoi,
          :updatedGroup,
          :updatedQuarantine
        ) = await _createProductAndArtworkByArtworkQuarantine(
          session,
          artworkQuarantineId: artworkQuarantineId,
          artworkTemplateId: artworkTemplateId,
          salesOrderId: salesOrderId,
          customerId: customerId,
          productType: productType,
          serienId: serienId,
          serienIndex: serienIndex,
          artworkType: artworkType,
          printProcessType: printProcessType,
          layerId: layerId,
          transaction: transaction,
        );

        // add new product to the stream
        productStreamController.add(finalProduct!);
        artworkQuarantineStreamController.add(updatedQuarantine);
        if (updatedGroup != null) {
          artworkQuarantineGroupStreamController.add(updatedGroup);
        }
        // add updated quarantine to the stream so it can be removed
        // artworkQuarantineStreamController.add(artworkQuarantine);

        return finalProduct;
      }

      final (
        :finalProduct,
        :salesOrderItem,
        :prepareArtworkSoi,
        :updatedGroup,
        :updatedQuarantine
      ) = await session.db.transaction((transaction) async {
        return _createProductAndArtworkByArtworkQuarantine(
          session,
          artworkQuarantineId: artworkQuarantineId,
          artworkTemplateId: artworkTemplateId,
          salesOrderId: salesOrderId,
          customerId: customerId,
          productType: productType,
          serienId: serienId,
          serienIndex: serienIndex,
          artworkType: artworkType,
          printProcessType: printProcessType,
          layerId: layerId,
          transaction: transaction,
        );
      });

      // add new product to the stream
      productStreamController.add(finalProduct!);
      artworkQuarantineStreamController.add(updatedQuarantine);

      if (updatedGroup != null) {
        artworkQuarantineGroupStreamController.add(updatedGroup);
      }
      // add updated quarantine to the stream so it can be removed
      // artworkQuarantineStreamController.add(artworkQuarantine);
      // soiPrepareArtworkStreamController.add(prepareArtworkSoi);
      // soiPrepareArtworkStreamForSalesOrderController.add(prepareArtworkSoi);
      // salesOrderItemStreamController.add(salesOrderItem);

      return finalProduct;
    } catch (e) {
      session.log(
        'Error creating product part artwork by artwork quarantine: '
        '$e \n\n Transaction: $transaction',
      );
      rethrow;
    }
  }

  /// Private helper method that contains the actual implementation
  static Future<
      ({
        ProductDTO? finalProduct,
        SalesOrderItemDTO salesOrderItem,
        SoiPrepareArtworkDTO prepareArtworkSoi,
        ArtworkQuarantineGroupDTO? updatedGroup,
        ArtworkQuarantineDTO updatedQuarantine,
      })> _createProductAndArtworkByArtworkQuarantine(
    Session session, {
    required int artworkQuarantineId,
    required int artworkTemplateId,
    required int salesOrderId,
    required int customerId,
    required ProductType productType,
    required int? serienId,
    required int serienIndex,
    required ArtworkType artworkType,
    required ArtworkPrintProcessType printProcessType,
    required int layerId,
    required Transaction transaction,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    // * Pre-Checks

    // Check if serien index is available
    if (serienId != null) {
      await ProductHandler.isSerienIndexAvailable(
        session,
        transaction: transaction,
        serienId: serienId,
        serienIndex: serienIndex,
      );
    }

    // Check if artwork template is valid and exists
    final artworkTemplate = await ArtworkHandler.validateTemplate(
      session,
      artworkTemplateId: artworkTemplateId,
      transaction: transaction,
    );

    // Check if artwork quarantine is valid and exists
    final artworkQuarantine = await ArtworkHandler.validateQuarantine(
      session,
      artworkQuarantineId: artworkQuarantineId,
      transaction: transaction,
    );

    // * Create Product Master

    // Fetch SerienId

    // Set initial values
    final productMaster = await ProductHandler.createMaster(
      session,
      printProcessType: printProcessType,
      productType: productType,
      customerId: customerId,
      userId: userId,
      now: now,
      serienId: serienId,
      serienIndex: serienIndex,
      transaction: transaction,
    );

    // * Create Artwork Master

    final artworkMaster = await ArtworkHandler.createMaster(
      session,
      artworkTemplate: artworkTemplate!,
      printProcessType: printProcessType,
      artworkType: artworkType,
      productMasterId: productMaster.id!,
      customerId: customerId,
      layerId: layerId,
      userId: userId,
      now: now,
      artworkQuarantine: artworkQuarantine,
      transaction: transaction,
    );
    // * Create Product (Scoped to Sales Order)

    final product = await ProductHandler.create(
      session,
      productMaster: productMaster,
      salesOrderId: salesOrderId,
      customerId: customerId,
      userId: userId,
      now: now,
      transaction: transaction,
    );
    // * Create Artwork (Scoped to Product)
    final createdArtwork = await ArtworkHandler.create(
      session,
      artworkMaster: artworkMaster,
      productId: product.id!,
      customerId: customerId,
      userId: userId,
      now: now,
      transaction: transaction,
      salesOrderId: salesOrderId,
      artworkQuarantineId: artworkQuarantineId,
      isLocked: false,
    );
    // * Creating Prepare Artwork Soi

    // creating sales order item
    final (:salesOrderItem, :soiPrepareArtwork, :artwork) =
        await SoiPrepareArtworkHandler.createSoiPrepareArtworkAndSalesOrderItem(
      session,
      increaseArtworkVersion: false,
      artworkId: createdArtwork.id!,
      artworkMasterId: artworkMaster.id!,
      salesOrderId: salesOrderId,
      customerId: customerId,
      userId: userId,
      now: now,
      transaction: transaction,
    );

    // * Refetching the Product with the Artwork as Relation
    final productWithArtwork = await ProductDTO.db.findById(
      session,
      product.id!,
      include: ProductDTO.include(
        artworks: ArtworkDTO.includeList(),
      ),
      transaction: transaction,
    );
    // Adding to product stream

    // * Update Quarantine and Group Status
    // The status of the Quarantine is set to inUse since it was used to
    // create this product part
    // The group status is updated according to the status of the quarantine
    final (:quarantine, :updatedGroup) =
        await ArtworkQuarantineHandler.updateAfterAssignment(
      session,
      artworkQuarantineId,
      transaction,
      now,
      userId,
    );

    return (
      finalProduct: productWithArtwork,
      salesOrderItem: salesOrderItem,
      prepareArtworkSoi: soiPrepareArtwork,
      updatedGroup: updatedGroup,
      updatedQuarantine: quarantine,
    );
  }

  static Future<ProductDTO> createProductPartArtworkByArtworkQuarantine(
    Session session, {
    // origin, artwork quarantine and artwork template
    required int artworkQuarantineId,
    required int artworkTemplateId,
    required int customerId,

    // target, sales order and product
    required int salesOrderId,
    required int productId,

    // Artwork Settings
    required ArtworkType artworkType,
    required ArtworkPrintProcessType printProcessType,
    required int layerId,

    // Product Settings
    required int serienIndex,

    // Optional transaction for nested operations
    Transaction? transaction,
  }) async {
    try {
      if (transaction != null) {
        final (
          :product,
          :salesOrderItem,
          :prepareArtworkSoi,
          :updatedGroup,
          :updatedQuarantine
        ) = await _createProductPartArtworkByArtworkQuarantine(
          session,
          artworkQuarantineId: artworkQuarantineId,
          artworkTemplateId: artworkTemplateId,
          customerId: customerId,
          salesOrderId: salesOrderId,
          productId: productId,
          artworkType: artworkType,
          printProcessType: printProcessType,
          layerId: layerId,
          serienIndex: serienIndex,
          transaction: transaction,
        );

        // Broadcast Changes
        productStreamController.add(product);
        soiPrepareArtworkStreamController.add(prepareArtworkSoi);
        salesOrderItemStreamController.add(salesOrderItem);
        artworkQuarantineStreamController.add(updatedQuarantine);
        if (updatedGroup != null) {
          artworkQuarantineGroupStreamController.add(updatedGroup);
        }

        return product;
      }

      final (
        :product,
        :salesOrderItem,
        :prepareArtworkSoi,
        :updatedGroup,
        :updatedQuarantine
      ) = await session.db.transaction((transaction) async {
        return _createProductPartArtworkByArtworkQuarantine(
          session,
          artworkQuarantineId: artworkQuarantineId,
          artworkTemplateId: artworkTemplateId,
          customerId: customerId,
          salesOrderId: salesOrderId,
          productId: productId,
          artworkType: artworkType,
          printProcessType: printProcessType,
          layerId: layerId,
          serienIndex: serienIndex,
          transaction: transaction,
        );
      });

      // Broadcast Changes
      productStreamController.add(product);
      soiPrepareArtworkStreamController.add(prepareArtworkSoi);
      salesOrderItemStreamController.add(salesOrderItem);
      artworkQuarantineStreamController.add(updatedQuarantine);
      if (updatedGroup != null) {
        artworkQuarantineGroupStreamController.add(updatedGroup);
      }
      return product;
    } catch (e) {
      session.log(
        'Error creating product part artwork by artwork quarantine: $e '
        '\n\n Transaction: $transaction',
      );
      rethrow;
    }
  }

  /// Private helper method that contains the actual implementation
  static Future<
      ({
        ProductDTO product,
        SalesOrderItemDTO salesOrderItem,
        SoiPrepareArtworkDTO prepareArtworkSoi,
        ArtworkQuarantineGroupDTO? updatedGroup,
        ArtworkQuarantineDTO updatedQuarantine,
      })> _createProductPartArtworkByArtworkQuarantine(
    Session session, {
    required int artworkQuarantineId,
    required int artworkTemplateId,
    required int customerId,
    required int salesOrderId,
    required int productId,
    required ArtworkType artworkType,
    required ArtworkPrintProcessType printProcessType,
    required int layerId,
    required int serienIndex,
    required Transaction transaction,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    // * Pre-Checks

    // Check if artwork template is valid and exists
    final artworkTemplate = await ArtworkHandler.validateTemplate(
      session,
      artworkTemplateId: artworkTemplateId,
      transaction: transaction,
    );

    // Check if artwork quarantine is valid and exists
    final artworkQuarantine = await ArtworkHandler.validateQuarantine(
      session,
      artworkQuarantineId: artworkQuarantineId,
      transaction: transaction,
    );

    // Check if product exists
    final product = await ProductHandler.validateForAddingProductPart(
      session,
      productId: productId,
      salesOrderId: salesOrderId,
      transaction: transaction,
    );

    // * Create Product Part/Artwork
    final artworkMaster = await ArtworkHandler.createMaster(
      session,
      artworkTemplate: artworkTemplate!,
      printProcessType: printProcessType,
      artworkType: artworkType,
      productMasterId: product.productMasterId,
      customerId: customerId,
      layerId: layerId,
      userId: userId,
      now: now,
      artworkQuarantine: artworkQuarantine,
      transaction: transaction,
    );

    // * Create Artwork (Scoped to Product)
    final createdArtwork = await ArtworkHandler.create(
      session,
      artworkMaster: artworkMaster,
      productId: product.id!,
      customerId: customerId,
      userId: userId,
      now: now,
      salesOrderId: salesOrderId,
      artworkQuarantineId: artworkQuarantineId,
      isLocked: false,
      transaction: transaction,
    );

    // creating sales order item
    final (:salesOrderItem, :soiPrepareArtwork, :artwork) =
        await SoiPrepareArtworkHandler.createSoiPrepareArtworkAndSalesOrderItem(
      session,
      customerId: customerId,
      increaseArtworkVersion: false,
      artworkId: createdArtwork.id!,
      artworkMasterId: artworkMaster.id!,
      salesOrderId: salesOrderId,
      userId: userId,
      now: now,
      transaction: transaction,
    );

    // * Refetch Product
    final refetchedProduct = await ProductDTO.db.findById(
      session,
      product.id!,
      include: ProductDTO.include(
        artworks: ArtworkDTO.includeList(),
      ),
      transaction: transaction,
    );

    // * Update Quarantine and Group Status
    // The status of the Quarantine is set to inUse since it was used to
    // create this product part
    // The group status is updated according to the status of the quarantine
    final (:quarantine, :updatedGroup) =
        await ArtworkQuarantineHandler.updateAfterAssignment(
      session,
      artworkQuarantineId,
      transaction,
      now,
      userId,
    );

    return (
      product: refetchedProduct!,
      salesOrderItem: salesOrderItem,
      prepareArtworkSoi: soiPrepareArtwork,
      updatedGroup: updatedGroup,
      updatedQuarantine: quarantine,
    );
  }

  static Future<List<ProductDTO>>
      createBulkProductPartArtworkByArtworkQuarantine(
    Session session, {
    required int customerId,
    required int artworkTemplateId,
    required int salesOrderId,
    required List<SalesOrderItemType> salesOrderItemTypes,
    required int productId,
    required ArtworkType artworkType,
    required int layerId,
    required ArtworkPrintProcessType printProcessType,
    required List<({int artworkQuarantineId, int serienIndex})>
        quarantinesWithIndices,
  }) async {
    final createdProducts = await session.db.transaction((transaction) async {
      final products = <ProductDTO>[];

      // Process each quarantine with its serien index
      for (final quarantineWithIndex in quarantinesWithIndices) {
        // Create product part and artwork for this quarantine
        // Pass the transaction to ensure everything runs in a single
        // transaction
        try {
          final product = await createProductPartArtworkByArtworkQuarantine(
            session,
            artworkQuarantineId: quarantineWithIndex.artworkQuarantineId,
            artworkTemplateId: artworkTemplateId,
            customerId: customerId,
            salesOrderId: salesOrderId,
            productId: productId,
            artworkType: artworkType,
            printProcessType: printProcessType,
            layerId: layerId,
            serienIndex: quarantineWithIndex.serienIndex,
            transaction: transaction,
          );

          products.add(product);
        } catch (e) {
          // Log the error but continue with other items
          session.log(
            'Error creating product part artwork by artwork quarantine: $e '
            '\n\n Transaction: $transaction',
          );

          // Re-throw to rollback the entire transaction
          rethrow;
        }
      }

      return products;
    });

    return createdProducts;
  }

  static Future<void> addExistingProductToSalesOrder(
    Session session, {
    required int productMasterId,
    required int salesOrderId,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    final product = await session.db.transaction((transaction) async {
      // * Check if Product Master exists
      final productMaster = await ProductHandler.validateMaster(
        session,
        productMasterId: productMasterId,
        transaction: transaction,
      );
      // * Check if product/p master is already in sales order
      await ProductHandler.validateForSalesOrder(
        session,
        productMasterId: productMasterId,
        salesOrderId: salesOrderId,
        transaction: transaction,
      );

      // * Check if artworks of the product master are unlocked in another
      // sales order

      // find all prepare artwork sois for all artworks from the product
      await ProductHandler.hasUnlockedArtworks(
        session,
        productMaster: productMaster,
        transaction: transaction,
      );

      // * Create Product (Scoped to Sales Order)
      final initialSalesOrderProduct = ProductHandler.generateByProductMaster(
        productMaster: productMaster,
        salesOrderId: salesOrderId,
        customerId: productMaster.customerId,
        userId: userId,
        now: now,
      );
      final salesOrderProduct = await ProductDTO.db.insertRow(
        session,
        initialSalesOrderProduct,
        transaction: transaction,
      );

      // * Create Artworks for Sales Order
      for (final artwork in productMaster.artworks!) {
        final initialSalesOrderArtwork = ArtworkHandler.generateByMaster(
          artworkMaster: artwork,
          isLocked: true,
          productId: salesOrderProduct.id!,
          customerId: productMaster.customerId,
          userId: userId,
          now: now,
          salesOrderId: salesOrderId,
          artworkQuarantineId: null,
        );
        await ArtworkDTO.db.insertRow(
          session,
          initialSalesOrderArtwork,
          transaction: transaction,
        );
      }
      // refetch product
      final refetchedProduct = await ProductDTO.db.findById(
        session,
        salesOrderProduct.id!,
        include: ProductDTO.include(
          artworks: ArtworkDTO.includeList(),
        ),
        transaction: transaction,
      );
      return refetchedProduct;
    });
    // * Broadcast Changes
    productStreamController.add(product!);
  }

  static Future<List<ProductDTO>>
      createBulkProductAndArtworkByArtworkQuarantine(
    Session session, {
    required int customerId,
    required int artworkTemplateId,
    required int salesOrderId,
    required List<SalesOrderItemType> salesOrderItemTypes,
    required ArtworkType artworkType,
    required int layerId,
    required ArtworkPrintProcessType printProcessType,
    required ProductType productType,
    required int? serienId,
    required List<({int artworkQuarantineId, int serienIndex})>
        quarantinesWithIndices,
  }) async {
    final createdProducts = await session.db.transaction((transaction) async {
      final products = <ProductDTO>[];

      // Process each quarantine with its serien index
      for (final quarantineWithIndex in quarantinesWithIndices) {
        try {
          // Create product and artwork for this quarantine
          // Pass the transaction to ensure everything runs in a single
          // transaction
          final product = await createProductAndArtworkByArtworkQuarantine(
            session,
            artworkQuarantineId: quarantineWithIndex.artworkQuarantineId,
            artworkTemplateId: artworkTemplateId,
            salesOrderId: salesOrderId,
            customerId: customerId,
            productType: productType,
            serienId: serienId,
            serienIndex: quarantineWithIndex.serienIndex,
            artworkType: artworkType,
            printProcessType: printProcessType,
            layerId: layerId,
            transaction: transaction,
          );

          products.add(product);
        } catch (e) {
          // Log the error but continue with other items
          session.log(
            'Error creating product for quarantine '
            '${quarantineWithIndex.artworkQuarantineId}: $e',
          );

          // Re-throw to rollback the entire transaction
          rethrow;
        }
      }

      return products;
    });

    return createdProducts;
  }

  /// Create a new product manually without requiring artwork quarantines
  ///
  /// This method creates a product with a default artwork template
  /// that can be filled in by the user via the UI
  ///
  /// The product will bundle the artwork:
  /// Product -> ProductPart -> Artwork
  ///
  static Future<ProductDTO> createProductManually(
    Session session, {
    required int salesOrderId,
    required int customerId,
    required ProductType productType,
    required int? serienId,
    required int serienIndex,
    required ArtworkType artworkType,
    required ArtworkPrintProcessType printProcessType,
    required int layerId,
    required int artworkTemplateId,
  }) async {
    try {
      final (:product, :salesOrderItem, :prepareArtworkSoi) =
          await session.db.transaction(
        (transaction) async {
          final (:userId, :now) =
              await CoreUtils.getCurrentTimeAndUser(session);

          // * Pre-Checks
          // Check if serien index is available
          if (serienId != null) {
            await ProductHandler.isSerienIndexAvailable(
              session,
              transaction: transaction,
              serienId: serienId,
              serienIndex: serienIndex,
            );
          }

          // Check if artwork template is valid and exists
          final artworkTemplate = await ArtworkHandler.validateTemplate(
            session,
            artworkTemplateId: artworkTemplateId,
            transaction: transaction,
            throwException: true,
          );

          // * Create Product Master
          final productMaster = await ProductHandler.createMaster(
            session,
            printProcessType: printProcessType,
            productType: productType,
            customerId: customerId,
            userId: userId,
            now: now,
            serienId: serienId,
            serienIndex: serienIndex,
            transaction: transaction,
          );

          // * Create Artwork Master
          final artworkMaster = await ArtworkHandler.createMaster(
            session,
            artworkTemplate: artworkTemplate!,
            printProcessType: printProcessType,
            artworkType: artworkType,
            productMasterId: productMaster.id!,
            customerId: customerId,
            layerId: layerId,
            userId: userId,
            now: now,
            artworkQuarantine: null, // No quarantine for manual creation
            transaction: transaction,
          );

          // * Create Product (Scoped to Sales Order)
          final product = await ProductHandler.create(
            session,
            productMaster: productMaster,
            salesOrderId: salesOrderId,
            customerId: customerId,
            userId: userId,
            now: now,
            transaction: transaction,
          );

          // * Create Artwork (Scoped to Product)
          final createdArtwork = await ArtworkHandler.create(
            session,
            artworkMaster: artworkMaster,
            productId: product.id!,
            customerId: customerId,
            userId: userId,
            now: now,
            transaction: transaction,
            salesOrderId: salesOrderId,
            artworkQuarantineId: null, // No quarantine for manual creation
            isLocked: false,
          );

          // * Creating Prepare Artwork Soi
          final (:salesOrderItem, :soiPrepareArtwork, :artwork) =
              await SoiPrepareArtworkHandler
                  .createSoiPrepareArtworkAndSalesOrderItem(
            session,
            increaseArtworkVersion: false,
            artworkId: createdArtwork.id!,
            artworkMasterId: artworkMaster.id!,
            salesOrderId: salesOrderId,
            customerId: customerId,
            userId: userId,
            now: now,
            transaction: transaction,
          );

          // * Refetching the Product with the Artwork as Relation
          final productWithArtwork = await ProductDTO.db.findById(
            session,
            product.id!,
            include: ProductDTO.include(
              artworks: ArtworkDTO.includeList(),
            ),
            transaction: transaction,
          );

          return (
            product: productWithArtwork!,
            salesOrderItem: salesOrderItem,
            prepareArtworkSoi: soiPrepareArtwork,
          );
        },
      );

      // Add new product to the stream to notify UI
      productStreamController.add(product);
      salesOrderItemStreamController.add(salesOrderItem);
      soiPrepareArtworkStreamController.add(prepareArtworkSoi);

      return product;
    } catch (e) {
      session.log(
        'Error creating product manually: $e',
      );
      rethrow;
    }
  }

  // * Update

  // Updating a Artwork (scoped to a Sales Order)

  static Future<ArtworkDTO> updateArtwork(
    Session session, {
    required ArtworkDTO artwork,
    required String sessionId,
    required bool release,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    final (:updatedProduct, :updatedArtwork) =
        await session.db.transaction((transaction) async {
      // * Validate Update
      final serverArtwork = await ArtworkDTO.db.findById(
        session,
        artwork.id!,
        transaction: transaction,
      );
      await GenericCrud.validateUpdate(
        session,
        sessionId: sessionId,
        serverEntity: serverArtwork,
        now: now,
      );

      // * check dimension changes
      final dimensionChanged = artwork.width != serverArtwork!.width ||
          artwork.height != serverArtwork.height;
      if (dimensionChanged) {
        // * check if the artwork is used in a nutzenlayout
        final nutzenlayoutArtwork =
            await NutzenlayoutHandler.hasArtworkNutzenlayout(
          session,
          artworkId: artwork.id!,
        );
        if (nutzenlayoutArtwork) {
          throw await ElbExceptionThrower.validationError(
            session,
            exceptionType: ElbExceptionType.conflict,
            message: ElbValidationError
                .artworkDimensionsCantBeChangedBecauseItsInNutzenlayout,
          );
        }
      }

      // TODO: Can a artwork change the Sales Order?
      // TODO: Can a artwork change the Product?

      // * Update Artwork
      await ArtworkDTO.db.updateRow(
        session,
        artwork.copyWith(
          lastModifiedAt: now,
          lastModifiedById: userId,
          editingSession: release ? null : serverArtwork.editingSession,
          editingSince: release ? null : serverArtwork.editingSince,
          editingById: release ? null : serverArtwork.editingById,
        ),
        transaction: transaction,
      );

      // * Refetch Artwork
      final refetchedArtwork = await ArtworkDTO.db.findById(
        session,
        artwork.id!,
        include: ArtworkDTO.include(
          salesOrder: SalesOrderDTO.include(),
          product: ProductDTO.include(),
          customer: CustomerDTO.include(
            contact: ContactDTO.include(),
          ),
          artworkMaster: ArtworkMasterDTO.include(),
        ),
        transaction: transaction,
      );
      // // * Add to Stream
      // artworkStreamController.add(refetchedArtwork!);

      // * Refetch Product
      final refetchedProduct = await ProductDTO.db.findById(
        session,
        artwork.productId!,
        include: ProductDTO.include(
          customer: CustomerDTO.include(
            contact: ContactDTO.include(),
          ),
          salesOrder: SalesOrderDTO.include(),
          artworks: ArtworkDTO.includeList(
            include: ArtworkDTO.include(
              salesOrder: SalesOrderDTO.include(),
              product: ProductDTO.include(),
              customer: CustomerDTO.include(
                contact: ContactDTO.include(),
              ),
            ),
          ),
        ),
        transaction: transaction,
      );

      await ArtworkHandler.updateMasterByArtwork(
        session,
        transaction,
        artwork: refetchedArtwork!,
        userId: userId,
        now: now,
        salesOrderId: refetchedArtwork.salesOrder!.id!,
        customSalesOrderId: refetchedArtwork.salesOrder!.customId,
      );

      return (
        updatedArtwork: refetchedArtwork,
        updatedProduct: refetchedProduct!,
      );
    });

    // * Broadcast Changes
    artworkStreamController.add(updatedArtwork);
    productStreamController.add(updatedProduct);
    return updatedArtwork;
  }

  static Future<ProductDTO?> updateProduct(
    Session session, {
    required ProductDTO product,
    required String sessionId,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final updatedProduct = await session.db.transaction((transaction) async {
      // fetch the product
      final serverProduct = await ProductDTO.db.findById(
        session,
        product.id!,
        transaction: transaction,
      );
      await GenericCrud.validateUpdate(
        session,
        sessionId: sessionId,
        serverEntity: serverProduct,
        now: now,
      );

      await ProductDTO.db.updateRow(
        session,
        product.copyWith(
          lastModifiedAt: now,
          lastModifiedById: userId,
          editingSession: serverProduct!.editingSession,
          editingSince: serverProduct.editingSince,
          editingById: serverProduct.editingById,
        ),
        transaction: transaction,
      );
      final refetchedProduct = await ProductDTO.db.findById(
        session,
        product.id!,
        include: ProductDTO.include(
          customer: CustomerDTO.include(
            contact: ContactDTO.include(),
          ),
          salesOrder: SalesOrderDTO.include(),
          artworks: ArtworkDTO.includeList(
            include: ArtworkDTO.include(
              salesOrder: SalesOrderDTO.include(),
              product: ProductDTO.include(),
              customer: CustomerDTO.include(
                contact: ContactDTO.include(),
              ),
            ),
          ),
        ),
        transaction: transaction,
      );
      await _updateProductMasterByProduct(
        session,
        transaction,
        product: refetchedProduct!,
        userId: userId,
        now: now,
        salesOrderId: refetchedProduct.salesOrder!.id!,
        customSalesOrderId: refetchedProduct.salesOrder!.customId,
      );
      return refetchedProduct;
    });
    productStreamController.add(updatedProduct);
    return updatedProduct;
  }

  // *
  // * Utils
  // *

  // * Artwork Master

  // * Checks

  // * Artwork Master Log Fields

  static Future<ProductMasterDTO?> _fetchProductMaster(
    Session session,
    Transaction transaction, {
    required int productMasterId,
  }) async {
    final master = await ProductMasterDTO.db
        .findById(session, productMasterId, transaction: transaction);
    return master;
  }

  static ProductMasterDTO _generateProductMasterByProduct(
    ProductDTO product,
    ProductMasterDTO master,
  ) {
    return ProductMasterDTO(
      id: master.id,
      serienIdString: master.serienIdString,
      productType: product.productType,
      description: product.description,
      serienId: product.serienId,
      serienIndex: product.serienIndex,
      customerId: product.customerId,
      customerReference: product.customerReference,
      printProcessType: product.printProcessType,
      keywords: product.keywords,
      createdAt: master.createdAt,
      createdById: master.createdById,
      lastModifiedAt: product.lastModifiedAt,
      lastModifiedById: product.lastModifiedById,
      isDraft: false,
    );
  }

  static Future<void> _updateProductMasterByProduct(
    Session session,
    Transaction transaction, {
    required ProductDTO product,
    required int userId,
    required DateTime now,
    required int salesOrderId,
    required int customSalesOrderId,
  }) async {
    final master = await _fetchProductMaster(
      session,
      transaction,
      productMasterId: product.productMasterId,
    );
    if (master == null) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.productMasterNotFound,
      );
    }
    final updatedMaster = _generateProductMasterByProduct(product, master);
    await ProductMasterDTO.db.updateRow(
      session,
      updatedMaster,
      transaction: transaction,
    );
    await _logProductMaster(
      session,
      transaction,
      oldMaster: master,
      updatedMaster: updatedMaster,
      userId: userId,
      now: now,
      salesOrderId: salesOrderId,
      customSalesOrderId: customSalesOrderId,
    );
  }

  static Future<void> _logProductMaster(
    Session session,
    Transaction transaction, {
    required ProductMasterDTO oldMaster,
    required ProductMasterDTO updatedMaster,
    required int userId,
    required DateTime now,
    required int salesOrderId,
    required int customSalesOrderId,
  }) async {
    final logs = <ProductLogDTO>[];
    final logFields = _productMasterLogFields();
    final entityId = oldMaster.id;
    for (final field in logFields) {
      final oldValue = field.getValue(oldMaster);
      final newValue = field.getValue(updatedMaster);
      if (oldValue != newValue) {
        logs.add(
          ProductLogDTO(
            entityId: entityId!,
            field: field.fieldName,
            oldValue: oldValue.toString(),
            newValue: newValue.toString(),
            salesOrderId: salesOrderId,
            salesOrderCustomId: customSalesOrderId,
            tableType: TableType.productMaster,
            updatedAt: now,
            updatedById: userId,
          ),
        );
      }
    }
    await ProductLogDTO.db.insert(session, logs, transaction: transaction);
  }

  static List<LogField<ProductMasterDTO>> _productMasterLogFields() {
    return ProductField.values
        .map((field) {
          switch (field) {
            case ProductField.productType:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.productType,
              );
            case ProductField.description:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.description,
              );
            case ProductField.serienId:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.serienId.toString(),
              );
            case ProductField.serienIndex:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.serienIndex.toString(),
              );
            case ProductField.customerReference:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.customerReference,
              );
            case ProductField.printProcessType:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.printProcessType,
              );
            case ProductField.keywords:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.keywords,
              );
            case ProductField.serienIdString:
              return LogField<ProductMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.serienIdString,
              );

            case ProductField.customer:
            case ProductField.id:
            case ProductField.createdAt:
            case ProductField.createdBy:
            case ProductField.lastModifiedAt:
            case ProductField.lastModifiedBy:
            case ProductField.isDraft:
            case ProductField.deletedAt:
            case ProductField.salesOrder:
            case ProductField.productMaster:
            case ProductField.artworks:
            case ProductField.productId:
            case ProductField.productPartId:
              return null;
          }
        })
        .whereType<LogField<ProductMasterDTO>>()
        .toList();
  }
}
