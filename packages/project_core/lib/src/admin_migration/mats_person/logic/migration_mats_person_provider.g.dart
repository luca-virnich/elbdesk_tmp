// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migration_mats_person_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$migrationMatsPersonRepositoryHash() =>
    r'5e121d9db93d04915a2414eb6823a53052d47462';

/// See also [migrationMatsPersonRepository].
@ProviderFor(migrationMatsPersonRepository)
final migrationMatsPersonRepositoryProvider =
    AutoDisposeProvider<MigrationMatsPersonRepository>.internal(
  migrationMatsPersonRepository,
  name: r'migrationMatsPersonRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$migrationMatsPersonRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MigrationMatsPersonRepositoryRef
    = AutoDisposeProviderRef<MigrationMatsPersonRepository>;
String _$migrationMatsPersonControllerHash() =>
    r'002121a862fc10e8ab5adce2570498e02074fb50';

/// See also [migrationMatsPersonController].
@ProviderFor(migrationMatsPersonController)
final migrationMatsPersonControllerProvider =
    AutoDisposeProvider<MigrationMatsPersonController>.internal(
  migrationMatsPersonController,
  name: r'migrationMatsPersonControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$migrationMatsPersonControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MigrationMatsPersonControllerRef
    = AutoDisposeProviderRef<MigrationMatsPersonController>;
String _$findMigrationMatsPersonsHash() =>
    r'e9acf139ca43e9ff70b3dcdb931ae2b26e9c4ccb';

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

/// See also [findMigrationMatsPersons].
@ProviderFor(findMigrationMatsPersons)
const findMigrationMatsPersonsProvider = FindMigrationMatsPersonsFamily();

/// See also [findMigrationMatsPersons].
class FindMigrationMatsPersonsFamily
    extends Family<AsyncValue<List<MigrationMatsPerson>>> {
  /// See also [findMigrationMatsPersons].
  const FindMigrationMatsPersonsFamily();

  /// See also [findMigrationMatsPersons].
  FindMigrationMatsPersonsProvider call(
    String sessionId,
  ) {
    return FindMigrationMatsPersonsProvider(
      sessionId,
    );
  }

  @override
  FindMigrationMatsPersonsProvider getProviderOverride(
    covariant FindMigrationMatsPersonsProvider provider,
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
  String? get name => r'findMigrationMatsPersonsProvider';
}

/// See also [findMigrationMatsPersons].
class FindMigrationMatsPersonsProvider
    extends AutoDisposeFutureProvider<List<MigrationMatsPerson>> {
  /// See also [findMigrationMatsPersons].
  FindMigrationMatsPersonsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findMigrationMatsPersons(
            ref as FindMigrationMatsPersonsRef,
            sessionId,
          ),
          from: findMigrationMatsPersonsProvider,
          name: r'findMigrationMatsPersonsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findMigrationMatsPersonsHash,
          dependencies: FindMigrationMatsPersonsFamily._dependencies,
          allTransitiveDependencies:
              FindMigrationMatsPersonsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindMigrationMatsPersonsProvider._internal(
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
    FutureOr<List<MigrationMatsPerson>> Function(
            FindMigrationMatsPersonsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindMigrationMatsPersonsProvider._internal(
        (ref) => create(ref as FindMigrationMatsPersonsRef),
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
  AutoDisposeFutureProviderElement<List<MigrationMatsPerson>> createElement() {
    return _FindMigrationMatsPersonsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindMigrationMatsPersonsProvider &&
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
mixin FindMigrationMatsPersonsRef
    on AutoDisposeFutureProviderRef<List<MigrationMatsPerson>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindMigrationMatsPersonsProviderElement
    extends AutoDisposeFutureProviderElement<List<MigrationMatsPerson>>
    with FindMigrationMatsPersonsRef {
  _FindMigrationMatsPersonsProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FindMigrationMatsPersonsProvider).sessionId;
}

String _$fetchMigrationMatsPersonByIdHash() =>
    r'282d00f0983dd961e3ebe1fd3be0f0067e1b52c1';

/// See also [fetchMigrationMatsPersonById].
@ProviderFor(fetchMigrationMatsPersonById)
const fetchMigrationMatsPersonByIdProvider =
    FetchMigrationMatsPersonByIdFamily();

/// See also [fetchMigrationMatsPersonById].
class FetchMigrationMatsPersonByIdFamily
    extends Family<AsyncValue<MigrationMatsPerson>> {
  /// See also [fetchMigrationMatsPersonById].
  const FetchMigrationMatsPersonByIdFamily();

  /// See also [fetchMigrationMatsPersonById].
  FetchMigrationMatsPersonByIdProvider call(
    int id,
  ) {
    return FetchMigrationMatsPersonByIdProvider(
      id,
    );
  }

  @override
  FetchMigrationMatsPersonByIdProvider getProviderOverride(
    covariant FetchMigrationMatsPersonByIdProvider provider,
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
  String? get name => r'fetchMigrationMatsPersonByIdProvider';
}

/// See also [fetchMigrationMatsPersonById].
class FetchMigrationMatsPersonByIdProvider
    extends AutoDisposeFutureProvider<MigrationMatsPerson> {
  /// See also [fetchMigrationMatsPersonById].
  FetchMigrationMatsPersonByIdProvider(
    int id,
  ) : this._internal(
          (ref) => fetchMigrationMatsPersonById(
            ref as FetchMigrationMatsPersonByIdRef,
            id,
          ),
          from: fetchMigrationMatsPersonByIdProvider,
          name: r'fetchMigrationMatsPersonByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMigrationMatsPersonByIdHash,
          dependencies: FetchMigrationMatsPersonByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchMigrationMatsPersonByIdFamily._allTransitiveDependencies,
          id: id,
        );

  FetchMigrationMatsPersonByIdProvider._internal(
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
    FutureOr<MigrationMatsPerson> Function(
            FetchMigrationMatsPersonByIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchMigrationMatsPersonByIdProvider._internal(
        (ref) => create(ref as FetchMigrationMatsPersonByIdRef),
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
  AutoDisposeFutureProviderElement<MigrationMatsPerson> createElement() {
    return _FetchMigrationMatsPersonByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchMigrationMatsPersonByIdProvider && other.id == id;
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
mixin FetchMigrationMatsPersonByIdRef
    on AutoDisposeFutureProviderRef<MigrationMatsPerson> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchMigrationMatsPersonByIdProviderElement
    extends AutoDisposeFutureProviderElement<MigrationMatsPerson>
    with FetchMigrationMatsPersonByIdRef {
  _FetchMigrationMatsPersonByIdProviderElement(super.provider);

  @override
  int get id => (origin as FetchMigrationMatsPersonByIdProvider).id;
}

String _$watchMigrationMatsPersonUpdatesHash() =>
    r'ece13358545a2f208c606305aea2325b318af263';

/// See also [watchMigrationMatsPersonUpdates].
@ProviderFor(watchMigrationMatsPersonUpdates)
const watchMigrationMatsPersonUpdatesProvider =
    WatchMigrationMatsPersonUpdatesFamily();

/// See also [watchMigrationMatsPersonUpdates].
class WatchMigrationMatsPersonUpdatesFamily
    extends Family<AsyncValue<MigrationMatsPerson>> {
  /// See also [watchMigrationMatsPersonUpdates].
  const WatchMigrationMatsPersonUpdatesFamily();

  /// See also [watchMigrationMatsPersonUpdates].
  WatchMigrationMatsPersonUpdatesProvider call({
    required int id,
  }) {
    return WatchMigrationMatsPersonUpdatesProvider(
      id: id,
    );
  }

  @override
  WatchMigrationMatsPersonUpdatesProvider getProviderOverride(
    covariant WatchMigrationMatsPersonUpdatesProvider provider,
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
  String? get name => r'watchMigrationMatsPersonUpdatesProvider';
}

/// See also [watchMigrationMatsPersonUpdates].
class WatchMigrationMatsPersonUpdatesProvider
    extends AutoDisposeStreamProvider<MigrationMatsPerson> {
  /// See also [watchMigrationMatsPersonUpdates].
  WatchMigrationMatsPersonUpdatesProvider({
    required int id,
  }) : this._internal(
          (ref) => watchMigrationMatsPersonUpdates(
            ref as WatchMigrationMatsPersonUpdatesRef,
            id: id,
          ),
          from: watchMigrationMatsPersonUpdatesProvider,
          name: r'watchMigrationMatsPersonUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchMigrationMatsPersonUpdatesHash,
          dependencies: WatchMigrationMatsPersonUpdatesFamily._dependencies,
          allTransitiveDependencies:
              WatchMigrationMatsPersonUpdatesFamily._allTransitiveDependencies,
          id: id,
        );

  WatchMigrationMatsPersonUpdatesProvider._internal(
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
    Stream<MigrationMatsPerson> Function(
            WatchMigrationMatsPersonUpdatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchMigrationMatsPersonUpdatesProvider._internal(
        (ref) => create(ref as WatchMigrationMatsPersonUpdatesRef),
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
  AutoDisposeStreamProviderElement<MigrationMatsPerson> createElement() {
    return _WatchMigrationMatsPersonUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchMigrationMatsPersonUpdatesProvider && other.id == id;
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
mixin WatchMigrationMatsPersonUpdatesRef
    on AutoDisposeStreamProviderRef<MigrationMatsPerson> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WatchMigrationMatsPersonUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<MigrationMatsPerson>
    with WatchMigrationMatsPersonUpdatesRef {
  _WatchMigrationMatsPersonUpdatesProviderElement(super.provider);

  @override
  int get id => (origin as WatchMigrationMatsPersonUpdatesProvider).id;
}

String _$fetchAndWatchMigrationMatsPersonHash() =>
    r'83e0454e9ce7f272ab346ca5e8ffa9a27747fc73';

abstract class _$FetchAndWatchMigrationMatsPerson
    extends BuildlessAutoDisposeAsyncNotifier<MigrationMatsPerson> {
  late final int id;

  FutureOr<MigrationMatsPerson> build(
    int id,
  );
}

/// See also [FetchAndWatchMigrationMatsPerson].
@ProviderFor(FetchAndWatchMigrationMatsPerson)
const fetchAndWatchMigrationMatsPersonProvider =
    FetchAndWatchMigrationMatsPersonFamily();

/// See also [FetchAndWatchMigrationMatsPerson].
class FetchAndWatchMigrationMatsPersonFamily
    extends Family<AsyncValue<MigrationMatsPerson>> {
  /// See also [FetchAndWatchMigrationMatsPerson].
  const FetchAndWatchMigrationMatsPersonFamily();

  /// See also [FetchAndWatchMigrationMatsPerson].
  FetchAndWatchMigrationMatsPersonProvider call(
    int id,
  ) {
    return FetchAndWatchMigrationMatsPersonProvider(
      id,
    );
  }

  @override
  FetchAndWatchMigrationMatsPersonProvider getProviderOverride(
    covariant FetchAndWatchMigrationMatsPersonProvider provider,
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
  String? get name => r'fetchAndWatchMigrationMatsPersonProvider';
}

/// See also [FetchAndWatchMigrationMatsPerson].
class FetchAndWatchMigrationMatsPersonProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        FetchAndWatchMigrationMatsPerson, MigrationMatsPerson> {
  /// See also [FetchAndWatchMigrationMatsPerson].
  FetchAndWatchMigrationMatsPersonProvider(
    int id,
  ) : this._internal(
          () => FetchAndWatchMigrationMatsPerson()..id = id,
          from: fetchAndWatchMigrationMatsPersonProvider,
          name: r'fetchAndWatchMigrationMatsPersonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchMigrationMatsPersonHash,
          dependencies: FetchAndWatchMigrationMatsPersonFamily._dependencies,
          allTransitiveDependencies:
              FetchAndWatchMigrationMatsPersonFamily._allTransitiveDependencies,
          id: id,
        );

  FetchAndWatchMigrationMatsPersonProvider._internal(
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
  FutureOr<MigrationMatsPerson> runNotifierBuild(
    covariant FetchAndWatchMigrationMatsPerson notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(FetchAndWatchMigrationMatsPerson Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchAndWatchMigrationMatsPersonProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FetchAndWatchMigrationMatsPerson,
      MigrationMatsPerson> createElement() {
    return _FetchAndWatchMigrationMatsPersonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAndWatchMigrationMatsPersonProvider && other.id == id;
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
mixin FetchAndWatchMigrationMatsPersonRef
    on AutoDisposeAsyncNotifierProviderRef<MigrationMatsPerson> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchAndWatchMigrationMatsPersonProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        FetchAndWatchMigrationMatsPerson,
        MigrationMatsPerson> with FetchAndWatchMigrationMatsPersonRef {
  _FetchAndWatchMigrationMatsPersonProviderElement(super.provider);

  @override
  int get id => (origin as FetchAndWatchMigrationMatsPersonProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
