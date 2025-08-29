import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/product/repositories/product_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

/// Product Repository Provider
@riverpod
ProductRepository productRepository(Ref ref) {
  final endpoint = serverpodClient.product;
  final endpointProductMaster = serverpodClient.productMaster;
  final logEndpoint = serverpodClient.productLog;
  return ProductRepository(
    ref: ref,
    endpoint: endpoint,
    endpointProductMaster: endpointProductMaster,
    logEndpoint: logEndpoint,
  );
}

@riverpod
Future<List<Product>> findProductsBySalesOrderId(
  Ref ref,
  int salesOrderId,
  String sessionId,
) async {
  return ref.watch(productRepositoryProvider).findBySalesOrderId(
        salesOrderId: salesOrderId,
      );
}

@riverpod
Future<List<Product>> findProductsBySalesOrderIdWithMultiLayer(
  Ref ref,
  int salesOrderId,
  String sessionId,
) async {
  final products =
      await ref.watch(productRepositoryProvider).findBySalesOrderId(
            salesOrderId: salesOrderId,
          );
  return products
      .where(
        (product) =>
            product.productType == ProductType.multilayer ||
            product.productType == ProductType.kit,
      )
      .toList();
}

@riverpod
Future<List<Product>> findMasterProductsByCustomer(
  Ref ref,
  int customerId,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.product.name,
    ),
  );
  return ref.watch(productRepositoryProvider).findByCustomerId(
        customerId: customerId,
        sort: sort,
        filter: filter,
      );
}

@riverpod
Future<List<Product>> findMasterProducts(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.product.name,
    ),
  );
  return ref.watch(productRepositoryProvider).findMasterProducts(
        sort: sort,
        filter: filter,
      );
}

@riverpod
Future<List<Product>> findProducts(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.product.name,
    ),
  );
  return ref.watch(productRepositoryProvider).find(sort: sort, filter: filter);
}

@riverpod
Future<Product> fetchProductByIdWithoutRelations(
  Ref ref,
  int productId,
) async {
  return ref.watch(productRepositoryProvider).fetchByIdWithoutRelations(
        productId,
      );
}

@riverpod
Future<List<Product>> fetchProductHistory(
  Ref ref,
  int productMasterId,
  String sessionId,
) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.fetchHistory(productMasterId);
}

// *
// * Watch Single Product / Entity
// *

@riverpod
Stream<Product> watchProduct(
  Ref ref, {
  required String sessionId,
  required int productId,
}) async* {
  final streamHelper = ServerpodStreamManager<Product, ProductDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.product.watchEntity(
      sessionId: sessionId,
      entityId: productId,
      releaseOnClose: true,
    ),
    convertDtoToModel: Product.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchProduct: $error');
    },
  );
}

// *
// * Watch Products by Sales Order
// *

@riverpod
class WatchProductsBySalesOrder extends _$WatchProductsBySalesOrder {
  @override
  Future<List<Product>> build(int salesOrderId, String sessionId) async {
    final products = await ref
        .watch(productRepositoryProvider)
        .findBySalesOrderId(salesOrderId: salesOrderId);

    ref.listen(
      watchProductUpdatesBySalesOrderProvider(salesOrderId),
      (previous, next) {
        if (next is AsyncData<Product>) {
          handleEvent(next.value);
        }
      },
    );

    return products;
  }

  Future<void> handleEvent(Product updatedProduct) async {
    final currentList = await future;
    // check if artwork is already in list
    final isDeleted = updatedProduct.meta.deletedAt != null;

    if (isDeleted) {
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedProduct.meta.id)
            .toList(),
      );
      return;
    }
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedProduct.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing artwork
      final updatedList = [...currentList];
      updatedList[existingIndex] = updatedProduct;
      state = AsyncValue.data(
        updatedList
          ..sort((a, b) {
            // First compare by productId
            final productIdComparison = a.productId.compareTo(b.productId);
            // If productIds are the same, compare by product.index
            return productIdComparison != 0
                ? productIdComparison
                : a.productIndex.compareTo(b.productIndex);
          }),
      );
    } else {
      state = AsyncValue.data(
        [...currentList, updatedProduct]..sort((a, b) {
            // First compare by productId
            final productIdComparison = a.productId.compareTo(b.productId);
            // If productIds are the same, compare by product.index
            return productIdComparison != 0
                ? productIdComparison
                : a.productIndex.compareTo(b.productIndex);
          }),
      );
    }
  }
}

@riverpod
Stream<Product> watchProductUpdatesBySalesOrder(
  Ref ref,
  int salesOrderId,
) async* {
  final streamHelper = ServerpodStreamManager<Product, ProductDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.product.watchBySalesOrder(
      salesOrderId: salesOrderId,
    ),
    convertDtoToModel: Product.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamArtworkQuarantinesByCustomerId: $error');
    },
  );
}
