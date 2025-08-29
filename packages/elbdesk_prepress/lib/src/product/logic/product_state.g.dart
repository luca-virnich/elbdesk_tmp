// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productStateHash() => r'a66d8e7f7f649828c59245f5bb570e89c9716474';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ProductState
    extends BuildlessAutoDisposeAsyncNotifier<Product> {
  late final int entityId;
  late final String sessionId;

  FutureOr<Product> build(
    int entityId,
    String sessionId,
  );
}

/// Product State
///
/// This state manages a single Product that is being displayed in e.g. a
/// card. The state is used to manage the data of the Product and to save
/// the data when the state is disposed.
///
/// Copied from [ProductState].
@ProviderFor(ProductState)
const productStateProvider = ProductStateFamily();

/// Product State
///
/// This state manages a single Product that is being displayed in e.g. a
/// card. The state is used to manage the data of the Product and to save
/// the data when the state is disposed.
///
/// Copied from [ProductState].
class ProductStateFamily extends Family<AsyncValue<Product>> {
  /// Product State
  ///
  /// This state manages a single Product that is being displayed in e.g. a
  /// card. The state is used to manage the data of the Product and to save
  /// the data when the state is disposed.
  ///
  /// Copied from [ProductState].
  const ProductStateFamily();

  /// Product State
  ///
  /// This state manages a single Product that is being displayed in e.g. a
  /// card. The state is used to manage the data of the Product and to save
  /// the data when the state is disposed.
  ///
  /// Copied from [ProductState].
  ProductStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return ProductStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  ProductStateProvider getProviderOverride(
    covariant ProductStateProvider provider,
  ) {
    return call(
      provider.entityId,
      provider.sessionId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productStateProvider';
}

/// Product State
///
/// This state manages a single Product that is being displayed in e.g. a
/// card. The state is used to manage the data of the Product and to save
/// the data when the state is disposed.
///
/// Copied from [ProductState].
class ProductStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductState, Product> {
  /// Product State
  ///
  /// This state manages a single Product that is being displayed in e.g. a
  /// card. The state is used to manage the data of the Product and to save
  /// the data when the state is disposed.
  ///
  /// Copied from [ProductState].
  ProductStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => ProductState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: productStateProvider,
          name: r'productStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productStateHash,
          dependencies: ProductStateFamily._dependencies,
          allTransitiveDependencies:
              ProductStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  ProductStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityId,
    required this.sessionId,
  }) : super.internal();

  final int entityId;
  final String sessionId;

  @override
  FutureOr<Product> runNotifierBuild(
    covariant ProductState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(ProductState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductStateProvider._internal(
        () => create()
          ..entityId = entityId
          ..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityId: entityId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductState, Product>
      createElement() {
    return _ProductStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductStateProvider &&
        other.entityId == entityId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductStateRef on AutoDisposeAsyncNotifierProviderRef<Product> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ProductStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductState, Product>
    with ProductStateRef {
  _ProductStateProviderElement(super.provider);

  @override
  int get entityId => (origin as ProductStateProvider).entityId;
  @override
  String get sessionId => (origin as ProductStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
