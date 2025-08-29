// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutzenlayout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nutzenlayoutRepositoryHash() =>
    r'2244b016226b66fcaf538df079b90e2bcdc943d3';

/// See also [nutzenlayoutRepository].
@ProviderFor(nutzenlayoutRepository)
final nutzenlayoutRepositoryProvider =
    AutoDisposeProvider<NutzenlayoutRepository>.internal(
  nutzenlayoutRepository,
  name: r'nutzenlayoutRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nutzenlayoutRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NutzenlayoutRepositoryRef
    = AutoDisposeProviderRef<NutzenlayoutRepository>;
String _$fetchNutzelayoutsByMasterIdHash() =>
    r'f126e895d3725fd197dafe6963173ee88f9d5ae7';

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

/// See also [fetchNutzelayoutsByMasterId].
@ProviderFor(fetchNutzelayoutsByMasterId)
const fetchNutzelayoutsByMasterIdProvider = FetchNutzelayoutsByMasterIdFamily();

/// See also [fetchNutzelayoutsByMasterId].
class FetchNutzelayoutsByMasterIdFamily extends Family<AsyncValue<List<int>>> {
  /// See also [fetchNutzelayoutsByMasterId].
  const FetchNutzelayoutsByMasterIdFamily();

  /// See also [fetchNutzelayoutsByMasterId].
  FetchNutzelayoutsByMasterIdProvider call(
    String sessionId,
  ) {
    return FetchNutzelayoutsByMasterIdProvider(
      sessionId,
    );
  }

  @override
  FetchNutzelayoutsByMasterIdProvider getProviderOverride(
    covariant FetchNutzelayoutsByMasterIdProvider provider,
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
  String? get name => r'fetchNutzelayoutsByMasterIdProvider';
}

/// See also [fetchNutzelayoutsByMasterId].
class FetchNutzelayoutsByMasterIdProvider
    extends AutoDisposeFutureProvider<List<int>> {
  /// See also [fetchNutzelayoutsByMasterId].
  FetchNutzelayoutsByMasterIdProvider(
    String sessionId,
  ) : this._internal(
          (ref) => fetchNutzelayoutsByMasterId(
            ref as FetchNutzelayoutsByMasterIdRef,
            sessionId,
          ),
          from: fetchNutzelayoutsByMasterIdProvider,
          name: r'fetchNutzelayoutsByMasterIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchNutzelayoutsByMasterIdHash,
          dependencies: FetchNutzelayoutsByMasterIdFamily._dependencies,
          allTransitiveDependencies:
              FetchNutzelayoutsByMasterIdFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FetchNutzelayoutsByMasterIdProvider._internal(
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
    FutureOr<List<int>> Function(FetchNutzelayoutsByMasterIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchNutzelayoutsByMasterIdProvider._internal(
        (ref) => create(ref as FetchNutzelayoutsByMasterIdRef),
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
  AutoDisposeFutureProviderElement<List<int>> createElement() {
    return _FetchNutzelayoutsByMasterIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchNutzelayoutsByMasterIdProvider &&
        other.sessionId == sessionId;
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
mixin FetchNutzelayoutsByMasterIdRef
    on AutoDisposeFutureProviderRef<List<int>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchNutzelayoutsByMasterIdProviderElement
    extends AutoDisposeFutureProviderElement<List<int>>
    with FetchNutzelayoutsByMasterIdRef {
  _FetchNutzelayoutsByMasterIdProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FetchNutzelayoutsByMasterIdProvider).sessionId;
}

String _$fetchNutzenlayoutsByCustomerWithDimensionsHash() =>
    r'1731c839c756d548f842b1950aadda8791aa53b5';

/// See also [fetchNutzenlayoutsByCustomerWithDimensions].
@ProviderFor(fetchNutzenlayoutsByCustomerWithDimensions)
const fetchNutzenlayoutsByCustomerWithDimensionsProvider =
    FetchNutzenlayoutsByCustomerWithDimensionsFamily();

/// See also [fetchNutzenlayoutsByCustomerWithDimensions].
class FetchNutzenlayoutsByCustomerWithDimensionsFamily
    extends Family<AsyncValue<List<Nutzenlayout>>> {
  /// See also [fetchNutzenlayoutsByCustomerWithDimensions].
  const FetchNutzenlayoutsByCustomerWithDimensionsFamily();

  /// See also [fetchNutzenlayoutsByCustomerWithDimensions].
  FetchNutzenlayoutsByCustomerWithDimensionsProvider call({
    required int customerId,
    required double width,
    required double height,
  }) {
    return FetchNutzenlayoutsByCustomerWithDimensionsProvider(
      customerId: customerId,
      width: width,
      height: height,
    );
  }

  @override
  FetchNutzenlayoutsByCustomerWithDimensionsProvider getProviderOverride(
    covariant FetchNutzenlayoutsByCustomerWithDimensionsProvider provider,
  ) {
    return call(
      customerId: provider.customerId,
      width: provider.width,
      height: provider.height,
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
  String? get name => r'fetchNutzenlayoutsByCustomerWithDimensionsProvider';
}

/// See also [fetchNutzenlayoutsByCustomerWithDimensions].
class FetchNutzenlayoutsByCustomerWithDimensionsProvider
    extends AutoDisposeFutureProvider<List<Nutzenlayout>> {
  /// See also [fetchNutzenlayoutsByCustomerWithDimensions].
  FetchNutzenlayoutsByCustomerWithDimensionsProvider({
    required int customerId,
    required double width,
    required double height,
  }) : this._internal(
          (ref) => fetchNutzenlayoutsByCustomerWithDimensions(
            ref as FetchNutzenlayoutsByCustomerWithDimensionsRef,
            customerId: customerId,
            width: width,
            height: height,
          ),
          from: fetchNutzenlayoutsByCustomerWithDimensionsProvider,
          name: r'fetchNutzenlayoutsByCustomerWithDimensionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchNutzenlayoutsByCustomerWithDimensionsHash,
          dependencies:
              FetchNutzenlayoutsByCustomerWithDimensionsFamily._dependencies,
          allTransitiveDependencies:
              FetchNutzenlayoutsByCustomerWithDimensionsFamily
                  ._allTransitiveDependencies,
          customerId: customerId,
          width: width,
          height: height,
        );

  FetchNutzenlayoutsByCustomerWithDimensionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
    required this.width,
    required this.height,
  }) : super.internal();

  final int customerId;
  final double width;
  final double height;

  @override
  Override overrideWith(
    FutureOr<List<Nutzenlayout>> Function(
            FetchNutzenlayoutsByCustomerWithDimensionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchNutzenlayoutsByCustomerWithDimensionsProvider._internal(
        (ref) => create(ref as FetchNutzenlayoutsByCustomerWithDimensionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
        width: width,
        height: height,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Nutzenlayout>> createElement() {
    return _FetchNutzenlayoutsByCustomerWithDimensionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchNutzenlayoutsByCustomerWithDimensionsProvider &&
        other.customerId == customerId &&
        other.width == width &&
        other.height == height;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);
    hash = _SystemHash.combine(hash, width.hashCode);
    hash = _SystemHash.combine(hash, height.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchNutzenlayoutsByCustomerWithDimensionsRef
    on AutoDisposeFutureProviderRef<List<Nutzenlayout>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `width` of this provider.
  double get width;

  /// The parameter `height` of this provider.
  double get height;
}

class _FetchNutzenlayoutsByCustomerWithDimensionsProviderElement
    extends AutoDisposeFutureProviderElement<List<Nutzenlayout>>
    with FetchNutzenlayoutsByCustomerWithDimensionsRef {
  _FetchNutzenlayoutsByCustomerWithDimensionsProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as FetchNutzenlayoutsByCustomerWithDimensionsProvider).customerId;
  @override
  double get width =>
      (origin as FetchNutzenlayoutsByCustomerWithDimensionsProvider).width;
  @override
  double get height =>
      (origin as FetchNutzenlayoutsByCustomerWithDimensionsProvider).height;
}

String _$fetchMultiNutzenlayoutsByCustomerWithDimensionsHash() =>
    r'1b90ddb254e323ea806bcf1c3d9deb05ac88c21b';

/// See also [fetchMultiNutzenlayoutsByCustomerWithDimensions].
@ProviderFor(fetchMultiNutzenlayoutsByCustomerWithDimensions)
const fetchMultiNutzenlayoutsByCustomerWithDimensionsProvider =
    FetchMultiNutzenlayoutsByCustomerWithDimensionsFamily();

/// See also [fetchMultiNutzenlayoutsByCustomerWithDimensions].
class FetchMultiNutzenlayoutsByCustomerWithDimensionsFamily
    extends Family<AsyncValue<List<Nutzenlayout>>> {
  /// See also [fetchMultiNutzenlayoutsByCustomerWithDimensions].
  const FetchMultiNutzenlayoutsByCustomerWithDimensionsFamily();

  /// See also [fetchMultiNutzenlayoutsByCustomerWithDimensions].
  FetchMultiNutzenlayoutsByCustomerWithDimensionsProvider call({
    required int customerId,
    required Set<NutzenlayoutArtworkDimensions> dimensions,
  }) {
    return FetchMultiNutzenlayoutsByCustomerWithDimensionsProvider(
      customerId: customerId,
      dimensions: dimensions,
    );
  }

  @override
  FetchMultiNutzenlayoutsByCustomerWithDimensionsProvider getProviderOverride(
    covariant FetchMultiNutzenlayoutsByCustomerWithDimensionsProvider provider,
  ) {
    return call(
      customerId: provider.customerId,
      dimensions: provider.dimensions,
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
  String? get name =>
      r'fetchMultiNutzenlayoutsByCustomerWithDimensionsProvider';
}

/// See also [fetchMultiNutzenlayoutsByCustomerWithDimensions].
class FetchMultiNutzenlayoutsByCustomerWithDimensionsProvider
    extends AutoDisposeFutureProvider<List<Nutzenlayout>> {
  /// See also [fetchMultiNutzenlayoutsByCustomerWithDimensions].
  FetchMultiNutzenlayoutsByCustomerWithDimensionsProvider({
    required int customerId,
    required Set<NutzenlayoutArtworkDimensions> dimensions,
  }) : this._internal(
          (ref) => fetchMultiNutzenlayoutsByCustomerWithDimensions(
            ref as FetchMultiNutzenlayoutsByCustomerWithDimensionsRef,
            customerId: customerId,
            dimensions: dimensions,
          ),
          from: fetchMultiNutzenlayoutsByCustomerWithDimensionsProvider,
          name: r'fetchMultiNutzenlayoutsByCustomerWithDimensionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMultiNutzenlayoutsByCustomerWithDimensionsHash,
          dependencies: FetchMultiNutzenlayoutsByCustomerWithDimensionsFamily
              ._dependencies,
          allTransitiveDependencies:
              FetchMultiNutzenlayoutsByCustomerWithDimensionsFamily
                  ._allTransitiveDependencies,
          customerId: customerId,
          dimensions: dimensions,
        );

  FetchMultiNutzenlayoutsByCustomerWithDimensionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
    required this.dimensions,
  }) : super.internal();

  final int customerId;
  final Set<NutzenlayoutArtworkDimensions> dimensions;

  @override
  Override overrideWith(
    FutureOr<List<Nutzenlayout>> Function(
            FetchMultiNutzenlayoutsByCustomerWithDimensionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override:
          FetchMultiNutzenlayoutsByCustomerWithDimensionsProvider._internal(
        (ref) =>
            create(ref as FetchMultiNutzenlayoutsByCustomerWithDimensionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
        dimensions: dimensions,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Nutzenlayout>> createElement() {
    return _FetchMultiNutzenlayoutsByCustomerWithDimensionsProviderElement(
        this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchMultiNutzenlayoutsByCustomerWithDimensionsProvider &&
        other.customerId == customerId &&
        other.dimensions == dimensions;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);
    hash = _SystemHash.combine(hash, dimensions.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchMultiNutzenlayoutsByCustomerWithDimensionsRef
    on AutoDisposeFutureProviderRef<List<Nutzenlayout>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `dimensions` of this provider.
  Set<NutzenlayoutArtworkDimensions> get dimensions;
}

class _FetchMultiNutzenlayoutsByCustomerWithDimensionsProviderElement
    extends AutoDisposeFutureProviderElement<List<Nutzenlayout>>
    with FetchMultiNutzenlayoutsByCustomerWithDimensionsRef {
  _FetchMultiNutzenlayoutsByCustomerWithDimensionsProviderElement(
      super.provider);

  @override
  int get customerId =>
      (origin as FetchMultiNutzenlayoutsByCustomerWithDimensionsProvider)
          .customerId;
  @override
  Set<NutzenlayoutArtworkDimensions> get dimensions =>
      (origin as FetchMultiNutzenlayoutsByCustomerWithDimensionsProvider)
          .dimensions;
}

String _$fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderHash() =>
    r'253fcaf0142c95ebf90ce8828c5b1da374cfdfb7';

/// See also [fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrder].
@ProviderFor(fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrder)
const fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider =
    FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderFamily();

/// See also [fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrder].
class FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderFamily
    extends Family<AsyncValue<List<Nutzenlayout>>> {
  /// See also [fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrder].
  const FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderFamily();

  /// See also [fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrder].
  FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider call({
    required int salesOrderId,
    required int artworkId,
  }) {
    return FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider(
      salesOrderId: salesOrderId,
      artworkId: artworkId,
    );
  }

  @override
  FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider
      getProviderOverride(
    covariant FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider
        provider,
  ) {
    return call(
      salesOrderId: provider.salesOrderId,
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
  String? get name =>
      r'fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider';
}

/// See also [fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrder].
class FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider
    extends AutoDisposeFutureProvider<List<Nutzenlayout>> {
  /// See also [fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrder].
  FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider({
    required int salesOrderId,
    required int artworkId,
  }) : this._internal(
          (ref) => fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrder(
            ref as FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderRef,
            salesOrderId: salesOrderId,
            artworkId: artworkId,
          ),
          from: fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider,
          name: r'fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderHash,
          dependencies:
              FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderFamily
                  ._dependencies,
          allTransitiveDependencies:
              FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
          artworkId: artworkId,
        );

  FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.salesOrderId,
    required this.artworkId,
  }) : super.internal();

  final int salesOrderId;
  final int artworkId;

  @override
  Override overrideWith(
    FutureOr<List<Nutzenlayout>> Function(
            FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override:
          FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider._internal(
        (ref) => create(
            ref as FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        salesOrderId: salesOrderId,
        artworkId: artworkId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Nutzenlayout>> createElement() {
    return _FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProviderElement(
        this);
  }

  @override
  bool operator ==(Object other) {
    return other
            is FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider &&
        other.salesOrderId == salesOrderId &&
        other.artworkId == artworkId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, salesOrderId.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderRef
    on AutoDisposeFutureProviderRef<List<Nutzenlayout>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;

  /// The parameter `artworkId` of this provider.
  int get artworkId;
}

class _FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<Nutzenlayout>>
    with FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderRef {
  _FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProviderElement(
      super.provider);

  @override
  int get salesOrderId =>
      (origin as FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider)
          .salesOrderId;
  @override
  int get artworkId =>
      (origin as FetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider)
          .artworkId;
}

String _$watchSalesOrderSingleNutzenlayoutsLightHash() =>
    r'9bd11bfa29a5982308455ab65d50ec89802c38f0';

/// See also [watchSalesOrderSingleNutzenlayoutsLight].
@ProviderFor(watchSalesOrderSingleNutzenlayoutsLight)
const watchSalesOrderSingleNutzenlayoutsLightProvider =
    WatchSalesOrderSingleNutzenlayoutsLightFamily();

/// See also [watchSalesOrderSingleNutzenlayoutsLight].
class WatchSalesOrderSingleNutzenlayoutsLightFamily
    extends Family<AsyncValue<SalesOrderSingleNutzenlayoutLightDTO>> {
  /// See also [watchSalesOrderSingleNutzenlayoutsLight].
  const WatchSalesOrderSingleNutzenlayoutsLightFamily();

  /// See also [watchSalesOrderSingleNutzenlayoutsLight].
  WatchSalesOrderSingleNutzenlayoutsLightProvider call({
    required int salesOrderId,
  }) {
    return WatchSalesOrderSingleNutzenlayoutsLightProvider(
      salesOrderId: salesOrderId,
    );
  }

  @override
  WatchSalesOrderSingleNutzenlayoutsLightProvider getProviderOverride(
    covariant WatchSalesOrderSingleNutzenlayoutsLightProvider provider,
  ) {
    return call(
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
  String? get name => r'watchSalesOrderSingleNutzenlayoutsLightProvider';
}

/// See also [watchSalesOrderSingleNutzenlayoutsLight].
class WatchSalesOrderSingleNutzenlayoutsLightProvider
    extends AutoDisposeStreamProvider<SalesOrderSingleNutzenlayoutLightDTO> {
  /// See also [watchSalesOrderSingleNutzenlayoutsLight].
  WatchSalesOrderSingleNutzenlayoutsLightProvider({
    required int salesOrderId,
  }) : this._internal(
          (ref) => watchSalesOrderSingleNutzenlayoutsLight(
            ref as WatchSalesOrderSingleNutzenlayoutsLightRef,
            salesOrderId: salesOrderId,
          ),
          from: watchSalesOrderSingleNutzenlayoutsLightProvider,
          name: r'watchSalesOrderSingleNutzenlayoutsLightProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSalesOrderSingleNutzenlayoutsLightHash,
          dependencies:
              WatchSalesOrderSingleNutzenlayoutsLightFamily._dependencies,
          allTransitiveDependencies:
              WatchSalesOrderSingleNutzenlayoutsLightFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  WatchSalesOrderSingleNutzenlayoutsLightProvider._internal(
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
    Stream<SalesOrderSingleNutzenlayoutLightDTO> Function(
            WatchSalesOrderSingleNutzenlayoutsLightRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSalesOrderSingleNutzenlayoutsLightProvider._internal(
        (ref) => create(ref as WatchSalesOrderSingleNutzenlayoutsLightRef),
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
  AutoDisposeStreamProviderElement<SalesOrderSingleNutzenlayoutLightDTO>
      createElement() {
    return _WatchSalesOrderSingleNutzenlayoutsLightProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSalesOrderSingleNutzenlayoutsLightProvider &&
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
mixin WatchSalesOrderSingleNutzenlayoutsLightRef
    on AutoDisposeStreamProviderRef<SalesOrderSingleNutzenlayoutLightDTO> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchSalesOrderSingleNutzenlayoutsLightProviderElement
    extends AutoDisposeStreamProviderElement<
        SalesOrderSingleNutzenlayoutLightDTO>
    with WatchSalesOrderSingleNutzenlayoutsLightRef {
  _WatchSalesOrderSingleNutzenlayoutsLightProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchSalesOrderSingleNutzenlayoutsLightProvider).salesOrderId;
}

String _$watchSalesOrderMultiNutzenlayoutsLightHash() =>
    r'89766e0443d1b2db677da8ec4de63f3190d3df6c';

/// See also [watchSalesOrderMultiNutzenlayoutsLight].
@ProviderFor(watchSalesOrderMultiNutzenlayoutsLight)
const watchSalesOrderMultiNutzenlayoutsLightProvider =
    WatchSalesOrderMultiNutzenlayoutsLightFamily();

/// See also [watchSalesOrderMultiNutzenlayoutsLight].
class WatchSalesOrderMultiNutzenlayoutsLightFamily
    extends Family<AsyncValue<SalesOrderMultiNutzenlayoutLightDTO>> {
  /// See also [watchSalesOrderMultiNutzenlayoutsLight].
  const WatchSalesOrderMultiNutzenlayoutsLightFamily();

  /// See also [watchSalesOrderMultiNutzenlayoutsLight].
  WatchSalesOrderMultiNutzenlayoutsLightProvider call({
    required int salesOrderId,
  }) {
    return WatchSalesOrderMultiNutzenlayoutsLightProvider(
      salesOrderId: salesOrderId,
    );
  }

  @override
  WatchSalesOrderMultiNutzenlayoutsLightProvider getProviderOverride(
    covariant WatchSalesOrderMultiNutzenlayoutsLightProvider provider,
  ) {
    return call(
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
  String? get name => r'watchSalesOrderMultiNutzenlayoutsLightProvider';
}

/// See also [watchSalesOrderMultiNutzenlayoutsLight].
class WatchSalesOrderMultiNutzenlayoutsLightProvider
    extends AutoDisposeStreamProvider<SalesOrderMultiNutzenlayoutLightDTO> {
  /// See also [watchSalesOrderMultiNutzenlayoutsLight].
  WatchSalesOrderMultiNutzenlayoutsLightProvider({
    required int salesOrderId,
  }) : this._internal(
          (ref) => watchSalesOrderMultiNutzenlayoutsLight(
            ref as WatchSalesOrderMultiNutzenlayoutsLightRef,
            salesOrderId: salesOrderId,
          ),
          from: watchSalesOrderMultiNutzenlayoutsLightProvider,
          name: r'watchSalesOrderMultiNutzenlayoutsLightProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSalesOrderMultiNutzenlayoutsLightHash,
          dependencies:
              WatchSalesOrderMultiNutzenlayoutsLightFamily._dependencies,
          allTransitiveDependencies:
              WatchSalesOrderMultiNutzenlayoutsLightFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  WatchSalesOrderMultiNutzenlayoutsLightProvider._internal(
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
    Stream<SalesOrderMultiNutzenlayoutLightDTO> Function(
            WatchSalesOrderMultiNutzenlayoutsLightRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSalesOrderMultiNutzenlayoutsLightProvider._internal(
        (ref) => create(ref as WatchSalesOrderMultiNutzenlayoutsLightRef),
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
  AutoDisposeStreamProviderElement<SalesOrderMultiNutzenlayoutLightDTO>
      createElement() {
    return _WatchSalesOrderMultiNutzenlayoutsLightProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSalesOrderMultiNutzenlayoutsLightProvider &&
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
mixin WatchSalesOrderMultiNutzenlayoutsLightRef
    on AutoDisposeStreamProviderRef<SalesOrderMultiNutzenlayoutLightDTO> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchSalesOrderMultiNutzenlayoutsLightProviderElement
    extends AutoDisposeStreamProviderElement<
        SalesOrderMultiNutzenlayoutLightDTO>
    with WatchSalesOrderMultiNutzenlayoutsLightRef {
  _WatchSalesOrderMultiNutzenlayoutsLightProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchSalesOrderMultiNutzenlayoutsLightProvider).salesOrderId;
}

String _$fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderHash() =>
    r'da805c827d9866b6b6d44c2dc11b38873d69c62b';

/// See also [fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrder].
@ProviderFor(fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrder)
const fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider =
    FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderFamily();

/// See also [fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrder].
class FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderFamily
    extends Family<AsyncValue<List<Nutzenlayout>>> {
  /// See also [fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrder].
  const FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderFamily();

  /// See also [fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrder].
  FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider call({
    required int salesOrderId,
    required int artworkId,
  }) {
    return FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider(
      salesOrderId: salesOrderId,
      artworkId: artworkId,
    );
  }

  @override
  FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider
      getProviderOverride(
    covariant FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider
        provider,
  ) {
    return call(
      salesOrderId: provider.salesOrderId,
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
  String? get name =>
      r'fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider';
}

/// See also [fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrder].
class FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider
    extends AutoDisposeFutureProvider<List<Nutzenlayout>> {
  /// See also [fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrder].
  FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider({
    required int salesOrderId,
    required int artworkId,
  }) : this._internal(
          (ref) => fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrder(
            ref as FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderRef,
            salesOrderId: salesOrderId,
            artworkId: artworkId,
          ),
          from: fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider,
          name: r'fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderHash,
          dependencies: FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderFamily
              ._dependencies,
          allTransitiveDependencies:
              FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
          artworkId: artworkId,
        );

  FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.salesOrderId,
    required this.artworkId,
  }) : super.internal();

  final int salesOrderId;
  final int artworkId;

  @override
  Override overrideWith(
    FutureOr<List<Nutzenlayout>> Function(
            FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override:
          FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider._internal(
        (ref) => create(
            ref as FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        salesOrderId: salesOrderId,
        artworkId: artworkId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Nutzenlayout>> createElement() {
    return _FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProviderElement(
        this);
  }

  @override
  bool operator ==(Object other) {
    return other
            is FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider &&
        other.salesOrderId == salesOrderId &&
        other.artworkId == artworkId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, salesOrderId.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderRef
    on AutoDisposeFutureProviderRef<List<Nutzenlayout>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;

  /// The parameter `artworkId` of this provider.
  int get artworkId;
}

class _FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<Nutzenlayout>>
    with FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderRef {
  _FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProviderElement(
      super.provider);

  @override
  int get salesOrderId =>
      (origin as FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider)
          .salesOrderId;
  @override
  int get artworkId =>
      (origin as FetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider)
          .artworkId;
}

String _$fetchAndWatchArtworkNutzenlayoutsBySalesOrderHash() =>
    r'5dff837f976890f4508b68703dcff3ffc3f48b94';

/// *
/// * Combined
/// *
///
/// Copied from [fetchAndWatchArtworkNutzenlayoutsBySalesOrder].
@ProviderFor(fetchAndWatchArtworkNutzenlayoutsBySalesOrder)
const fetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider =
    FetchAndWatchArtworkNutzenlayoutsBySalesOrderFamily();

/// *
/// * Combined
/// *
///
/// Copied from [fetchAndWatchArtworkNutzenlayoutsBySalesOrder].
class FetchAndWatchArtworkNutzenlayoutsBySalesOrderFamily
    extends Family<AsyncValue<List<Nutzenlayout>>> {
  /// *
  /// * Combined
  /// *
  ///
  /// Copied from [fetchAndWatchArtworkNutzenlayoutsBySalesOrder].
  const FetchAndWatchArtworkNutzenlayoutsBySalesOrderFamily();

  /// *
  /// * Combined
  /// *
  ///
  /// Copied from [fetchAndWatchArtworkNutzenlayoutsBySalesOrder].
  FetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider call({
    required int salesOrderId,
    required int artworkId,
  }) {
    return FetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider(
      salesOrderId: salesOrderId,
      artworkId: artworkId,
    );
  }

  @override
  FetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider getProviderOverride(
    covariant FetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider provider,
  ) {
    return call(
      salesOrderId: provider.salesOrderId,
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
  String? get name => r'fetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider';
}

/// *
/// * Combined
/// *
///
/// Copied from [fetchAndWatchArtworkNutzenlayoutsBySalesOrder].
class FetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider
    extends AutoDisposeFutureProvider<List<Nutzenlayout>> {
  /// *
  /// * Combined
  /// *
  ///
  /// Copied from [fetchAndWatchArtworkNutzenlayoutsBySalesOrder].
  FetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider({
    required int salesOrderId,
    required int artworkId,
  }) : this._internal(
          (ref) => fetchAndWatchArtworkNutzenlayoutsBySalesOrder(
            ref as FetchAndWatchArtworkNutzenlayoutsBySalesOrderRef,
            salesOrderId: salesOrderId,
            artworkId: artworkId,
          ),
          from: fetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider,
          name: r'fetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchArtworkNutzenlayoutsBySalesOrderHash,
          dependencies:
              FetchAndWatchArtworkNutzenlayoutsBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              FetchAndWatchArtworkNutzenlayoutsBySalesOrderFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
          artworkId: artworkId,
        );

  FetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.salesOrderId,
    required this.artworkId,
  }) : super.internal();

  final int salesOrderId;
  final int artworkId;

  @override
  Override overrideWith(
    FutureOr<List<Nutzenlayout>> Function(
            FetchAndWatchArtworkNutzenlayoutsBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider._internal(
        (ref) =>
            create(ref as FetchAndWatchArtworkNutzenlayoutsBySalesOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        salesOrderId: salesOrderId,
        artworkId: artworkId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Nutzenlayout>> createElement() {
    return _FetchAndWatchArtworkNutzenlayoutsBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider &&
        other.salesOrderId == salesOrderId &&
        other.artworkId == artworkId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, salesOrderId.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchAndWatchArtworkNutzenlayoutsBySalesOrderRef
    on AutoDisposeFutureProviderRef<List<Nutzenlayout>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;

  /// The parameter `artworkId` of this provider.
  int get artworkId;
}

class _FetchAndWatchArtworkNutzenlayoutsBySalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<Nutzenlayout>>
    with FetchAndWatchArtworkNutzenlayoutsBySalesOrderRef {
  _FetchAndWatchArtworkNutzenlayoutsBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as FetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider)
          .salesOrderId;
  @override
  int get artworkId =>
      (origin as FetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider)
          .artworkId;
}

String _$fetchAndWatchSalesOrderSingleNutzenlayoutsHash() =>
    r'28d9334999caf635649426e837dc3179d769dcf1';

abstract class _$FetchAndWatchSalesOrderSingleNutzenlayouts
    extends BuildlessAutoDisposeAsyncNotifier<
        List<SalesOrderSingleNutzenlayoutLight>> {
  late final int salesOrderId;

  FutureOr<List<SalesOrderSingleNutzenlayoutLight>> build({
    required int salesOrderId,
  });
}

/// See also [FetchAndWatchSalesOrderSingleNutzenlayouts].
@ProviderFor(FetchAndWatchSalesOrderSingleNutzenlayouts)
const fetchAndWatchSalesOrderSingleNutzenlayoutsProvider =
    FetchAndWatchSalesOrderSingleNutzenlayoutsFamily();

/// See also [FetchAndWatchSalesOrderSingleNutzenlayouts].
class FetchAndWatchSalesOrderSingleNutzenlayoutsFamily
    extends Family<AsyncValue<List<SalesOrderSingleNutzenlayoutLight>>> {
  /// See also [FetchAndWatchSalesOrderSingleNutzenlayouts].
  const FetchAndWatchSalesOrderSingleNutzenlayoutsFamily();

  /// See also [FetchAndWatchSalesOrderSingleNutzenlayouts].
  FetchAndWatchSalesOrderSingleNutzenlayoutsProvider call({
    required int salesOrderId,
  }) {
    return FetchAndWatchSalesOrderSingleNutzenlayoutsProvider(
      salesOrderId: salesOrderId,
    );
  }

  @override
  FetchAndWatchSalesOrderSingleNutzenlayoutsProvider getProviderOverride(
    covariant FetchAndWatchSalesOrderSingleNutzenlayoutsProvider provider,
  ) {
    return call(
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
  String? get name => r'fetchAndWatchSalesOrderSingleNutzenlayoutsProvider';
}

/// See also [FetchAndWatchSalesOrderSingleNutzenlayouts].
class FetchAndWatchSalesOrderSingleNutzenlayoutsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        FetchAndWatchSalesOrderSingleNutzenlayouts,
        List<SalesOrderSingleNutzenlayoutLight>> {
  /// See also [FetchAndWatchSalesOrderSingleNutzenlayouts].
  FetchAndWatchSalesOrderSingleNutzenlayoutsProvider({
    required int salesOrderId,
  }) : this._internal(
          () => FetchAndWatchSalesOrderSingleNutzenlayouts()
            ..salesOrderId = salesOrderId,
          from: fetchAndWatchSalesOrderSingleNutzenlayoutsProvider,
          name: r'fetchAndWatchSalesOrderSingleNutzenlayoutsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchSalesOrderSingleNutzenlayoutsHash,
          dependencies:
              FetchAndWatchSalesOrderSingleNutzenlayoutsFamily._dependencies,
          allTransitiveDependencies:
              FetchAndWatchSalesOrderSingleNutzenlayoutsFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  FetchAndWatchSalesOrderSingleNutzenlayoutsProvider._internal(
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
  FutureOr<List<SalesOrderSingleNutzenlayoutLight>> runNotifierBuild(
    covariant FetchAndWatchSalesOrderSingleNutzenlayouts notifier,
  ) {
    return notifier.build(
      salesOrderId: salesOrderId,
    );
  }

  @override
  Override overrideWith(
      FetchAndWatchSalesOrderSingleNutzenlayouts Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchAndWatchSalesOrderSingleNutzenlayoutsProvider._internal(
        () => create()..salesOrderId = salesOrderId,
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
  AutoDisposeAsyncNotifierProviderElement<
      FetchAndWatchSalesOrderSingleNutzenlayouts,
      List<SalesOrderSingleNutzenlayoutLight>> createElement() {
    return _FetchAndWatchSalesOrderSingleNutzenlayoutsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAndWatchSalesOrderSingleNutzenlayoutsProvider &&
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
mixin FetchAndWatchSalesOrderSingleNutzenlayoutsRef
    on AutoDisposeAsyncNotifierProviderRef<
        List<SalesOrderSingleNutzenlayoutLight>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _FetchAndWatchSalesOrderSingleNutzenlayoutsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        FetchAndWatchSalesOrderSingleNutzenlayouts,
        List<SalesOrderSingleNutzenlayoutLight>>
    with FetchAndWatchSalesOrderSingleNutzenlayoutsRef {
  _FetchAndWatchSalesOrderSingleNutzenlayoutsProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as FetchAndWatchSalesOrderSingleNutzenlayoutsProvider)
          .salesOrderId;
}

String _$fetchAndWatchSalesOrderMultiNutzenlayoutsHash() =>
    r'0a389d30df263ea12ee3d9c8db9e691f9e56006a';

abstract class _$FetchAndWatchSalesOrderMultiNutzenlayouts
    extends BuildlessAutoDisposeAsyncNotifier<
        List<SalesOrderMultiNutzenlayoutLight>> {
  late final int salesOrderId;

  FutureOr<List<SalesOrderMultiNutzenlayoutLight>> build({
    required int salesOrderId,
  });
}

/// *
/// * Multi Nutzenlayouts
/// *
///
/// Copied from [FetchAndWatchSalesOrderMultiNutzenlayouts].
@ProviderFor(FetchAndWatchSalesOrderMultiNutzenlayouts)
const fetchAndWatchSalesOrderMultiNutzenlayoutsProvider =
    FetchAndWatchSalesOrderMultiNutzenlayoutsFamily();

/// *
/// * Multi Nutzenlayouts
/// *
///
/// Copied from [FetchAndWatchSalesOrderMultiNutzenlayouts].
class FetchAndWatchSalesOrderMultiNutzenlayoutsFamily
    extends Family<AsyncValue<List<SalesOrderMultiNutzenlayoutLight>>> {
  /// *
  /// * Multi Nutzenlayouts
  /// *
  ///
  /// Copied from [FetchAndWatchSalesOrderMultiNutzenlayouts].
  const FetchAndWatchSalesOrderMultiNutzenlayoutsFamily();

  /// *
  /// * Multi Nutzenlayouts
  /// *
  ///
  /// Copied from [FetchAndWatchSalesOrderMultiNutzenlayouts].
  FetchAndWatchSalesOrderMultiNutzenlayoutsProvider call({
    required int salesOrderId,
  }) {
    return FetchAndWatchSalesOrderMultiNutzenlayoutsProvider(
      salesOrderId: salesOrderId,
    );
  }

  @override
  FetchAndWatchSalesOrderMultiNutzenlayoutsProvider getProviderOverride(
    covariant FetchAndWatchSalesOrderMultiNutzenlayoutsProvider provider,
  ) {
    return call(
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
  String? get name => r'fetchAndWatchSalesOrderMultiNutzenlayoutsProvider';
}

/// *
/// * Multi Nutzenlayouts
/// *
///
/// Copied from [FetchAndWatchSalesOrderMultiNutzenlayouts].
class FetchAndWatchSalesOrderMultiNutzenlayoutsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        FetchAndWatchSalesOrderMultiNutzenlayouts,
        List<SalesOrderMultiNutzenlayoutLight>> {
  /// *
  /// * Multi Nutzenlayouts
  /// *
  ///
  /// Copied from [FetchAndWatchSalesOrderMultiNutzenlayouts].
  FetchAndWatchSalesOrderMultiNutzenlayoutsProvider({
    required int salesOrderId,
  }) : this._internal(
          () => FetchAndWatchSalesOrderMultiNutzenlayouts()
            ..salesOrderId = salesOrderId,
          from: fetchAndWatchSalesOrderMultiNutzenlayoutsProvider,
          name: r'fetchAndWatchSalesOrderMultiNutzenlayoutsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchSalesOrderMultiNutzenlayoutsHash,
          dependencies:
              FetchAndWatchSalesOrderMultiNutzenlayoutsFamily._dependencies,
          allTransitiveDependencies:
              FetchAndWatchSalesOrderMultiNutzenlayoutsFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  FetchAndWatchSalesOrderMultiNutzenlayoutsProvider._internal(
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
  FutureOr<List<SalesOrderMultiNutzenlayoutLight>> runNotifierBuild(
    covariant FetchAndWatchSalesOrderMultiNutzenlayouts notifier,
  ) {
    return notifier.build(
      salesOrderId: salesOrderId,
    );
  }

  @override
  Override overrideWith(
      FetchAndWatchSalesOrderMultiNutzenlayouts Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchAndWatchSalesOrderMultiNutzenlayoutsProvider._internal(
        () => create()..salesOrderId = salesOrderId,
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
  AutoDisposeAsyncNotifierProviderElement<
      FetchAndWatchSalesOrderMultiNutzenlayouts,
      List<SalesOrderMultiNutzenlayoutLight>> createElement() {
    return _FetchAndWatchSalesOrderMultiNutzenlayoutsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAndWatchSalesOrderMultiNutzenlayoutsProvider &&
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
mixin FetchAndWatchSalesOrderMultiNutzenlayoutsRef
    on AutoDisposeAsyncNotifierProviderRef<
        List<SalesOrderMultiNutzenlayoutLight>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _FetchAndWatchSalesOrderMultiNutzenlayoutsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        FetchAndWatchSalesOrderMultiNutzenlayouts,
        List<SalesOrderMultiNutzenlayoutLight>>
    with FetchAndWatchSalesOrderMultiNutzenlayoutsRef {
  _FetchAndWatchSalesOrderMultiNutzenlayoutsProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as FetchAndWatchSalesOrderMultiNutzenlayoutsProvider)
          .salesOrderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
