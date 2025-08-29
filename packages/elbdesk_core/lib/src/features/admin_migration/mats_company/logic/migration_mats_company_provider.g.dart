// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_mats_company_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$migrationMatsCompanyRepositoryHash() =>
    r'b5e085dc68d929891bd390c448d574a4b4332d17';

/// See also [migrationMatsCompanyRepository].
@ProviderFor(migrationMatsCompanyRepository)
final migrationMatsCompanyRepositoryProvider =
    AutoDisposeProvider<MigrationMatsCompanyRepository>.internal(
  migrationMatsCompanyRepository,
  name: r'migrationMatsCompanyRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$migrationMatsCompanyRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MigrationMatsCompanyRepositoryRef
    = AutoDisposeProviderRef<MigrationMatsCompanyRepository>;
String _$migrationMatsCompanyControllerHash() =>
    r'4719e009377b2cbc9123ab74317d752d21f6644d';

/// See also [migrationMatsCompanyController].
@ProviderFor(migrationMatsCompanyController)
final migrationMatsCompanyControllerProvider =
    AutoDisposeProvider<MigrationMatsCompanyController>.internal(
  migrationMatsCompanyController,
  name: r'migrationMatsCompanyControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$migrationMatsCompanyControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MigrationMatsCompanyControllerRef
    = AutoDisposeProviderRef<MigrationMatsCompanyController>;
String _$findMigrationMatsCompaniesHash() =>
    r'6366acc5bc91e1f6e4673b75f84462b1dfdd77ba';

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

/// See also [findMigrationMatsCompanies].
@ProviderFor(findMigrationMatsCompanies)
const findMigrationMatsCompaniesProvider = FindMigrationMatsCompaniesFamily();

/// See also [findMigrationMatsCompanies].
class FindMigrationMatsCompaniesFamily
    extends Family<AsyncValue<List<MigrationMatsCompany>>> {
  /// See also [findMigrationMatsCompanies].
  const FindMigrationMatsCompaniesFamily();

  /// See also [findMigrationMatsCompanies].
  FindMigrationMatsCompaniesProvider call(
    String sessionId,
  ) {
    return FindMigrationMatsCompaniesProvider(
      sessionId,
    );
  }

  @override
  FindMigrationMatsCompaniesProvider getProviderOverride(
    covariant FindMigrationMatsCompaniesProvider provider,
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
  String? get name => r'findMigrationMatsCompaniesProvider';
}

/// See also [findMigrationMatsCompanies].
class FindMigrationMatsCompaniesProvider
    extends AutoDisposeFutureProvider<List<MigrationMatsCompany>> {
  /// See also [findMigrationMatsCompanies].
  FindMigrationMatsCompaniesProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findMigrationMatsCompanies(
            ref as FindMigrationMatsCompaniesRef,
            sessionId,
          ),
          from: findMigrationMatsCompaniesProvider,
          name: r'findMigrationMatsCompaniesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findMigrationMatsCompaniesHash,
          dependencies: FindMigrationMatsCompaniesFamily._dependencies,
          allTransitiveDependencies:
              FindMigrationMatsCompaniesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindMigrationMatsCompaniesProvider._internal(
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
    FutureOr<List<MigrationMatsCompany>> Function(
            FindMigrationMatsCompaniesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindMigrationMatsCompaniesProvider._internal(
        (ref) => create(ref as FindMigrationMatsCompaniesRef),
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
  AutoDisposeFutureProviderElement<List<MigrationMatsCompany>> createElement() {
    return _FindMigrationMatsCompaniesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindMigrationMatsCompaniesProvider &&
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
mixin FindMigrationMatsCompaniesRef
    on AutoDisposeFutureProviderRef<List<MigrationMatsCompany>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindMigrationMatsCompaniesProviderElement
    extends AutoDisposeFutureProviderElement<List<MigrationMatsCompany>>
    with FindMigrationMatsCompaniesRef {
  _FindMigrationMatsCompaniesProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FindMigrationMatsCompaniesProvider).sessionId;
}

String _$fetchMigrationMatsCompanyByIdHash() =>
    r'063e998f2a8b001a0c81db0835920b56611eb3fa';

/// See also [fetchMigrationMatsCompanyById].
@ProviderFor(fetchMigrationMatsCompanyById)
const fetchMigrationMatsCompanyByIdProvider =
    FetchMigrationMatsCompanyByIdFamily();

/// See also [fetchMigrationMatsCompanyById].
class FetchMigrationMatsCompanyByIdFamily
    extends Family<AsyncValue<MigrationMatsCompany>> {
  /// See also [fetchMigrationMatsCompanyById].
  const FetchMigrationMatsCompanyByIdFamily();

  /// See also [fetchMigrationMatsCompanyById].
  FetchMigrationMatsCompanyByIdProvider call(
    int id,
  ) {
    return FetchMigrationMatsCompanyByIdProvider(
      id,
    );
  }

  @override
  FetchMigrationMatsCompanyByIdProvider getProviderOverride(
    covariant FetchMigrationMatsCompanyByIdProvider provider,
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
  String? get name => r'fetchMigrationMatsCompanyByIdProvider';
}

/// See also [fetchMigrationMatsCompanyById].
class FetchMigrationMatsCompanyByIdProvider
    extends AutoDisposeFutureProvider<MigrationMatsCompany> {
  /// See also [fetchMigrationMatsCompanyById].
  FetchMigrationMatsCompanyByIdProvider(
    int id,
  ) : this._internal(
          (ref) => fetchMigrationMatsCompanyById(
            ref as FetchMigrationMatsCompanyByIdRef,
            id,
          ),
          from: fetchMigrationMatsCompanyByIdProvider,
          name: r'fetchMigrationMatsCompanyByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMigrationMatsCompanyByIdHash,
          dependencies: FetchMigrationMatsCompanyByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchMigrationMatsCompanyByIdFamily._allTransitiveDependencies,
          id: id,
        );

  FetchMigrationMatsCompanyByIdProvider._internal(
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
    FutureOr<MigrationMatsCompany> Function(
            FetchMigrationMatsCompanyByIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchMigrationMatsCompanyByIdProvider._internal(
        (ref) => create(ref as FetchMigrationMatsCompanyByIdRef),
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
  AutoDisposeFutureProviderElement<MigrationMatsCompany> createElement() {
    return _FetchMigrationMatsCompanyByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchMigrationMatsCompanyByIdProvider && other.id == id;
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
mixin FetchMigrationMatsCompanyByIdRef
    on AutoDisposeFutureProviderRef<MigrationMatsCompany> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchMigrationMatsCompanyByIdProviderElement
    extends AutoDisposeFutureProviderElement<MigrationMatsCompany>
    with FetchMigrationMatsCompanyByIdRef {
  _FetchMigrationMatsCompanyByIdProviderElement(super.provider);

  @override
  int get id => (origin as FetchMigrationMatsCompanyByIdProvider).id;
}

String _$watchMigrationMatsCompanyUpdatesHash() =>
    r'c1d4c1d2fa4e0e0ac17ff3d60ca7a2980d5e2046';

/// See also [watchMigrationMatsCompanyUpdates].
@ProviderFor(watchMigrationMatsCompanyUpdates)
const watchMigrationMatsCompanyUpdatesProvider =
    WatchMigrationMatsCompanyUpdatesFamily();

/// See also [watchMigrationMatsCompanyUpdates].
class WatchMigrationMatsCompanyUpdatesFamily
    extends Family<AsyncValue<MigrationMatsCompany>> {
  /// See also [watchMigrationMatsCompanyUpdates].
  const WatchMigrationMatsCompanyUpdatesFamily();

  /// See also [watchMigrationMatsCompanyUpdates].
  WatchMigrationMatsCompanyUpdatesProvider call({
    required int id,
  }) {
    return WatchMigrationMatsCompanyUpdatesProvider(
      id: id,
    );
  }

  @override
  WatchMigrationMatsCompanyUpdatesProvider getProviderOverride(
    covariant WatchMigrationMatsCompanyUpdatesProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'watchMigrationMatsCompanyUpdatesProvider';
}

/// See also [watchMigrationMatsCompanyUpdates].
class WatchMigrationMatsCompanyUpdatesProvider
    extends AutoDisposeStreamProvider<MigrationMatsCompany> {
  /// See also [watchMigrationMatsCompanyUpdates].
  WatchMigrationMatsCompanyUpdatesProvider({
    required int id,
  }) : this._internal(
          (ref) => watchMigrationMatsCompanyUpdates(
            ref as WatchMigrationMatsCompanyUpdatesRef,
            id: id,
          ),
          from: watchMigrationMatsCompanyUpdatesProvider,
          name: r'watchMigrationMatsCompanyUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchMigrationMatsCompanyUpdatesHash,
          dependencies: WatchMigrationMatsCompanyUpdatesFamily._dependencies,
          allTransitiveDependencies:
              WatchMigrationMatsCompanyUpdatesFamily._allTransitiveDependencies,
          id: id,
        );

  WatchMigrationMatsCompanyUpdatesProvider._internal(
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
    Stream<MigrationMatsCompany> Function(
            WatchMigrationMatsCompanyUpdatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchMigrationMatsCompanyUpdatesProvider._internal(
        (ref) => create(ref as WatchMigrationMatsCompanyUpdatesRef),
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
  AutoDisposeStreamProviderElement<MigrationMatsCompany> createElement() {
    return _WatchMigrationMatsCompanyUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchMigrationMatsCompanyUpdatesProvider && other.id == id;
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
mixin WatchMigrationMatsCompanyUpdatesRef
    on AutoDisposeStreamProviderRef<MigrationMatsCompany> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WatchMigrationMatsCompanyUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<MigrationMatsCompany>
    with WatchMigrationMatsCompanyUpdatesRef {
  _WatchMigrationMatsCompanyUpdatesProviderElement(super.provider);

  @override
  int get id => (origin as WatchMigrationMatsCompanyUpdatesProvider).id;
}

String _$fetchAndWatchMigrationMatsCompanyHash() =>
    r'4aa52cb7fe4ca0751020848539ea31100f0eab02';

abstract class _$FetchAndWatchMigrationMatsCompany
    extends BuildlessAutoDisposeAsyncNotifier<MigrationMatsCompany> {
  late final int id;

  FutureOr<MigrationMatsCompany> build(
    int id,
  );
}

/// See also [FetchAndWatchMigrationMatsCompany].
@ProviderFor(FetchAndWatchMigrationMatsCompany)
const fetchAndWatchMigrationMatsCompanyProvider =
    FetchAndWatchMigrationMatsCompanyFamily();

/// See also [FetchAndWatchMigrationMatsCompany].
class FetchAndWatchMigrationMatsCompanyFamily
    extends Family<AsyncValue<MigrationMatsCompany>> {
  /// See also [FetchAndWatchMigrationMatsCompany].
  const FetchAndWatchMigrationMatsCompanyFamily();

  /// See also [FetchAndWatchMigrationMatsCompany].
  FetchAndWatchMigrationMatsCompanyProvider call(
    int id,
  ) {
    return FetchAndWatchMigrationMatsCompanyProvider(
      id,
    );
  }

  @override
  FetchAndWatchMigrationMatsCompanyProvider getProviderOverride(
    covariant FetchAndWatchMigrationMatsCompanyProvider provider,
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
  String? get name => r'fetchAndWatchMigrationMatsCompanyProvider';
}

/// See also [FetchAndWatchMigrationMatsCompany].
class FetchAndWatchMigrationMatsCompanyProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        FetchAndWatchMigrationMatsCompany, MigrationMatsCompany> {
  /// See also [FetchAndWatchMigrationMatsCompany].
  FetchAndWatchMigrationMatsCompanyProvider(
    int id,
  ) : this._internal(
          () => FetchAndWatchMigrationMatsCompany()..id = id,
          from: fetchAndWatchMigrationMatsCompanyProvider,
          name: r'fetchAndWatchMigrationMatsCompanyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchMigrationMatsCompanyHash,
          dependencies: FetchAndWatchMigrationMatsCompanyFamily._dependencies,
          allTransitiveDependencies: FetchAndWatchMigrationMatsCompanyFamily
              ._allTransitiveDependencies,
          id: id,
        );

  FetchAndWatchMigrationMatsCompanyProvider._internal(
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
  FutureOr<MigrationMatsCompany> runNotifierBuild(
    covariant FetchAndWatchMigrationMatsCompany notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(FetchAndWatchMigrationMatsCompany Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchAndWatchMigrationMatsCompanyProvider._internal(
        () => create()..id = id,
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
  AutoDisposeAsyncNotifierProviderElement<FetchAndWatchMigrationMatsCompany,
      MigrationMatsCompany> createElement() {
    return _FetchAndWatchMigrationMatsCompanyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAndWatchMigrationMatsCompanyProvider && other.id == id;
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
mixin FetchAndWatchMigrationMatsCompanyRef
    on AutoDisposeAsyncNotifierProviderRef<MigrationMatsCompany> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchAndWatchMigrationMatsCompanyProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        FetchAndWatchMigrationMatsCompany,
        MigrationMatsCompany> with FetchAndWatchMigrationMatsCompanyRef {
  _FetchAndWatchMigrationMatsCompanyProviderElement(super.provider);

  @override
  int get id => (origin as FetchAndWatchMigrationMatsCompanyProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
