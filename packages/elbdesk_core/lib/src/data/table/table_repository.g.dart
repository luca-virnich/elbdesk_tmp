// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchTableConfigsHash() => r'f00b2e093883535c5d9f9b337eee45e3d6f02579';

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

/// Fetch Table Configs Provider
///
/// This provider is used to fetch a list of TableConfigs from the server.
///
/// Each TableConfig holds a possible view for a table
/// Can be empty, but not null
///
/// Copied from [fetchTableConfigs].
@ProviderFor(fetchTableConfigs)
const fetchTableConfigsProvider = FetchTableConfigsFamily();

/// Fetch Table Configs Provider
///
/// This provider is used to fetch a list of TableConfigs from the server.
///
/// Each TableConfig holds a possible view for a table
/// Can be empty, but not null
///
/// Copied from [fetchTableConfigs].
class FetchTableConfigsFamily extends Family<AsyncValue<List<TableConfig>>> {
  /// Fetch Table Configs Provider
  ///
  /// This provider is used to fetch a list of TableConfigs from the server.
  ///
  /// Each TableConfig holds a possible view for a table
  /// Can be empty, but not null
  ///
  /// Copied from [fetchTableConfigs].
  const FetchTableConfigsFamily();

  /// Fetch Table Configs Provider
  ///
  /// This provider is used to fetch a list of TableConfigs from the server.
  ///
  /// Each TableConfig holds a possible view for a table
  /// Can be empty, but not null
  ///
  /// Copied from [fetchTableConfigs].
  FetchTableConfigsProvider call({
    required String componentIdentifier,
    required String sessionId,
  }) {
    return FetchTableConfigsProvider(
      componentIdentifier: componentIdentifier,
      sessionId: sessionId,
    );
  }

  @override
  FetchTableConfigsProvider getProviderOverride(
    covariant FetchTableConfigsProvider provider,
  ) {
    return call(
      componentIdentifier: provider.componentIdentifier,
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
  String? get name => r'fetchTableConfigsProvider';
}

/// Fetch Table Configs Provider
///
/// This provider is used to fetch a list of TableConfigs from the server.
///
/// Each TableConfig holds a possible view for a table
/// Can be empty, but not null
///
/// Copied from [fetchTableConfigs].
class FetchTableConfigsProvider
    extends AutoDisposeFutureProvider<List<TableConfig>> {
  /// Fetch Table Configs Provider
  ///
  /// This provider is used to fetch a list of TableConfigs from the server.
  ///
  /// Each TableConfig holds a possible view for a table
  /// Can be empty, but not null
  ///
  /// Copied from [fetchTableConfigs].
  FetchTableConfigsProvider({
    required String componentIdentifier,
    required String sessionId,
  }) : this._internal(
          (ref) => fetchTableConfigs(
            ref as FetchTableConfigsRef,
            componentIdentifier: componentIdentifier,
            sessionId: sessionId,
          ),
          from: fetchTableConfigsProvider,
          name: r'fetchTableConfigsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchTableConfigsHash,
          dependencies: FetchTableConfigsFamily._dependencies,
          allTransitiveDependencies:
              FetchTableConfigsFamily._allTransitiveDependencies,
          componentIdentifier: componentIdentifier,
          sessionId: sessionId,
        );

  FetchTableConfigsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.componentIdentifier,
    required this.sessionId,
  }) : super.internal();

  final String componentIdentifier;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<TableConfig>> Function(FetchTableConfigsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchTableConfigsProvider._internal(
        (ref) => create(ref as FetchTableConfigsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        componentIdentifier: componentIdentifier,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TableConfig>> createElement() {
    return _FetchTableConfigsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchTableConfigsProvider &&
        other.componentIdentifier == componentIdentifier &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, componentIdentifier.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchTableConfigsRef on AutoDisposeFutureProviderRef<List<TableConfig>> {
  /// The parameter `componentIdentifier` of this provider.
  String get componentIdentifier;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchTableConfigsProviderElement
    extends AutoDisposeFutureProviderElement<List<TableConfig>>
    with FetchTableConfigsRef {
  _FetchTableConfigsProviderElement(super.provider);

  @override
  String get componentIdentifier =>
      (origin as FetchTableConfigsProvider).componentIdentifier;
  @override
  String get sessionId => (origin as FetchTableConfigsProvider).sessionId;
}

String _$tableRepositoryHash() => r'abf854c26fbde7a81a02243eb23e78934d5e4f37';

/// Table Repository Provider
///
/// Copied from [tableRepository].
@ProviderFor(tableRepository)
final tableRepositoryProvider = AutoDisposeProvider<TableRepository>.internal(
  tableRepository,
  name: r'tableRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tableRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TableRepositoryRef = AutoDisposeProviderRef<TableRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
