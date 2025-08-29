// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$findSalesOrdersHash() => r'022bd02d9bb1d253757a9cba1517cb3f53b3abfa';

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

/// Fetch Sales Orders Provider
///
/// This provider is used to fetch a list of Sales Orders from the server.
///
/// The sessionId is needed to differentiate between different tables. One
/// table could have filters enabled and another one not. The sessionId is used
/// to be able to fetch both lists with the same provider.
///
///
/// Copied from [findSalesOrders].
@ProviderFor(findSalesOrders)
const findSalesOrdersProvider = FindSalesOrdersFamily();

/// Fetch Sales Orders Provider
///
/// This provider is used to fetch a list of Sales Orders from the server.
///
/// The sessionId is needed to differentiate between different tables. One
/// table could have filters enabled and another one not. The sessionId is used
/// to be able to fetch both lists with the same provider.
///
///
/// Copied from [findSalesOrders].
class FindSalesOrdersFamily extends Family<AsyncValue<List<SalesOrder>>> {
  /// Fetch Sales Orders Provider
  ///
  /// This provider is used to fetch a list of Sales Orders from the server.
  ///
  /// The sessionId is needed to differentiate between different tables. One
  /// table could have filters enabled and another one not. The sessionId is used
  /// to be able to fetch both lists with the same provider.
  ///
  ///
  /// Copied from [findSalesOrders].
  const FindSalesOrdersFamily();

  /// Fetch Sales Orders Provider
  ///
  /// This provider is used to fetch a list of Sales Orders from the server.
  ///
  /// The sessionId is needed to differentiate between different tables. One
  /// table could have filters enabled and another one not. The sessionId is used
  /// to be able to fetch both lists with the same provider.
  ///
  ///
  /// Copied from [findSalesOrders].
  FindSalesOrdersProvider call(
    String sessionId,
  ) {
    return FindSalesOrdersProvider(
      sessionId,
    );
  }

  @override
  FindSalesOrdersProvider getProviderOverride(
    covariant FindSalesOrdersProvider provider,
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
  String? get name => r'findSalesOrdersProvider';
}

/// Fetch Sales Orders Provider
///
/// This provider is used to fetch a list of Sales Orders from the server.
///
/// The sessionId is needed to differentiate between different tables. One
/// table could have filters enabled and another one not. The sessionId is used
/// to be able to fetch both lists with the same provider.
///
///
/// Copied from [findSalesOrders].
class FindSalesOrdersProvider
    extends AutoDisposeFutureProvider<List<SalesOrder>> {
  /// Fetch Sales Orders Provider
  ///
  /// This provider is used to fetch a list of Sales Orders from the server.
  ///
  /// The sessionId is needed to differentiate between different tables. One
  /// table could have filters enabled and another one not. The sessionId is used
  /// to be able to fetch both lists with the same provider.
  ///
  ///
  /// Copied from [findSalesOrders].
  FindSalesOrdersProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findSalesOrders(
            ref as FindSalesOrdersRef,
            sessionId,
          ),
          from: findSalesOrdersProvider,
          name: r'findSalesOrdersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findSalesOrdersHash,
          dependencies: FindSalesOrdersFamily._dependencies,
          allTransitiveDependencies:
              FindSalesOrdersFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindSalesOrdersProvider._internal(
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
    FutureOr<List<SalesOrder>> Function(FindSalesOrdersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindSalesOrdersProvider._internal(
        (ref) => create(ref as FindSalesOrdersRef),
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
  AutoDisposeFutureProviderElement<List<SalesOrder>> createElement() {
    return _FindSalesOrdersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindSalesOrdersProvider && other.sessionId == sessionId;
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
mixin FindSalesOrdersRef on AutoDisposeFutureProviderRef<List<SalesOrder>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindSalesOrdersProviderElement
    extends AutoDisposeFutureProviderElement<List<SalesOrder>>
    with FindSalesOrdersRef {
  _FindSalesOrdersProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindSalesOrdersProvider).sessionId;
}

String _$findSalesOrdersByCustomerIdHash() =>
    r'97aebcd3a5c9d13a7de12a210b7345fff1edaa36';

/// See also [findSalesOrdersByCustomerId].
@ProviderFor(findSalesOrdersByCustomerId)
const findSalesOrdersByCustomerIdProvider = FindSalesOrdersByCustomerIdFamily();

/// See also [findSalesOrdersByCustomerId].
class FindSalesOrdersByCustomerIdFamily
    extends Family<AsyncValue<List<SalesOrder>>> {
  /// See also [findSalesOrdersByCustomerId].
  const FindSalesOrdersByCustomerIdFamily();

  /// See also [findSalesOrdersByCustomerId].
  FindSalesOrdersByCustomerIdProvider call(
    String sessionId,
    int customerId,
  ) {
    return FindSalesOrdersByCustomerIdProvider(
      sessionId,
      customerId,
    );
  }

  @override
  FindSalesOrdersByCustomerIdProvider getProviderOverride(
    covariant FindSalesOrdersByCustomerIdProvider provider,
  ) {
    return call(
      provider.sessionId,
      provider.customerId,
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
  String? get name => r'findSalesOrdersByCustomerIdProvider';
}

/// See also [findSalesOrdersByCustomerId].
class FindSalesOrdersByCustomerIdProvider
    extends AutoDisposeFutureProvider<List<SalesOrder>> {
  /// See also [findSalesOrdersByCustomerId].
  FindSalesOrdersByCustomerIdProvider(
    String sessionId,
    int customerId,
  ) : this._internal(
          (ref) => findSalesOrdersByCustomerId(
            ref as FindSalesOrdersByCustomerIdRef,
            sessionId,
            customerId,
          ),
          from: findSalesOrdersByCustomerIdProvider,
          name: r'findSalesOrdersByCustomerIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findSalesOrdersByCustomerIdHash,
          dependencies: FindSalesOrdersByCustomerIdFamily._dependencies,
          allTransitiveDependencies:
              FindSalesOrdersByCustomerIdFamily._allTransitiveDependencies,
          sessionId: sessionId,
          customerId: customerId,
        );

  FindSalesOrdersByCustomerIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.customerId,
  }) : super.internal();

  final String sessionId;
  final int customerId;

  @override
  Override overrideWith(
    FutureOr<List<SalesOrder>> Function(FindSalesOrdersByCustomerIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindSalesOrdersByCustomerIdProvider._internal(
        (ref) => create(ref as FindSalesOrdersByCustomerIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SalesOrder>> createElement() {
    return _FindSalesOrdersByCustomerIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindSalesOrdersByCustomerIdProvider &&
        other.sessionId == sessionId &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindSalesOrdersByCustomerIdRef
    on AutoDisposeFutureProviderRef<List<SalesOrder>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _FindSalesOrdersByCustomerIdProviderElement
    extends AutoDisposeFutureProviderElement<List<SalesOrder>>
    with FindSalesOrdersByCustomerIdRef {
  _FindSalesOrdersByCustomerIdProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FindSalesOrdersByCustomerIdProvider).sessionId;
  @override
  int get customerId =>
      (origin as FindSalesOrdersByCustomerIdProvider).customerId;
}

String _$findSalesOrdersSpotlightHash() =>
    r'eedbc21fe0639af13af6c027539f16a3dc943353';

/// See also [findSalesOrdersSpotlight].
@ProviderFor(findSalesOrdersSpotlight)
const findSalesOrdersSpotlightProvider = FindSalesOrdersSpotlightFamily();

/// See also [findSalesOrdersSpotlight].
class FindSalesOrdersSpotlightFamily
    extends Family<AsyncValue<List<SpotlightItem>>> {
  /// See also [findSalesOrdersSpotlight].
  const FindSalesOrdersSpotlightFamily();

  /// See also [findSalesOrdersSpotlight].
  FindSalesOrdersSpotlightProvider call(
    String query,
  ) {
    return FindSalesOrdersSpotlightProvider(
      query,
    );
  }

  @override
  FindSalesOrdersSpotlightProvider getProviderOverride(
    covariant FindSalesOrdersSpotlightProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'findSalesOrdersSpotlightProvider';
}

/// See also [findSalesOrdersSpotlight].
class FindSalesOrdersSpotlightProvider
    extends AutoDisposeFutureProvider<List<SpotlightItem>> {
  /// See also [findSalesOrdersSpotlight].
  FindSalesOrdersSpotlightProvider(
    String query,
  ) : this._internal(
          (ref) => findSalesOrdersSpotlight(
            ref as FindSalesOrdersSpotlightRef,
            query,
          ),
          from: findSalesOrdersSpotlightProvider,
          name: r'findSalesOrdersSpotlightProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findSalesOrdersSpotlightHash,
          dependencies: FindSalesOrdersSpotlightFamily._dependencies,
          allTransitiveDependencies:
              FindSalesOrdersSpotlightFamily._allTransitiveDependencies,
          query: query,
        );

  FindSalesOrdersSpotlightProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<SpotlightItem>> Function(FindSalesOrdersSpotlightRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindSalesOrdersSpotlightProvider._internal(
        (ref) => create(ref as FindSalesOrdersSpotlightRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SpotlightItem>> createElement() {
    return _FindSalesOrdersSpotlightProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindSalesOrdersSpotlightProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindSalesOrdersSpotlightRef
    on AutoDisposeFutureProviderRef<List<SpotlightItem>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FindSalesOrdersSpotlightProviderElement
    extends AutoDisposeFutureProviderElement<List<SpotlightItem>>
    with FindSalesOrdersSpotlightRef {
  _FindSalesOrdersSpotlightProviderElement(super.provider);

  @override
  String get query => (origin as FindSalesOrdersSpotlightProvider).query;
}

String _$fetchSalesOrderHash() => r'790edbf63f78571274d64f6a4b0a801ae9dbe540';

/// Fetch Sales Order Provider
///
/// This provider is used to fetch a single Sales Order from the server.
///
/// The sessionId is needed to differentiate between different opened cards with
/// the same SalesOrder. Only the first one to fetch the SalesOrder is able
/// to edit it.
///
/// Copied from [fetchSalesOrder].
@ProviderFor(fetchSalesOrder)
const fetchSalesOrderProvider = FetchSalesOrderFamily();

/// Fetch Sales Order Provider
///
/// This provider is used to fetch a single Sales Order from the server.
///
/// The sessionId is needed to differentiate between different opened cards with
/// the same SalesOrder. Only the first one to fetch the SalesOrder is able
/// to edit it.
///
/// Copied from [fetchSalesOrder].
class FetchSalesOrderFamily extends Family<AsyncValue<SalesOrder?>> {
  /// Fetch Sales Order Provider
  ///
  /// This provider is used to fetch a single Sales Order from the server.
  ///
  /// The sessionId is needed to differentiate between different opened cards with
  /// the same SalesOrder. Only the first one to fetch the SalesOrder is able
  /// to edit it.
  ///
  /// Copied from [fetchSalesOrder].
  const FetchSalesOrderFamily();

  /// Fetch Sales Order Provider
  ///
  /// This provider is used to fetch a single Sales Order from the server.
  ///
  /// The sessionId is needed to differentiate between different opened cards with
  /// the same SalesOrder. Only the first one to fetch the SalesOrder is able
  /// to edit it.
  ///
  /// Copied from [fetchSalesOrder].
  FetchSalesOrderProvider call(
    int id,
    String sessionId,
  ) {
    return FetchSalesOrderProvider(
      id,
      sessionId,
    );
  }

  @override
  FetchSalesOrderProvider getProviderOverride(
    covariant FetchSalesOrderProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'fetchSalesOrderProvider';
}

/// Fetch Sales Order Provider
///
/// This provider is used to fetch a single Sales Order from the server.
///
/// The sessionId is needed to differentiate between different opened cards with
/// the same SalesOrder. Only the first one to fetch the SalesOrder is able
/// to edit it.
///
/// Copied from [fetchSalesOrder].
class FetchSalesOrderProvider extends AutoDisposeFutureProvider<SalesOrder?> {
  /// Fetch Sales Order Provider
  ///
  /// This provider is used to fetch a single Sales Order from the server.
  ///
  /// The sessionId is needed to differentiate between different opened cards with
  /// the same SalesOrder. Only the first one to fetch the SalesOrder is able
  /// to edit it.
  ///
  /// Copied from [fetchSalesOrder].
  FetchSalesOrderProvider(
    int id,
    String sessionId,
  ) : this._internal(
          (ref) => fetchSalesOrder(
            ref as FetchSalesOrderRef,
            id,
            sessionId,
          ),
          from: fetchSalesOrderProvider,
          name: r'fetchSalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchSalesOrderHash,
          dependencies: FetchSalesOrderFamily._dependencies,
          allTransitiveDependencies:
              FetchSalesOrderFamily._allTransitiveDependencies,
          id: id,
          sessionId: sessionId,
        );

  FetchSalesOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.sessionId,
  }) : super.internal();

  final int id;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<SalesOrder?> Function(FetchSalesOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchSalesOrderProvider._internal(
        (ref) => create(ref as FetchSalesOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SalesOrder?> createElement() {
    return _FetchSalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSalesOrderProvider &&
        other.id == id &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchSalesOrderRef on AutoDisposeFutureProviderRef<SalesOrder?> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchSalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<SalesOrder?>
    with FetchSalesOrderRef {
  _FetchSalesOrderProviderElement(super.provider);

  @override
  int get id => (origin as FetchSalesOrderProvider).id;
  @override
  String get sessionId => (origin as FetchSalesOrderProvider).sessionId;
}

String _$salesOrderRepositoryHash() =>
    r'db9a8ba766620f6b25afac4751d190908df9a8f9';

/// Fetch Sales Order Repository Provider
///
/// Copied from [salesOrderRepository].
@ProviderFor(salesOrderRepository)
final salesOrderRepositoryProvider =
    AutoDisposeProvider<SalesOrderRepository>.internal(
  salesOrderRepository,
  name: r'salesOrderRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesOrderRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SalesOrderRepositoryRef = AutoDisposeProviderRef<SalesOrderRepository>;
String _$watchSalesOrderHash() => r'f1d3954fe9539c534d24fcfe97c3ebaee36dee3c';

/// See also [watchSalesOrder].
@ProviderFor(watchSalesOrder)
const watchSalesOrderProvider = WatchSalesOrderFamily();

/// See also [watchSalesOrder].
class WatchSalesOrderFamily extends Family<AsyncValue<SalesOrder>> {
  /// See also [watchSalesOrder].
  const WatchSalesOrderFamily();

  /// See also [watchSalesOrder].
  WatchSalesOrderProvider call({
    required String sessionId,
    required int salesOrderId,
  }) {
    return WatchSalesOrderProvider(
      sessionId: sessionId,
      salesOrderId: salesOrderId,
    );
  }

  @override
  WatchSalesOrderProvider getProviderOverride(
    covariant WatchSalesOrderProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      salesOrderId: provider.salesOrderId,
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
  String? get name => r'watchSalesOrderProvider';
}

/// See also [watchSalesOrder].
class WatchSalesOrderProvider extends AutoDisposeStreamProvider<SalesOrder> {
  /// See also [watchSalesOrder].
  WatchSalesOrderProvider({
    required String sessionId,
    required int salesOrderId,
  }) : this._internal(
          (ref) => watchSalesOrder(
            ref as WatchSalesOrderRef,
            sessionId: sessionId,
            salesOrderId: salesOrderId,
          ),
          from: watchSalesOrderProvider,
          name: r'watchSalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSalesOrderHash,
          dependencies: WatchSalesOrderFamily._dependencies,
          allTransitiveDependencies:
              WatchSalesOrderFamily._allTransitiveDependencies,
          sessionId: sessionId,
          salesOrderId: salesOrderId,
        );

  WatchSalesOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.salesOrderId,
  }) : super.internal();

  final String sessionId;
  final int salesOrderId;

  @override
  Override overrideWith(
    Stream<SalesOrder> Function(WatchSalesOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSalesOrderProvider._internal(
        (ref) => create(ref as WatchSalesOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        salesOrderId: salesOrderId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<SalesOrder> createElement() {
    return _WatchSalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSalesOrderProvider &&
        other.sessionId == sessionId &&
        other.salesOrderId == salesOrderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, salesOrderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchSalesOrderRef on AutoDisposeStreamProviderRef<SalesOrder> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchSalesOrderProviderElement
    extends AutoDisposeStreamProviderElement<SalesOrder>
    with WatchSalesOrderRef {
  _WatchSalesOrderProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchSalesOrderProvider).sessionId;
  @override
  int get salesOrderId => (origin as WatchSalesOrderProvider).salesOrderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
