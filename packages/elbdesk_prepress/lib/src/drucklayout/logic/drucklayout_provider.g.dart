// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drucklayout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$drucklayoutRepositoryHash() =>
    r'46f3dd90fc0c961d2a0bfe1b3f3476dd8931d181';

/// See also [drucklayoutRepository].
@ProviderFor(drucklayoutRepository)
final drucklayoutRepositoryProvider =
    AutoDisposeProvider<DrucklayoutRepository>.internal(
  drucklayoutRepository,
  name: r'drucklayoutRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$drucklayoutRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DrucklayoutRepositoryRef
    = AutoDisposeProviderRef<DrucklayoutRepository>;
String _$findDrucklayoutsHash() => r'4661d2164d3d04c36c38830a241d9c7b8f246b3f';

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

/// Find Drucklayouts Provider
///
/// Copied from [findDrucklayouts].
@ProviderFor(findDrucklayouts)
const findDrucklayoutsProvider = FindDrucklayoutsFamily();

/// Find Drucklayouts Provider
///
/// Copied from [findDrucklayouts].
class FindDrucklayoutsFamily extends Family<AsyncValue<List<Drucklayout>>> {
  /// Find Drucklayouts Provider
  ///
  /// Copied from [findDrucklayouts].
  const FindDrucklayoutsFamily();

  /// Find Drucklayouts Provider
  ///
  /// Copied from [findDrucklayouts].
  FindDrucklayoutsProvider call(
    String sessionId,
  ) {
    return FindDrucklayoutsProvider(
      sessionId,
    );
  }

  @override
  FindDrucklayoutsProvider getProviderOverride(
    covariant FindDrucklayoutsProvider provider,
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
  String? get name => r'findDrucklayoutsProvider';
}

/// Find Drucklayouts Provider
///
/// Copied from [findDrucklayouts].
class FindDrucklayoutsProvider
    extends AutoDisposeFutureProvider<List<Drucklayout>> {
  /// Find Drucklayouts Provider
  ///
  /// Copied from [findDrucklayouts].
  FindDrucklayoutsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findDrucklayouts(
            ref as FindDrucklayoutsRef,
            sessionId,
          ),
          from: findDrucklayoutsProvider,
          name: r'findDrucklayoutsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findDrucklayoutsHash,
          dependencies: FindDrucklayoutsFamily._dependencies,
          allTransitiveDependencies:
              FindDrucklayoutsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindDrucklayoutsProvider._internal(
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
    FutureOr<List<Drucklayout>> Function(FindDrucklayoutsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindDrucklayoutsProvider._internal(
        (ref) => create(ref as FindDrucklayoutsRef),
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
  AutoDisposeFutureProviderElement<List<Drucklayout>> createElement() {
    return _FindDrucklayoutsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindDrucklayoutsProvider && other.sessionId == sessionId;
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
mixin FindDrucklayoutsRef on AutoDisposeFutureProviderRef<List<Drucklayout>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindDrucklayoutsProviderElement
    extends AutoDisposeFutureProviderElement<List<Drucklayout>>
    with FindDrucklayoutsRef {
  _FindDrucklayoutsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindDrucklayoutsProvider).sessionId;
}

String _$fetchDrucklayoutsHash() => r'b1a1a0610a4d67b599f2f979a5f84637b2874197';

/// Fetch all Drucklayouts Provider
///
/// Copied from [fetchDrucklayouts].
@ProviderFor(fetchDrucklayouts)
final fetchDrucklayoutsProvider =
    AutoDisposeFutureProvider<List<Drucklayout>>.internal(
  fetchDrucklayouts,
  name: r'fetchDrucklayoutsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchDrucklayoutsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchDrucklayoutsRef = AutoDisposeFutureProviderRef<List<Drucklayout>>;
String _$fetchDrucklayoutHash() => r'ce27df5f5490790744867e296d6815078f60e62e';

/// Fetch Drucklayout by ID Provider
///
/// Copied from [fetchDrucklayout].
@ProviderFor(fetchDrucklayout)
const fetchDrucklayoutProvider = FetchDrucklayoutFamily();

/// Fetch Drucklayout by ID Provider
///
/// Copied from [fetchDrucklayout].
class FetchDrucklayoutFamily extends Family<AsyncValue<Drucklayout?>> {
  /// Fetch Drucklayout by ID Provider
  ///
  /// Copied from [fetchDrucklayout].
  const FetchDrucklayoutFamily();

  /// Fetch Drucklayout by ID Provider
  ///
  /// Copied from [fetchDrucklayout].
  FetchDrucklayoutProvider call(
    int id,
  ) {
    return FetchDrucklayoutProvider(
      id,
    );
  }

  @override
  FetchDrucklayoutProvider getProviderOverride(
    covariant FetchDrucklayoutProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'fetchDrucklayoutProvider';
}

/// Fetch Drucklayout by ID Provider
///
/// Copied from [fetchDrucklayout].
class FetchDrucklayoutProvider extends AutoDisposeFutureProvider<Drucklayout?> {
  /// Fetch Drucklayout by ID Provider
  ///
  /// Copied from [fetchDrucklayout].
  FetchDrucklayoutProvider(
    int id,
  ) : this._internal(
          (ref) => fetchDrucklayout(
            ref as FetchDrucklayoutRef,
            id,
          ),
          from: fetchDrucklayoutProvider,
          name: r'fetchDrucklayoutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchDrucklayoutHash,
          dependencies: FetchDrucklayoutFamily._dependencies,
          allTransitiveDependencies:
              FetchDrucklayoutFamily._allTransitiveDependencies,
          id: id,
        );

  FetchDrucklayoutProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Drucklayout?> Function(FetchDrucklayoutRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchDrucklayoutProvider._internal(
        (ref) => create(ref as FetchDrucklayoutRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Drucklayout?> createElement() {
    return _FetchDrucklayoutProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchDrucklayoutProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchDrucklayoutRef on AutoDisposeFutureProviderRef<Drucklayout?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchDrucklayoutProviderElement
    extends AutoDisposeFutureProviderElement<Drucklayout?>
    with FetchDrucklayoutRef {
  _FetchDrucklayoutProviderElement(super.provider);

  @override
  int get id => (origin as FetchDrucklayoutProvider).id;
}

String _$watchDrucklayoutHash() => r'dbf164045241e9e0f54a4a28387656003fe89a84';

/// Watch Drucklayout by ID Provider
///
/// Copied from [watchDrucklayout].
@ProviderFor(watchDrucklayout)
const watchDrucklayoutProvider = WatchDrucklayoutFamily();

/// Watch Drucklayout by ID Provider
///
/// Copied from [watchDrucklayout].
class WatchDrucklayoutFamily extends Family<AsyncValue<Drucklayout>> {
  /// Watch Drucklayout by ID Provider
  ///
  /// Copied from [watchDrucklayout].
  const WatchDrucklayoutFamily();

  /// Watch Drucklayout by ID Provider
  ///
  /// Copied from [watchDrucklayout].
  WatchDrucklayoutProvider call({
    required int entityId,
    required String sessionId,
  }) {
    return WatchDrucklayoutProvider(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  WatchDrucklayoutProvider getProviderOverride(
    covariant WatchDrucklayoutProvider provider,
  ) {
    return call(
      entityId: provider.entityId,
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
  String? get name => r'watchDrucklayoutProvider';
}

/// Watch Drucklayout by ID Provider
///
/// Copied from [watchDrucklayout].
class WatchDrucklayoutProvider extends AutoDisposeStreamProvider<Drucklayout> {
  /// Watch Drucklayout by ID Provider
  ///
  /// Copied from [watchDrucklayout].
  WatchDrucklayoutProvider({
    required int entityId,
    required String sessionId,
  }) : this._internal(
          (ref) => watchDrucklayout(
            ref as WatchDrucklayoutRef,
            entityId: entityId,
            sessionId: sessionId,
          ),
          from: watchDrucklayoutProvider,
          name: r'watchDrucklayoutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDrucklayoutHash,
          dependencies: WatchDrucklayoutFamily._dependencies,
          allTransitiveDependencies:
              WatchDrucklayoutFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  WatchDrucklayoutProvider._internal(
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
  Override overrideWith(
    Stream<Drucklayout> Function(WatchDrucklayoutRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchDrucklayoutProvider._internal(
        (ref) => create(ref as WatchDrucklayoutRef),
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
  AutoDisposeStreamProviderElement<Drucklayout> createElement() {
    return _WatchDrucklayoutProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDrucklayoutProvider &&
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
mixin WatchDrucklayoutRef on AutoDisposeStreamProviderRef<Drucklayout> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _WatchDrucklayoutProviderElement
    extends AutoDisposeStreamProviderElement<Drucklayout>
    with WatchDrucklayoutRef {
  _WatchDrucklayoutProviderElement(super.provider);

  @override
  int get entityId => (origin as WatchDrucklayoutProvider).entityId;
  @override
  String get sessionId => (origin as WatchDrucklayoutProvider).sessionId;
}

String _$fetchDrucklayoutsBySalesOrderHash() =>
    r'aeeed3bc65e2cb4733f60a1ee4085b231103c7d5';

/// Fetch Drucklayouts by Sales Order Provider
///
/// Copied from [fetchDrucklayoutsBySalesOrder].
@ProviderFor(fetchDrucklayoutsBySalesOrder)
const fetchDrucklayoutsBySalesOrderProvider =
    FetchDrucklayoutsBySalesOrderFamily();

/// Fetch Drucklayouts by Sales Order Provider
///
/// Copied from [fetchDrucklayoutsBySalesOrder].
class FetchDrucklayoutsBySalesOrderFamily
    extends Family<AsyncValue<List<Drucklayout>>> {
  /// Fetch Drucklayouts by Sales Order Provider
  ///
  /// Copied from [fetchDrucklayoutsBySalesOrder].
  const FetchDrucklayoutsBySalesOrderFamily();

  /// Fetch Drucklayouts by Sales Order Provider
  ///
  /// Copied from [fetchDrucklayoutsBySalesOrder].
  FetchDrucklayoutsBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return FetchDrucklayoutsBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  FetchDrucklayoutsBySalesOrderProvider getProviderOverride(
    covariant FetchDrucklayoutsBySalesOrderProvider provider,
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
  String? get name => r'fetchDrucklayoutsBySalesOrderProvider';
}

/// Fetch Drucklayouts by Sales Order Provider
///
/// Copied from [fetchDrucklayoutsBySalesOrder].
class FetchDrucklayoutsBySalesOrderProvider
    extends AutoDisposeFutureProvider<List<Drucklayout>> {
  /// Fetch Drucklayouts by Sales Order Provider
  ///
  /// Copied from [fetchDrucklayoutsBySalesOrder].
  FetchDrucklayoutsBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => fetchDrucklayoutsBySalesOrder(
            ref as FetchDrucklayoutsBySalesOrderRef,
            salesOrderId,
          ),
          from: fetchDrucklayoutsBySalesOrderProvider,
          name: r'fetchDrucklayoutsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchDrucklayoutsBySalesOrderHash,
          dependencies: FetchDrucklayoutsBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              FetchDrucklayoutsBySalesOrderFamily._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  FetchDrucklayoutsBySalesOrderProvider._internal(
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
    FutureOr<List<Drucklayout>> Function(
            FetchDrucklayoutsBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchDrucklayoutsBySalesOrderProvider._internal(
        (ref) => create(ref as FetchDrucklayoutsBySalesOrderRef),
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
  AutoDisposeFutureProviderElement<List<Drucklayout>> createElement() {
    return _FetchDrucklayoutsBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchDrucklayoutsBySalesOrderProvider &&
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
mixin FetchDrucklayoutsBySalesOrderRef
    on AutoDisposeFutureProviderRef<List<Drucklayout>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _FetchDrucklayoutsBySalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<Drucklayout>>
    with FetchDrucklayoutsBySalesOrderRef {
  _FetchDrucklayoutsBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as FetchDrucklayoutsBySalesOrderProvider).salesOrderId;
}

String _$findDrucklayoutsByCustomerHash() =>
    r'436460e871f75f4059bb581bb4edcce3f1f9edfe';

/// Find Drucklayouts by Customer Provider
///
/// Copied from [findDrucklayoutsByCustomer].
@ProviderFor(findDrucklayoutsByCustomer)
const findDrucklayoutsByCustomerProvider = FindDrucklayoutsByCustomerFamily();

/// Find Drucklayouts by Customer Provider
///
/// Copied from [findDrucklayoutsByCustomer].
class FindDrucklayoutsByCustomerFamily
    extends Family<AsyncValue<List<Drucklayout>>> {
  /// Find Drucklayouts by Customer Provider
  ///
  /// Copied from [findDrucklayoutsByCustomer].
  const FindDrucklayoutsByCustomerFamily();

  /// Find Drucklayouts by Customer Provider
  ///
  /// Copied from [findDrucklayoutsByCustomer].
  FindDrucklayoutsByCustomerProvider call(
    int customerId,
    String sessionId,
  ) {
    return FindDrucklayoutsByCustomerProvider(
      customerId,
      sessionId,
    );
  }

  @override
  FindDrucklayoutsByCustomerProvider getProviderOverride(
    covariant FindDrucklayoutsByCustomerProvider provider,
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
  String? get name => r'findDrucklayoutsByCustomerProvider';
}

/// Find Drucklayouts by Customer Provider
///
/// Copied from [findDrucklayoutsByCustomer].
class FindDrucklayoutsByCustomerProvider
    extends AutoDisposeFutureProvider<List<Drucklayout>> {
  /// Find Drucklayouts by Customer Provider
  ///
  /// Copied from [findDrucklayoutsByCustomer].
  FindDrucklayoutsByCustomerProvider(
    int customerId,
    String sessionId,
  ) : this._internal(
          (ref) => findDrucklayoutsByCustomer(
            ref as FindDrucklayoutsByCustomerRef,
            customerId,
            sessionId,
          ),
          from: findDrucklayoutsByCustomerProvider,
          name: r'findDrucklayoutsByCustomerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findDrucklayoutsByCustomerHash,
          dependencies: FindDrucklayoutsByCustomerFamily._dependencies,
          allTransitiveDependencies:
              FindDrucklayoutsByCustomerFamily._allTransitiveDependencies,
          customerId: customerId,
          sessionId: sessionId,
        );

  FindDrucklayoutsByCustomerProvider._internal(
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
    FutureOr<List<Drucklayout>> Function(FindDrucklayoutsByCustomerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindDrucklayoutsByCustomerProvider._internal(
        (ref) => create(ref as FindDrucklayoutsByCustomerRef),
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
  AutoDisposeFutureProviderElement<List<Drucklayout>> createElement() {
    return _FindDrucklayoutsByCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindDrucklayoutsByCustomerProvider &&
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
mixin FindDrucklayoutsByCustomerRef
    on AutoDisposeFutureProviderRef<List<Drucklayout>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindDrucklayoutsByCustomerProviderElement
    extends AutoDisposeFutureProviderElement<List<Drucklayout>>
    with FindDrucklayoutsByCustomerRef {
  _FindDrucklayoutsByCustomerProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as FindDrucklayoutsByCustomerProvider).customerId;
  @override
  String get sessionId =>
      (origin as FindDrucklayoutsByCustomerProvider).sessionId;
}

String _$watchDrucklayoutsBySalesOrderStreamHash() =>
    r'e3df4eb99a78937a15899a953d69caac4787bf44';

/// Watch Drucklayout Updates by Sales Order ID Provider
///
/// Copied from [watchDrucklayoutsBySalesOrderStream].
@ProviderFor(watchDrucklayoutsBySalesOrderStream)
const watchDrucklayoutsBySalesOrderStreamProvider =
    WatchDrucklayoutsBySalesOrderStreamFamily();

/// Watch Drucklayout Updates by Sales Order ID Provider
///
/// Copied from [watchDrucklayoutsBySalesOrderStream].
class WatchDrucklayoutsBySalesOrderStreamFamily
    extends Family<AsyncValue<Drucklayout>> {
  /// Watch Drucklayout Updates by Sales Order ID Provider
  ///
  /// Copied from [watchDrucklayoutsBySalesOrderStream].
  const WatchDrucklayoutsBySalesOrderStreamFamily();

  /// Watch Drucklayout Updates by Sales Order ID Provider
  ///
  /// Copied from [watchDrucklayoutsBySalesOrderStream].
  WatchDrucklayoutsBySalesOrderStreamProvider call(
    int salesOrderId,
  ) {
    return WatchDrucklayoutsBySalesOrderStreamProvider(
      salesOrderId,
    );
  }

  @override
  WatchDrucklayoutsBySalesOrderStreamProvider getProviderOverride(
    covariant WatchDrucklayoutsBySalesOrderStreamProvider provider,
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
  String? get name => r'watchDrucklayoutsBySalesOrderStreamProvider';
}

/// Watch Drucklayout Updates by Sales Order ID Provider
///
/// Copied from [watchDrucklayoutsBySalesOrderStream].
class WatchDrucklayoutsBySalesOrderStreamProvider
    extends AutoDisposeStreamProvider<Drucklayout> {
  /// Watch Drucklayout Updates by Sales Order ID Provider
  ///
  /// Copied from [watchDrucklayoutsBySalesOrderStream].
  WatchDrucklayoutsBySalesOrderStreamProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => watchDrucklayoutsBySalesOrderStream(
            ref as WatchDrucklayoutsBySalesOrderStreamRef,
            salesOrderId,
          ),
          from: watchDrucklayoutsBySalesOrderStreamProvider,
          name: r'watchDrucklayoutsBySalesOrderStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDrucklayoutsBySalesOrderStreamHash,
          dependencies: WatchDrucklayoutsBySalesOrderStreamFamily._dependencies,
          allTransitiveDependencies: WatchDrucklayoutsBySalesOrderStreamFamily
              ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  WatchDrucklayoutsBySalesOrderStreamProvider._internal(
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
    Stream<Drucklayout> Function(
            WatchDrucklayoutsBySalesOrderStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchDrucklayoutsBySalesOrderStreamProvider._internal(
        (ref) => create(ref as WatchDrucklayoutsBySalesOrderStreamRef),
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
  AutoDisposeStreamProviderElement<Drucklayout> createElement() {
    return _WatchDrucklayoutsBySalesOrderStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDrucklayoutsBySalesOrderStreamProvider &&
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
mixin WatchDrucklayoutsBySalesOrderStreamRef
    on AutoDisposeStreamProviderRef<Drucklayout> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchDrucklayoutsBySalesOrderStreamProviderElement
    extends AutoDisposeStreamProviderElement<Drucklayout>
    with WatchDrucklayoutsBySalesOrderStreamRef {
  _WatchDrucklayoutsBySalesOrderStreamProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchDrucklayoutsBySalesOrderStreamProvider).salesOrderId;
}

String _$watchDrucklayoutsByCustomerStreamHash() =>
    r'68e4ca35caaa4300650ff9fa7bc82ab1d86b635e';

/// Watch Drucklayout Updates by Customer ID Provider
///
/// Copied from [watchDrucklayoutsByCustomerStream].
@ProviderFor(watchDrucklayoutsByCustomerStream)
const watchDrucklayoutsByCustomerStreamProvider =
    WatchDrucklayoutsByCustomerStreamFamily();

/// Watch Drucklayout Updates by Customer ID Provider
///
/// Copied from [watchDrucklayoutsByCustomerStream].
class WatchDrucklayoutsByCustomerStreamFamily
    extends Family<AsyncValue<Drucklayout>> {
  /// Watch Drucklayout Updates by Customer ID Provider
  ///
  /// Copied from [watchDrucklayoutsByCustomerStream].
  const WatchDrucklayoutsByCustomerStreamFamily();

  /// Watch Drucklayout Updates by Customer ID Provider
  ///
  /// Copied from [watchDrucklayoutsByCustomerStream].
  WatchDrucklayoutsByCustomerStreamProvider call(
    int customerId,
    String sessionId,
  ) {
    return WatchDrucklayoutsByCustomerStreamProvider(
      customerId,
      sessionId,
    );
  }

  @override
  WatchDrucklayoutsByCustomerStreamProvider getProviderOverride(
    covariant WatchDrucklayoutsByCustomerStreamProvider provider,
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
  String? get name => r'watchDrucklayoutsByCustomerStreamProvider';
}

/// Watch Drucklayout Updates by Customer ID Provider
///
/// Copied from [watchDrucklayoutsByCustomerStream].
class WatchDrucklayoutsByCustomerStreamProvider
    extends AutoDisposeStreamProvider<Drucklayout> {
  /// Watch Drucklayout Updates by Customer ID Provider
  ///
  /// Copied from [watchDrucklayoutsByCustomerStream].
  WatchDrucklayoutsByCustomerStreamProvider(
    int customerId,
    String sessionId,
  ) : this._internal(
          (ref) => watchDrucklayoutsByCustomerStream(
            ref as WatchDrucklayoutsByCustomerStreamRef,
            customerId,
            sessionId,
          ),
          from: watchDrucklayoutsByCustomerStreamProvider,
          name: r'watchDrucklayoutsByCustomerStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDrucklayoutsByCustomerStreamHash,
          dependencies: WatchDrucklayoutsByCustomerStreamFamily._dependencies,
          allTransitiveDependencies: WatchDrucklayoutsByCustomerStreamFamily
              ._allTransitiveDependencies,
          customerId: customerId,
          sessionId: sessionId,
        );

  WatchDrucklayoutsByCustomerStreamProvider._internal(
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
    Stream<Drucklayout> Function(WatchDrucklayoutsByCustomerStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchDrucklayoutsByCustomerStreamProvider._internal(
        (ref) => create(ref as WatchDrucklayoutsByCustomerStreamRef),
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
  AutoDisposeStreamProviderElement<Drucklayout> createElement() {
    return _WatchDrucklayoutsByCustomerStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDrucklayoutsByCustomerStreamProvider &&
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
mixin WatchDrucklayoutsByCustomerStreamRef
    on AutoDisposeStreamProviderRef<Drucklayout> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _WatchDrucklayoutsByCustomerStreamProviderElement
    extends AutoDisposeStreamProviderElement<Drucklayout>
    with WatchDrucklayoutsByCustomerStreamRef {
  _WatchDrucklayoutsByCustomerStreamProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as WatchDrucklayoutsByCustomerStreamProvider).customerId;
  @override
  String get sessionId =>
      (origin as WatchDrucklayoutsByCustomerStreamProvider).sessionId;
}

String _$fetchAssignedNutzenlayoutsForDrucklayoutHash() =>
    r'060edf2e7b765f1a84c20fa5cad671e8c41209e2';

/// Provider for fetching assigned Nutzenlayouts for a Drucklayout in a
/// Sales Order
///
/// Copied from [fetchAssignedNutzenlayoutsForDrucklayout].
@ProviderFor(fetchAssignedNutzenlayoutsForDrucklayout)
const fetchAssignedNutzenlayoutsForDrucklayoutProvider =
    FetchAssignedNutzenlayoutsForDrucklayoutFamily();

/// Provider for fetching assigned Nutzenlayouts for a Drucklayout in a
/// Sales Order
///
/// Copied from [fetchAssignedNutzenlayoutsForDrucklayout].
class FetchAssignedNutzenlayoutsForDrucklayoutFamily extends Family<
    AsyncValue<
        ({
          List<SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts,
          List<SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts
        })>> {
  /// Provider for fetching assigned Nutzenlayouts for a Drucklayout in a
  /// Sales Order
  ///
  /// Copied from [fetchAssignedNutzenlayoutsForDrucklayout].
  const FetchAssignedNutzenlayoutsForDrucklayoutFamily();

  /// Provider for fetching assigned Nutzenlayouts for a Drucklayout in a
  /// Sales Order
  ///
  /// Copied from [fetchAssignedNutzenlayoutsForDrucklayout].
  FetchAssignedNutzenlayoutsForDrucklayoutProvider call({
    required int drucklayoutId,
    required int salesOrderId,
  }) {
    return FetchAssignedNutzenlayoutsForDrucklayoutProvider(
      drucklayoutId: drucklayoutId,
      salesOrderId: salesOrderId,
    );
  }

  @override
  FetchAssignedNutzenlayoutsForDrucklayoutProvider getProviderOverride(
    covariant FetchAssignedNutzenlayoutsForDrucklayoutProvider provider,
  ) {
    return call(
      drucklayoutId: provider.drucklayoutId,
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
  String? get name => r'fetchAssignedNutzenlayoutsForDrucklayoutProvider';
}

/// Provider for fetching assigned Nutzenlayouts for a Drucklayout in a
/// Sales Order
///
/// Copied from [fetchAssignedNutzenlayoutsForDrucklayout].
class FetchAssignedNutzenlayoutsForDrucklayoutProvider
    extends AutoDisposeFutureProvider<
        ({
          List<SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts,
          List<SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts
        })> {
  /// Provider for fetching assigned Nutzenlayouts for a Drucklayout in a
  /// Sales Order
  ///
  /// Copied from [fetchAssignedNutzenlayoutsForDrucklayout].
  FetchAssignedNutzenlayoutsForDrucklayoutProvider({
    required int drucklayoutId,
    required int salesOrderId,
  }) : this._internal(
          (ref) => fetchAssignedNutzenlayoutsForDrucklayout(
            ref as FetchAssignedNutzenlayoutsForDrucklayoutRef,
            drucklayoutId: drucklayoutId,
            salesOrderId: salesOrderId,
          ),
          from: fetchAssignedNutzenlayoutsForDrucklayoutProvider,
          name: r'fetchAssignedNutzenlayoutsForDrucklayoutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAssignedNutzenlayoutsForDrucklayoutHash,
          dependencies:
              FetchAssignedNutzenlayoutsForDrucklayoutFamily._dependencies,
          allTransitiveDependencies:
              FetchAssignedNutzenlayoutsForDrucklayoutFamily
                  ._allTransitiveDependencies,
          drucklayoutId: drucklayoutId,
          salesOrderId: salesOrderId,
        );

  FetchAssignedNutzenlayoutsForDrucklayoutProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.drucklayoutId,
    required this.salesOrderId,
  }) : super.internal();

  final int drucklayoutId;
  final int salesOrderId;

  @override
  Override overrideWith(
    FutureOr<
                ({
                  List<SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts,
                  List<SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts
                })>
            Function(FetchAssignedNutzenlayoutsForDrucklayoutRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAssignedNutzenlayoutsForDrucklayoutProvider._internal(
        (ref) => create(ref as FetchAssignedNutzenlayoutsForDrucklayoutRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        drucklayoutId: drucklayoutId,
        salesOrderId: salesOrderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<
      ({
        List<SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts,
        List<SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts
      })> createElement() {
    return _FetchAssignedNutzenlayoutsForDrucklayoutProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAssignedNutzenlayoutsForDrucklayoutProvider &&
        other.drucklayoutId == drucklayoutId &&
        other.salesOrderId == salesOrderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, drucklayoutId.hashCode);
    hash = _SystemHash.combine(hash, salesOrderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchAssignedNutzenlayoutsForDrucklayoutRef
    on AutoDisposeFutureProviderRef<
        ({
          List<SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts,
          List<SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts
        })> {
  /// The parameter `drucklayoutId` of this provider.
  int get drucklayoutId;

  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _FetchAssignedNutzenlayoutsForDrucklayoutProviderElement
    extends AutoDisposeFutureProviderElement<
        ({
          List<SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts,
          List<SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts
        })> with FetchAssignedNutzenlayoutsForDrucklayoutRef {
  _FetchAssignedNutzenlayoutsForDrucklayoutProviderElement(super.provider);

  @override
  int get drucklayoutId =>
      (origin as FetchAssignedNutzenlayoutsForDrucklayoutProvider)
          .drucklayoutId;
  @override
  int get salesOrderId =>
      (origin as FetchAssignedNutzenlayoutsForDrucklayoutProvider).salesOrderId;
}

String _$fetchArtworkAssociatedDrucklayoutsBySalesOrderHash() =>
    r'0f010539fa77136685cea86c56f5c94c1b620913';

/// Provider that fetches drucklayouts associated with a specific artwork
/// in a sales order
/// This is used to display Drucklayouts related to an Artwork inside of a
/// SalesOrder
///
/// Copied from [fetchArtworkAssociatedDrucklayoutsBySalesOrder].
@ProviderFor(fetchArtworkAssociatedDrucklayoutsBySalesOrder)
const fetchArtworkAssociatedDrucklayoutsBySalesOrderProvider =
    FetchArtworkAssociatedDrucklayoutsBySalesOrderFamily();

/// Provider that fetches drucklayouts associated with a specific artwork
/// in a sales order
/// This is used to display Drucklayouts related to an Artwork inside of a
/// SalesOrder
///
/// Copied from [fetchArtworkAssociatedDrucklayoutsBySalesOrder].
class FetchArtworkAssociatedDrucklayoutsBySalesOrderFamily
    extends Family<AsyncValue<List<Drucklayout>>> {
  /// Provider that fetches drucklayouts associated with a specific artwork
  /// in a sales order
  /// This is used to display Drucklayouts related to an Artwork inside of a
  /// SalesOrder
  ///
  /// Copied from [fetchArtworkAssociatedDrucklayoutsBySalesOrder].
  const FetchArtworkAssociatedDrucklayoutsBySalesOrderFamily();

  /// Provider that fetches drucklayouts associated with a specific artwork
  /// in a sales order
  /// This is used to display Drucklayouts related to an Artwork inside of a
  /// SalesOrder
  ///
  /// Copied from [fetchArtworkAssociatedDrucklayoutsBySalesOrder].
  FetchArtworkAssociatedDrucklayoutsBySalesOrderProvider call({
    required int salesOrderId,
    required int artworkId,
  }) {
    return FetchArtworkAssociatedDrucklayoutsBySalesOrderProvider(
      salesOrderId: salesOrderId,
      artworkId: artworkId,
    );
  }

  @override
  FetchArtworkAssociatedDrucklayoutsBySalesOrderProvider getProviderOverride(
    covariant FetchArtworkAssociatedDrucklayoutsBySalesOrderProvider provider,
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
  String? get name => r'fetchArtworkAssociatedDrucklayoutsBySalesOrderProvider';
}

/// Provider that fetches drucklayouts associated with a specific artwork
/// in a sales order
/// This is used to display Drucklayouts related to an Artwork inside of a
/// SalesOrder
///
/// Copied from [fetchArtworkAssociatedDrucklayoutsBySalesOrder].
class FetchArtworkAssociatedDrucklayoutsBySalesOrderProvider
    extends AutoDisposeFutureProvider<List<Drucklayout>> {
  /// Provider that fetches drucklayouts associated with a specific artwork
  /// in a sales order
  /// This is used to display Drucklayouts related to an Artwork inside of a
  /// SalesOrder
  ///
  /// Copied from [fetchArtworkAssociatedDrucklayoutsBySalesOrder].
  FetchArtworkAssociatedDrucklayoutsBySalesOrderProvider({
    required int salesOrderId,
    required int artworkId,
  }) : this._internal(
          (ref) => fetchArtworkAssociatedDrucklayoutsBySalesOrder(
            ref as FetchArtworkAssociatedDrucklayoutsBySalesOrderRef,
            salesOrderId: salesOrderId,
            artworkId: artworkId,
          ),
          from: fetchArtworkAssociatedDrucklayoutsBySalesOrderProvider,
          name: r'fetchArtworkAssociatedDrucklayoutsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkAssociatedDrucklayoutsBySalesOrderHash,
          dependencies: FetchArtworkAssociatedDrucklayoutsBySalesOrderFamily
              ._dependencies,
          allTransitiveDependencies:
              FetchArtworkAssociatedDrucklayoutsBySalesOrderFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
          artworkId: artworkId,
        );

  FetchArtworkAssociatedDrucklayoutsBySalesOrderProvider._internal(
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
    FutureOr<List<Drucklayout>> Function(
            FetchArtworkAssociatedDrucklayoutsBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override:
          FetchArtworkAssociatedDrucklayoutsBySalesOrderProvider._internal(
        (ref) =>
            create(ref as FetchArtworkAssociatedDrucklayoutsBySalesOrderRef),
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
  AutoDisposeFutureProviderElement<List<Drucklayout>> createElement() {
    return _FetchArtworkAssociatedDrucklayoutsBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkAssociatedDrucklayoutsBySalesOrderProvider &&
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
mixin FetchArtworkAssociatedDrucklayoutsBySalesOrderRef
    on AutoDisposeFutureProviderRef<List<Drucklayout>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;

  /// The parameter `artworkId` of this provider.
  int get artworkId;
}

class _FetchArtworkAssociatedDrucklayoutsBySalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<Drucklayout>>
    with FetchArtworkAssociatedDrucklayoutsBySalesOrderRef {
  _FetchArtworkAssociatedDrucklayoutsBySalesOrderProviderElement(
      super.provider);

  @override
  int get salesOrderId =>
      (origin as FetchArtworkAssociatedDrucklayoutsBySalesOrderProvider)
          .salesOrderId;
  @override
  int get artworkId =>
      (origin as FetchArtworkAssociatedDrucklayoutsBySalesOrderProvider)
          .artworkId;
}

String _$watchDrucklayoutsBySalesOrderHash() =>
    r'36dc8963dc8d9ebe7623472dfd879a0106667aa4';

abstract class _$WatchDrucklayoutsBySalesOrder
    extends BuildlessAutoDisposeAsyncNotifier<List<Drucklayout>> {
  late final int salesOrderId;

  FutureOr<List<Drucklayout>> build(
    int salesOrderId,
  );
}

/// Watch Drucklayouts by Sales Order Provider
///
/// Handles incoming stream
///
/// Copied from [WatchDrucklayoutsBySalesOrder].
@ProviderFor(WatchDrucklayoutsBySalesOrder)
const watchDrucklayoutsBySalesOrderProvider =
    WatchDrucklayoutsBySalesOrderFamily();

/// Watch Drucklayouts by Sales Order Provider
///
/// Handles incoming stream
///
/// Copied from [WatchDrucklayoutsBySalesOrder].
class WatchDrucklayoutsBySalesOrderFamily
    extends Family<AsyncValue<List<Drucklayout>>> {
  /// Watch Drucklayouts by Sales Order Provider
  ///
  /// Handles incoming stream
  ///
  /// Copied from [WatchDrucklayoutsBySalesOrder].
  const WatchDrucklayoutsBySalesOrderFamily();

  /// Watch Drucklayouts by Sales Order Provider
  ///
  /// Handles incoming stream
  ///
  /// Copied from [WatchDrucklayoutsBySalesOrder].
  WatchDrucklayoutsBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return WatchDrucklayoutsBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  WatchDrucklayoutsBySalesOrderProvider getProviderOverride(
    covariant WatchDrucklayoutsBySalesOrderProvider provider,
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
  String? get name => r'watchDrucklayoutsBySalesOrderProvider';
}

/// Watch Drucklayouts by Sales Order Provider
///
/// Handles incoming stream
///
/// Copied from [WatchDrucklayoutsBySalesOrder].
class WatchDrucklayoutsBySalesOrderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchDrucklayoutsBySalesOrder,
        List<Drucklayout>> {
  /// Watch Drucklayouts by Sales Order Provider
  ///
  /// Handles incoming stream
  ///
  /// Copied from [WatchDrucklayoutsBySalesOrder].
  WatchDrucklayoutsBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          () => WatchDrucklayoutsBySalesOrder()..salesOrderId = salesOrderId,
          from: watchDrucklayoutsBySalesOrderProvider,
          name: r'watchDrucklayoutsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDrucklayoutsBySalesOrderHash,
          dependencies: WatchDrucklayoutsBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              WatchDrucklayoutsBySalesOrderFamily._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  WatchDrucklayoutsBySalesOrderProvider._internal(
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
  FutureOr<List<Drucklayout>> runNotifierBuild(
    covariant WatchDrucklayoutsBySalesOrder notifier,
  ) {
    return notifier.build(
      salesOrderId,
    );
  }

  @override
  Override overrideWith(WatchDrucklayoutsBySalesOrder Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchDrucklayoutsBySalesOrderProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WatchDrucklayoutsBySalesOrder,
      List<Drucklayout>> createElement() {
    return _WatchDrucklayoutsBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDrucklayoutsBySalesOrderProvider &&
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
mixin WatchDrucklayoutsBySalesOrderRef
    on AutoDisposeAsyncNotifierProviderRef<List<Drucklayout>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchDrucklayoutsBySalesOrderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchDrucklayoutsBySalesOrder,
        List<Drucklayout>> with WatchDrucklayoutsBySalesOrderRef {
  _WatchDrucklayoutsBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchDrucklayoutsBySalesOrderProvider).salesOrderId;
}

String _$watchDrucklayoutsByCustomerHash() =>
    r'c76a8e831a175b7212829e925bde4fc77c7f3135';

abstract class _$WatchDrucklayoutsByCustomer
    extends BuildlessAutoDisposeAsyncNotifier<List<Drucklayout>> {
  late final int customerId;
  late final String sessionId;

  FutureOr<List<Drucklayout>> build(
    int customerId,
    String sessionId,
  );
}

/// Watch Drucklayouts by Customer Provider
///
/// Handles incoming stream
///
/// Copied from [WatchDrucklayoutsByCustomer].
@ProviderFor(WatchDrucklayoutsByCustomer)
const watchDrucklayoutsByCustomerProvider = WatchDrucklayoutsByCustomerFamily();

/// Watch Drucklayouts by Customer Provider
///
/// Handles incoming stream
///
/// Copied from [WatchDrucklayoutsByCustomer].
class WatchDrucklayoutsByCustomerFamily
    extends Family<AsyncValue<List<Drucklayout>>> {
  /// Watch Drucklayouts by Customer Provider
  ///
  /// Handles incoming stream
  ///
  /// Copied from [WatchDrucklayoutsByCustomer].
  const WatchDrucklayoutsByCustomerFamily();

  /// Watch Drucklayouts by Customer Provider
  ///
  /// Handles incoming stream
  ///
  /// Copied from [WatchDrucklayoutsByCustomer].
  WatchDrucklayoutsByCustomerProvider call(
    int customerId,
    String sessionId,
  ) {
    return WatchDrucklayoutsByCustomerProvider(
      customerId,
      sessionId,
    );
  }

  @override
  WatchDrucklayoutsByCustomerProvider getProviderOverride(
    covariant WatchDrucklayoutsByCustomerProvider provider,
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
  String? get name => r'watchDrucklayoutsByCustomerProvider';
}

/// Watch Drucklayouts by Customer Provider
///
/// Handles incoming stream
///
/// Copied from [WatchDrucklayoutsByCustomer].
class WatchDrucklayoutsByCustomerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchDrucklayoutsByCustomer,
        List<Drucklayout>> {
  /// Watch Drucklayouts by Customer Provider
  ///
  /// Handles incoming stream
  ///
  /// Copied from [WatchDrucklayoutsByCustomer].
  WatchDrucklayoutsByCustomerProvider(
    int customerId,
    String sessionId,
  ) : this._internal(
          () => WatchDrucklayoutsByCustomer()
            ..customerId = customerId
            ..sessionId = sessionId,
          from: watchDrucklayoutsByCustomerProvider,
          name: r'watchDrucklayoutsByCustomerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDrucklayoutsByCustomerHash,
          dependencies: WatchDrucklayoutsByCustomerFamily._dependencies,
          allTransitiveDependencies:
              WatchDrucklayoutsByCustomerFamily._allTransitiveDependencies,
          customerId: customerId,
          sessionId: sessionId,
        );

  WatchDrucklayoutsByCustomerProvider._internal(
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
  FutureOr<List<Drucklayout>> runNotifierBuild(
    covariant WatchDrucklayoutsByCustomer notifier,
  ) {
    return notifier.build(
      customerId,
      sessionId,
    );
  }

  @override
  Override overrideWith(WatchDrucklayoutsByCustomer Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchDrucklayoutsByCustomerProvider._internal(
        () => create()
          ..customerId = customerId
          ..sessionId = sessionId,
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
  AutoDisposeAsyncNotifierProviderElement<WatchDrucklayoutsByCustomer,
      List<Drucklayout>> createElement() {
    return _WatchDrucklayoutsByCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDrucklayoutsByCustomerProvider &&
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
mixin WatchDrucklayoutsByCustomerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Drucklayout>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _WatchDrucklayoutsByCustomerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WatchDrucklayoutsByCustomer,
        List<Drucklayout>> with WatchDrucklayoutsByCustomerRef {
  _WatchDrucklayoutsByCustomerProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as WatchDrucklayoutsByCustomerProvider).customerId;
  @override
  String get sessionId =>
      (origin as WatchDrucklayoutsByCustomerProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
