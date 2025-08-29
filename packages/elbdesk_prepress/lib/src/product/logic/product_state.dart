import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/product/_export_product.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_state.g.dart';

/// Product State
///
/// This state manages a single Product that is being displayed in e.g. a
/// card. The state is used to manage the data of the Product and to save
/// the data when the state is disposed.

@riverpod
class ProductState extends _$ProductState implements EntityState<Product> {
  ///@nodoc
  ProductState() {
    _initializeStateManager();
  }
  late final EntityStateManager<Product> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<Product>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (Product product) => state = AsyncData(product),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () =>
          ref.read(productRepositoryProvider).fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(productRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(productRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () => ref.read(productRepositoryProvider).update(
            entity: state.requireValue,
            release: true,
            sessionId: sessionId,
          ),
    );
  }

  @override
  Future<Product> build(int entityId, String sessionId) async {
    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  @override
  Future<void> refetchWithLock() {
    return _stateManager.refetchWithLock();
  }

  @override
  Future<void> refetchWithoutLock() {
    return _stateManager.refetchWithoutLock();
  }

  @override
  Future<void> saveAndUnlockAndRefetch() async {
    return _stateManager.saveAndUnlockAndRefetch();
  }

  void updateKeywords(String keywords) {
    state = AsyncData(
      state.requireValue.copyWith(keywords: keywords),
    );
  }

  void updateCustomerReference(String customerReference) {
    state = AsyncData(
      state.requireValue.copyWith(customerReference: customerReference),
    );
  }

  @override
  void updateMetaAfterSave() {
    final userId = ref.read(authUserStateProvider)!.id!;
    state = AsyncData(
      state.requireValue.copyWith.meta(
        lastModifiedAt: DateTime.now(),
        lastModifiedById: userId,
        isDraft: false,
      ),
    );
  }

  void updatePrintProcessType(ArtworkPrintProcessType? printProcessType) {
    state = AsyncData(
      state.requireValue.copyWith(printProcessType: printProcessType),
    );
  }

  void updateProductType(ProductType? productType) {
    state = AsyncData(
      state.requireValue.copyWith(productType: productType),
    );
  }

  void updateDescription(String description) {
    state = AsyncData(
      state.requireValue.copyWith(description: description),
    );
  }
}
