import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/product/_export_product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Product Repository
class ProductRepository implements EntityRepository<Product> {
  /// Product Repository constructor
  ProductRepository({
    required this.ref,
    required this.endpoint,
    required this.endpointProductMaster,
    required this.logEndpoint,
  });

  /// Serverpod client1
  final Ref ref;
  final EndpointProduct endpoint;
  final EndpointProductMaster endpointProductMaster;
  final EndpointProductLog logEndpoint;

  @override
  Future<List<Product>> find({Sort? sort, Filter? filter}) async {
    throw UnimplementedError();
  }

  Future<List<Product>> findBySalesOrderId({
    required int salesOrderId,
  }) async {
    final products = await endpoint.fetchBySalesOrder(
      salesOrderId,
    );
    return products.map(Product.fromDTO).toList()
      ..sort((a, b) {
        // First compare by productId
        final productIdComparison = a.productId.compareTo(b.productId);
        // If productIds are the same, compare by product.index
        return productIdComparison != 0
            ? productIdComparison
            : a.productIndex.compareTo(b.productIndex);
      });
  }

  @override
  Future<Product> fetchById(int id) async {
    final product = await endpoint.fetchById(id);
    return Product.fromDTO(product!);
  }

  Future<Product> fetchByIdWithoutRelations(int id) async {
    final product = await endpoint.fetchByIdWithoutRelations(id);
    return Product.fromDTO(product!);
  }

  @override
  Future<List<Product>> fetchAll() async {
    throw UnimplementedError();
  }

  @override
  Future<Product?> fetchAndLock(int id, String sessionId) async {
    final product = await endpoint.fetchAndLock(
      editingSessionId: sessionId,
      id: id,
    );
    return product != null ? Product.fromDTO(product) : null;
  }

  @override
  Future<void> release(int id, String sessionId) async {
    await endpoint.release(
      entityId: id,
      sessionId: sessionId,
    );
  }

  @override
  Future<Product> update({
    required Product entity,
    required bool release,
    required String sessionId,
  }) async {
    final newProduct = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return Product.fromDTO(newProduct!);
  }

  @override
  Future<Product> createAndReturnEntity({
    required Product entity,
    required bool release,
    required String sessionId,
    int? salesOrderId,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    throw UnimplementedError();
  }

  // maybe need to add salesOrderId in order to create a
  // product for a sales order
  Future<int> create({
    required String sessionId,
    required int? salesOrderId,
  }) async {
    throw UnimplementedError();
  }

  /// Create a new product manually without requiring artwork quarantines
  ///
  /// This method creates a product with user defined settings
  /// that can be filled in by the user via the UI
  ///
  Future<int> createManually({
    required String sessionId,
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
    final product = await endpoint.createManually(
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
    return product.id!;
  }

  Future<Product?> createProductFromArtworkQuarantineAndArtworkTemplate({
    required int customerId,
    required int artworkTemplateId,
    required int artworkQuarantineId,
    required int salesOrderId,
    required List<SalesOrderItemType> types,
    required ArtworkType artworkType,
    required int layerId,
    required int serienIndex,
    required ArtworkPrintProcessType printProcessType,
    required ProductType productType,
    required int? serienId,
  }) async {
    final product =
        await endpoint.createProductFromArtworkQuarantineAndArtworkTemplate(
      customerId: customerId,
      artworkTemplateId: artworkTemplateId,
      artworkQuarantineId: artworkQuarantineId,
      salesOrderId: salesOrderId,
      salesOrderItemTypes: types,
      artworkType: artworkType,
      layerId: layerId,
      serienIndex: serienIndex,
      printProcessType: printProcessType,
      productType: productType,
      serienId: serienId,
    );
    return Product.fromDTO(product!);
  }

  /// Create multiple products from artwork quarantines and an artwork template
  /// in a single transaction
  ///
  /// This method creates multiple products and artworks from the provided
  /// artwork quarantines using the same artwork template and settings.
  /// All operations are performed within a single database transaction.
  ///
  Future<List<Product>>
      createBulkProductFromArtworkQuarantineAndArtworkTemplate({
    required int customerId,
    required int artworkTemplateId,
    required int salesOrderId,
    required List<SalesOrderItemType> types,
    required ArtworkType artworkType,
    required int layerId,
    required ArtworkPrintProcessType printProcessType,
    required ProductType productType,
    required int? serienId,
    required List<({int artworkQuarantineId, int serienIndex})>
        quarantinesWithIndices,
  }) async {
    final products =
        await endpoint.createBulkProductFromArtworkQuarantineAndArtworkTemplate(
      customerId: customerId,
      artworkTemplateId: artworkTemplateId,
      salesOrderId: salesOrderId,
      salesOrderItemTypes: types,
      artworkType: artworkType,
      layerId: layerId,
      printProcessType: printProcessType,
      productType: productType,
      serienId: serienId,
      quarantinesWithIndices: quarantinesWithIndices,
    );

    return products.map(Product.fromDTO).toList();
  }

  Future<Product?> createProductPartFromArtworkQuarantineAndTemplate({
    required int customerId,
    required int artworkTemplateId,
    required int artworkQuarantineId,
    required int salesOrderId,
    required List<SalesOrderItemType> types,
    required int productId,
    required ArtworkType artworkType,
    required int layerId,
    required int serienIndex,
    required ArtworkPrintProcessType printProcessType,
  }) async {
    final product =
        await endpoint.createProductPartFromArtworkQuarantineAndTemplate(
      productId: productId,
      artworkTemplateId: artworkTemplateId,
      customerId: customerId,
      artworkQuarantineId: artworkQuarantineId,
      salesOrderId: salesOrderId,
      salesOrderItemTypes: types,
      artworkType: artworkType,
      layerId: layerId,
      serienIndex: serienIndex,
      printProcessType: printProcessType,
    );
    return Product.fromDTO(product!);
  }

  /// Create multiple product parts from artwork quarantines and an artwork template
  /// in a single transaction
  ///
  /// This method creates multiple product parts and artworks from the provided
  /// artwork quarantines using the same artwork template and settings.
  /// All operations are performed within a single database transaction.
  ///
  Future<List<Product>> createBulkProductPartFromArtworkQuarantineAndTemplate({
    required int customerId,
    required int artworkTemplateId,
    required int salesOrderId,
    required List<SalesOrderItemType> types,
    required int productId,
    required ArtworkType artworkType,
    required int layerId,
    required ArtworkPrintProcessType printProcessType,
    required List<({int artworkQuarantineId, int serienIndex})>
        quarantinesWithIndices,
  }) async {
    final products =
        await endpoint.createBulkProductPartFromArtworkQuarantineAndTemplate(
      customerId: customerId,
      artworkTemplateId: artworkTemplateId,
      salesOrderId: salesOrderId,
      salesOrderItemTypes: types,
      productId: productId,
      artworkType: artworkType,
      layerId: layerId,
      printProcessType: printProcessType,
      quarantinesWithIndices: quarantinesWithIndices,
    );
    return products.map(Product.fromDTO).toList();
  }

  Future<List<Product>> findByCustomerId({
    required int customerId,
    Sort? sort,
    Filter? filter,
  }) async {
    final products = await endpointProductMaster.findByCustomer(
      customerId: customerId,
      sort: sort,
      filter: filter,
    );
    return products.map(Product.fromMasterDTO).toList();
  }

  Future<void> addExistingProductToSalesOrder({
    required int productMasterId,
    required int salesOrderId,
  }) async {
    await endpoint.addExistingProductToSalesOrder(
      productMasterId: productMasterId,
      salesOrderId: salesOrderId,
    );
  }

  Future<int> fetchNextSerienIndex(int serienId) async {
    return endpointProductMaster.fetchNextSerienIndex(
      serienId,
    );
  }

  Future<List<Product>> fetchHistory(int productMasterId) async {
    final products = await endpoint.fetchHistory(
      productMasterId: productMasterId,
    );
    return products.map(Product.fromDTO).toList();
  }

  /// Fetches product log entries for a specific product
  Future<List<ProductLogDTO>> fetchProductLogs(
    int entityId,
    TableType tableType,
  ) async {
    final logs = await logEndpoint.fetchProductLogs(
      entityId: entityId,
      tableType: tableType,
    );
    return logs;
  }

  Future<List<Product>> findMasterProducts({
    Sort? sort,
    Filter? filter,
  }) async {
    final products = await endpointProductMaster.find(
      sort: sort,
      filter: filter,
    );
    return products.map(Product.fromMasterDTO).toList();
  }
}
