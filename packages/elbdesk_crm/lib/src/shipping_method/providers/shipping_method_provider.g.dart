// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_method_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchShippingMethodHash() =>
    r'2a357ae2d86cd88e1c972e43a4397b9f90d7cd36';

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

/// See also [fetchShippingMethod].
@ProviderFor(fetchShippingMethod)
const fetchShippingMethodProvider = FetchShippingMethodFamily();

/// See also [fetchShippingMethod].
class FetchShippingMethodFamily extends Family<AsyncValue<ShippingMethod>> {
  /// See also [fetchShippingMethod].
  const FetchShippingMethodFamily();

  /// See also [fetchShippingMethod].
  FetchShippingMethodProvider call(
    int id,
  ) {
    return FetchShippingMethodProvider(
      id,
    );
  }

  @override
  FetchShippingMethodProvider getProviderOverride(
    covariant FetchShippingMethodProvider provider,
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
  String? get name => r'fetchShippingMethodProvider';
}

/// See also [fetchShippingMethod].
class FetchShippingMethodProvider
    extends AutoDisposeFutureProvider<ShippingMethod> {
  /// See also [fetchShippingMethod].
  FetchShippingMethodProvider(
    int id,
  ) : this._internal(
          (ref) => fetchShippingMethod(
            ref as FetchShippingMethodRef,
            id,
          ),
          from: fetchShippingMethodProvider,
          name: r'fetchShippingMethodProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchShippingMethodHash,
          dependencies: FetchShippingMethodFamily._dependencies,
          allTransitiveDependencies:
              FetchShippingMethodFamily._allTransitiveDependencies,
          id: id,
        );

  FetchShippingMethodProvider._internal(
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
    FutureOr<ShippingMethod> Function(FetchShippingMethodRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchShippingMethodProvider._internal(
        (ref) => create(ref as FetchShippingMethodRef),
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
  AutoDisposeFutureProviderElement<ShippingMethod> createElement() {
    return _FetchShippingMethodProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchShippingMethodProvider && other.id == id;
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
mixin FetchShippingMethodRef on AutoDisposeFutureProviderRef<ShippingMethod> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchShippingMethodProviderElement
    extends AutoDisposeFutureProviderElement<ShippingMethod>
    with FetchShippingMethodRef {
  _FetchShippingMethodProviderElement(super.provider);

  @override
  int get id => (origin as FetchShippingMethodProvider).id;
}

String _$findShippingMethodsHash() =>
    r'1071dd231581ab08ef4a02c99ff9ef7be5efd34c';

/// See also [findShippingMethods].
@ProviderFor(findShippingMethods)
const findShippingMethodsProvider = FindShippingMethodsFamily();

/// See also [findShippingMethods].
class FindShippingMethodsFamily
    extends Family<AsyncValue<List<ShippingMethod>>> {
  /// See also [findShippingMethods].
  const FindShippingMethodsFamily();

  /// See also [findShippingMethods].
  FindShippingMethodsProvider call(
    String sessionId,
  ) {
    return FindShippingMethodsProvider(
      sessionId,
    );
  }

  @override
  FindShippingMethodsProvider getProviderOverride(
    covariant FindShippingMethodsProvider provider,
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
  String? get name => r'findShippingMethodsProvider';
}

/// See also [findShippingMethods].
class FindShippingMethodsProvider
    extends AutoDisposeFutureProvider<List<ShippingMethod>> {
  /// See also [findShippingMethods].
  FindShippingMethodsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findShippingMethods(
            ref as FindShippingMethodsRef,
            sessionId,
          ),
          from: findShippingMethodsProvider,
          name: r'findShippingMethodsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findShippingMethodsHash,
          dependencies: FindShippingMethodsFamily._dependencies,
          allTransitiveDependencies:
              FindShippingMethodsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindShippingMethodsProvider._internal(
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
    FutureOr<List<ShippingMethod>> Function(FindShippingMethodsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindShippingMethodsProvider._internal(
        (ref) => create(ref as FindShippingMethodsRef),
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
  AutoDisposeFutureProviderElement<List<ShippingMethod>> createElement() {
    return _FindShippingMethodsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindShippingMethodsProvider && other.sessionId == sessionId;
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
mixin FindShippingMethodsRef
    on AutoDisposeFutureProviderRef<List<ShippingMethod>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindShippingMethodsProviderElement
    extends AutoDisposeFutureProviderElement<List<ShippingMethod>>
    with FindShippingMethodsRef {
  _FindShippingMethodsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindShippingMethodsProvider).sessionId;
}

String _$shippingMethodRepositoryHash() =>
    r'd49e5b960a6462d0d603a860afeeecc4ada637b8';

/// See also [shippingMethodRepository].
@ProviderFor(shippingMethodRepository)
final shippingMethodRepositoryProvider =
    AutoDisposeProvider<ShippingMethodRepository>.internal(
  shippingMethodRepository,
  name: r'shippingMethodRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shippingMethodRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShippingMethodRepositoryRef
    = AutoDisposeProviderRef<ShippingMethodRepository>;
String _$watchShippingMethodHash() =>
    r'c0624bd1fdc97ef18621bdda8dfc04ef04049081';

/// See also [watchShippingMethod].
@ProviderFor(watchShippingMethod)
const watchShippingMethodProvider = WatchShippingMethodFamily();

/// See also [watchShippingMethod].
class WatchShippingMethodFamily extends Family<AsyncValue<ShippingMethod>> {
  /// See also [watchShippingMethod].
  const WatchShippingMethodFamily();

  /// See also [watchShippingMethod].
  WatchShippingMethodProvider call({
    required String sessionId,
    required int shippingMethodId,
  }) {
    return WatchShippingMethodProvider(
      sessionId: sessionId,
      shippingMethodId: shippingMethodId,
    );
  }

  @override
  WatchShippingMethodProvider getProviderOverride(
    covariant WatchShippingMethodProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      shippingMethodId: provider.shippingMethodId,
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
  String? get name => r'watchShippingMethodProvider';
}

/// See also [watchShippingMethod].
class WatchShippingMethodProvider
    extends AutoDisposeStreamProvider<ShippingMethod> {
  /// See also [watchShippingMethod].
  WatchShippingMethodProvider({
    required String sessionId,
    required int shippingMethodId,
  }) : this._internal(
          (ref) => watchShippingMethod(
            ref as WatchShippingMethodRef,
            sessionId: sessionId,
            shippingMethodId: shippingMethodId,
          ),
          from: watchShippingMethodProvider,
          name: r'watchShippingMethodProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchShippingMethodHash,
          dependencies: WatchShippingMethodFamily._dependencies,
          allTransitiveDependencies:
              WatchShippingMethodFamily._allTransitiveDependencies,
          sessionId: sessionId,
          shippingMethodId: shippingMethodId,
        );

  WatchShippingMethodProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.shippingMethodId,
  }) : super.internal();

  final String sessionId;
  final int shippingMethodId;

  @override
  Override overrideWith(
    Stream<ShippingMethod> Function(WatchShippingMethodRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchShippingMethodProvider._internal(
        (ref) => create(ref as WatchShippingMethodRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        shippingMethodId: shippingMethodId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ShippingMethod> createElement() {
    return _WatchShippingMethodProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchShippingMethodProvider &&
        other.sessionId == sessionId &&
        other.shippingMethodId == shippingMethodId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, shippingMethodId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchShippingMethodRef on AutoDisposeStreamProviderRef<ShippingMethod> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `shippingMethodId` of this provider.
  int get shippingMethodId;
}

class _WatchShippingMethodProviderElement
    extends AutoDisposeStreamProviderElement<ShippingMethod>
    with WatchShippingMethodRef {
  _WatchShippingMethodProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchShippingMethodProvider).sessionId;
  @override
  int get shippingMethodId =>
      (origin as WatchShippingMethodProvider).shippingMethodId;
}

String _$watchAllShippingMethodsHash() =>
    r'909707a071566f725fdaba982d9632bdc29cefac';

/// See also [watchAllShippingMethods].
@ProviderFor(watchAllShippingMethods)
final watchAllShippingMethodsProvider =
    AutoDisposeStreamProvider<ShippingMethod>.internal(
  watchAllShippingMethods,
  name: r'watchAllShippingMethodsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAllShippingMethodsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllShippingMethodsRef
    = AutoDisposeStreamProviderRef<ShippingMethod>;
String _$fetchAndWatchAllShippingMethodsHash() =>
    r'8c56a29c629adb6d8b1022a0fd55e83e67ced210';

/// See also [FetchAndWatchAllShippingMethods].
@ProviderFor(FetchAndWatchAllShippingMethods)
final fetchAndWatchAllShippingMethodsProvider =
    AutoDisposeAsyncNotifierProvider<FetchAndWatchAllShippingMethods,
        List<ShippingMethod>>.internal(
  FetchAndWatchAllShippingMethods.new,
  name: r'fetchAndWatchAllShippingMethodsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAndWatchAllShippingMethodsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FetchAndWatchAllShippingMethods
    = AutoDisposeAsyncNotifier<List<ShippingMethod>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
