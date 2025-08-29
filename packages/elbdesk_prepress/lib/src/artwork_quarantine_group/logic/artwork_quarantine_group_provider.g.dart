// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_quarantine_group_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkQuarantineGroupRepositoryHash() =>
    r'faab58d3ec18acd093844cd03a7f8c31a5031ea2';

/// Artwork Quarantine Group Repository Provider
///
/// Copied from [artworkQuarantineGroupRepository].
@ProviderFor(artworkQuarantineGroupRepository)
final artworkQuarantineGroupRepositoryProvider =
    AutoDisposeProvider<ArtworkQuarantineGroupRepository>.internal(
  artworkQuarantineGroupRepository,
  name: r'artworkQuarantineGroupRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$artworkQuarantineGroupRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArtworkQuarantineGroupRepositoryRef
    = AutoDisposeProviderRef<ArtworkQuarantineGroupRepository>;
String _$findArtworkQuarantineGroupsHash() =>
    r'f097311192fbb16e303e57c653c76a8a80155f26';

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

/// Find Artwork Quarantine Groups Provider
///
/// Copied from [findArtworkQuarantineGroups].
@ProviderFor(findArtworkQuarantineGroups)
const findArtworkQuarantineGroupsProvider = FindArtworkQuarantineGroupsFamily();

/// Find Artwork Quarantine Groups Provider
///
/// Copied from [findArtworkQuarantineGroups].
class FindArtworkQuarantineGroupsFamily
    extends Family<AsyncValue<List<ArtworkQuarantineGroup>>> {
  /// Find Artwork Quarantine Groups Provider
  ///
  /// Copied from [findArtworkQuarantineGroups].
  const FindArtworkQuarantineGroupsFamily();

  /// Find Artwork Quarantine Groups Provider
  ///
  /// Copied from [findArtworkQuarantineGroups].
  FindArtworkQuarantineGroupsProvider call(
    String sessionId,
  ) {
    return FindArtworkQuarantineGroupsProvider(
      sessionId,
    );
  }

  @override
  FindArtworkQuarantineGroupsProvider getProviderOverride(
    covariant FindArtworkQuarantineGroupsProvider provider,
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
  String? get name => r'findArtworkQuarantineGroupsProvider';
}

/// Find Artwork Quarantine Groups Provider
///
/// Copied from [findArtworkQuarantineGroups].
class FindArtworkQuarantineGroupsProvider
    extends AutoDisposeFutureProvider<List<ArtworkQuarantineGroup>> {
  /// Find Artwork Quarantine Groups Provider
  ///
  /// Copied from [findArtworkQuarantineGroups].
  FindArtworkQuarantineGroupsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findArtworkQuarantineGroups(
            ref as FindArtworkQuarantineGroupsRef,
            sessionId,
          ),
          from: findArtworkQuarantineGroupsProvider,
          name: r'findArtworkQuarantineGroupsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findArtworkQuarantineGroupsHash,
          dependencies: FindArtworkQuarantineGroupsFamily._dependencies,
          allTransitiveDependencies:
              FindArtworkQuarantineGroupsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindArtworkQuarantineGroupsProvider._internal(
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
    FutureOr<List<ArtworkQuarantineGroup>> Function(
            FindArtworkQuarantineGroupsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindArtworkQuarantineGroupsProvider._internal(
        (ref) => create(ref as FindArtworkQuarantineGroupsRef),
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
  AutoDisposeFutureProviderElement<List<ArtworkQuarantineGroup>>
      createElement() {
    return _FindArtworkQuarantineGroupsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindArtworkQuarantineGroupsProvider &&
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
mixin FindArtworkQuarantineGroupsRef
    on AutoDisposeFutureProviderRef<List<ArtworkQuarantineGroup>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindArtworkQuarantineGroupsProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkQuarantineGroup>>
    with FindArtworkQuarantineGroupsRef {
  _FindArtworkQuarantineGroupsProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FindArtworkQuarantineGroupsProvider).sessionId;
}

String _$fetchArtworkQuarantineGroupHash() =>
    r'29bfb4e06951a8e31a83f915d2147b163139af98';

/// Fetch Artwork Quarantine Group Provider
///
/// Copied from [fetchArtworkQuarantineGroup].
@ProviderFor(fetchArtworkQuarantineGroup)
const fetchArtworkQuarantineGroupProvider = FetchArtworkQuarantineGroupFamily();

/// Fetch Artwork Quarantine Group Provider
///
/// Copied from [fetchArtworkQuarantineGroup].
class FetchArtworkQuarantineGroupFamily
    extends Family<AsyncValue<ArtworkQuarantineGroup?>> {
  /// Fetch Artwork Quarantine Group Provider
  ///
  /// Copied from [fetchArtworkQuarantineGroup].
  const FetchArtworkQuarantineGroupFamily();

  /// Fetch Artwork Quarantine Group Provider
  ///
  /// Copied from [fetchArtworkQuarantineGroup].
  FetchArtworkQuarantineGroupProvider call(
    int artworkQuarantineGroupId,
  ) {
    return FetchArtworkQuarantineGroupProvider(
      artworkQuarantineGroupId,
    );
  }

  @override
  FetchArtworkQuarantineGroupProvider getProviderOverride(
    covariant FetchArtworkQuarantineGroupProvider provider,
  ) {
    return call(
      provider.artworkQuarantineGroupId,
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
  String? get name => r'fetchArtworkQuarantineGroupProvider';
}

/// Fetch Artwork Quarantine Group Provider
///
/// Copied from [fetchArtworkQuarantineGroup].
class FetchArtworkQuarantineGroupProvider
    extends AutoDisposeFutureProvider<ArtworkQuarantineGroup?> {
  /// Fetch Artwork Quarantine Group Provider
  ///
  /// Copied from [fetchArtworkQuarantineGroup].
  FetchArtworkQuarantineGroupProvider(
    int artworkQuarantineGroupId,
  ) : this._internal(
          (ref) => fetchArtworkQuarantineGroup(
            ref as FetchArtworkQuarantineGroupRef,
            artworkQuarantineGroupId,
          ),
          from: fetchArtworkQuarantineGroupProvider,
          name: r'fetchArtworkQuarantineGroupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkQuarantineGroupHash,
          dependencies: FetchArtworkQuarantineGroupFamily._dependencies,
          allTransitiveDependencies:
              FetchArtworkQuarantineGroupFamily._allTransitiveDependencies,
          artworkQuarantineGroupId: artworkQuarantineGroupId,
        );

  FetchArtworkQuarantineGroupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkQuarantineGroupId,
  }) : super.internal();

  final int artworkQuarantineGroupId;

  @override
  Override overrideWith(
    FutureOr<ArtworkQuarantineGroup?> Function(
            FetchArtworkQuarantineGroupRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkQuarantineGroupProvider._internal(
        (ref) => create(ref as FetchArtworkQuarantineGroupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkQuarantineGroupId: artworkQuarantineGroupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ArtworkQuarantineGroup?> createElement() {
    return _FetchArtworkQuarantineGroupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkQuarantineGroupProvider &&
        other.artworkQuarantineGroupId == artworkQuarantineGroupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkQuarantineGroupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchArtworkQuarantineGroupRef
    on AutoDisposeFutureProviderRef<ArtworkQuarantineGroup?> {
  /// The parameter `artworkQuarantineGroupId` of this provider.
  int get artworkQuarantineGroupId;
}

class _FetchArtworkQuarantineGroupProviderElement
    extends AutoDisposeFutureProviderElement<ArtworkQuarantineGroup?>
    with FetchArtworkQuarantineGroupRef {
  _FetchArtworkQuarantineGroupProviderElement(super.provider);

  @override
  int get artworkQuarantineGroupId =>
      (origin as FetchArtworkQuarantineGroupProvider).artworkQuarantineGroupId;
}

String _$watchArtworkQuarantineGroupHash() =>
    r'147ef6a2129e04cb91e9ff0663ba7e24ad833adb';

/// Watch Artwork Quarantine Group Stream Provider
///
/// Copied from [watchArtworkQuarantineGroup].
@ProviderFor(watchArtworkQuarantineGroup)
const watchArtworkQuarantineGroupProvider = WatchArtworkQuarantineGroupFamily();

/// Watch Artwork Quarantine Group Stream Provider
///
/// Copied from [watchArtworkQuarantineGroup].
class WatchArtworkQuarantineGroupFamily
    extends Family<AsyncValue<ArtworkQuarantineGroup>> {
  /// Watch Artwork Quarantine Group Stream Provider
  ///
  /// Copied from [watchArtworkQuarantineGroup].
  const WatchArtworkQuarantineGroupFamily();

  /// Watch Artwork Quarantine Group Stream Provider
  ///
  /// Copied from [watchArtworkQuarantineGroup].
  WatchArtworkQuarantineGroupProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchArtworkQuarantineGroupProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchArtworkQuarantineGroupProvider getProviderOverride(
    covariant WatchArtworkQuarantineGroupProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
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
  String? get name => r'watchArtworkQuarantineGroupProvider';
}

/// Watch Artwork Quarantine Group Stream Provider
///
/// Copied from [watchArtworkQuarantineGroup].
class WatchArtworkQuarantineGroupProvider
    extends AutoDisposeStreamProvider<ArtworkQuarantineGroup> {
  /// Watch Artwork Quarantine Group Stream Provider
  ///
  /// Copied from [watchArtworkQuarantineGroup].
  WatchArtworkQuarantineGroupProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchArtworkQuarantineGroup(
            ref as WatchArtworkQuarantineGroupRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchArtworkQuarantineGroupProvider,
          name: r'watchArtworkQuarantineGroupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantineGroupHash,
          dependencies: WatchArtworkQuarantineGroupFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkQuarantineGroupFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchArtworkQuarantineGroupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.id,
  }) : super.internal();

  final String sessionId;
  final int id;

  @override
  Override overrideWith(
    Stream<ArtworkQuarantineGroup> Function(
            WatchArtworkQuarantineGroupRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkQuarantineGroupProvider._internal(
        (ref) => create(ref as WatchArtworkQuarantineGroupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ArtworkQuarantineGroup> createElement() {
    return _WatchArtworkQuarantineGroupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantineGroupProvider &&
        other.sessionId == sessionId &&
        other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkQuarantineGroupRef
    on AutoDisposeStreamProviderRef<ArtworkQuarantineGroup> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchArtworkQuarantineGroupProviderElement
    extends AutoDisposeStreamProviderElement<ArtworkQuarantineGroup>
    with WatchArtworkQuarantineGroupRef {
  _WatchArtworkQuarantineGroupProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchArtworkQuarantineGroupProvider).sessionId;
  @override
  int get id => (origin as WatchArtworkQuarantineGroupProvider).id;
}

String _$fetchArtworkQuarantineGroupsByCustomerIdHash() =>
    r'85eb88c4c9e05413fa0305869f20f9e1d71cd1ad';

/// Fetch Artwork Quarantine Groups By Customer ID Provider
///
/// Copied from [fetchArtworkQuarantineGroupsByCustomerId].
@ProviderFor(fetchArtworkQuarantineGroupsByCustomerId)
const fetchArtworkQuarantineGroupsByCustomerIdProvider =
    FetchArtworkQuarantineGroupsByCustomerIdFamily();

/// Fetch Artwork Quarantine Groups By Customer ID Provider
///
/// Copied from [fetchArtworkQuarantineGroupsByCustomerId].
class FetchArtworkQuarantineGroupsByCustomerIdFamily
    extends Family<AsyncValue<List<ArtworkQuarantineGroup>>> {
  /// Fetch Artwork Quarantine Groups By Customer ID Provider
  ///
  /// Copied from [fetchArtworkQuarantineGroupsByCustomerId].
  const FetchArtworkQuarantineGroupsByCustomerIdFamily();

  /// Fetch Artwork Quarantine Groups By Customer ID Provider
  ///
  /// Copied from [fetchArtworkQuarantineGroupsByCustomerId].
  FetchArtworkQuarantineGroupsByCustomerIdProvider call(
    int customerId,
  ) {
    return FetchArtworkQuarantineGroupsByCustomerIdProvider(
      customerId,
    );
  }

  @override
  FetchArtworkQuarantineGroupsByCustomerIdProvider getProviderOverride(
    covariant FetchArtworkQuarantineGroupsByCustomerIdProvider provider,
  ) {
    return call(
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
  String? get name => r'fetchArtworkQuarantineGroupsByCustomerIdProvider';
}

/// Fetch Artwork Quarantine Groups By Customer ID Provider
///
/// Copied from [fetchArtworkQuarantineGroupsByCustomerId].
class FetchArtworkQuarantineGroupsByCustomerIdProvider
    extends AutoDisposeFutureProvider<List<ArtworkQuarantineGroup>> {
  /// Fetch Artwork Quarantine Groups By Customer ID Provider
  ///
  /// Copied from [fetchArtworkQuarantineGroupsByCustomerId].
  FetchArtworkQuarantineGroupsByCustomerIdProvider(
    int customerId,
  ) : this._internal(
          (ref) => fetchArtworkQuarantineGroupsByCustomerId(
            ref as FetchArtworkQuarantineGroupsByCustomerIdRef,
            customerId,
          ),
          from: fetchArtworkQuarantineGroupsByCustomerIdProvider,
          name: r'fetchArtworkQuarantineGroupsByCustomerIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkQuarantineGroupsByCustomerIdHash,
          dependencies:
              FetchArtworkQuarantineGroupsByCustomerIdFamily._dependencies,
          allTransitiveDependencies:
              FetchArtworkQuarantineGroupsByCustomerIdFamily
                  ._allTransitiveDependencies,
          customerId: customerId,
        );

  FetchArtworkQuarantineGroupsByCustomerIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
  }) : super.internal();

  final int customerId;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkQuarantineGroup>> Function(
            FetchArtworkQuarantineGroupsByCustomerIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkQuarantineGroupsByCustomerIdProvider._internal(
        (ref) => create(ref as FetchArtworkQuarantineGroupsByCustomerIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkQuarantineGroup>>
      createElement() {
    return _FetchArtworkQuarantineGroupsByCustomerIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkQuarantineGroupsByCustomerIdProvider &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchArtworkQuarantineGroupsByCustomerIdRef
    on AutoDisposeFutureProviderRef<List<ArtworkQuarantineGroup>> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _FetchArtworkQuarantineGroupsByCustomerIdProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkQuarantineGroup>>
    with FetchArtworkQuarantineGroupsByCustomerIdRef {
  _FetchArtworkQuarantineGroupsByCustomerIdProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as FetchArtworkQuarantineGroupsByCustomerIdProvider).customerId;
}

String _$watchArtworkQuarantineGroupUpdatesByCustomerIdHash() =>
    r'b23f109806153effd32b16ce8534f51c79385527';

/// Watch Artwork Quarantine Group Updates By Customer ID Stream Provider
///
/// Copied from [watchArtworkQuarantineGroupUpdatesByCustomerId].
@ProviderFor(watchArtworkQuarantineGroupUpdatesByCustomerId)
const watchArtworkQuarantineGroupUpdatesByCustomerIdProvider =
    WatchArtworkQuarantineGroupUpdatesByCustomerIdFamily();

/// Watch Artwork Quarantine Group Updates By Customer ID Stream Provider
///
/// Copied from [watchArtworkQuarantineGroupUpdatesByCustomerId].
class WatchArtworkQuarantineGroupUpdatesByCustomerIdFamily
    extends Family<AsyncValue<ArtworkQuarantineGroup>> {
  /// Watch Artwork Quarantine Group Updates By Customer ID Stream Provider
  ///
  /// Copied from [watchArtworkQuarantineGroupUpdatesByCustomerId].
  const WatchArtworkQuarantineGroupUpdatesByCustomerIdFamily();

  /// Watch Artwork Quarantine Group Updates By Customer ID Stream Provider
  ///
  /// Copied from [watchArtworkQuarantineGroupUpdatesByCustomerId].
  WatchArtworkQuarantineGroupUpdatesByCustomerIdProvider call(
    int customerId,
  ) {
    return WatchArtworkQuarantineGroupUpdatesByCustomerIdProvider(
      customerId,
    );
  }

  @override
  WatchArtworkQuarantineGroupUpdatesByCustomerIdProvider getProviderOverride(
    covariant WatchArtworkQuarantineGroupUpdatesByCustomerIdProvider provider,
  ) {
    return call(
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
  String? get name => r'watchArtworkQuarantineGroupUpdatesByCustomerIdProvider';
}

/// Watch Artwork Quarantine Group Updates By Customer ID Stream Provider
///
/// Copied from [watchArtworkQuarantineGroupUpdatesByCustomerId].
class WatchArtworkQuarantineGroupUpdatesByCustomerIdProvider
    extends AutoDisposeStreamProvider<ArtworkQuarantineGroup> {
  /// Watch Artwork Quarantine Group Updates By Customer ID Stream Provider
  ///
  /// Copied from [watchArtworkQuarantineGroupUpdatesByCustomerId].
  WatchArtworkQuarantineGroupUpdatesByCustomerIdProvider(
    int customerId,
  ) : this._internal(
          (ref) => watchArtworkQuarantineGroupUpdatesByCustomerId(
            ref as WatchArtworkQuarantineGroupUpdatesByCustomerIdRef,
            customerId,
          ),
          from: watchArtworkQuarantineGroupUpdatesByCustomerIdProvider,
          name: r'watchArtworkQuarantineGroupUpdatesByCustomerIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantineGroupUpdatesByCustomerIdHash,
          dependencies: WatchArtworkQuarantineGroupUpdatesByCustomerIdFamily
              ._dependencies,
          allTransitiveDependencies:
              WatchArtworkQuarantineGroupUpdatesByCustomerIdFamily
                  ._allTransitiveDependencies,
          customerId: customerId,
        );

  WatchArtworkQuarantineGroupUpdatesByCustomerIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
  }) : super.internal();

  final int customerId;

  @override
  Override overrideWith(
    Stream<ArtworkQuarantineGroup> Function(
            WatchArtworkQuarantineGroupUpdatesByCustomerIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override:
          WatchArtworkQuarantineGroupUpdatesByCustomerIdProvider._internal(
        (ref) =>
            create(ref as WatchArtworkQuarantineGroupUpdatesByCustomerIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ArtworkQuarantineGroup> createElement() {
    return _WatchArtworkQuarantineGroupUpdatesByCustomerIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantineGroupUpdatesByCustomerIdProvider &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkQuarantineGroupUpdatesByCustomerIdRef
    on AutoDisposeStreamProviderRef<ArtworkQuarantineGroup> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _WatchArtworkQuarantineGroupUpdatesByCustomerIdProviderElement
    extends AutoDisposeStreamProviderElement<ArtworkQuarantineGroup>
    with WatchArtworkQuarantineGroupUpdatesByCustomerIdRef {
  _WatchArtworkQuarantineGroupUpdatesByCustomerIdProviderElement(
      super.provider);

  @override
  int get customerId =>
      (origin as WatchArtworkQuarantineGroupUpdatesByCustomerIdProvider)
          .customerId;
}

String _$watchArtworkQuarantineGroupsByStatusStreamHash() =>
    r'6985c8ec7acfa17680f1f63fdae1ab9897501013';

/// Watch Artwork Quarantine Groups By Status Stream Provider
///
/// Copied from [watchArtworkQuarantineGroupsByStatusStream].
@ProviderFor(watchArtworkQuarantineGroupsByStatusStream)
const watchArtworkQuarantineGroupsByStatusStreamProvider =
    WatchArtworkQuarantineGroupsByStatusStreamFamily();

/// Watch Artwork Quarantine Groups By Status Stream Provider
///
/// Copied from [watchArtworkQuarantineGroupsByStatusStream].
class WatchArtworkQuarantineGroupsByStatusStreamFamily
    extends Family<AsyncValue<ArtworkQuarantineGroup>> {
  /// Watch Artwork Quarantine Groups By Status Stream Provider
  ///
  /// Copied from [watchArtworkQuarantineGroupsByStatusStream].
  const WatchArtworkQuarantineGroupsByStatusStreamFamily();

  /// Watch Artwork Quarantine Groups By Status Stream Provider
  ///
  /// Copied from [watchArtworkQuarantineGroupsByStatusStream].
  WatchArtworkQuarantineGroupsByStatusStreamProvider call(
    ArtworkQuarantineGroupStatus status,
  ) {
    return WatchArtworkQuarantineGroupsByStatusStreamProvider(
      status,
    );
  }

  @override
  WatchArtworkQuarantineGroupsByStatusStreamProvider getProviderOverride(
    covariant WatchArtworkQuarantineGroupsByStatusStreamProvider provider,
  ) {
    return call(
      provider.status,
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
  String? get name => r'watchArtworkQuarantineGroupsByStatusStreamProvider';
}

/// Watch Artwork Quarantine Groups By Status Stream Provider
///
/// Copied from [watchArtworkQuarantineGroupsByStatusStream].
class WatchArtworkQuarantineGroupsByStatusStreamProvider
    extends AutoDisposeStreamProvider<ArtworkQuarantineGroup> {
  /// Watch Artwork Quarantine Groups By Status Stream Provider
  ///
  /// Copied from [watchArtworkQuarantineGroupsByStatusStream].
  WatchArtworkQuarantineGroupsByStatusStreamProvider(
    ArtworkQuarantineGroupStatus status,
  ) : this._internal(
          (ref) => watchArtworkQuarantineGroupsByStatusStream(
            ref as WatchArtworkQuarantineGroupsByStatusStreamRef,
            status,
          ),
          from: watchArtworkQuarantineGroupsByStatusStreamProvider,
          name: r'watchArtworkQuarantineGroupsByStatusStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantineGroupsByStatusStreamHash,
          dependencies:
              WatchArtworkQuarantineGroupsByStatusStreamFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkQuarantineGroupsByStatusStreamFamily
                  ._allTransitiveDependencies,
          status: status,
        );

  WatchArtworkQuarantineGroupsByStatusStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final ArtworkQuarantineGroupStatus status;

  @override
  Override overrideWith(
    Stream<ArtworkQuarantineGroup> Function(
            WatchArtworkQuarantineGroupsByStatusStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkQuarantineGroupsByStatusStreamProvider._internal(
        (ref) => create(ref as WatchArtworkQuarantineGroupsByStatusStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ArtworkQuarantineGroup> createElement() {
    return _WatchArtworkQuarantineGroupsByStatusStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantineGroupsByStatusStreamProvider &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkQuarantineGroupsByStatusStreamRef
    on AutoDisposeStreamProviderRef<ArtworkQuarantineGroup> {
  /// The parameter `status` of this provider.
  ArtworkQuarantineGroupStatus get status;
}

class _WatchArtworkQuarantineGroupsByStatusStreamProviderElement
    extends AutoDisposeStreamProviderElement<ArtworkQuarantineGroup>
    with WatchArtworkQuarantineGroupsByStatusStreamRef {
  _WatchArtworkQuarantineGroupsByStatusStreamProviderElement(super.provider);

  @override
  ArtworkQuarantineGroupStatus get status =>
      (origin as WatchArtworkQuarantineGroupsByStatusStreamProvider).status;
}

String _$fetchArtworkQuarantineGroupsByStatusHash() =>
    r'5c96a1e3fae066177c760c0583ed45d04f37438c';

/// Fetch Artwork Quarantine Groups By Status Provider
///
/// Copied from [fetchArtworkQuarantineGroupsByStatus].
@ProviderFor(fetchArtworkQuarantineGroupsByStatus)
const fetchArtworkQuarantineGroupsByStatusProvider =
    FetchArtworkQuarantineGroupsByStatusFamily();

/// Fetch Artwork Quarantine Groups By Status Provider
///
/// Copied from [fetchArtworkQuarantineGroupsByStatus].
class FetchArtworkQuarantineGroupsByStatusFamily
    extends Family<AsyncValue<List<ArtworkQuarantineGroup>>> {
  /// Fetch Artwork Quarantine Groups By Status Provider
  ///
  /// Copied from [fetchArtworkQuarantineGroupsByStatus].
  const FetchArtworkQuarantineGroupsByStatusFamily();

  /// Fetch Artwork Quarantine Groups By Status Provider
  ///
  /// Copied from [fetchArtworkQuarantineGroupsByStatus].
  FetchArtworkQuarantineGroupsByStatusProvider call(
    ArtworkQuarantineGroupStatus status,
  ) {
    return FetchArtworkQuarantineGroupsByStatusProvider(
      status,
    );
  }

  @override
  FetchArtworkQuarantineGroupsByStatusProvider getProviderOverride(
    covariant FetchArtworkQuarantineGroupsByStatusProvider provider,
  ) {
    return call(
      provider.status,
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
  String? get name => r'fetchArtworkQuarantineGroupsByStatusProvider';
}

/// Fetch Artwork Quarantine Groups By Status Provider
///
/// Copied from [fetchArtworkQuarantineGroupsByStatus].
class FetchArtworkQuarantineGroupsByStatusProvider
    extends AutoDisposeFutureProvider<List<ArtworkQuarantineGroup>> {
  /// Fetch Artwork Quarantine Groups By Status Provider
  ///
  /// Copied from [fetchArtworkQuarantineGroupsByStatus].
  FetchArtworkQuarantineGroupsByStatusProvider(
    ArtworkQuarantineGroupStatus status,
  ) : this._internal(
          (ref) => fetchArtworkQuarantineGroupsByStatus(
            ref as FetchArtworkQuarantineGroupsByStatusRef,
            status,
          ),
          from: fetchArtworkQuarantineGroupsByStatusProvider,
          name: r'fetchArtworkQuarantineGroupsByStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkQuarantineGroupsByStatusHash,
          dependencies:
              FetchArtworkQuarantineGroupsByStatusFamily._dependencies,
          allTransitiveDependencies: FetchArtworkQuarantineGroupsByStatusFamily
              ._allTransitiveDependencies,
          status: status,
        );

  FetchArtworkQuarantineGroupsByStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final ArtworkQuarantineGroupStatus status;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkQuarantineGroup>> Function(
            FetchArtworkQuarantineGroupsByStatusRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkQuarantineGroupsByStatusProvider._internal(
        (ref) => create(ref as FetchArtworkQuarantineGroupsByStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkQuarantineGroup>>
      createElement() {
    return _FetchArtworkQuarantineGroupsByStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkQuarantineGroupsByStatusProvider &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchArtworkQuarantineGroupsByStatusRef
    on AutoDisposeFutureProviderRef<List<ArtworkQuarantineGroup>> {
  /// The parameter `status` of this provider.
  ArtworkQuarantineGroupStatus get status;
}

class _FetchArtworkQuarantineGroupsByStatusProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkQuarantineGroup>>
    with FetchArtworkQuarantineGroupsByStatusRef {
  _FetchArtworkQuarantineGroupsByStatusProviderElement(super.provider);

  @override
  ArtworkQuarantineGroupStatus get status =>
      (origin as FetchArtworkQuarantineGroupsByStatusProvider).status;
}

String _$fetchArtworkQuarantineGroupsByCustomerIdAndStatusHash() =>
    r'89164b01bda660e57c0e33637d1e4b571b1f5259';

/// Fetch artwork quarantine groups by customer ID and status
///
/// Copied from [fetchArtworkQuarantineGroupsByCustomerIdAndStatus].
@ProviderFor(fetchArtworkQuarantineGroupsByCustomerIdAndStatus)
const fetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider =
    FetchArtworkQuarantineGroupsByCustomerIdAndStatusFamily();

/// Fetch artwork quarantine groups by customer ID and status
///
/// Copied from [fetchArtworkQuarantineGroupsByCustomerIdAndStatus].
class FetchArtworkQuarantineGroupsByCustomerIdAndStatusFamily
    extends Family<AsyncValue<List<ArtworkQuarantineGroup>>> {
  /// Fetch artwork quarantine groups by customer ID and status
  ///
  /// Copied from [fetchArtworkQuarantineGroupsByCustomerIdAndStatus].
  const FetchArtworkQuarantineGroupsByCustomerIdAndStatusFamily();

  /// Fetch artwork quarantine groups by customer ID and status
  ///
  /// Copied from [fetchArtworkQuarantineGroupsByCustomerIdAndStatus].
  FetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider call({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) {
    return FetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider(
      customerId: customerId,
      status: status,
    );
  }

  @override
  FetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider getProviderOverride(
    covariant FetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider
        provider,
  ) {
    return call(
      customerId: provider.customerId,
      status: provider.status,
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
      r'fetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider';
}

/// Fetch artwork quarantine groups by customer ID and status
///
/// Copied from [fetchArtworkQuarantineGroupsByCustomerIdAndStatus].
class FetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider
    extends AutoDisposeFutureProvider<List<ArtworkQuarantineGroup>> {
  /// Fetch artwork quarantine groups by customer ID and status
  ///
  /// Copied from [fetchArtworkQuarantineGroupsByCustomerIdAndStatus].
  FetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) : this._internal(
          (ref) => fetchArtworkQuarantineGroupsByCustomerIdAndStatus(
            ref as FetchArtworkQuarantineGroupsByCustomerIdAndStatusRef,
            customerId: customerId,
            status: status,
          ),
          from: fetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider,
          name: r'fetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkQuarantineGroupsByCustomerIdAndStatusHash,
          dependencies: FetchArtworkQuarantineGroupsByCustomerIdAndStatusFamily
              ._dependencies,
          allTransitiveDependencies:
              FetchArtworkQuarantineGroupsByCustomerIdAndStatusFamily
                  ._allTransitiveDependencies,
          customerId: customerId,
          status: status,
        );

  FetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
    required this.status,
  }) : super.internal();

  final int customerId;
  final ArtworkQuarantineGroupStatus status;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkQuarantineGroup>> Function(
            FetchArtworkQuarantineGroupsByCustomerIdAndStatusRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override:
          FetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider._internal(
        (ref) =>
            create(ref as FetchArtworkQuarantineGroupsByCustomerIdAndStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkQuarantineGroup>>
      createElement() {
    return _FetchArtworkQuarantineGroupsByCustomerIdAndStatusProviderElement(
        this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider &&
        other.customerId == customerId &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchArtworkQuarantineGroupsByCustomerIdAndStatusRef
    on AutoDisposeFutureProviderRef<List<ArtworkQuarantineGroup>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `status` of this provider.
  ArtworkQuarantineGroupStatus get status;
}

class _FetchArtworkQuarantineGroupsByCustomerIdAndStatusProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkQuarantineGroup>>
    with FetchArtworkQuarantineGroupsByCustomerIdAndStatusRef {
  _FetchArtworkQuarantineGroupsByCustomerIdAndStatusProviderElement(
      super.provider);

  @override
  int get customerId =>
      (origin as FetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider)
          .customerId;
  @override
  ArtworkQuarantineGroupStatus get status =>
      (origin as FetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider)
          .status;
}

String _$watchArtworkQuarantineGroupsByCustomerHash() =>
    r'3bc42bfe5f342a1b4691ad3876004859ffe642b0';

abstract class _$WatchArtworkQuarantineGroupsByCustomer
    extends BuildlessAutoDisposeAsyncNotifier<List<ArtworkQuarantineGroup>> {
  late final int customerId;

  FutureOr<List<ArtworkQuarantineGroup>> build(
    int customerId,
  );
}

/// Watch Artwork Quarantine Groups By Customer Provider
///
/// Handles incoming stream
///
/// Copied from [WatchArtworkQuarantineGroupsByCustomer].
@ProviderFor(WatchArtworkQuarantineGroupsByCustomer)
const watchArtworkQuarantineGroupsByCustomerProvider =
    WatchArtworkQuarantineGroupsByCustomerFamily();

/// Watch Artwork Quarantine Groups By Customer Provider
///
/// Handles incoming stream
///
/// Copied from [WatchArtworkQuarantineGroupsByCustomer].
class WatchArtworkQuarantineGroupsByCustomerFamily
    extends Family<AsyncValue<List<ArtworkQuarantineGroup>>> {
  /// Watch Artwork Quarantine Groups By Customer Provider
  ///
  /// Handles incoming stream
  ///
  /// Copied from [WatchArtworkQuarantineGroupsByCustomer].
  const WatchArtworkQuarantineGroupsByCustomerFamily();

  /// Watch Artwork Quarantine Groups By Customer Provider
  ///
  /// Handles incoming stream
  ///
  /// Copied from [WatchArtworkQuarantineGroupsByCustomer].
  WatchArtworkQuarantineGroupsByCustomerProvider call(
    int customerId,
  ) {
    return WatchArtworkQuarantineGroupsByCustomerProvider(
      customerId,
    );
  }

  @override
  WatchArtworkQuarantineGroupsByCustomerProvider getProviderOverride(
    covariant WatchArtworkQuarantineGroupsByCustomerProvider provider,
  ) {
    return call(
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
  String? get name => r'watchArtworkQuarantineGroupsByCustomerProvider';
}

/// Watch Artwork Quarantine Groups By Customer Provider
///
/// Handles incoming stream
///
/// Copied from [WatchArtworkQuarantineGroupsByCustomer].
class WatchArtworkQuarantineGroupsByCustomerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        WatchArtworkQuarantineGroupsByCustomer, List<ArtworkQuarantineGroup>> {
  /// Watch Artwork Quarantine Groups By Customer Provider
  ///
  /// Handles incoming stream
  ///
  /// Copied from [WatchArtworkQuarantineGroupsByCustomer].
  WatchArtworkQuarantineGroupsByCustomerProvider(
    int customerId,
  ) : this._internal(
          () =>
              WatchArtworkQuarantineGroupsByCustomer()..customerId = customerId,
          from: watchArtworkQuarantineGroupsByCustomerProvider,
          name: r'watchArtworkQuarantineGroupsByCustomerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantineGroupsByCustomerHash,
          dependencies:
              WatchArtworkQuarantineGroupsByCustomerFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkQuarantineGroupsByCustomerFamily
                  ._allTransitiveDependencies,
          customerId: customerId,
        );

  WatchArtworkQuarantineGroupsByCustomerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
  }) : super.internal();

  final int customerId;

  @override
  FutureOr<List<ArtworkQuarantineGroup>> runNotifierBuild(
    covariant WatchArtworkQuarantineGroupsByCustomer notifier,
  ) {
    return notifier.build(
      customerId,
    );
  }

  @override
  Override overrideWith(
      WatchArtworkQuarantineGroupsByCustomer Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkQuarantineGroupsByCustomerProvider._internal(
        () => create()..customerId = customerId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
      WatchArtworkQuarantineGroupsByCustomer,
      List<ArtworkQuarantineGroup>> createElement() {
    return _WatchArtworkQuarantineGroupsByCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantineGroupsByCustomerProvider &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkQuarantineGroupsByCustomerRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArtworkQuarantineGroup>> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _WatchArtworkQuarantineGroupsByCustomerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchArtworkQuarantineGroupsByCustomer, List<ArtworkQuarantineGroup>>
    with WatchArtworkQuarantineGroupsByCustomerRef {
  _WatchArtworkQuarantineGroupsByCustomerProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as WatchArtworkQuarantineGroupsByCustomerProvider).customerId;
}

String _$watchArtworkQuarantineGroupsByStatusHash() =>
    r'903ff327bc035dd5a3a8cbfbb60ef7e62f16580b';

abstract class _$WatchArtworkQuarantineGroupsByStatus
    extends BuildlessAutoDisposeAsyncNotifier<List<ArtworkQuarantineGroup>> {
  late final ArtworkQuarantineGroupStatus status;

  FutureOr<List<ArtworkQuarantineGroup>> build(
    ArtworkQuarantineGroupStatus status,
  );
}

/// Watch Artwork Quarantine Groups By Status Provider
///
/// Handles incoming stream of filtered groups
///
/// Copied from [WatchArtworkQuarantineGroupsByStatus].
@ProviderFor(WatchArtworkQuarantineGroupsByStatus)
const watchArtworkQuarantineGroupsByStatusProvider =
    WatchArtworkQuarantineGroupsByStatusFamily();

/// Watch Artwork Quarantine Groups By Status Provider
///
/// Handles incoming stream of filtered groups
///
/// Copied from [WatchArtworkQuarantineGroupsByStatus].
class WatchArtworkQuarantineGroupsByStatusFamily
    extends Family<AsyncValue<List<ArtworkQuarantineGroup>>> {
  /// Watch Artwork Quarantine Groups By Status Provider
  ///
  /// Handles incoming stream of filtered groups
  ///
  /// Copied from [WatchArtworkQuarantineGroupsByStatus].
  const WatchArtworkQuarantineGroupsByStatusFamily();

  /// Watch Artwork Quarantine Groups By Status Provider
  ///
  /// Handles incoming stream of filtered groups
  ///
  /// Copied from [WatchArtworkQuarantineGroupsByStatus].
  WatchArtworkQuarantineGroupsByStatusProvider call(
    ArtworkQuarantineGroupStatus status,
  ) {
    return WatchArtworkQuarantineGroupsByStatusProvider(
      status,
    );
  }

  @override
  WatchArtworkQuarantineGroupsByStatusProvider getProviderOverride(
    covariant WatchArtworkQuarantineGroupsByStatusProvider provider,
  ) {
    return call(
      provider.status,
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
  String? get name => r'watchArtworkQuarantineGroupsByStatusProvider';
}

/// Watch Artwork Quarantine Groups By Status Provider
///
/// Handles incoming stream of filtered groups
///
/// Copied from [WatchArtworkQuarantineGroupsByStatus].
class WatchArtworkQuarantineGroupsByStatusProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        WatchArtworkQuarantineGroupsByStatus, List<ArtworkQuarantineGroup>> {
  /// Watch Artwork Quarantine Groups By Status Provider
  ///
  /// Handles incoming stream of filtered groups
  ///
  /// Copied from [WatchArtworkQuarantineGroupsByStatus].
  WatchArtworkQuarantineGroupsByStatusProvider(
    ArtworkQuarantineGroupStatus status,
  ) : this._internal(
          () => WatchArtworkQuarantineGroupsByStatus()..status = status,
          from: watchArtworkQuarantineGroupsByStatusProvider,
          name: r'watchArtworkQuarantineGroupsByStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantineGroupsByStatusHash,
          dependencies:
              WatchArtworkQuarantineGroupsByStatusFamily._dependencies,
          allTransitiveDependencies: WatchArtworkQuarantineGroupsByStatusFamily
              ._allTransitiveDependencies,
          status: status,
        );

  WatchArtworkQuarantineGroupsByStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final ArtworkQuarantineGroupStatus status;

  @override
  FutureOr<List<ArtworkQuarantineGroup>> runNotifierBuild(
    covariant WatchArtworkQuarantineGroupsByStatus notifier,
  ) {
    return notifier.build(
      status,
    );
  }

  @override
  Override overrideWith(
      WatchArtworkQuarantineGroupsByStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkQuarantineGroupsByStatusProvider._internal(
        () => create()..status = status,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WatchArtworkQuarantineGroupsByStatus,
      List<ArtworkQuarantineGroup>> createElement() {
    return _WatchArtworkQuarantineGroupsByStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantineGroupsByStatusProvider &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkQuarantineGroupsByStatusRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArtworkQuarantineGroup>> {
  /// The parameter `status` of this provider.
  ArtworkQuarantineGroupStatus get status;
}

class _WatchArtworkQuarantineGroupsByStatusProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchArtworkQuarantineGroupsByStatus, List<ArtworkQuarantineGroup>>
    with WatchArtworkQuarantineGroupsByStatusRef {
  _WatchArtworkQuarantineGroupsByStatusProviderElement(super.provider);

  @override
  ArtworkQuarantineGroupStatus get status =>
      (origin as WatchArtworkQuarantineGroupsByStatusProvider).status;
}

String _$watchArtworkQuarantineGroupsByCustomerIdAndStatusHash() =>
    r'5699467c9fa1bdb86929189ee9168f4306696c49';

abstract class _$WatchArtworkQuarantineGroupsByCustomerIdAndStatus
    extends BuildlessAutoDisposeAsyncNotifier<List<ArtworkQuarantineGroup>> {
  late final int customerId;
  late final ArtworkQuarantineGroupStatus status;

  FutureOr<List<ArtworkQuarantineGroup>> build({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  });
}

/// Watch Artwork Quarantine Groups By Customer ID And Status Provider
///
/// Watches Groups by Customer ID and Status
/// Listens to updates from the customer groups stream and filters by status
///
/// Copied from [WatchArtworkQuarantineGroupsByCustomerIdAndStatus].
@ProviderFor(WatchArtworkQuarantineGroupsByCustomerIdAndStatus)
const watchArtworkQuarantineGroupsByCustomerIdAndStatusProvider =
    WatchArtworkQuarantineGroupsByCustomerIdAndStatusFamily();

/// Watch Artwork Quarantine Groups By Customer ID And Status Provider
///
/// Watches Groups by Customer ID and Status
/// Listens to updates from the customer groups stream and filters by status
///
/// Copied from [WatchArtworkQuarantineGroupsByCustomerIdAndStatus].
class WatchArtworkQuarantineGroupsByCustomerIdAndStatusFamily
    extends Family<AsyncValue<List<ArtworkQuarantineGroup>>> {
  /// Watch Artwork Quarantine Groups By Customer ID And Status Provider
  ///
  /// Watches Groups by Customer ID and Status
  /// Listens to updates from the customer groups stream and filters by status
  ///
  /// Copied from [WatchArtworkQuarantineGroupsByCustomerIdAndStatus].
  const WatchArtworkQuarantineGroupsByCustomerIdAndStatusFamily();

  /// Watch Artwork Quarantine Groups By Customer ID And Status Provider
  ///
  /// Watches Groups by Customer ID and Status
  /// Listens to updates from the customer groups stream and filters by status
  ///
  /// Copied from [WatchArtworkQuarantineGroupsByCustomerIdAndStatus].
  WatchArtworkQuarantineGroupsByCustomerIdAndStatusProvider call({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) {
    return WatchArtworkQuarantineGroupsByCustomerIdAndStatusProvider(
      customerId: customerId,
      status: status,
    );
  }

  @override
  WatchArtworkQuarantineGroupsByCustomerIdAndStatusProvider getProviderOverride(
    covariant WatchArtworkQuarantineGroupsByCustomerIdAndStatusProvider
        provider,
  ) {
    return call(
      customerId: provider.customerId,
      status: provider.status,
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
      r'watchArtworkQuarantineGroupsByCustomerIdAndStatusProvider';
}

/// Watch Artwork Quarantine Groups By Customer ID And Status Provider
///
/// Watches Groups by Customer ID and Status
/// Listens to updates from the customer groups stream and filters by status
///
/// Copied from [WatchArtworkQuarantineGroupsByCustomerIdAndStatus].
class WatchArtworkQuarantineGroupsByCustomerIdAndStatusProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        WatchArtworkQuarantineGroupsByCustomerIdAndStatus,
        List<ArtworkQuarantineGroup>> {
  /// Watch Artwork Quarantine Groups By Customer ID And Status Provider
  ///
  /// Watches Groups by Customer ID and Status
  /// Listens to updates from the customer groups stream and filters by status
  ///
  /// Copied from [WatchArtworkQuarantineGroupsByCustomerIdAndStatus].
  WatchArtworkQuarantineGroupsByCustomerIdAndStatusProvider({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) : this._internal(
          () => WatchArtworkQuarantineGroupsByCustomerIdAndStatus()
            ..customerId = customerId
            ..status = status,
          from: watchArtworkQuarantineGroupsByCustomerIdAndStatusProvider,
          name: r'watchArtworkQuarantineGroupsByCustomerIdAndStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantineGroupsByCustomerIdAndStatusHash,
          dependencies: WatchArtworkQuarantineGroupsByCustomerIdAndStatusFamily
              ._dependencies,
          allTransitiveDependencies:
              WatchArtworkQuarantineGroupsByCustomerIdAndStatusFamily
                  ._allTransitiveDependencies,
          customerId: customerId,
          status: status,
        );

  WatchArtworkQuarantineGroupsByCustomerIdAndStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
    required this.status,
  }) : super.internal();

  final int customerId;
  final ArtworkQuarantineGroupStatus status;

  @override
  FutureOr<List<ArtworkQuarantineGroup>> runNotifierBuild(
    covariant WatchArtworkQuarantineGroupsByCustomerIdAndStatus notifier,
  ) {
    return notifier.build(
      customerId: customerId,
      status: status,
    );
  }

  @override
  Override overrideWith(
      WatchArtworkQuarantineGroupsByCustomerIdAndStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override:
          WatchArtworkQuarantineGroupsByCustomerIdAndStatusProvider._internal(
        () => create()
          ..customerId = customerId
          ..status = status,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
      WatchArtworkQuarantineGroupsByCustomerIdAndStatus,
      List<ArtworkQuarantineGroup>> createElement() {
    return _WatchArtworkQuarantineGroupsByCustomerIdAndStatusProviderElement(
        this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantineGroupsByCustomerIdAndStatusProvider &&
        other.customerId == customerId &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkQuarantineGroupsByCustomerIdAndStatusRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArtworkQuarantineGroup>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `status` of this provider.
  ArtworkQuarantineGroupStatus get status;
}

class _WatchArtworkQuarantineGroupsByCustomerIdAndStatusProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchArtworkQuarantineGroupsByCustomerIdAndStatus,
        List<ArtworkQuarantineGroup>>
    with WatchArtworkQuarantineGroupsByCustomerIdAndStatusRef {
  _WatchArtworkQuarantineGroupsByCustomerIdAndStatusProviderElement(
      super.provider);

  @override
  int get customerId =>
      (origin as WatchArtworkQuarantineGroupsByCustomerIdAndStatusProvider)
          .customerId;
  @override
  ArtworkQuarantineGroupStatus get status =>
      (origin as WatchArtworkQuarantineGroupsByCustomerIdAndStatusProvider)
          .status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
