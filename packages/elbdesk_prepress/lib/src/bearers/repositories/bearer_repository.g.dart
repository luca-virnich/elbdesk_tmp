// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bearer_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchBearersHash() => r'7d2c6f1b049ad56e4ecf676843d8f1f9a1efa7e6';

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

/// Fetch Bearers Provider
///
/// This provider is used to fetch bearers from the server. It's possible to
/// add a sort and filter to the fetch request
///
/// Copied from [fetchBearers].
@ProviderFor(fetchBearers)
const fetchBearersProvider = FetchBearersFamily();

/// Fetch Bearers Provider
///
/// This provider is used to fetch bearers from the server. It's possible to
/// add a sort and filter to the fetch request
///
/// Copied from [fetchBearers].
class FetchBearersFamily extends Family<AsyncValue<List<Bearer>>> {
  /// Fetch Bearers Provider
  ///
  /// This provider is used to fetch bearers from the server. It's possible to
  /// add a sort and filter to the fetch request
  ///
  /// Copied from [fetchBearers].
  const FetchBearersFamily();

  /// Fetch Bearers Provider
  ///
  /// This provider is used to fetch bearers from the server. It's possible to
  /// add a sort and filter to the fetch request
  ///
  /// Copied from [fetchBearers].
  FetchBearersProvider call(
    TableType tableType,
    String sessionId,
  ) {
    return FetchBearersProvider(
      tableType,
      sessionId,
    );
  }

  @override
  FetchBearersProvider getProviderOverride(
    covariant FetchBearersProvider provider,
  ) {
    return call(
      provider.tableType,
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
  String? get name => r'fetchBearersProvider';
}

/// Fetch Bearers Provider
///
/// This provider is used to fetch bearers from the server. It's possible to
/// add a sort and filter to the fetch request
///
/// Copied from [fetchBearers].
class FetchBearersProvider extends AutoDisposeFutureProvider<List<Bearer>> {
  /// Fetch Bearers Provider
  ///
  /// This provider is used to fetch bearers from the server. It's possible to
  /// add a sort and filter to the fetch request
  ///
  /// Copied from [fetchBearers].
  FetchBearersProvider(
    TableType tableType,
    String sessionId,
  ) : this._internal(
          (ref) => fetchBearers(
            ref as FetchBearersRef,
            tableType,
            sessionId,
          ),
          from: fetchBearersProvider,
          name: r'fetchBearersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchBearersHash,
          dependencies: FetchBearersFamily._dependencies,
          allTransitiveDependencies:
              FetchBearersFamily._allTransitiveDependencies,
          tableType: tableType,
          sessionId: sessionId,
        );

  FetchBearersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.sessionId,
  }) : super.internal();

  final TableType tableType;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<Bearer>> Function(FetchBearersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchBearersProvider._internal(
        (ref) => create(ref as FetchBearersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Bearer>> createElement() {
    return _FetchBearersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchBearersProvider &&
        other.tableType == tableType &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchBearersRef on AutoDisposeFutureProviderRef<List<Bearer>> {
  /// The parameter `tableType` of this provider.
  TableType get tableType;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchBearersProviderElement
    extends AutoDisposeFutureProviderElement<List<Bearer>>
    with FetchBearersRef {
  _FetchBearersProviderElement(super.provider);

  @override
  TableType get tableType => (origin as FetchBearersProvider).tableType;
  @override
  String get sessionId => (origin as FetchBearersProvider).sessionId;
}

String _$fetchBearerHash() => r'886c4d7da6969197c4782d21330983a4363af467';

/// Fetch Bearer Provider
///
/// This provider is used to fetch a single bearer from the server
/// based on the provided bearerId and sessionId
///
/// The sessionId is required to lock the bearer for editing
///
/// Copied from [fetchBearer].
@ProviderFor(fetchBearer)
const fetchBearerProvider = FetchBearerFamily();

/// Fetch Bearer Provider
///
/// This provider is used to fetch a single bearer from the server
/// based on the provided bearerId and sessionId
///
/// The sessionId is required to lock the bearer for editing
///
/// Copied from [fetchBearer].
class FetchBearerFamily extends Family<AsyncValue<Bearer?>> {
  /// Fetch Bearer Provider
  ///
  /// This provider is used to fetch a single bearer from the server
  /// based on the provided bearerId and sessionId
  ///
  /// The sessionId is required to lock the bearer for editing
  ///
  /// Copied from [fetchBearer].
  const FetchBearerFamily();

  /// Fetch Bearer Provider
  ///
  /// This provider is used to fetch a single bearer from the server
  /// based on the provided bearerId and sessionId
  ///
  /// The sessionId is required to lock the bearer for editing
  ///
  /// Copied from [fetchBearer].
  FetchBearerProvider call(
    int id,
    String sessionId,
  ) {
    return FetchBearerProvider(
      id,
      sessionId,
    );
  }

  @override
  FetchBearerProvider getProviderOverride(
    covariant FetchBearerProvider provider,
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
  String? get name => r'fetchBearerProvider';
}

/// Fetch Bearer Provider
///
/// This provider is used to fetch a single bearer from the server
/// based on the provided bearerId and sessionId
///
/// The sessionId is required to lock the bearer for editing
///
/// Copied from [fetchBearer].
class FetchBearerProvider extends AutoDisposeFutureProvider<Bearer?> {
  /// Fetch Bearer Provider
  ///
  /// This provider is used to fetch a single bearer from the server
  /// based on the provided bearerId and sessionId
  ///
  /// The sessionId is required to lock the bearer for editing
  ///
  /// Copied from [fetchBearer].
  FetchBearerProvider(
    int id,
    String sessionId,
  ) : this._internal(
          (ref) => fetchBearer(
            ref as FetchBearerRef,
            id,
            sessionId,
          ),
          from: fetchBearerProvider,
          name: r'fetchBearerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchBearerHash,
          dependencies: FetchBearerFamily._dependencies,
          allTransitiveDependencies:
              FetchBearerFamily._allTransitiveDependencies,
          id: id,
          sessionId: sessionId,
        );

  FetchBearerProvider._internal(
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
    FutureOr<Bearer?> Function(FetchBearerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchBearerProvider._internal(
        (ref) => create(ref as FetchBearerRef),
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
  AutoDisposeFutureProviderElement<Bearer?> createElement() {
    return _FetchBearerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchBearerProvider &&
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
mixin FetchBearerRef on AutoDisposeFutureProviderRef<Bearer?> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchBearerProviderElement
    extends AutoDisposeFutureProviderElement<Bearer?> with FetchBearerRef {
  _FetchBearerProviderElement(super.provider);

  @override
  int get id => (origin as FetchBearerProvider).id;
  @override
  String get sessionId => (origin as FetchBearerProvider).sessionId;
}

String _$fetchFilteredBearersHash() =>
    r'bbb38057c4dae870f1af34bb402a6b367431e911';

/// Fetch Filtered Bearers Provider
///
/// This provider is used to fetch bearers from the server. It's possible to
/// add addtional sort and filter arguments to the fetch request
///
/// Copied from [fetchFilteredBearers].
@ProviderFor(fetchFilteredBearers)
const fetchFilteredBearersProvider = FetchFilteredBearersFamily();

/// Fetch Filtered Bearers Provider
///
/// This provider is used to fetch bearers from the server. It's possible to
/// add addtional sort and filter arguments to the fetch request
///
/// Copied from [fetchFilteredBearers].
class FetchFilteredBearersFamily extends Family<AsyncValue<List<Bearer>>> {
  /// Fetch Filtered Bearers Provider
  ///
  /// This provider is used to fetch bearers from the server. It's possible to
  /// add addtional sort and filter arguments to the fetch request
  ///
  /// Copied from [fetchFilteredBearers].
  const FetchFilteredBearersFamily();

  /// Fetch Filtered Bearers Provider
  ///
  /// This provider is used to fetch bearers from the server. It's possible to
  /// add addtional sort and filter arguments to the fetch request
  ///
  /// Copied from [fetchFilteredBearers].
  FetchFilteredBearersProvider call({
    required Sort sort,
    required Filter filter,
  }) {
    return FetchFilteredBearersProvider(
      sort: sort,
      filter: filter,
    );
  }

  @override
  FetchFilteredBearersProvider getProviderOverride(
    covariant FetchFilteredBearersProvider provider,
  ) {
    return call(
      sort: provider.sort,
      filter: provider.filter,
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
  String? get name => r'fetchFilteredBearersProvider';
}

/// Fetch Filtered Bearers Provider
///
/// This provider is used to fetch bearers from the server. It's possible to
/// add addtional sort and filter arguments to the fetch request
///
/// Copied from [fetchFilteredBearers].
class FetchFilteredBearersProvider
    extends AutoDisposeFutureProvider<List<Bearer>> {
  /// Fetch Filtered Bearers Provider
  ///
  /// This provider is used to fetch bearers from the server. It's possible to
  /// add addtional sort and filter arguments to the fetch request
  ///
  /// Copied from [fetchFilteredBearers].
  FetchFilteredBearersProvider({
    required Sort sort,
    required Filter filter,
  }) : this._internal(
          (ref) => fetchFilteredBearers(
            ref as FetchFilteredBearersRef,
            sort: sort,
            filter: filter,
          ),
          from: fetchFilteredBearersProvider,
          name: r'fetchFilteredBearersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchFilteredBearersHash,
          dependencies: FetchFilteredBearersFamily._dependencies,
          allTransitiveDependencies:
              FetchFilteredBearersFamily._allTransitiveDependencies,
          sort: sort,
          filter: filter,
        );

  FetchFilteredBearersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sort,
    required this.filter,
  }) : super.internal();

  final Sort sort;
  final Filter filter;

  @override
  Override overrideWith(
    FutureOr<List<Bearer>> Function(FetchFilteredBearersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchFilteredBearersProvider._internal(
        (ref) => create(ref as FetchFilteredBearersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sort: sort,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Bearer>> createElement() {
    return _FetchFilteredBearersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchFilteredBearersProvider &&
        other.sort == sort &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sort.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchFilteredBearersRef on AutoDisposeFutureProviderRef<List<Bearer>> {
  /// The parameter `sort` of this provider.
  Sort get sort;

  /// The parameter `filter` of this provider.
  Filter get filter;
}

class _FetchFilteredBearersProviderElement
    extends AutoDisposeFutureProviderElement<List<Bearer>>
    with FetchFilteredBearersRef {
  _FetchFilteredBearersProviderElement(super.provider);

  @override
  Sort get sort => (origin as FetchFilteredBearersProvider).sort;
  @override
  Filter get filter => (origin as FetchFilteredBearersProvider).filter;
}

String _$fetchBearersByCustomerHash() =>
    r'c6a88038a06e5485a9cb87c5ff7597ec0f448f52';

/// Fetch Bearers by Customer Provider
///
/// This provider is used to fetch bearers from the server. It's possible to
/// add addtional sort and filter arguments to the fetch request
///
/// Copied from [fetchBearersByCustomer].
@ProviderFor(fetchBearersByCustomer)
const fetchBearersByCustomerProvider = FetchBearersByCustomerFamily();

/// Fetch Bearers by Customer Provider
///
/// This provider is used to fetch bearers from the server. It's possible to
/// add addtional sort and filter arguments to the fetch request
///
/// Copied from [fetchBearersByCustomer].
class FetchBearersByCustomerFamily extends Family<AsyncValue<List<Bearer>>> {
  /// Fetch Bearers by Customer Provider
  ///
  /// This provider is used to fetch bearers from the server. It's possible to
  /// add addtional sort and filter arguments to the fetch request
  ///
  /// Copied from [fetchBearersByCustomer].
  const FetchBearersByCustomerFamily();

  /// Fetch Bearers by Customer Provider
  ///
  /// This provider is used to fetch bearers from the server. It's possible to
  /// add addtional sort and filter arguments to the fetch request
  ///
  /// Copied from [fetchBearersByCustomer].
  FetchBearersByCustomerProvider call(
    int customerId,
    TableType tableType,
    String sessionId,
  ) {
    return FetchBearersByCustomerProvider(
      customerId,
      tableType,
      sessionId,
    );
  }

  @override
  FetchBearersByCustomerProvider getProviderOverride(
    covariant FetchBearersByCustomerProvider provider,
  ) {
    return call(
      provider.customerId,
      provider.tableType,
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
  String? get name => r'fetchBearersByCustomerProvider';
}

/// Fetch Bearers by Customer Provider
///
/// This provider is used to fetch bearers from the server. It's possible to
/// add addtional sort and filter arguments to the fetch request
///
/// Copied from [fetchBearersByCustomer].
class FetchBearersByCustomerProvider
    extends AutoDisposeFutureProvider<List<Bearer>> {
  /// Fetch Bearers by Customer Provider
  ///
  /// This provider is used to fetch bearers from the server. It's possible to
  /// add addtional sort and filter arguments to the fetch request
  ///
  /// Copied from [fetchBearersByCustomer].
  FetchBearersByCustomerProvider(
    int customerId,
    TableType tableType,
    String sessionId,
  ) : this._internal(
          (ref) => fetchBearersByCustomer(
            ref as FetchBearersByCustomerRef,
            customerId,
            tableType,
            sessionId,
          ),
          from: fetchBearersByCustomerProvider,
          name: r'fetchBearersByCustomerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchBearersByCustomerHash,
          dependencies: FetchBearersByCustomerFamily._dependencies,
          allTransitiveDependencies:
              FetchBearersByCustomerFamily._allTransitiveDependencies,
          customerId: customerId,
          tableType: tableType,
          sessionId: sessionId,
        );

  FetchBearersByCustomerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
    required this.tableType,
    required this.sessionId,
  }) : super.internal();

  final int customerId;
  final TableType tableType;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<Bearer>> Function(FetchBearersByCustomerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchBearersByCustomerProvider._internal(
        (ref) => create(ref as FetchBearersByCustomerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
        tableType: tableType,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Bearer>> createElement() {
    return _FetchBearersByCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchBearersByCustomerProvider &&
        other.customerId == customerId &&
        other.tableType == tableType &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchBearersByCustomerRef on AutoDisposeFutureProviderRef<List<Bearer>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `tableType` of this provider.
  TableType get tableType;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchBearersByCustomerProviderElement
    extends AutoDisposeFutureProviderElement<List<Bearer>>
    with FetchBearersByCustomerRef {
  _FetchBearersByCustomerProviderElement(super.provider);

  @override
  int get customerId => (origin as FetchBearersByCustomerProvider).customerId;
  @override
  TableType get tableType =>
      (origin as FetchBearersByCustomerProvider).tableType;
  @override
  String get sessionId => (origin as FetchBearersByCustomerProvider).sessionId;
}

String _$bearerRepositoryHash() => r'7192726855f9487e0f3647a981423796c48ee5f9';

/// Bearer Repository Provider
///
/// Copied from [bearerRepository].
@ProviderFor(bearerRepository)
final bearerRepositoryProvider = AutoDisposeProvider<BearerRepository>.internal(
  bearerRepository,
  name: r'bearerRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bearerRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BearerRepositoryRef = AutoDisposeProviderRef<BearerRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
