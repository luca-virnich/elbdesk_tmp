import 'dart:async';

import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/product/product_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/product_artwork_handler.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final productStreamController = StreamController<ProductDTO>.broadcast();

/// Product Endpoint
///
/// This endpoint is used to create, read, update and delete products
///
/// Products are used to bundle ProductParts and the underlying Artworks
///
/// See [ProductDTO] for more details
///
class ProductEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _tableType = TableType.product;

  Stream<ProductDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) async* {
    if (releaseOnClose) {
      session.addWillCloseListener(
        (session) {
          release(session, entityId: entityId, sessionId: sessionId);
        },
      );
    }

    yield* productStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  // Watch Products by Sales Order
  Stream<ProductDTO> watchBySalesOrder(
    Session session, {
    required int salesOrderId,
  }) async* {
    yield* productStreamController.stream.where(
      (event) => event.salesOrderId == salesOrderId,
    );
  }

  Future<ProductDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return ProductDTO.db.findById(
      session,
      id,
      include: ProductDTO.include(
        artworks: ArtworkDTO.includeList(),
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
        salesOrder: SalesOrderDTO.include(),
      ),
    );
  }

  Future<ProductDTO?> fetchByIdWithoutRelations(
    Session session,
    int id,
  ) async {
    return ProductDTO.db.findById(
      session,
      id,
    );
  }

  Future<ProductDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ProductDTO.db.findById(
      session,
      id,
      include: ProductDTO.include(
        artworks: ArtworkDTO.includeList(),
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
        salesOrder: SalesOrderDTO.include(),
      ),
      transaction: transaction,
    );
  }

  Future<ProductDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<ProductDTO>(
      session,
      id: id,
      tableType: _tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: ProductDTOTable().tableName,
      streamController: productStreamController,
    );
  }

  Future<ProductDTO?> update(
    Session session, {
    required ProductDTO entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedProduct = await ProductArtworkHandler.updateProduct(
      session,
      product: entity,
      sessionId: sessionId,
    );
    return updatedProduct;
  }

  // we are creating a new product master and then a new artwork master
  /// Create a new product from an artwork quarantine and an artwork template
  ///
  /// The template is used to create the Artwork with specific print process
  /// settings and/or colors
  ///
  /// The product will bundle the artwork:
  /// Product -> ProductPart -> Artwork
  ///
  /// The Quarantine artwork will be used to create an Artwork Master
  /// This will always be the master from which new actual Artworks that are
  /// used inside of SalesOrders are created from
  ///
  Future<ProductDTO?> createProductFromArtworkQuarantineAndArtworkTemplate(
    Session session, {
    required int artworkQuarantineId,
    required int? serienId,
    required int artworkTemplateId,
    required int customerId,
    required int layerId,
    required int salesOrderId,
    required int serienIndex,
    required List<SalesOrderItemType> salesOrderItemTypes,
    required ArtworkType artworkType,
    required ArtworkPrintProcessType printProcessType,
    required ProductType productType,
  }) async {
    final product =
        await ProductArtworkHandler.createProductAndArtworkByArtworkQuarantine(
      session,
      artworkQuarantineId: artworkQuarantineId,
      artworkTemplateId: artworkTemplateId,
      customerId: customerId,
      salesOrderId: salesOrderId,
      productType: productType,
      serienId: serienId,
      serienIndex: serienIndex,
      artworkType: artworkType,
      printProcessType: printProcessType,
      layerId: layerId,
    );
    return product;
  }

  /// Create multiple products from artwork quarantines and an artwork template
  /// in a single transaction
  ///
  /// This method creates multiple products and artworks from the provided
  /// artwork quarantines using the same artwork template and settings.
  /// All operations are performed within a single database transaction.
  ///
  Future<List<ProductDTO>>
      createBulkProductFromArtworkQuarantineAndArtworkTemplate(
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
    final products = await ProductArtworkHandler
        .createBulkProductAndArtworkByArtworkQuarantine(
      session,
      customerId: customerId,
      artworkTemplateId: artworkTemplateId,
      salesOrderId: salesOrderId,
      salesOrderItemTypes: salesOrderItemTypes,
      artworkType: artworkType,
      layerId: layerId,
      printProcessType: printProcessType,
      productType: productType,
      serienId: serienId,
      quarantinesWithIndices: quarantinesWithIndices,
    );

    return products;
  }

  /// Create a new product part from an artwork quarantine and an artwork
  /// template
  ///
  /// The template is used to create the Artwork with specific print process
  /// settings and/or colors
  ///
  /// The product will bundle the artwork:
  /// Product -> ProductPart -> Artwork
  ///
  /// The Quarantine artwork will be used to create an Artwork Master
  /// This will always be the master from which new actual Artworks that are
  /// used inside of SalesOrders are created from
  ///
  Future<ProductDTO?> createProductPartFromArtworkQuarantineAndTemplate(
    Session session, {
    required int artworkQuarantineId,
    required int artworkTemplateId,
    required int customerId,
    required int salesOrderId,
    required List<SalesOrderItemType> salesOrderItemTypes,
    required int productId,
    required ArtworkType artworkType,
    required ArtworkPrintProcessType printProcessType,
    required int layerId,
    required int serienIndex,
  }) async {
    final product =
        await ProductArtworkHandler.createProductPartArtworkByArtworkQuarantine(
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
    );
    return product;
  }

  /// Create multiple product parts from artwork quarantines and an artwork template
  /// in a single transaction
  ///
  /// This method creates multiple product parts and artworks from the provided
  /// artwork quarantines using the same artwork template and settings.
  /// All operations are performed within a single database transaction.
  ///
  Future<List<ProductDTO>>
      createBulkProductPartFromArtworkQuarantineAndTemplate(
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
    final products = await ProductArtworkHandler
        .createBulkProductPartArtworkByArtworkQuarantine(
      session,
      customerId: customerId,
      artworkTemplateId: artworkTemplateId,
      salesOrderId: salesOrderId,
      salesOrderItemTypes: salesOrderItemTypes,
      productId: productId,
      artworkType: artworkType,
      layerId: layerId,
      printProcessType: printProcessType,
      quarantinesWithIndices: quarantinesWithIndices,
    );
    return products;
  }

  Future<void> addExistingProductToSalesOrder(
    Session session, {
    required int productMasterId,
    required int salesOrderId,
  }) async {
    await ProductArtworkHandler.addExistingProductToSalesOrder(
      session,
      productMasterId: productMasterId,
      salesOrderId: salesOrderId,
    );
  }

  // Future<void> createFromProductMaster(
  //   Session session, {
  //   required int productMasterId,
  //   required int salesOrderId,
  //   required int? artworkQuarantineId,
  // }) async {
  //   final now = DateTime.now();
  //   final userId = (await session.authenticated)?.userId;
  //   // check if product master exists
  //   final productMaster =
  //       await ProductMasterEndpoint().fetchByIdForNewSalesOrderProduct(
  //     session,
  //     productMasterId,
  //   );
  //   if (productMaster == null) {
  //     throw ElbException(
  //       message: 'Product master not found',
  //       exceptionType: ElbExceptionType.conflict,
  //       elbExceptionMessage: ElbExceptionMessage.productMasterNotFound,
  //     );
  //   }
  //   // check if product master is already in sales order
  //   final product = await ProductDTO.db.find(
  //     session,
  //     where: (t) =>
  //         t.productMasterId.equals(productMasterId) &
  //         t.salesOrderId.equals(salesOrderId),
  //   );

  //   if (product.isNotEmpty) {
  //     throw ElbException(
  //       message: 'Product master already in sales order',
  //       exceptionType: ElbExceptionType.conflict,
  //       elbExceptionMessage:
  //           ElbExceptionMessage.productMasterAlreadyInSalesOrder,
  //     );
  //   }

  //   final newProductDTO = await ProductDTO.db.insertRow(
  //     session,
  //     ProductDTO(
  //       printProcessType: productMaster.printProcessType,
  //       customerReference: productMaster.customerReference,
  //       productType: productMaster.productType,
  //       serienId: productMaster.serienId,
  //       productMasterId: productMasterId,
  //       width: productMaster.width,
  //       height: productMaster.height,
  //       customerId: productMaster.customerId,
  //       salesOrderId: salesOrderId,
  //       description: productMaster.description,
  //       stichwort1: productMaster.stichwort1,
  //       stichwort2: productMaster.stichwort2,
  //       searchTerm: productMaster.searchTerm,
  //       serienIndex: productMaster.serienIndex,
  //       createdAt: now,
  //       createdById: userId,
  //       isDraft: false,
  //     ),
  //   );

  //   await Future.wait(
  //     productMaster.artworks!.map((artwork) {
  //       return ArtworkEndpoint().createFromMaster(
  //         session,
  //         artworkMasterDTO: artwork,
  //         now: now,
  //         userId: userId!,
  //         salesOrderId: salesOrderId,
  //         productId: newProductDTO.id!,
  //         artworkQuarantineId: artworkQuarantineId,
  //       );
  //     }),
  //   );

  //   final refetched = await fetchForSalesOrderListStream(
  //     session,
  //     newProductDTO.id!,
  //   );

  //   productStreamController.add(refetched!);

  //   return;
  // }

  Future<ProductDTO?> fetchForSalesOrderListStream(
    Session session,
    int productId,
  ) async {
    return ProductDTO.db.findById(
      session,
      productId,
      include: ProductDTO.include(
        artworks: ArtworkDTO.includeList(),
      ),
    );
  }

  Future<List<ProductDTO>> fetchBySalesOrder(
    Session session,
    int salesOrderId,
  ) {
    return ProductDTO.db.find(
      session,
      where: (t) => t.salesOrderId.equals(salesOrderId),
      include: ProductDTO.include(
        artworks: ArtworkDTO.includeList(),
      ),
      orderBy: (t) => t.serienId,
    );
  }

  Future<ProductDTO?> fetchByIdForRelease(
    Session session,
    int entityId,
  ) async {
    return ProductDTO.db.findById(
      session,
      entityId,
      include: ProductDTO.include(
        artworks: ArtworkDTO.includeList(),
      ),
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return GenericCrud.releaseEntity<ProductDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: ProductHandler.updateRow,
      tableType: _tableType,
      streamController: productStreamController,
      deleteDraft: null,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ProductDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: _tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }

  /// Fetch History of Product by Master ID
  Future<List<ProductDTO>> fetchHistory(
    Session session, {
    required int productMasterId,
  }) async {
    return ProductDTO.db.find(
      session,
      where: (t) =>
          t.productMasterId.equals(productMasterId) &
          t.deletedAt.equals(null as DateTime?),
      include: ProductDTO.include(
        salesOrder: SalesOrderDTO.include(),
        artworks: ArtworkDTO.includeList(),
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
      ),
    );
  }

  /// Create a new product manually without requiring artwork quarantines
  ///
  /// This method creates a product with user defined settings
  ///
  /// Product -> ProductPart -> Artwork
  ///
  Future<ProductDTO> createManually(
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
    final product = await ProductArtworkHandler.createProductManually(
      session,
      salesOrderId: salesOrderId,
      customerId: customerId,
      productType: productType,
      serienId: serienId,
      serienIndex: serienIndex,
      artworkType: artworkType,
      printProcessType: printProcessType,
      layerId: layerId,
      artworkTemplateId: artworkTemplateId,
    );

    return product;
  }
}
