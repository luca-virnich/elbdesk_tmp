// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$salesOrderItemRepositoryHash() =>
    r'd76880213105ede97b52330dfffba137749eba80';

/// See also [salesOrderItemRepository].
@ProviderFor(salesOrderItemRepository)
final salesOrderItemRepositoryProvider =
    AutoDisposeProvider<SalesOrderItemRepository>.internal(
  salesOrderItemRepository,
  name: r'salesOrderItemRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesOrderItemRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SalesOrderItemRepositoryRef
    = AutoDisposeProviderRef<SalesOrderItemRepository>;
String _$fetchSalesOrderItemsHash() =>
    r'8e6c323f5cdfdf17b9b14b2cf65e332ac329c842';

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

/// See also [fetchSalesOrderItems].
@ProviderFor(fetchSalesOrderItems)
const fetchSalesOrderItemsProvider = FetchSalesOrderItemsFamily();

/// See also [fetchSalesOrderItems].
class FetchSalesOrderItemsFamily
    extends Family<AsyncValue<List<SalesOrderItem>>> {
  /// See also [fetchSalesOrderItems].
  const FetchSalesOrderItemsFamily();

  /// See also [fetchSalesOrderItems].
  FetchSalesOrderItemsProvider call({
    required int salesOrderId,
    required String sessionId,
  }) {
    return FetchSalesOrderItemsProvider(
      salesOrderId: salesOrderId,
      sessionId: sessionId,
    );
  }

  @override
  FetchSalesOrderItemsProvider getProviderOverride(
    covariant FetchSalesOrderItemsProvider provider,
  ) {
    return call(
      salesOrderId: provider.salesOrderId,
      sessionId: provider.sessionId,
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
  String? get name => r'fetchSalesOrderItemsProvider';
}

/// See also [fetchSalesOrderItems].
class FetchSalesOrderItemsProvider
    extends AutoDisposeFutureProvider<List<SalesOrderItem>> {
  /// See also [fetchSalesOrderItems].
  FetchSalesOrderItemsProvider({
    required int salesOrderId,
    required String sessionId,
  }) : this._internal(
          (ref) => fetchSalesOrderItems(
            ref as FetchSalesOrderItemsRef,
            salesOrderId: salesOrderId,
            sessionId: sessionId,
          ),
          from: fetchSalesOrderItemsProvider,
          name: r'fetchSalesOrderItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchSalesOrderItemsHash,
          dependencies: FetchSalesOrderItemsFamily._dependencies,
          allTransitiveDependencies:
              FetchSalesOrderItemsFamily._allTransitiveDependencies,
          salesOrderId: salesOrderId,
          sessionId: sessionId,
        );

  FetchSalesOrderItemsProvider._internal(
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
    FutureOr<List<SalesOrderItem>> Function(FetchSalesOrderItemsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchSalesOrderItemsProvider._internal(
        (ref) => create(ref as FetchSalesOrderItemsRef),
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
  AutoDisposeFutureProviderElement<List<SalesOrderItem>> createElement() {
    return _FetchSalesOrderItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSalesOrderItemsProvider &&
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
mixin FetchSalesOrderItemsRef
    on AutoDisposeFutureProviderRef<List<SalesOrderItem>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchSalesOrderItemsProviderElement
    extends AutoDisposeFutureProviderElement<List<SalesOrderItem>>
    with FetchSalesOrderItemsRef {
  _FetchSalesOrderItemsProviderElement(super.provider);

  @override
  int get salesOrderId => (origin as FetchSalesOrderItemsProvider).salesOrderId;
  @override
  String get sessionId => (origin as FetchSalesOrderItemsProvider).sessionId;
}

String _$findSalesOrderItemsHash() =>
    r'39fc51a513b36bdbaaae15195ca1e4801de6dcc4';

/// Fetch Sales Order Items Provider
///
/// This provider is used to fetch a list of Sales Order Items from the server.
///
/// The sessionId is needed to differentiate between different tables. One
/// table could have filters enabled and another one not. The sessionId is used
/// to be able to fetch both lists with the same provider.
///
///
/// Copied from [findSalesOrderItems].
@ProviderFor(findSalesOrderItems)
const findSalesOrderItemsProvider = FindSalesOrderItemsFamily();

/// Fetch Sales Order Items Provider
///
/// This provider is used to fetch a list of Sales Order Items from the server.
///
/// The sessionId is needed to differentiate between different tables. One
/// table could have filters enabled and another one not. The sessionId is used
/// to be able to fetch both lists with the same provider.
///
///
/// Copied from [findSalesOrderItems].
class FindSalesOrderItemsFamily
    extends Family<AsyncValue<List<SalesOrderItem>>> {
  /// Fetch Sales Order Items Provider
  ///
  /// This provider is used to fetch a list of Sales Order Items from the server.
  ///
  /// The sessionId is needed to differentiate between different tables. One
  /// table could have filters enabled and another one not. The sessionId is used
  /// to be able to fetch both lists with the same provider.
  ///
  ///
  /// Copied from [findSalesOrderItems].
  const FindSalesOrderItemsFamily();

  /// Fetch Sales Order Items Provider
  ///
  /// This provider is used to fetch a list of Sales Order Items from the server.
  ///
  /// The sessionId is needed to differentiate between different tables. One
  /// table could have filters enabled and another one not. The sessionId is used
  /// to be able to fetch both lists with the same provider.
  ///
  ///
  /// Copied from [findSalesOrderItems].
  FindSalesOrderItemsProvider call(
    String sessionId,
  ) {
    return FindSalesOrderItemsProvider(
      sessionId,
    );
  }

  @override
  FindSalesOrderItemsProvider getProviderOverride(
    covariant FindSalesOrderItemsProvider provider,
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
  String? get name => r'findSalesOrderItemsProvider';
}

/// Fetch Sales Order Items Provider
///
/// This provider is used to fetch a list of Sales Order Items from the server.
///
/// The sessionId is needed to differentiate between different tables. One
/// table could have filters enabled and another one not. The sessionId is used
/// to be able to fetch both lists with the same provider.
///
///
/// Copied from [findSalesOrderItems].
class FindSalesOrderItemsProvider
    extends AutoDisposeFutureProvider<List<SalesOrderItem>> {
  /// Fetch Sales Order Items Provider
  ///
  /// This provider is used to fetch a list of Sales Order Items from the server.
  ///
  /// The sessionId is needed to differentiate between different tables. One
  /// table could have filters enabled and another one not. The sessionId is used
  /// to be able to fetch both lists with the same provider.
  ///
  ///
  /// Copied from [findSalesOrderItems].
  FindSalesOrderItemsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findSalesOrderItems(
            ref as FindSalesOrderItemsRef,
            sessionId,
          ),
          from: findSalesOrderItemsProvider,
          name: r'findSalesOrderItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findSalesOrderItemsHash,
          dependencies: FindSalesOrderItemsFamily._dependencies,
          allTransitiveDependencies:
              FindSalesOrderItemsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindSalesOrderItemsProvider._internal(
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
    FutureOr<List<SalesOrderItem>> Function(FindSalesOrderItemsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindSalesOrderItemsProvider._internal(
        (ref) => create(ref as FindSalesOrderItemsRef),
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
  AutoDisposeFutureProviderElement<List<SalesOrderItem>> createElement() {
    return _FindSalesOrderItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindSalesOrderItemsProvider && other.sessionId == sessionId;
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
mixin FindSalesOrderItemsRef
    on AutoDisposeFutureProviderRef<List<SalesOrderItem>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindSalesOrderItemsProviderElement
    extends AutoDisposeFutureProviderElement<List<SalesOrderItem>>
    with FindSalesOrderItemsRef {
  _FindSalesOrderItemsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindSalesOrderItemsProvider).sessionId;
}

String _$watchSoiPrepareArtworkByArtworkHash() =>
    r'0e13c850bd90b1c4e5e9014371f0a937e4746fd7';

/// Provider that watches for SoiPrepareArtwork updates for a specific artwork
///
/// Copied from [watchSoiPrepareArtworkByArtwork].
@ProviderFor(watchSoiPrepareArtworkByArtwork)
const watchSoiPrepareArtworkByArtworkProvider =
    WatchSoiPrepareArtworkByArtworkFamily();

/// Provider that watches for SoiPrepareArtwork updates for a specific artwork
///
/// Copied from [watchSoiPrepareArtworkByArtwork].
class WatchSoiPrepareArtworkByArtworkFamily
    extends Family<AsyncValue<SoiPrepareArtwork>> {
  /// Provider that watches for SoiPrepareArtwork updates for a specific artwork
  ///
  /// Copied from [watchSoiPrepareArtworkByArtwork].
  const WatchSoiPrepareArtworkByArtworkFamily();

  /// Provider that watches for SoiPrepareArtwork updates for a specific artwork
  ///
  /// Copied from [watchSoiPrepareArtworkByArtwork].
  WatchSoiPrepareArtworkByArtworkProvider call({
    required int artworkId,
  }) {
    return WatchSoiPrepareArtworkByArtworkProvider(
      artworkId: artworkId,
    );
  }

  @override
  WatchSoiPrepareArtworkByArtworkProvider getProviderOverride(
    covariant WatchSoiPrepareArtworkByArtworkProvider provider,
  ) {
    return call(
      artworkId: provider.artworkId,
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
  String? get name => r'watchSoiPrepareArtworkByArtworkProvider';
}

/// Provider that watches for SoiPrepareArtwork updates for a specific artwork
///
/// Copied from [watchSoiPrepareArtworkByArtwork].
class WatchSoiPrepareArtworkByArtworkProvider
    extends AutoDisposeStreamProvider<SoiPrepareArtwork> {
  /// Provider that watches for SoiPrepareArtwork updates for a specific artwork
  ///
  /// Copied from [watchSoiPrepareArtworkByArtwork].
  WatchSoiPrepareArtworkByArtworkProvider({
    required int artworkId,
  }) : this._internal(
          (ref) => watchSoiPrepareArtworkByArtwork(
            ref as WatchSoiPrepareArtworkByArtworkRef,
            artworkId: artworkId,
          ),
          from: watchSoiPrepareArtworkByArtworkProvider,
          name: r'watchSoiPrepareArtworkByArtworkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSoiPrepareArtworkByArtworkHash,
          dependencies: WatchSoiPrepareArtworkByArtworkFamily._dependencies,
          allTransitiveDependencies:
              WatchSoiPrepareArtworkByArtworkFamily._allTransitiveDependencies,
          artworkId: artworkId,
        );

  WatchSoiPrepareArtworkByArtworkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkId,
  }) : super.internal();

  final int artworkId;

  @override
  Override overrideWith(
    Stream<SoiPrepareArtwork> Function(
            WatchSoiPrepareArtworkByArtworkRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSoiPrepareArtworkByArtworkProvider._internal(
        (ref) => create(ref as WatchSoiPrepareArtworkByArtworkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkId: artworkId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<SoiPrepareArtwork> createElement() {
    return _WatchSoiPrepareArtworkByArtworkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSoiPrepareArtworkByArtworkProvider &&
        other.artworkId == artworkId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchSoiPrepareArtworkByArtworkRef
    on AutoDisposeStreamProviderRef<SoiPrepareArtwork> {
  /// The parameter `artworkId` of this provider.
  int get artworkId;
}

class _WatchSoiPrepareArtworkByArtworkProviderElement
    extends AutoDisposeStreamProviderElement<SoiPrepareArtwork>
    with WatchSoiPrepareArtworkByArtworkRef {
  _WatchSoiPrepareArtworkByArtworkProviderElement(super.provider);

  @override
  int get artworkId =>
      (origin as WatchSoiPrepareArtworkByArtworkProvider).artworkId;
}

String _$watchSoiRequestArtworkApprovalByArtworkHash() =>
    r'b23ee621d9c31fa7b7ecb14edc4b851d74f84047';

/// See also [watchSoiRequestArtworkApprovalByArtwork].
@ProviderFor(watchSoiRequestArtworkApprovalByArtwork)
const watchSoiRequestArtworkApprovalByArtworkProvider =
    WatchSoiRequestArtworkApprovalByArtworkFamily();

/// See also [watchSoiRequestArtworkApprovalByArtwork].
class WatchSoiRequestArtworkApprovalByArtworkFamily
    extends Family<AsyncValue<SoiRequestArtworkApproval>> {
  /// See also [watchSoiRequestArtworkApprovalByArtwork].
  const WatchSoiRequestArtworkApprovalByArtworkFamily();

  /// See also [watchSoiRequestArtworkApprovalByArtwork].
  WatchSoiRequestArtworkApprovalByArtworkProvider call({
    required int artworkId,
  }) {
    return WatchSoiRequestArtworkApprovalByArtworkProvider(
      artworkId: artworkId,
    );
  }

  @override
  WatchSoiRequestArtworkApprovalByArtworkProvider getProviderOverride(
    covariant WatchSoiRequestArtworkApprovalByArtworkProvider provider,
  ) {
    return call(
      artworkId: provider.artworkId,
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
  String? get name => r'watchSoiRequestArtworkApprovalByArtworkProvider';
}

/// See also [watchSoiRequestArtworkApprovalByArtwork].
class WatchSoiRequestArtworkApprovalByArtworkProvider
    extends AutoDisposeStreamProvider<SoiRequestArtworkApproval> {
  /// See also [watchSoiRequestArtworkApprovalByArtwork].
  WatchSoiRequestArtworkApprovalByArtworkProvider({
    required int artworkId,
  }) : this._internal(
          (ref) => watchSoiRequestArtworkApprovalByArtwork(
            ref as WatchSoiRequestArtworkApprovalByArtworkRef,
            artworkId: artworkId,
          ),
          from: watchSoiRequestArtworkApprovalByArtworkProvider,
          name: r'watchSoiRequestArtworkApprovalByArtworkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSoiRequestArtworkApprovalByArtworkHash,
          dependencies:
              WatchSoiRequestArtworkApprovalByArtworkFamily._dependencies,
          allTransitiveDependencies:
              WatchSoiRequestArtworkApprovalByArtworkFamily
                  ._allTransitiveDependencies,
          artworkId: artworkId,
        );

  WatchSoiRequestArtworkApprovalByArtworkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkId,
  }) : super.internal();

  final int artworkId;

  @override
  Override overrideWith(
    Stream<SoiRequestArtworkApproval> Function(
            WatchSoiRequestArtworkApprovalByArtworkRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSoiRequestArtworkApprovalByArtworkProvider._internal(
        (ref) => create(ref as WatchSoiRequestArtworkApprovalByArtworkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkId: artworkId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<SoiRequestArtworkApproval> createElement() {
    return _WatchSoiRequestArtworkApprovalByArtworkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSoiRequestArtworkApprovalByArtworkProvider &&
        other.artworkId == artworkId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchSoiRequestArtworkApprovalByArtworkRef
    on AutoDisposeStreamProviderRef<SoiRequestArtworkApproval> {
  /// The parameter `artworkId` of this provider.
  int get artworkId;
}

class _WatchSoiRequestArtworkApprovalByArtworkProviderElement
    extends AutoDisposeStreamProviderElement<SoiRequestArtworkApproval>
    with WatchSoiRequestArtworkApprovalByArtworkRef {
  _WatchSoiRequestArtworkApprovalByArtworkProviderElement(super.provider);

  @override
  int get artworkId =>
      (origin as WatchSoiRequestArtworkApprovalByArtworkProvider).artworkId;
}

String _$watchSoiEinzelformaufbauByArtworkHash() =>
    r'8d102d933a008b8eeaf79e99064181385ec1d444';

/// See also [watchSoiEinzelformaufbauByArtwork].
@ProviderFor(watchSoiEinzelformaufbauByArtwork)
const watchSoiEinzelformaufbauByArtworkProvider =
    WatchSoiEinzelformaufbauByArtworkFamily();

/// See also [watchSoiEinzelformaufbauByArtwork].
class WatchSoiEinzelformaufbauByArtworkFamily
    extends Family<AsyncValue<SoiEinzelformaufbau>> {
  /// See also [watchSoiEinzelformaufbauByArtwork].
  const WatchSoiEinzelformaufbauByArtworkFamily();

  /// See also [watchSoiEinzelformaufbauByArtwork].
  WatchSoiEinzelformaufbauByArtworkProvider call({
    required int artworkId,
  }) {
    return WatchSoiEinzelformaufbauByArtworkProvider(
      artworkId: artworkId,
    );
  }

  @override
  WatchSoiEinzelformaufbauByArtworkProvider getProviderOverride(
    covariant WatchSoiEinzelformaufbauByArtworkProvider provider,
  ) {
    return call(
      artworkId: provider.artworkId,
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
  String? get name => r'watchSoiEinzelformaufbauByArtworkProvider';
}

/// See also [watchSoiEinzelformaufbauByArtwork].
class WatchSoiEinzelformaufbauByArtworkProvider
    extends AutoDisposeStreamProvider<SoiEinzelformaufbau> {
  /// See also [watchSoiEinzelformaufbauByArtwork].
  WatchSoiEinzelformaufbauByArtworkProvider({
    required int artworkId,
  }) : this._internal(
          (ref) => watchSoiEinzelformaufbauByArtwork(
            ref as WatchSoiEinzelformaufbauByArtworkRef,
            artworkId: artworkId,
          ),
          from: watchSoiEinzelformaufbauByArtworkProvider,
          name: r'watchSoiEinzelformaufbauByArtworkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSoiEinzelformaufbauByArtworkHash,
          dependencies: WatchSoiEinzelformaufbauByArtworkFamily._dependencies,
          allTransitiveDependencies: WatchSoiEinzelformaufbauByArtworkFamily
              ._allTransitiveDependencies,
          artworkId: artworkId,
        );

  WatchSoiEinzelformaufbauByArtworkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkId,
  }) : super.internal();

  final int artworkId;

  @override
  Override overrideWith(
    Stream<SoiEinzelformaufbau> Function(
            WatchSoiEinzelformaufbauByArtworkRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSoiEinzelformaufbauByArtworkProvider._internal(
        (ref) => create(ref as WatchSoiEinzelformaufbauByArtworkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkId: artworkId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<SoiEinzelformaufbau> createElement() {
    return _WatchSoiEinzelformaufbauByArtworkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSoiEinzelformaufbauByArtworkProvider &&
        other.artworkId == artworkId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchSoiEinzelformaufbauByArtworkRef
    on AutoDisposeStreamProviderRef<SoiEinzelformaufbau> {
  /// The parameter `artworkId` of this provider.
  int get artworkId;
}

class _WatchSoiEinzelformaufbauByArtworkProviderElement
    extends AutoDisposeStreamProviderElement<SoiEinzelformaufbau>
    with WatchSoiEinzelformaufbauByArtworkRef {
  _WatchSoiEinzelformaufbauByArtworkProviderElement(super.provider);

  @override
  int get artworkId =>
      (origin as WatchSoiEinzelformaufbauByArtworkProvider).artworkId;
}

String _$watchGeneralSalesOrderItemsBySalesOrderHash() =>
    r'4e7aee53a2f77f8b2ef9d646aa9e2916900573ef';

/// See also [watchGeneralSalesOrderItemsBySalesOrder].
@ProviderFor(watchGeneralSalesOrderItemsBySalesOrder)
const watchGeneralSalesOrderItemsBySalesOrderProvider =
    WatchGeneralSalesOrderItemsBySalesOrderFamily();

/// See also [watchGeneralSalesOrderItemsBySalesOrder].
class WatchGeneralSalesOrderItemsBySalesOrderFamily
    extends Family<AsyncValue<List<SalesOrderItem>>> {
  /// See also [watchGeneralSalesOrderItemsBySalesOrder].
  const WatchGeneralSalesOrderItemsBySalesOrderFamily();

  /// See also [watchGeneralSalesOrderItemsBySalesOrder].
  WatchGeneralSalesOrderItemsBySalesOrderProvider call({
    required int salesOrderId,
    required String sessionId,
  }) {
    return WatchGeneralSalesOrderItemsBySalesOrderProvider(
      salesOrderId: salesOrderId,
      sessionId: sessionId,
    );
  }

  @override
  WatchGeneralSalesOrderItemsBySalesOrderProvider getProviderOverride(
    covariant WatchGeneralSalesOrderItemsBySalesOrderProvider provider,
  ) {
    return call(
      salesOrderId: provider.salesOrderId,
      sessionId: provider.sessionId,
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
  String? get name => r'watchGeneralSalesOrderItemsBySalesOrderProvider';
}

/// See also [watchGeneralSalesOrderItemsBySalesOrder].
class WatchGeneralSalesOrderItemsBySalesOrderProvider
    extends AutoDisposeFutureProvider<List<SalesOrderItem>> {
  /// See also [watchGeneralSalesOrderItemsBySalesOrder].
  WatchGeneralSalesOrderItemsBySalesOrderProvider({
    required int salesOrderId,
    required String sessionId,
  }) : this._internal(
          (ref) => watchGeneralSalesOrderItemsBySalesOrder(
            ref as WatchGeneralSalesOrderItemsBySalesOrderRef,
            salesOrderId: salesOrderId,
            sessionId: sessionId,
          ),
          from: watchGeneralSalesOrderItemsBySalesOrderProvider,
          name: r'watchGeneralSalesOrderItemsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchGeneralSalesOrderItemsBySalesOrderHash,
          dependencies:
              WatchGeneralSalesOrderItemsBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              WatchGeneralSalesOrderItemsBySalesOrderFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
          sessionId: sessionId,
        );

  WatchGeneralSalesOrderItemsBySalesOrderProvider._internal(
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
    FutureOr<List<SalesOrderItem>> Function(
            WatchGeneralSalesOrderItemsBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchGeneralSalesOrderItemsBySalesOrderProvider._internal(
        (ref) => create(ref as WatchGeneralSalesOrderItemsBySalesOrderRef),
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
  AutoDisposeFutureProviderElement<List<SalesOrderItem>> createElement() {
    return _WatchGeneralSalesOrderItemsBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchGeneralSalesOrderItemsBySalesOrderProvider &&
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
mixin WatchGeneralSalesOrderItemsBySalesOrderRef
    on AutoDisposeFutureProviderRef<List<SalesOrderItem>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _WatchGeneralSalesOrderItemsBySalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<SalesOrderItem>>
    with WatchGeneralSalesOrderItemsBySalesOrderRef {
  _WatchGeneralSalesOrderItemsBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchGeneralSalesOrderItemsBySalesOrderProvider).salesOrderId;
  @override
  String get sessionId =>
      (origin as WatchGeneralSalesOrderItemsBySalesOrderProvider).sessionId;
}

String _$watchSalesOrderItemUpdatesHash() =>
    r'9e863466aacfa86716a9bc41e3be3ba0234dcde1';

/// See also [watchSalesOrderItemUpdates].
@ProviderFor(watchSalesOrderItemUpdates)
const watchSalesOrderItemUpdatesProvider = WatchSalesOrderItemUpdatesFamily();

/// See also [watchSalesOrderItemUpdates].
class WatchSalesOrderItemUpdatesFamily
    extends Family<AsyncValue<SalesOrderItem>> {
  /// See also [watchSalesOrderItemUpdates].
  const WatchSalesOrderItemUpdatesFamily();

  /// See also [watchSalesOrderItemUpdates].
  WatchSalesOrderItemUpdatesProvider call({
    required String sessionId,
    required int salesOrderId,
  }) {
    return WatchSalesOrderItemUpdatesProvider(
      sessionId: sessionId,
      salesOrderId: salesOrderId,
    );
  }

  @override
  WatchSalesOrderItemUpdatesProvider getProviderOverride(
    covariant WatchSalesOrderItemUpdatesProvider provider,
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
  String? get name => r'watchSalesOrderItemUpdatesProvider';
}

/// See also [watchSalesOrderItemUpdates].
class WatchSalesOrderItemUpdatesProvider
    extends AutoDisposeStreamProvider<SalesOrderItem> {
  /// See also [watchSalesOrderItemUpdates].
  WatchSalesOrderItemUpdatesProvider({
    required String sessionId,
    required int salesOrderId,
  }) : this._internal(
          (ref) => watchSalesOrderItemUpdates(
            ref as WatchSalesOrderItemUpdatesRef,
            sessionId: sessionId,
            salesOrderId: salesOrderId,
          ),
          from: watchSalesOrderItemUpdatesProvider,
          name: r'watchSalesOrderItemUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSalesOrderItemUpdatesHash,
          dependencies: WatchSalesOrderItemUpdatesFamily._dependencies,
          allTransitiveDependencies:
              WatchSalesOrderItemUpdatesFamily._allTransitiveDependencies,
          sessionId: sessionId,
          salesOrderId: salesOrderId,
        );

  WatchSalesOrderItemUpdatesProvider._internal(
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
    Stream<SalesOrderItem> Function(WatchSalesOrderItemUpdatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSalesOrderItemUpdatesProvider._internal(
        (ref) => create(ref as WatchSalesOrderItemUpdatesRef),
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
  AutoDisposeStreamProviderElement<SalesOrderItem> createElement() {
    return _WatchSalesOrderItemUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSalesOrderItemUpdatesProvider &&
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
mixin WatchSalesOrderItemUpdatesRef
    on AutoDisposeStreamProviderRef<SalesOrderItem> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchSalesOrderItemUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<SalesOrderItem>
    with WatchSalesOrderItemUpdatesRef {
  _WatchSalesOrderItemUpdatesProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchSalesOrderItemUpdatesProvider).sessionId;
  @override
  int get salesOrderId =>
      (origin as WatchSalesOrderItemUpdatesProvider).salesOrderId;
}

String _$watchSalesOrderItemsByArtworkHash() =>
    r'54271bd23c59d3a1feeac20036687a5b5a67bc6e';

abstract class _$WatchSalesOrderItemsByArtwork
    extends BuildlessAutoDisposeAsyncNotifier<List<SalesOrderItem>> {
  late final int artworkId;

  FutureOr<List<SalesOrderItem>> build(
    int artworkId,
  );
}

/// Manages a list of SalesOrderItems for a specific artwork and handles updates
///
/// Copied from [WatchSalesOrderItemsByArtwork].
@ProviderFor(WatchSalesOrderItemsByArtwork)
const watchSalesOrderItemsByArtworkProvider =
    WatchSalesOrderItemsByArtworkFamily();

/// Manages a list of SalesOrderItems for a specific artwork and handles updates
///
/// Copied from [WatchSalesOrderItemsByArtwork].
class WatchSalesOrderItemsByArtworkFamily
    extends Family<AsyncValue<List<SalesOrderItem>>> {
  /// Manages a list of SalesOrderItems for a specific artwork and handles updates
  ///
  /// Copied from [WatchSalesOrderItemsByArtwork].
  const WatchSalesOrderItemsByArtworkFamily();

  /// Manages a list of SalesOrderItems for a specific artwork and handles updates
  ///
  /// Copied from [WatchSalesOrderItemsByArtwork].
  WatchSalesOrderItemsByArtworkProvider call(
    int artworkId,
  ) {
    return WatchSalesOrderItemsByArtworkProvider(
      artworkId,
    );
  }

  @override
  WatchSalesOrderItemsByArtworkProvider getProviderOverride(
    covariant WatchSalesOrderItemsByArtworkProvider provider,
  ) {
    return call(
      provider.artworkId,
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
  String? get name => r'watchSalesOrderItemsByArtworkProvider';
}

/// Manages a list of SalesOrderItems for a specific artwork and handles updates
///
/// Copied from [WatchSalesOrderItemsByArtwork].
class WatchSalesOrderItemsByArtworkProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchSalesOrderItemsByArtwork,
        List<SalesOrderItem>> {
  /// Manages a list of SalesOrderItems for a specific artwork and handles updates
  ///
  /// Copied from [WatchSalesOrderItemsByArtwork].
  WatchSalesOrderItemsByArtworkProvider(
    int artworkId,
  ) : this._internal(
          () => WatchSalesOrderItemsByArtwork()..artworkId = artworkId,
          from: watchSalesOrderItemsByArtworkProvider,
          name: r'watchSalesOrderItemsByArtworkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSalesOrderItemsByArtworkHash,
          dependencies: WatchSalesOrderItemsByArtworkFamily._dependencies,
          allTransitiveDependencies:
              WatchSalesOrderItemsByArtworkFamily._allTransitiveDependencies,
          artworkId: artworkId,
        );

  WatchSalesOrderItemsByArtworkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkId,
  }) : super.internal();

  final int artworkId;

  @override
  FutureOr<List<SalesOrderItem>> runNotifierBuild(
    covariant WatchSalesOrderItemsByArtwork notifier,
  ) {
    return notifier.build(
      artworkId,
    );
  }

  @override
  Override overrideWith(WatchSalesOrderItemsByArtwork Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchSalesOrderItemsByArtworkProvider._internal(
        () => create()..artworkId = artworkId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkId: artworkId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WatchSalesOrderItemsByArtwork,
      List<SalesOrderItem>> createElement() {
    return _WatchSalesOrderItemsByArtworkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSalesOrderItemsByArtworkProvider &&
        other.artworkId == artworkId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchSalesOrderItemsByArtworkRef
    on AutoDisposeAsyncNotifierProviderRef<List<SalesOrderItem>> {
  /// The parameter `artworkId` of this provider.
  int get artworkId;
}

class _WatchSalesOrderItemsByArtworkProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchSalesOrderItemsByArtwork,
        List<SalesOrderItem>> with WatchSalesOrderItemsByArtworkRef {
  _WatchSalesOrderItemsByArtworkProviderElement(super.provider);

  @override
  int get artworkId =>
      (origin as WatchSalesOrderItemsByArtworkProvider).artworkId;
}

String _$watchSalesOrderItemsHash() =>
    r'54436c4d0adeabd72a0998f0cc72c31ac014e1c3';

abstract class _$WatchSalesOrderItems
    extends BuildlessAutoDisposeAsyncNotifier<List<SalesOrderItem>> {
  late final int salesOrderId;
  late final String sessionId;

  FutureOr<List<SalesOrderItem>> build(
    int salesOrderId,
    String sessionId,
  );
}

/// See also [WatchSalesOrderItems].
@ProviderFor(WatchSalesOrderItems)
const watchSalesOrderItemsProvider = WatchSalesOrderItemsFamily();

/// See also [WatchSalesOrderItems].
class WatchSalesOrderItemsFamily
    extends Family<AsyncValue<List<SalesOrderItem>>> {
  /// See also [WatchSalesOrderItems].
  const WatchSalesOrderItemsFamily();

  /// See also [WatchSalesOrderItems].
  WatchSalesOrderItemsProvider call(
    int salesOrderId,
    String sessionId,
  ) {
    return WatchSalesOrderItemsProvider(
      salesOrderId,
      sessionId,
    );
  }

  @override
  WatchSalesOrderItemsProvider getProviderOverride(
    covariant WatchSalesOrderItemsProvider provider,
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
  String? get name => r'watchSalesOrderItemsProvider';
}

/// See also [WatchSalesOrderItems].
class WatchSalesOrderItemsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    WatchSalesOrderItems, List<SalesOrderItem>> {
  /// See also [WatchSalesOrderItems].
  WatchSalesOrderItemsProvider(
    int salesOrderId,
    String sessionId,
  ) : this._internal(
          () => WatchSalesOrderItems()
            ..salesOrderId = salesOrderId
            ..sessionId = sessionId,
          from: watchSalesOrderItemsProvider,
          name: r'watchSalesOrderItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSalesOrderItemsHash,
          dependencies: WatchSalesOrderItemsFamily._dependencies,
          allTransitiveDependencies:
              WatchSalesOrderItemsFamily._allTransitiveDependencies,
          salesOrderId: salesOrderId,
          sessionId: sessionId,
        );

  WatchSalesOrderItemsProvider._internal(
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
  FutureOr<List<SalesOrderItem>> runNotifierBuild(
    covariant WatchSalesOrderItems notifier,
  ) {
    return notifier.build(
      salesOrderId,
      sessionId,
    );
  }

  @override
  Override overrideWith(WatchSalesOrderItems Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchSalesOrderItemsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WatchSalesOrderItems,
      List<SalesOrderItem>> createElement() {
    return _WatchSalesOrderItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSalesOrderItemsProvider &&
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
mixin WatchSalesOrderItemsRef
    on AutoDisposeAsyncNotifierProviderRef<List<SalesOrderItem>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _WatchSalesOrderItemsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WatchSalesOrderItems,
        List<SalesOrderItem>> with WatchSalesOrderItemsRef {
  _WatchSalesOrderItemsProviderElement(super.provider);

  @override
  int get salesOrderId => (origin as WatchSalesOrderItemsProvider).salesOrderId;
  @override
  String get sessionId => (origin as WatchSalesOrderItemsProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
