// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productRepositoryHash() => r'0b35c691e313a8519901bb25100400f98ef9b3f0';

/// Product Repository Provider
///
/// Copied from [productRepository].
@ProviderFor(productRepository)
final productRepositoryProvider =
    AutoDisposeProvider<ProductRepository>.internal(
  productRepository,
  name: r'productRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductRepositoryRef = AutoDisposeProviderRef<ProductRepository>;
String _$findProductsBySalesOrderIdHash() =>
    r'512606e63e04f9cfcc7fa9b34535fc9609b4e4aa';

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

/// See also [findProductsBySalesOrderId].
@ProviderFor(findProductsBySalesOrderId)
const findProductsBySalesOrderIdProvider = FindProductsBySalesOrderIdFamily();

/// See also [findProductsBySalesOrderId].
class FindProductsBySalesOrderIdFamily
    extends Family<AsyncValue<List<Product>>> {
  /// See also [findProductsBySalesOrderId].
  const FindProductsBySalesOrderIdFamily();

  /// See also [findProductsBySalesOrderId].
  FindProductsBySalesOrderIdProvider call(
    int salesOrderId,
    String sessionId,
  ) {
    return FindProductsBySalesOrderIdProvider(
      salesOrderId,
      sessionId,
    );
  }

  @override
  FindProductsBySalesOrderIdProvider getProviderOverride(
    covariant FindProductsBySalesOrderIdProvider provider,
  ) {
    return call(
      provider.salesOrderId,
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
  String? get name => r'findProductsBySalesOrderIdProvider';
}

/// See also [findProductsBySalesOrderId].
class FindProductsBySalesOrderIdProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  /// See also [findProductsBySalesOrderId].
  FindProductsBySalesOrderIdProvider(
    int salesOrderId,
    String sessionId,
  ) : this._internal(
          (ref) => findProductsBySalesOrderId(
            ref as FindProductsBySalesOrderIdRef,
            salesOrderId,
            sessionId,
          ),
          from: findProductsBySalesOrderIdProvider,
          name: r'findProductsBySalesOrderIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findProductsBySalesOrderIdHash,
          dependencies: FindProductsBySalesOrderIdFamily._dependencies,
          allTransitiveDependencies:
              FindProductsBySalesOrderIdFamily._allTransitiveDependencies,
          salesOrderId: salesOrderId,
          sessionId: sessionId,
        );

  FindProductsBySalesOrderIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.salesOrderId,
    required this.sessionId,
  }) : super.internal();

  final int salesOrderId;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(FindProductsBySalesOrderIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindProductsBySalesOrderIdProvider._internal(
        (ref) => create(ref as FindProductsBySalesOrderIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        salesOrderId: salesOrderId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _FindProductsBySalesOrderIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindProductsBySalesOrderIdProvider &&
        other.salesOrderId == salesOrderId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, salesOrderId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindProductsBySalesOrderIdRef
    on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindProductsBySalesOrderIdProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>>
    with FindProductsBySalesOrderIdRef {
  _FindProductsBySalesOrderIdProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as FindProductsBySalesOrderIdProvider).salesOrderId;
  @override
  String get sessionId =>
      (origin as FindProductsBySalesOrderIdProvider).sessionId;
}

String _$findProductsBySalesOrderIdWithMultiLayerHash() =>
    r'8791b008d692c723991a4ecbbad172804643cc66';

/// See also [findProductsBySalesOrderIdWithMultiLayer].
@ProviderFor(findProductsBySalesOrderIdWithMultiLayer)
const findProductsBySalesOrderIdWithMultiLayerProvider =
    FindProductsBySalesOrderIdWithMultiLayerFamily();

/// See also [findProductsBySalesOrderIdWithMultiLayer].
class FindProductsBySalesOrderIdWithMultiLayerFamily
    extends Family<AsyncValue<List<Product>>> {
  /// See also [findProductsBySalesOrderIdWithMultiLayer].
  const FindProductsBySalesOrderIdWithMultiLayerFamily();

  /// See also [findProductsBySalesOrderIdWithMultiLayer].
  FindProductsBySalesOrderIdWithMultiLayerProvider call(
    int salesOrderId,
    String sessionId,
  ) {
    return FindProductsBySalesOrderIdWithMultiLayerProvider(
      salesOrderId,
      sessionId,
    );
  }

  @override
  FindProductsBySalesOrderIdWithMultiLayerProvider getProviderOverride(
    covariant FindProductsBySalesOrderIdWithMultiLayerProvider provider,
  ) {
    return call(
      provider.salesOrderId,
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
  String? get name => r'findProductsBySalesOrderIdWithMultiLayerProvider';
}

/// See also [findProductsBySalesOrderIdWithMultiLayer].
class FindProductsBySalesOrderIdWithMultiLayerProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  /// See also [findProductsBySalesOrderIdWithMultiLayer].
  FindProductsBySalesOrderIdWithMultiLayerProvider(
    int salesOrderId,
    String sessionId,
  ) : this._internal(
          (ref) => findProductsBySalesOrderIdWithMultiLayer(
            ref as FindProductsBySalesOrderIdWithMultiLayerRef,
            salesOrderId,
            sessionId,
          ),
          from: findProductsBySalesOrderIdWithMultiLayerProvider,
          name: r'findProductsBySalesOrderIdWithMultiLayerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findProductsBySalesOrderIdWithMultiLayerHash,
          dependencies:
              FindProductsBySalesOrderIdWithMultiLayerFamily._dependencies,
          allTransitiveDependencies:
              FindProductsBySalesOrderIdWithMultiLayerFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
          sessionId: sessionId,
        );

  FindProductsBySalesOrderIdWithMultiLayerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.salesOrderId,
    required this.sessionId,
  }) : super.internal();

  final int salesOrderId;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(
            FindProductsBySalesOrderIdWithMultiLayerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindProductsBySalesOrderIdWithMultiLayerProvider._internal(
        (ref) => create(ref as FindProductsBySalesOrderIdWithMultiLayerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        salesOrderId: salesOrderId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _FindProductsBySalesOrderIdWithMultiLayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindProductsBySalesOrderIdWithMultiLayerProvider &&
        other.salesOrderId == salesOrderId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, salesOrderId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindProductsBySalesOrderIdWithMultiLayerRef
    on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindProductsBySalesOrderIdWithMultiLayerProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>>
    with FindProductsBySalesOrderIdWithMultiLayerRef {
  _FindProductsBySalesOrderIdWithMultiLayerProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as FindProductsBySalesOrderIdWithMultiLayerProvider).salesOrderId;
  @override
  String get sessionId =>
      (origin as FindProductsBySalesOrderIdWithMultiLayerProvider).sessionId;
}

String _$findMasterProductsByCustomerHash() =>
    r'1b9f087c847769f790b507496308b52e380f3a9b';

/// See also [findMasterProductsByCustomer].
@ProviderFor(findMasterProductsByCustomer)
const findMasterProductsByCustomerProvider =
    FindMasterProductsByCustomerFamily();

/// See also [findMasterProductsByCustomer].
class FindMasterProductsByCustomerFamily
    extends Family<AsyncValue<List<Product>>> {
  /// See also [findMasterProductsByCustomer].
  const FindMasterProductsByCustomerFamily();

  /// See also [findMasterProductsByCustomer].
  FindMasterProductsByCustomerProvider call(
    int customerId,
    String sessionId,
  ) {
    return FindMasterProductsByCustomerProvider(
      customerId,
      sessionId,
    );
  }

  @override
  FindMasterProductsByCustomerProvider getProviderOverride(
    covariant FindMasterProductsByCustomerProvider provider,
  ) {
    return call(
      provider.customerId,
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
  String? get name => r'findMasterProductsByCustomerProvider';
}

/// See also [findMasterProductsByCustomer].
class FindMasterProductsByCustomerProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  /// See also [findMasterProductsByCustomer].
  FindMasterProductsByCustomerProvider(
    int customerId,
    String sessionId,
  ) : this._internal(
          (ref) => findMasterProductsByCustomer(
            ref as FindMasterProductsByCustomerRef,
            customerId,
            sessionId,
          ),
          from: findMasterProductsByCustomerProvider,
          name: r'findMasterProductsByCustomerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findMasterProductsByCustomerHash,
          dependencies: FindMasterProductsByCustomerFamily._dependencies,
          allTransitiveDependencies:
              FindMasterProductsByCustomerFamily._allTransitiveDependencies,
          customerId: customerId,
          sessionId: sessionId,
        );

  FindMasterProductsByCustomerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
    required this.sessionId,
  }) : super.internal();

  final int customerId;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(FindMasterProductsByCustomerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindMasterProductsByCustomerProvider._internal(
        (ref) => create(ref as FindMasterProductsByCustomerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _FindMasterProductsByCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindMasterProductsByCustomerProvider &&
        other.customerId == customerId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindMasterProductsByCustomerRef
    on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindMasterProductsByCustomerProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>>
    with FindMasterProductsByCustomerRef {
  _FindMasterProductsByCustomerProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as FindMasterProductsByCustomerProvider).customerId;
  @override
  String get sessionId =>
      (origin as FindMasterProductsByCustomerProvider).sessionId;
}

String _$findMasterProductsHash() =>
    r'7f85a71d027fecd49e70ed12fe934bfd8eb9bc78';

/// See also [findMasterProducts].
@ProviderFor(findMasterProducts)
const findMasterProductsProvider = FindMasterProductsFamily();

/// See also [findMasterProducts].
class FindMasterProductsFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [findMasterProducts].
  const FindMasterProductsFamily();

  /// See also [findMasterProducts].
  FindMasterProductsProvider call(
    String sessionId,
  ) {
    return FindMasterProductsProvider(
      sessionId,
    );
  }

  @override
  FindMasterProductsProvider getProviderOverride(
    covariant FindMasterProductsProvider provider,
  ) {
    return call(
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
  String? get name => r'findMasterProductsProvider';
}

/// See also [findMasterProducts].
class FindMasterProductsProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  /// See also [findMasterProducts].
  FindMasterProductsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findMasterProducts(
            ref as FindMasterProductsRef,
            sessionId,
          ),
          from: findMasterProductsProvider,
          name: r'findMasterProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findMasterProductsHash,
          dependencies: FindMasterProductsFamily._dependencies,
          allTransitiveDependencies:
              FindMasterProductsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindMasterProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(FindMasterProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindMasterProductsProvider._internal(
        (ref) => create(ref as FindMasterProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _FindMasterProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindMasterProductsProvider && other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindMasterProductsRef on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindMasterProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>>
    with FindMasterProductsRef {
  _FindMasterProductsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindMasterProductsProvider).sessionId;
}

String _$findProductsHash() => r'8176ebde0deb35fa1188397acdae01ebb4ce74c3';

/// See also [findProducts].
@ProviderFor(findProducts)
const findProductsProvider = FindProductsFamily();

/// See also [findProducts].
class FindProductsFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [findProducts].
  const FindProductsFamily();

  /// See also [findProducts].
  FindProductsProvider call(
    String sessionId,
  ) {
    return FindProductsProvider(
      sessionId,
    );
  }

  @override
  FindProductsProvider getProviderOverride(
    covariant FindProductsProvider provider,
  ) {
    return call(
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
  String? get name => r'findProductsProvider';
}

/// See also [findProducts].
class FindProductsProvider extends AutoDisposeFutureProvider<List<Product>> {
  /// See also [findProducts].
  FindProductsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findProducts(
            ref as FindProductsRef,
            sessionId,
          ),
          from: findProductsProvider,
          name: r'findProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findProductsHash,
          dependencies: FindProductsFamily._dependencies,
          allTransitiveDependencies:
              FindProductsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(FindProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindProductsProvider._internal(
        (ref) => create(ref as FindProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _FindProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindProductsProvider && other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindProductsRef on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>>
    with FindProductsRef {
  _FindProductsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindProductsProvider).sessionId;
}

String _$fetchProductByIdWithoutRelationsHash() =>
    r'ca8dbb262d70e5b5de2012e114314eea79b4b3f7';

/// See also [fetchProductByIdWithoutRelations].
@ProviderFor(fetchProductByIdWithoutRelations)
const fetchProductByIdWithoutRelationsProvider =
    FetchProductByIdWithoutRelationsFamily();

/// See also [fetchProductByIdWithoutRelations].
class FetchProductByIdWithoutRelationsFamily
    extends Family<AsyncValue<Product>> {
  /// See also [fetchProductByIdWithoutRelations].
  const FetchProductByIdWithoutRelationsFamily();

  /// See also [fetchProductByIdWithoutRelations].
  FetchProductByIdWithoutRelationsProvider call(
    int productId,
  ) {
    return FetchProductByIdWithoutRelationsProvider(
      productId,
    );
  }

  @override
  FetchProductByIdWithoutRelationsProvider getProviderOverride(
    covariant FetchProductByIdWithoutRelationsProvider provider,
  ) {
    return call(
      provider.productId,
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
  String? get name => r'fetchProductByIdWithoutRelationsProvider';
}

/// See also [fetchProductByIdWithoutRelations].
class FetchProductByIdWithoutRelationsProvider
    extends AutoDisposeFutureProvider<Product> {
  /// See also [fetchProductByIdWithoutRelations].
  FetchProductByIdWithoutRelationsProvider(
    int productId,
  ) : this._internal(
          (ref) => fetchProductByIdWithoutRelations(
            ref as FetchProductByIdWithoutRelationsRef,
            productId,
          ),
          from: fetchProductByIdWithoutRelationsProvider,
          name: r'fetchProductByIdWithoutRelationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchProductByIdWithoutRelationsHash,
          dependencies: FetchProductByIdWithoutRelationsFamily._dependencies,
          allTransitiveDependencies:
              FetchProductByIdWithoutRelationsFamily._allTransitiveDependencies,
          productId: productId,
        );

  FetchProductByIdWithoutRelationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final int productId;

  @override
  Override overrideWith(
    FutureOr<Product> Function(FetchProductByIdWithoutRelationsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchProductByIdWithoutRelationsProvider._internal(
        (ref) => create(ref as FetchProductByIdWithoutRelationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product> createElement() {
    return _FetchProductByIdWithoutRelationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProductByIdWithoutRelationsProvider &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchProductByIdWithoutRelationsRef
    on AutoDisposeFutureProviderRef<Product> {
  /// The parameter `productId` of this provider.
  int get productId;
}

class _FetchProductByIdWithoutRelationsProviderElement
    extends AutoDisposeFutureProviderElement<Product>
    with FetchProductByIdWithoutRelationsRef {
  _FetchProductByIdWithoutRelationsProviderElement(super.provider);

  @override
  int get productId =>
      (origin as FetchProductByIdWithoutRelationsProvider).productId;
}

String _$fetchProductHistoryHash() =>
    r'bc0315746005afbaea48087121cc2b69df2f8a15';

/// See also [fetchProductHistory].
@ProviderFor(fetchProductHistory)
const fetchProductHistoryProvider = FetchProductHistoryFamily();

/// See also [fetchProductHistory].
class FetchProductHistoryFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [fetchProductHistory].
  const FetchProductHistoryFamily();

  /// See also [fetchProductHistory].
  FetchProductHistoryProvider call(
    int productMasterId,
    String sessionId,
  ) {
    return FetchProductHistoryProvider(
      productMasterId,
      sessionId,
    );
  }

  @override
  FetchProductHistoryProvider getProviderOverride(
    covariant FetchProductHistoryProvider provider,
  ) {
    return call(
      provider.productMasterId,
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
  String? get name => r'fetchProductHistoryProvider';
}

/// See also [fetchProductHistory].
class FetchProductHistoryProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  /// See also [fetchProductHistory].
  FetchProductHistoryProvider(
    int productMasterId,
    String sessionId,
  ) : this._internal(
          (ref) => fetchProductHistory(
            ref as FetchProductHistoryRef,
            productMasterId,
            sessionId,
          ),
          from: fetchProductHistoryProvider,
          name: r'fetchProductHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchProductHistoryHash,
          dependencies: FetchProductHistoryFamily._dependencies,
          allTransitiveDependencies:
              FetchProductHistoryFamily._allTransitiveDependencies,
          productMasterId: productMasterId,
          sessionId: sessionId,
        );

  FetchProductHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productMasterId,
    required this.sessionId,
  }) : super.internal();

  final int productMasterId;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(FetchProductHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchProductHistoryProvider._internal(
        (ref) => create(ref as FetchProductHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productMasterId: productMasterId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _FetchProductHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProductHistoryProvider &&
        other.productMasterId == productMasterId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productMasterId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchProductHistoryRef on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `productMasterId` of this provider.
  int get productMasterId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchProductHistoryProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>>
    with FetchProductHistoryRef {
  _FetchProductHistoryProviderElement(super.provider);

  @override
  int get productMasterId =>
      (origin as FetchProductHistoryProvider).productMasterId;
  @override
  String get sessionId => (origin as FetchProductHistoryProvider).sessionId;
}

String _$watchProductHash() => r'd23ec1ea4857f4b93a41fcec30f02474837122e5';

/// See also [watchProduct].
@ProviderFor(watchProduct)
const watchProductProvider = WatchProductFamily();

/// See also [watchProduct].
class WatchProductFamily extends Family<AsyncValue<Product>> {
  /// See also [watchProduct].
  const WatchProductFamily();

  /// See also [watchProduct].
  WatchProductProvider call({
    required String sessionId,
    required int productId,
  }) {
    return WatchProductProvider(
      sessionId: sessionId,
      productId: productId,
    );
  }

  @override
  WatchProductProvider getProviderOverride(
    covariant WatchProductProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      productId: provider.productId,
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
  String? get name => r'watchProductProvider';
}

/// See also [watchProduct].
class WatchProductProvider extends AutoDisposeStreamProvider<Product> {
  /// See also [watchProduct].
  WatchProductProvider({
    required String sessionId,
    required int productId,
  }) : this._internal(
          (ref) => watchProduct(
            ref as WatchProductRef,
            sessionId: sessionId,
            productId: productId,
          ),
          from: watchProductProvider,
          name: r'watchProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchProductHash,
          dependencies: WatchProductFamily._dependencies,
          allTransitiveDependencies:
              WatchProductFamily._allTransitiveDependencies,
          sessionId: sessionId,
          productId: productId,
        );

  WatchProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.productId,
  }) : super.internal();

  final String sessionId;
  final int productId;

  @override
  Override overrideWith(
    Stream<Product> Function(WatchProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchProductProvider._internal(
        (ref) => create(ref as WatchProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Product> createElement() {
    return _WatchProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchProductProvider &&
        other.sessionId == sessionId &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchProductRef on AutoDisposeStreamProviderRef<Product> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `productId` of this provider.
  int get productId;
}

class _WatchProductProviderElement
    extends AutoDisposeStreamProviderElement<Product> with WatchProductRef {
  _WatchProductProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchProductProvider).sessionId;
  @override
  int get productId => (origin as WatchProductProvider).productId;
}

String _$watchProductUpdatesBySalesOrderHash() =>
    r'1aa8d2a673322b32381d6e46a2e61f2427c0123a';

/// See also [watchProductUpdatesBySalesOrder].
@ProviderFor(watchProductUpdatesBySalesOrder)
const watchProductUpdatesBySalesOrderProvider =
    WatchProductUpdatesBySalesOrderFamily();

/// See also [watchProductUpdatesBySalesOrder].
class WatchProductUpdatesBySalesOrderFamily
    extends Family<AsyncValue<Product>> {
  /// See also [watchProductUpdatesBySalesOrder].
  const WatchProductUpdatesBySalesOrderFamily();

  /// See also [watchProductUpdatesBySalesOrder].
  WatchProductUpdatesBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return WatchProductUpdatesBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  WatchProductUpdatesBySalesOrderProvider getProviderOverride(
    covariant WatchProductUpdatesBySalesOrderProvider provider,
  ) {
    return call(
      provider.salesOrderId,
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
  String? get name => r'watchProductUpdatesBySalesOrderProvider';
}

/// See also [watchProductUpdatesBySalesOrder].
class WatchProductUpdatesBySalesOrderProvider
    extends AutoDisposeStreamProvider<Product> {
  /// See also [watchProductUpdatesBySalesOrder].
  WatchProductUpdatesBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => watchProductUpdatesBySalesOrder(
            ref as WatchProductUpdatesBySalesOrderRef,
            salesOrderId,
          ),
          from: watchProductUpdatesBySalesOrderProvider,
          name: r'watchProductUpdatesBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchProductUpdatesBySalesOrderHash,
          dependencies: WatchProductUpdatesBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              WatchProductUpdatesBySalesOrderFamily._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  WatchProductUpdatesBySalesOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.salesOrderId,
  }) : super.internal();

  final int salesOrderId;

  @override
  Override overrideWith(
    Stream<Product> Function(WatchProductUpdatesBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchProductUpdatesBySalesOrderProvider._internal(
        (ref) => create(ref as WatchProductUpdatesBySalesOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        salesOrderId: salesOrderId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Product> createElement() {
    return _WatchProductUpdatesBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchProductUpdatesBySalesOrderProvider &&
        other.salesOrderId == salesOrderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, salesOrderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchProductUpdatesBySalesOrderRef
    on AutoDisposeStreamProviderRef<Product> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchProductUpdatesBySalesOrderProviderElement
    extends AutoDisposeStreamProviderElement<Product>
    with WatchProductUpdatesBySalesOrderRef {
  _WatchProductUpdatesBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchProductUpdatesBySalesOrderProvider).salesOrderId;
}

String _$watchProductsBySalesOrderHash() =>
    r'0845caa1837082eaef46a6138460020f92410b53';

abstract class _$WatchProductsBySalesOrder
    extends BuildlessAutoDisposeAsyncNotifier<List<Product>> {
  late final int salesOrderId;
  late final String sessionId;

  FutureOr<List<Product>> build(
    int salesOrderId,
    String sessionId,
  );
}

/// See also [WatchProductsBySalesOrder].
@ProviderFor(WatchProductsBySalesOrder)
const watchProductsBySalesOrderProvider = WatchProductsBySalesOrderFamily();

/// See also [WatchProductsBySalesOrder].
class WatchProductsBySalesOrderFamily
    extends Family<AsyncValue<List<Product>>> {
  /// See also [WatchProductsBySalesOrder].
  const WatchProductsBySalesOrderFamily();

  /// See also [WatchProductsBySalesOrder].
  WatchProductsBySalesOrderProvider call(
    int salesOrderId,
    String sessionId,
  ) {
    return WatchProductsBySalesOrderProvider(
      salesOrderId,
      sessionId,
    );
  }

  @override
  WatchProductsBySalesOrderProvider getProviderOverride(
    covariant WatchProductsBySalesOrderProvider provider,
  ) {
    return call(
      provider.salesOrderId,
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
  String? get name => r'watchProductsBySalesOrderProvider';
}

/// See also [WatchProductsBySalesOrder].
class WatchProductsBySalesOrderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchProductsBySalesOrder,
        List<Product>> {
  /// See also [WatchProductsBySalesOrder].
  WatchProductsBySalesOrderProvider(
    int salesOrderId,
    String sessionId,
  ) : this._internal(
          () => WatchProductsBySalesOrder()
            ..salesOrderId = salesOrderId
            ..sessionId = sessionId,
          from: watchProductsBySalesOrderProvider,
          name: r'watchProductsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchProductsBySalesOrderHash,
          dependencies: WatchProductsBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              WatchProductsBySalesOrderFamily._allTransitiveDependencies,
          salesOrderId: salesOrderId,
          sessionId: sessionId,
        );

  WatchProductsBySalesOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.salesOrderId,
    required this.sessionId,
  }) : super.internal();

  final int salesOrderId;
  final String sessionId;

  @override
  FutureOr<List<Product>> runNotifierBuild(
    covariant WatchProductsBySalesOrder notifier,
  ) {
    return notifier.build(
      salesOrderId,
      sessionId,
    );
  }

  @override
  Override overrideWith(WatchProductsBySalesOrder Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchProductsBySalesOrderProvider._internal(
        () => create()
          ..salesOrderId = salesOrderId
          ..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        salesOrderId: salesOrderId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WatchProductsBySalesOrder,
      List<Product>> createElement() {
    return _WatchProductsBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchProductsBySalesOrderProvider &&
        other.salesOrderId == salesOrderId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, salesOrderId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchProductsBySalesOrderRef
    on AutoDisposeAsyncNotifierProviderRef<List<Product>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _WatchProductsBySalesOrderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WatchProductsBySalesOrder,
        List<Product>> with WatchProductsBySalesOrderRef {
  _WatchProductsBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchProductsBySalesOrderProvider).salesOrderId;
  @override
  String get sessionId =>
      (origin as WatchProductsBySalesOrderProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
