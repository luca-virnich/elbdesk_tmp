// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$findAppClientsHash() => r'9a4aebc66d7d136115c4a9d39dd59c10e432b641';

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

/// See also [findAppClients].
@ProviderFor(findAppClients)
const findAppClientsProvider = FindAppClientsFamily();

/// See also [findAppClients].
class FindAppClientsFamily extends Family<AsyncValue<List<AppClient>>> {
  /// See also [findAppClients].
  const FindAppClientsFamily();

  /// See also [findAppClients].
  FindAppClientsProvider call(
    String sessionId,
  ) {
    return FindAppClientsProvider(
      sessionId,
    );
  }

  @override
  FindAppClientsProvider getProviderOverride(
    covariant FindAppClientsProvider provider,
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
  String? get name => r'findAppClientsProvider';
}

/// See also [findAppClients].
class FindAppClientsProvider
    extends AutoDisposeFutureProvider<List<AppClient>> {
  /// See also [findAppClients].
  FindAppClientsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findAppClients(
            ref as FindAppClientsRef,
            sessionId,
          ),
          from: findAppClientsProvider,
          name: r'findAppClientsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAppClientsHash,
          dependencies: FindAppClientsFamily._dependencies,
          allTransitiveDependencies:
              FindAppClientsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindAppClientsProvider._internal(
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
    FutureOr<List<AppClient>> Function(FindAppClientsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindAppClientsProvider._internal(
        (ref) => create(ref as FindAppClientsRef),
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
  AutoDisposeFutureProviderElement<List<AppClient>> createElement() {
    return _FindAppClientsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindAppClientsProvider && other.sessionId == sessionId;
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
mixin FindAppClientsRef on AutoDisposeFutureProviderRef<List<AppClient>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindAppClientsProviderElement
    extends AutoDisposeFutureProviderElement<List<AppClient>>
    with FindAppClientsRef {
  _FindAppClientsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindAppClientsProvider).sessionId;
}

String _$appClientRepositoryHash() =>
    r'7eda724dea5c36085b5864b5228cf6f0fbe2171d';

/// See also [appClientRepository].
@ProviderFor(appClientRepository)
final appClientRepositoryProvider =
    AutoDisposeProvider<AppClientRepository>.internal(
  appClientRepository,
  name: r'appClientRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appClientRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppClientRepositoryRef = AutoDisposeProviderRef<AppClientRepository>;
String _$watchAllAppClientsHash() =>
    r'e04a6d442b372401733c4290f6c34803c8218102';

/// See also [watchAllAppClients].
@ProviderFor(watchAllAppClients)
final watchAllAppClientsProvider =
    AutoDisposeStreamProvider<AppClient>.internal(
  watchAllAppClients,
  name: r'watchAllAppClientsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAllAppClientsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllAppClientsRef = AutoDisposeStreamProviderRef<AppClient>;
String _$fetchAndWatchAllAppClientsHash() =>
    r'4dd7e54e6cbbea3d74db5212865e9421bd50e479';

/// See also [FetchAndWatchAllAppClients].
@ProviderFor(FetchAndWatchAllAppClients)
final fetchAndWatchAllAppClientsProvider = AutoDisposeAsyncNotifierProvider<
    FetchAndWatchAllAppClients, List<AppClient>>.internal(
  FetchAndWatchAllAppClients.new,
  name: r'fetchAndWatchAllAppClientsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAndWatchAllAppClientsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FetchAndWatchAllAppClients
    = AutoDisposeAsyncNotifier<List<AppClient>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
