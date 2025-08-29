// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_quarantine_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkQuarantineRepositoryHash() =>
    r'0ac45bb8fdc59c0c1cb9d8a7aa01a4048d7d3105';

/// Artwork Quarantine Repository Provider
///
/// Copied from [artworkQuarantineRepository].
@ProviderFor(artworkQuarantineRepository)
final artworkQuarantineRepositoryProvider =
    AutoDisposeProvider<ArtworkQuarantineRepository>.internal(
  artworkQuarantineRepository,
  name: r'artworkQuarantineRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$artworkQuarantineRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArtworkQuarantineRepositoryRef
    = AutoDisposeProviderRef<ArtworkQuarantineRepository>;
String _$findArtworkQuarantinesHash() =>
    r'b80dafdfa64fd63d54aeefdd8e85c56912bfc4d0';

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

/// Find Artwork Quarantines Provider
///
/// Copied from [findArtworkQuarantines].
@ProviderFor(findArtworkQuarantines)
const findArtworkQuarantinesProvider = FindArtworkQuarantinesFamily();

/// Find Artwork Quarantines Provider
///
/// Copied from [findArtworkQuarantines].
class FindArtworkQuarantinesFamily
    extends Family<AsyncValue<List<ArtworkQuarantine>>> {
  /// Find Artwork Quarantines Provider
  ///
  /// Copied from [findArtworkQuarantines].
  const FindArtworkQuarantinesFamily();

  /// Find Artwork Quarantines Provider
  ///
  /// Copied from [findArtworkQuarantines].
  FindArtworkQuarantinesProvider call(
    String sessionId,
  ) {
    return FindArtworkQuarantinesProvider(
      sessionId,
    );
  }

  @override
  FindArtworkQuarantinesProvider getProviderOverride(
    covariant FindArtworkQuarantinesProvider provider,
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
  String? get name => r'findArtworkQuarantinesProvider';
}

/// Find Artwork Quarantines Provider
///
/// Copied from [findArtworkQuarantines].
class FindArtworkQuarantinesProvider
    extends AutoDisposeFutureProvider<List<ArtworkQuarantine>> {
  /// Find Artwork Quarantines Provider
  ///
  /// Copied from [findArtworkQuarantines].
  FindArtworkQuarantinesProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findArtworkQuarantines(
            ref as FindArtworkQuarantinesRef,
            sessionId,
          ),
          from: findArtworkQuarantinesProvider,
          name: r'findArtworkQuarantinesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findArtworkQuarantinesHash,
          dependencies: FindArtworkQuarantinesFamily._dependencies,
          allTransitiveDependencies:
              FindArtworkQuarantinesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindArtworkQuarantinesProvider._internal(
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
    FutureOr<List<ArtworkQuarantine>> Function(
            FindArtworkQuarantinesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindArtworkQuarantinesProvider._internal(
        (ref) => create(ref as FindArtworkQuarantinesRef),
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
  AutoDisposeFutureProviderElement<List<ArtworkQuarantine>> createElement() {
    return _FindArtworkQuarantinesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindArtworkQuarantinesProvider &&
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
mixin FindArtworkQuarantinesRef
    on AutoDisposeFutureProviderRef<List<ArtworkQuarantine>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindArtworkQuarantinesProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkQuarantine>>
    with FindArtworkQuarantinesRef {
  _FindArtworkQuarantinesProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindArtworkQuarantinesProvider).sessionId;
}

String _$fetchArtworkQuarantinesByCustomerIdHash() =>
    r'a5fc477710d513bbe8789f7d7d4f9366fbc749d9';

/// Fetch Artwork Quarantines By Customer ID Provider
///
/// Copied from [fetchArtworkQuarantinesByCustomerId].
@ProviderFor(fetchArtworkQuarantinesByCustomerId)
const fetchArtworkQuarantinesByCustomerIdProvider =
    FetchArtworkQuarantinesByCustomerIdFamily();

/// Fetch Artwork Quarantines By Customer ID Provider
///
/// Copied from [fetchArtworkQuarantinesByCustomerId].
class FetchArtworkQuarantinesByCustomerIdFamily
    extends Family<AsyncValue<List<ArtworkQuarantine>>> {
  /// Fetch Artwork Quarantines By Customer ID Provider
  ///
  /// Copied from [fetchArtworkQuarantinesByCustomerId].
  const FetchArtworkQuarantinesByCustomerIdFamily();

  /// Fetch Artwork Quarantines By Customer ID Provider
  ///
  /// Copied from [fetchArtworkQuarantinesByCustomerId].
  FetchArtworkQuarantinesByCustomerIdProvider call(
    int customerId,
  ) {
    return FetchArtworkQuarantinesByCustomerIdProvider(
      customerId,
    );
  }

  @override
  FetchArtworkQuarantinesByCustomerIdProvider getProviderOverride(
    covariant FetchArtworkQuarantinesByCustomerIdProvider provider,
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
  String? get name => r'fetchArtworkQuarantinesByCustomerIdProvider';
}

/// Fetch Artwork Quarantines By Customer ID Provider
///
/// Copied from [fetchArtworkQuarantinesByCustomerId].
class FetchArtworkQuarantinesByCustomerIdProvider
    extends AutoDisposeFutureProvider<List<ArtworkQuarantine>> {
  /// Fetch Artwork Quarantines By Customer ID Provider
  ///
  /// Copied from [fetchArtworkQuarantinesByCustomerId].
  FetchArtworkQuarantinesByCustomerIdProvider(
    int customerId,
  ) : this._internal(
          (ref) => fetchArtworkQuarantinesByCustomerId(
            ref as FetchArtworkQuarantinesByCustomerIdRef,
            customerId,
          ),
          from: fetchArtworkQuarantinesByCustomerIdProvider,
          name: r'fetchArtworkQuarantinesByCustomerIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkQuarantinesByCustomerIdHash,
          dependencies: FetchArtworkQuarantinesByCustomerIdFamily._dependencies,
          allTransitiveDependencies: FetchArtworkQuarantinesByCustomerIdFamily
              ._allTransitiveDependencies,
          customerId: customerId,
        );

  FetchArtworkQuarantinesByCustomerIdProvider._internal(
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
    FutureOr<List<ArtworkQuarantine>> Function(
            FetchArtworkQuarantinesByCustomerIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkQuarantinesByCustomerIdProvider._internal(
        (ref) => create(ref as FetchArtworkQuarantinesByCustomerIdRef),
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
  AutoDisposeFutureProviderElement<List<ArtworkQuarantine>> createElement() {
    return _FetchArtworkQuarantinesByCustomerIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkQuarantinesByCustomerIdProvider &&
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
mixin FetchArtworkQuarantinesByCustomerIdRef
    on AutoDisposeFutureProviderRef<List<ArtworkQuarantine>> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _FetchArtworkQuarantinesByCustomerIdProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkQuarantine>>
    with FetchArtworkQuarantinesByCustomerIdRef {
  _FetchArtworkQuarantinesByCustomerIdProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as FetchArtworkQuarantinesByCustomerIdProvider).customerId;
}

String _$fetchArtworkQuarantinesByGroupIdHash() =>
    r'9a38d653e67a0dd709ec3f13ed5edb889de0d484';

/// Fetch Artwork Quarantines By Group ID Provider
///
/// Copied from [fetchArtworkQuarantinesByGroupId].
@ProviderFor(fetchArtworkQuarantinesByGroupId)
const fetchArtworkQuarantinesByGroupIdProvider =
    FetchArtworkQuarantinesByGroupIdFamily();

/// Fetch Artwork Quarantines By Group ID Provider
///
/// Copied from [fetchArtworkQuarantinesByGroupId].
class FetchArtworkQuarantinesByGroupIdFamily
    extends Family<AsyncValue<List<ArtworkQuarantine>>> {
  /// Fetch Artwork Quarantines By Group ID Provider
  ///
  /// Copied from [fetchArtworkQuarantinesByGroupId].
  const FetchArtworkQuarantinesByGroupIdFamily();

  /// Fetch Artwork Quarantines By Group ID Provider
  ///
  /// Copied from [fetchArtworkQuarantinesByGroupId].
  FetchArtworkQuarantinesByGroupIdProvider call(
    int groupId,
  ) {
    return FetchArtworkQuarantinesByGroupIdProvider(
      groupId,
    );
  }

  @override
  FetchArtworkQuarantinesByGroupIdProvider getProviderOverride(
    covariant FetchArtworkQuarantinesByGroupIdProvider provider,
  ) {
    return call(
      provider.groupId,
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
  String? get name => r'fetchArtworkQuarantinesByGroupIdProvider';
}

/// Fetch Artwork Quarantines By Group ID Provider
///
/// Copied from [fetchArtworkQuarantinesByGroupId].
class FetchArtworkQuarantinesByGroupIdProvider
    extends AutoDisposeFutureProvider<List<ArtworkQuarantine>> {
  /// Fetch Artwork Quarantines By Group ID Provider
  ///
  /// Copied from [fetchArtworkQuarantinesByGroupId].
  FetchArtworkQuarantinesByGroupIdProvider(
    int groupId,
  ) : this._internal(
          (ref) => fetchArtworkQuarantinesByGroupId(
            ref as FetchArtworkQuarantinesByGroupIdRef,
            groupId,
          ),
          from: fetchArtworkQuarantinesByGroupIdProvider,
          name: r'fetchArtworkQuarantinesByGroupIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkQuarantinesByGroupIdHash,
          dependencies: FetchArtworkQuarantinesByGroupIdFamily._dependencies,
          allTransitiveDependencies:
              FetchArtworkQuarantinesByGroupIdFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  FetchArtworkQuarantinesByGroupIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final int groupId;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkQuarantine>> Function(
            FetchArtworkQuarantinesByGroupIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkQuarantinesByGroupIdProvider._internal(
        (ref) => create(ref as FetchArtworkQuarantinesByGroupIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkQuarantine>> createElement() {
    return _FetchArtworkQuarantinesByGroupIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkQuarantinesByGroupIdProvider &&
        other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchArtworkQuarantinesByGroupIdRef
    on AutoDisposeFutureProviderRef<List<ArtworkQuarantine>> {
  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _FetchArtworkQuarantinesByGroupIdProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkQuarantine>>
    with FetchArtworkQuarantinesByGroupIdRef {
  _FetchArtworkQuarantinesByGroupIdProviderElement(super.provider);

  @override
  int get groupId =>
      (origin as FetchArtworkQuarantinesByGroupIdProvider).groupId;
}

String _$fetchArtworkQuarantinesByGroupIdAndStatusHash() =>
    r'808198e82d79359e44e4a50b549d72d189cc03d8';

/// Fetch Artwork Quarantines By Group ID And Status Provider
///
/// Copied from [fetchArtworkQuarantinesByGroupIdAndStatus].
@ProviderFor(fetchArtworkQuarantinesByGroupIdAndStatus)
const fetchArtworkQuarantinesByGroupIdAndStatusProvider =
    FetchArtworkQuarantinesByGroupIdAndStatusFamily();

/// Fetch Artwork Quarantines By Group ID And Status Provider
///
/// Copied from [fetchArtworkQuarantinesByGroupIdAndStatus].
class FetchArtworkQuarantinesByGroupIdAndStatusFamily
    extends Family<AsyncValue<List<ArtworkQuarantine>>> {
  /// Fetch Artwork Quarantines By Group ID And Status Provider
  ///
  /// Copied from [fetchArtworkQuarantinesByGroupIdAndStatus].
  const FetchArtworkQuarantinesByGroupIdAndStatusFamily();

  /// Fetch Artwork Quarantines By Group ID And Status Provider
  ///
  /// Copied from [fetchArtworkQuarantinesByGroupIdAndStatus].
  FetchArtworkQuarantinesByGroupIdAndStatusProvider call({
    required int groupId,
    required ArtworkQuarantineGroupStatus status,
  }) {
    return FetchArtworkQuarantinesByGroupIdAndStatusProvider(
      groupId: groupId,
      status: status,
    );
  }

  @override
  FetchArtworkQuarantinesByGroupIdAndStatusProvider getProviderOverride(
    covariant FetchArtworkQuarantinesByGroupIdAndStatusProvider provider,
  ) {
    return call(
      groupId: provider.groupId,
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
  String? get name => r'fetchArtworkQuarantinesByGroupIdAndStatusProvider';
}

/// Fetch Artwork Quarantines By Group ID And Status Provider
///
/// Copied from [fetchArtworkQuarantinesByGroupIdAndStatus].
class FetchArtworkQuarantinesByGroupIdAndStatusProvider
    extends AutoDisposeFutureProvider<List<ArtworkQuarantine>> {
  /// Fetch Artwork Quarantines By Group ID And Status Provider
  ///
  /// Copied from [fetchArtworkQuarantinesByGroupIdAndStatus].
  FetchArtworkQuarantinesByGroupIdAndStatusProvider({
    required int groupId,
    required ArtworkQuarantineGroupStatus status,
  }) : this._internal(
          (ref) => fetchArtworkQuarantinesByGroupIdAndStatus(
            ref as FetchArtworkQuarantinesByGroupIdAndStatusRef,
            groupId: groupId,
            status: status,
          ),
          from: fetchArtworkQuarantinesByGroupIdAndStatusProvider,
          name: r'fetchArtworkQuarantinesByGroupIdAndStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkQuarantinesByGroupIdAndStatusHash,
          dependencies:
              FetchArtworkQuarantinesByGroupIdAndStatusFamily._dependencies,
          allTransitiveDependencies:
              FetchArtworkQuarantinesByGroupIdAndStatusFamily
                  ._allTransitiveDependencies,
          groupId: groupId,
          status: status,
        );

  FetchArtworkQuarantinesByGroupIdAndStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
    required this.status,
  }) : super.internal();

  final int groupId;
  final ArtworkQuarantineGroupStatus status;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkQuarantine>> Function(
            FetchArtworkQuarantinesByGroupIdAndStatusRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkQuarantinesByGroupIdAndStatusProvider._internal(
        (ref) => create(ref as FetchArtworkQuarantinesByGroupIdAndStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkQuarantine>> createElement() {
    return _FetchArtworkQuarantinesByGroupIdAndStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkQuarantinesByGroupIdAndStatusProvider &&
        other.groupId == groupId &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchArtworkQuarantinesByGroupIdAndStatusRef
    on AutoDisposeFutureProviderRef<List<ArtworkQuarantine>> {
  /// The parameter `groupId` of this provider.
  int get groupId;

  /// The parameter `status` of this provider.
  ArtworkQuarantineGroupStatus get status;
}

class _FetchArtworkQuarantinesByGroupIdAndStatusProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkQuarantine>>
    with FetchArtworkQuarantinesByGroupIdAndStatusRef {
  _FetchArtworkQuarantinesByGroupIdAndStatusProviderElement(super.provider);

  @override
  int get groupId =>
      (origin as FetchArtworkQuarantinesByGroupIdAndStatusProvider).groupId;
  @override
  ArtworkQuarantineGroupStatus get status =>
      (origin as FetchArtworkQuarantinesByGroupIdAndStatusProvider).status;
}

String _$fetchArtworkQuarantineHash() =>
    r'332646f5eab4456c64c8f817434321a9c474a5c8';

/// Fetch Artwork Quarantine Provider
///
/// Copied from [fetchArtworkQuarantine].
@ProviderFor(fetchArtworkQuarantine)
const fetchArtworkQuarantineProvider = FetchArtworkQuarantineFamily();

/// Fetch Artwork Quarantine Provider
///
/// Copied from [fetchArtworkQuarantine].
class FetchArtworkQuarantineFamily
    extends Family<AsyncValue<ArtworkQuarantine?>> {
  /// Fetch Artwork Quarantine Provider
  ///
  /// Copied from [fetchArtworkQuarantine].
  const FetchArtworkQuarantineFamily();

  /// Fetch Artwork Quarantine Provider
  ///
  /// Copied from [fetchArtworkQuarantine].
  FetchArtworkQuarantineProvider call(
    int artworkQuarantineId,
  ) {
    return FetchArtworkQuarantineProvider(
      artworkQuarantineId,
    );
  }

  @override
  FetchArtworkQuarantineProvider getProviderOverride(
    covariant FetchArtworkQuarantineProvider provider,
  ) {
    return call(
      provider.artworkQuarantineId,
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
  String? get name => r'fetchArtworkQuarantineProvider';
}

/// Fetch Artwork Quarantine Provider
///
/// Copied from [fetchArtworkQuarantine].
class FetchArtworkQuarantineProvider
    extends AutoDisposeFutureProvider<ArtworkQuarantine?> {
  /// Fetch Artwork Quarantine Provider
  ///
  /// Copied from [fetchArtworkQuarantine].
  FetchArtworkQuarantineProvider(
    int artworkQuarantineId,
  ) : this._internal(
          (ref) => fetchArtworkQuarantine(
            ref as FetchArtworkQuarantineRef,
            artworkQuarantineId,
          ),
          from: fetchArtworkQuarantineProvider,
          name: r'fetchArtworkQuarantineProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkQuarantineHash,
          dependencies: FetchArtworkQuarantineFamily._dependencies,
          allTransitiveDependencies:
              FetchArtworkQuarantineFamily._allTransitiveDependencies,
          artworkQuarantineId: artworkQuarantineId,
        );

  FetchArtworkQuarantineProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkQuarantineId,
  }) : super.internal();

  final int artworkQuarantineId;

  @override
  Override overrideWith(
    FutureOr<ArtworkQuarantine?> Function(FetchArtworkQuarantineRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkQuarantineProvider._internal(
        (ref) => create(ref as FetchArtworkQuarantineRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkQuarantineId: artworkQuarantineId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ArtworkQuarantine?> createElement() {
    return _FetchArtworkQuarantineProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkQuarantineProvider &&
        other.artworkQuarantineId == artworkQuarantineId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkQuarantineId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchArtworkQuarantineRef
    on AutoDisposeFutureProviderRef<ArtworkQuarantine?> {
  /// The parameter `artworkQuarantineId` of this provider.
  int get artworkQuarantineId;
}

class _FetchArtworkQuarantineProviderElement
    extends AutoDisposeFutureProviderElement<ArtworkQuarantine?>
    with FetchArtworkQuarantineRef {
  _FetchArtworkQuarantineProviderElement(super.provider);

  @override
  int get artworkQuarantineId =>
      (origin as FetchArtworkQuarantineProvider).artworkQuarantineId;
}

String _$watchArtworkQuarantineHash() =>
    r'd93f1434cf932c718c7a9b3ced05ce115262ba90';

/// Watch Artwork Quarantine Provider
///
/// Copied from [watchArtworkQuarantine].
@ProviderFor(watchArtworkQuarantine)
const watchArtworkQuarantineProvider = WatchArtworkQuarantineFamily();

/// Watch Artwork Quarantine Provider
///
/// Copied from [watchArtworkQuarantine].
class WatchArtworkQuarantineFamily
    extends Family<AsyncValue<ArtworkQuarantine>> {
  /// Watch Artwork Quarantine Provider
  ///
  /// Copied from [watchArtworkQuarantine].
  const WatchArtworkQuarantineFamily();

  /// Watch Artwork Quarantine Provider
  ///
  /// Copied from [watchArtworkQuarantine].
  WatchArtworkQuarantineProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchArtworkQuarantineProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchArtworkQuarantineProvider getProviderOverride(
    covariant WatchArtworkQuarantineProvider provider,
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
  String? get name => r'watchArtworkQuarantineProvider';
}

/// Watch Artwork Quarantine Provider
///
/// Copied from [watchArtworkQuarantine].
class WatchArtworkQuarantineProvider
    extends AutoDisposeStreamProvider<ArtworkQuarantine> {
  /// Watch Artwork Quarantine Provider
  ///
  /// Copied from [watchArtworkQuarantine].
  WatchArtworkQuarantineProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchArtworkQuarantine(
            ref as WatchArtworkQuarantineRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchArtworkQuarantineProvider,
          name: r'watchArtworkQuarantineProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantineHash,
          dependencies: WatchArtworkQuarantineFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkQuarantineFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchArtworkQuarantineProvider._internal(
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
    Stream<ArtworkQuarantine> Function(WatchArtworkQuarantineRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkQuarantineProvider._internal(
        (ref) => create(ref as WatchArtworkQuarantineRef),
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
  AutoDisposeStreamProviderElement<ArtworkQuarantine> createElement() {
    return _WatchArtworkQuarantineProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantineProvider &&
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
mixin WatchArtworkQuarantineRef
    on AutoDisposeStreamProviderRef<ArtworkQuarantine> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchArtworkQuarantineProviderElement
    extends AutoDisposeStreamProviderElement<ArtworkQuarantine>
    with WatchArtworkQuarantineRef {
  _WatchArtworkQuarantineProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchArtworkQuarantineProvider).sessionId;
  @override
  int get id => (origin as WatchArtworkQuarantineProvider).id;
}

String _$watchArtworkQuarantineUpdatesByCustomerIdHash() =>
    r'c9783f1e736f961dc823d27325cac660182e9d85';

/// Watch Artwork Quarantine Updates By Customer ID Stream Provider
/// Only listens to updates for specific customer
///
/// Copied from [watchArtworkQuarantineUpdatesByCustomerId].
@ProviderFor(watchArtworkQuarantineUpdatesByCustomerId)
const watchArtworkQuarantineUpdatesByCustomerIdProvider =
    WatchArtworkQuarantineUpdatesByCustomerIdFamily();

/// Watch Artwork Quarantine Updates By Customer ID Stream Provider
/// Only listens to updates for specific customer
///
/// Copied from [watchArtworkQuarantineUpdatesByCustomerId].
class WatchArtworkQuarantineUpdatesByCustomerIdFamily
    extends Family<AsyncValue<ArtworkQuarantine>> {
  /// Watch Artwork Quarantine Updates By Customer ID Stream Provider
  /// Only listens to updates for specific customer
  ///
  /// Copied from [watchArtworkQuarantineUpdatesByCustomerId].
  const WatchArtworkQuarantineUpdatesByCustomerIdFamily();

  /// Watch Artwork Quarantine Updates By Customer ID Stream Provider
  /// Only listens to updates for specific customer
  ///
  /// Copied from [watchArtworkQuarantineUpdatesByCustomerId].
  WatchArtworkQuarantineUpdatesByCustomerIdProvider call(
    int customerId,
  ) {
    return WatchArtworkQuarantineUpdatesByCustomerIdProvider(
      customerId,
    );
  }

  @override
  WatchArtworkQuarantineUpdatesByCustomerIdProvider getProviderOverride(
    covariant WatchArtworkQuarantineUpdatesByCustomerIdProvider provider,
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
  String? get name => r'watchArtworkQuarantineUpdatesByCustomerIdProvider';
}

/// Watch Artwork Quarantine Updates By Customer ID Stream Provider
/// Only listens to updates for specific customer
///
/// Copied from [watchArtworkQuarantineUpdatesByCustomerId].
class WatchArtworkQuarantineUpdatesByCustomerIdProvider
    extends AutoDisposeStreamProvider<ArtworkQuarantine> {
  /// Watch Artwork Quarantine Updates By Customer ID Stream Provider
  /// Only listens to updates for specific customer
  ///
  /// Copied from [watchArtworkQuarantineUpdatesByCustomerId].
  WatchArtworkQuarantineUpdatesByCustomerIdProvider(
    int customerId,
  ) : this._internal(
          (ref) => watchArtworkQuarantineUpdatesByCustomerId(
            ref as WatchArtworkQuarantineUpdatesByCustomerIdRef,
            customerId,
          ),
          from: watchArtworkQuarantineUpdatesByCustomerIdProvider,
          name: r'watchArtworkQuarantineUpdatesByCustomerIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantineUpdatesByCustomerIdHash,
          dependencies:
              WatchArtworkQuarantineUpdatesByCustomerIdFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkQuarantineUpdatesByCustomerIdFamily
                  ._allTransitiveDependencies,
          customerId: customerId,
        );

  WatchArtworkQuarantineUpdatesByCustomerIdProvider._internal(
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
    Stream<ArtworkQuarantine> Function(
            WatchArtworkQuarantineUpdatesByCustomerIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkQuarantineUpdatesByCustomerIdProvider._internal(
        (ref) => create(ref as WatchArtworkQuarantineUpdatesByCustomerIdRef),
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
  AutoDisposeStreamProviderElement<ArtworkQuarantine> createElement() {
    return _WatchArtworkQuarantineUpdatesByCustomerIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantineUpdatesByCustomerIdProvider &&
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
mixin WatchArtworkQuarantineUpdatesByCustomerIdRef
    on AutoDisposeStreamProviderRef<ArtworkQuarantine> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _WatchArtworkQuarantineUpdatesByCustomerIdProviderElement
    extends AutoDisposeStreamProviderElement<ArtworkQuarantine>
    with WatchArtworkQuarantineUpdatesByCustomerIdRef {
  _WatchArtworkQuarantineUpdatesByCustomerIdProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as WatchArtworkQuarantineUpdatesByCustomerIdProvider).customerId;
}

String _$watchArtworkQuarantineDeletionsHash() =>
    r'7170dcaed8d41f23efefc70112ad1796c07dfe3a';

/// Watch artwork quarantines deletions Stream Provider
///
/// Copied from [watchArtworkQuarantineDeletions].
@ProviderFor(watchArtworkQuarantineDeletions)
const watchArtworkQuarantineDeletionsProvider =
    WatchArtworkQuarantineDeletionsFamily();

/// Watch artwork quarantines deletions Stream Provider
///
/// Copied from [watchArtworkQuarantineDeletions].
class WatchArtworkQuarantineDeletionsFamily extends Family<AsyncValue<int>> {
  /// Watch artwork quarantines deletions Stream Provider
  ///
  /// Copied from [watchArtworkQuarantineDeletions].
  const WatchArtworkQuarantineDeletionsFamily();

  /// Watch artwork quarantines deletions Stream Provider
  ///
  /// Copied from [watchArtworkQuarantineDeletions].
  WatchArtworkQuarantineDeletionsProvider call(
    int customerId,
  ) {
    return WatchArtworkQuarantineDeletionsProvider(
      customerId,
    );
  }

  @override
  WatchArtworkQuarantineDeletionsProvider getProviderOverride(
    covariant WatchArtworkQuarantineDeletionsProvider provider,
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
  String? get name => r'watchArtworkQuarantineDeletionsProvider';
}

/// Watch artwork quarantines deletions Stream Provider
///
/// Copied from [watchArtworkQuarantineDeletions].
class WatchArtworkQuarantineDeletionsProvider
    extends AutoDisposeStreamProvider<int> {
  /// Watch artwork quarantines deletions Stream Provider
  ///
  /// Copied from [watchArtworkQuarantineDeletions].
  WatchArtworkQuarantineDeletionsProvider(
    int customerId,
  ) : this._internal(
          (ref) => watchArtworkQuarantineDeletions(
            ref as WatchArtworkQuarantineDeletionsRef,
            customerId,
          ),
          from: watchArtworkQuarantineDeletionsProvider,
          name: r'watchArtworkQuarantineDeletionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantineDeletionsHash,
          dependencies: WatchArtworkQuarantineDeletionsFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkQuarantineDeletionsFamily._allTransitiveDependencies,
          customerId: customerId,
        );

  WatchArtworkQuarantineDeletionsProvider._internal(
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
    Stream<int> Function(WatchArtworkQuarantineDeletionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkQuarantineDeletionsProvider._internal(
        (ref) => create(ref as WatchArtworkQuarantineDeletionsRef),
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
  AutoDisposeStreamProviderElement<int> createElement() {
    return _WatchArtworkQuarantineDeletionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantineDeletionsProvider &&
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
mixin WatchArtworkQuarantineDeletionsRef on AutoDisposeStreamProviderRef<int> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _WatchArtworkQuarantineDeletionsProviderElement
    extends AutoDisposeStreamProviderElement<int>
    with WatchArtworkQuarantineDeletionsRef {
  _WatchArtworkQuarantineDeletionsProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as WatchArtworkQuarantineDeletionsProvider).customerId;
}

String _$watchAllArtworkQuarantinesUpdatesHash() =>
    r'aca0b81d1161e7b4a02b6abd06b41be364d3566d';

/// Watch All Artwork Quarantines Updates Stream Provider
///
/// Copied from [watchAllArtworkQuarantinesUpdates].
@ProviderFor(watchAllArtworkQuarantinesUpdates)
final watchAllArtworkQuarantinesUpdatesProvider =
    AutoDisposeStreamProvider<ArtworkQuarantine>.internal(
  watchAllArtworkQuarantinesUpdates,
  name: r'watchAllArtworkQuarantinesUpdatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAllArtworkQuarantinesUpdatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllArtworkQuarantinesUpdatesRef
    = AutoDisposeStreamProviderRef<ArtworkQuarantine>;
String _$fetchArtworkQuarantinesByCustomerIdAndStatusHash() =>
    r'1cc8ef62037730545cff586c2584966913dbec0f';

/// Fetch artwork quarantines by customer ID and group status
///
/// Copied from [fetchArtworkQuarantinesByCustomerIdAndStatus].
@ProviderFor(fetchArtworkQuarantinesByCustomerIdAndStatus)
const fetchArtworkQuarantinesByCustomerIdAndStatusProvider =
    FetchArtworkQuarantinesByCustomerIdAndStatusFamily();

/// Fetch artwork quarantines by customer ID and group status
///
/// Copied from [fetchArtworkQuarantinesByCustomerIdAndStatus].
class FetchArtworkQuarantinesByCustomerIdAndStatusFamily
    extends Family<AsyncValue<List<ArtworkQuarantine>>> {
  /// Fetch artwork quarantines by customer ID and group status
  ///
  /// Copied from [fetchArtworkQuarantinesByCustomerIdAndStatus].
  const FetchArtworkQuarantinesByCustomerIdAndStatusFamily();

  /// Fetch artwork quarantines by customer ID and group status
  ///
  /// Copied from [fetchArtworkQuarantinesByCustomerIdAndStatus].
  FetchArtworkQuarantinesByCustomerIdAndStatusProvider call({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) {
    return FetchArtworkQuarantinesByCustomerIdAndStatusProvider(
      customerId: customerId,
      status: status,
    );
  }

  @override
  FetchArtworkQuarantinesByCustomerIdAndStatusProvider getProviderOverride(
    covariant FetchArtworkQuarantinesByCustomerIdAndStatusProvider provider,
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
  String? get name => r'fetchArtworkQuarantinesByCustomerIdAndStatusProvider';
}

/// Fetch artwork quarantines by customer ID and group status
///
/// Copied from [fetchArtworkQuarantinesByCustomerIdAndStatus].
class FetchArtworkQuarantinesByCustomerIdAndStatusProvider
    extends AutoDisposeFutureProvider<List<ArtworkQuarantine>> {
  /// Fetch artwork quarantines by customer ID and group status
  ///
  /// Copied from [fetchArtworkQuarantinesByCustomerIdAndStatus].
  FetchArtworkQuarantinesByCustomerIdAndStatusProvider({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) : this._internal(
          (ref) => fetchArtworkQuarantinesByCustomerIdAndStatus(
            ref as FetchArtworkQuarantinesByCustomerIdAndStatusRef,
            customerId: customerId,
            status: status,
          ),
          from: fetchArtworkQuarantinesByCustomerIdAndStatusProvider,
          name: r'fetchArtworkQuarantinesByCustomerIdAndStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkQuarantinesByCustomerIdAndStatusHash,
          dependencies:
              FetchArtworkQuarantinesByCustomerIdAndStatusFamily._dependencies,
          allTransitiveDependencies:
              FetchArtworkQuarantinesByCustomerIdAndStatusFamily
                  ._allTransitiveDependencies,
          customerId: customerId,
          status: status,
        );

  FetchArtworkQuarantinesByCustomerIdAndStatusProvider._internal(
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
    FutureOr<List<ArtworkQuarantine>> Function(
            FetchArtworkQuarantinesByCustomerIdAndStatusRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkQuarantinesByCustomerIdAndStatusProvider._internal(
        (ref) => create(ref as FetchArtworkQuarantinesByCustomerIdAndStatusRef),
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
  AutoDisposeFutureProviderElement<List<ArtworkQuarantine>> createElement() {
    return _FetchArtworkQuarantinesByCustomerIdAndStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkQuarantinesByCustomerIdAndStatusProvider &&
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
mixin FetchArtworkQuarantinesByCustomerIdAndStatusRef
    on AutoDisposeFutureProviderRef<List<ArtworkQuarantine>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `status` of this provider.
  ArtworkQuarantineGroupStatus get status;
}

class _FetchArtworkQuarantinesByCustomerIdAndStatusProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkQuarantine>>
    with FetchArtworkQuarantinesByCustomerIdAndStatusRef {
  _FetchArtworkQuarantinesByCustomerIdAndStatusProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as FetchArtworkQuarantinesByCustomerIdAndStatusProvider)
          .customerId;
  @override
  ArtworkQuarantineGroupStatus get status =>
      (origin as FetchArtworkQuarantinesByCustomerIdAndStatusProvider).status;
}

String _$watchArtworkQuarantinesByCustomerHash() =>
    r'e700e9cdbb01c191f227e2164f2e1e969b04c3d2';

abstract class _$WatchArtworkQuarantinesByCustomer
    extends BuildlessAutoDisposeAsyncNotifier<List<ArtworkQuarantine>> {
  late final int customerId;

  FutureOr<List<ArtworkQuarantine>> build(
    int customerId,
  );
}

/// Watch Artwork Quarantines By Customer Provider
///
/// Watches Quarantines by Customer ID
/// Listens to updates and deletions
///
/// Deletion Stream provides IDs of deleted quarantines
///
/// Copied from [WatchArtworkQuarantinesByCustomer].
@ProviderFor(WatchArtworkQuarantinesByCustomer)
const watchArtworkQuarantinesByCustomerProvider =
    WatchArtworkQuarantinesByCustomerFamily();

/// Watch Artwork Quarantines By Customer Provider
///
/// Watches Quarantines by Customer ID
/// Listens to updates and deletions
///
/// Deletion Stream provides IDs of deleted quarantines
///
/// Copied from [WatchArtworkQuarantinesByCustomer].
class WatchArtworkQuarantinesByCustomerFamily
    extends Family<AsyncValue<List<ArtworkQuarantine>>> {
  /// Watch Artwork Quarantines By Customer Provider
  ///
  /// Watches Quarantines by Customer ID
  /// Listens to updates and deletions
  ///
  /// Deletion Stream provides IDs of deleted quarantines
  ///
  /// Copied from [WatchArtworkQuarantinesByCustomer].
  const WatchArtworkQuarantinesByCustomerFamily();

  /// Watch Artwork Quarantines By Customer Provider
  ///
  /// Watches Quarantines by Customer ID
  /// Listens to updates and deletions
  ///
  /// Deletion Stream provides IDs of deleted quarantines
  ///
  /// Copied from [WatchArtworkQuarantinesByCustomer].
  WatchArtworkQuarantinesByCustomerProvider call(
    int customerId,
  ) {
    return WatchArtworkQuarantinesByCustomerProvider(
      customerId,
    );
  }

  @override
  WatchArtworkQuarantinesByCustomerProvider getProviderOverride(
    covariant WatchArtworkQuarantinesByCustomerProvider provider,
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
  String? get name => r'watchArtworkQuarantinesByCustomerProvider';
}

/// Watch Artwork Quarantines By Customer Provider
///
/// Watches Quarantines by Customer ID
/// Listens to updates and deletions
///
/// Deletion Stream provides IDs of deleted quarantines
///
/// Copied from [WatchArtworkQuarantinesByCustomer].
class WatchArtworkQuarantinesByCustomerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        WatchArtworkQuarantinesByCustomer, List<ArtworkQuarantine>> {
  /// Watch Artwork Quarantines By Customer Provider
  ///
  /// Watches Quarantines by Customer ID
  /// Listens to updates and deletions
  ///
  /// Deletion Stream provides IDs of deleted quarantines
  ///
  /// Copied from [WatchArtworkQuarantinesByCustomer].
  WatchArtworkQuarantinesByCustomerProvider(
    int customerId,
  ) : this._internal(
          () => WatchArtworkQuarantinesByCustomer()..customerId = customerId,
          from: watchArtworkQuarantinesByCustomerProvider,
          name: r'watchArtworkQuarantinesByCustomerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantinesByCustomerHash,
          dependencies: WatchArtworkQuarantinesByCustomerFamily._dependencies,
          allTransitiveDependencies: WatchArtworkQuarantinesByCustomerFamily
              ._allTransitiveDependencies,
          customerId: customerId,
        );

  WatchArtworkQuarantinesByCustomerProvider._internal(
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
  FutureOr<List<ArtworkQuarantine>> runNotifierBuild(
    covariant WatchArtworkQuarantinesByCustomer notifier,
  ) {
    return notifier.build(
      customerId,
    );
  }

  @override
  Override overrideWith(WatchArtworkQuarantinesByCustomer Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkQuarantinesByCustomerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WatchArtworkQuarantinesByCustomer,
      List<ArtworkQuarantine>> createElement() {
    return _WatchArtworkQuarantinesByCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantinesByCustomerProvider &&
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
mixin WatchArtworkQuarantinesByCustomerRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArtworkQuarantine>> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _WatchArtworkQuarantinesByCustomerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchArtworkQuarantinesByCustomer,
        List<ArtworkQuarantine>> with WatchArtworkQuarantinesByCustomerRef {
  _WatchArtworkQuarantinesByCustomerProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as WatchArtworkQuarantinesByCustomerProvider).customerId;
}

String _$allArtworkQuarantinesRealTimeHash() =>
    r'6ba7ebfd0fe1cee1c367205f121f853007a44ff0';

abstract class _$AllArtworkQuarantinesRealTime
    extends BuildlessAutoDisposeAsyncNotifier<List<ArtworkQuarantine>> {
  late final String sessionId;

  FutureOr<List<ArtworkQuarantine>> build(
    String sessionId,
  );
}

/// Watch All Artwork Quarantines Provider
///
/// Copied from [AllArtworkQuarantinesRealTime].
@ProviderFor(AllArtworkQuarantinesRealTime)
const allArtworkQuarantinesRealTimeProvider =
    AllArtworkQuarantinesRealTimeFamily();

/// Watch All Artwork Quarantines Provider
///
/// Copied from [AllArtworkQuarantinesRealTime].
class AllArtworkQuarantinesRealTimeFamily
    extends Family<AsyncValue<List<ArtworkQuarantine>>> {
  /// Watch All Artwork Quarantines Provider
  ///
  /// Copied from [AllArtworkQuarantinesRealTime].
  const AllArtworkQuarantinesRealTimeFamily();

  /// Watch All Artwork Quarantines Provider
  ///
  /// Copied from [AllArtworkQuarantinesRealTime].
  AllArtworkQuarantinesRealTimeProvider call(
    String sessionId,
  ) {
    return AllArtworkQuarantinesRealTimeProvider(
      sessionId,
    );
  }

  @override
  AllArtworkQuarantinesRealTimeProvider getProviderOverride(
    covariant AllArtworkQuarantinesRealTimeProvider provider,
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
  String? get name => r'allArtworkQuarantinesRealTimeProvider';
}

/// Watch All Artwork Quarantines Provider
///
/// Copied from [AllArtworkQuarantinesRealTime].
class AllArtworkQuarantinesRealTimeProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AllArtworkQuarantinesRealTime,
        List<ArtworkQuarantine>> {
  /// Watch All Artwork Quarantines Provider
  ///
  /// Copied from [AllArtworkQuarantinesRealTime].
  AllArtworkQuarantinesRealTimeProvider(
    String sessionId,
  ) : this._internal(
          () => AllArtworkQuarantinesRealTime()..sessionId = sessionId,
          from: allArtworkQuarantinesRealTimeProvider,
          name: r'allArtworkQuarantinesRealTimeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allArtworkQuarantinesRealTimeHash,
          dependencies: AllArtworkQuarantinesRealTimeFamily._dependencies,
          allTransitiveDependencies:
              AllArtworkQuarantinesRealTimeFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  AllArtworkQuarantinesRealTimeProvider._internal(
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
  FutureOr<List<ArtworkQuarantine>> runNotifierBuild(
    covariant AllArtworkQuarantinesRealTime notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(AllArtworkQuarantinesRealTime Function() create) {
    return ProviderOverride(
      origin: this,
      override: AllArtworkQuarantinesRealTimeProvider._internal(
        () => create()..sessionId = sessionId,
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
  AutoDisposeAsyncNotifierProviderElement<AllArtworkQuarantinesRealTime,
      List<ArtworkQuarantine>> createElement() {
    return _AllArtworkQuarantinesRealTimeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllArtworkQuarantinesRealTimeProvider &&
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
mixin AllArtworkQuarantinesRealTimeRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArtworkQuarantine>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _AllArtworkQuarantinesRealTimeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        AllArtworkQuarantinesRealTime,
        List<ArtworkQuarantine>> with AllArtworkQuarantinesRealTimeRef {
  _AllArtworkQuarantinesRealTimeProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as AllArtworkQuarantinesRealTimeProvider).sessionId;
}

String _$watchArtworkQuarantinesByCustomerIdAndStatusHash() =>
    r'61424439027033168762d050913458c960e1697f';

abstract class _$WatchArtworkQuarantinesByCustomerIdAndStatus
    extends BuildlessAutoDisposeAsyncNotifier<List<ArtworkQuarantine>> {
  late final int customerId;
  late final ArtworkQuarantineGroupStatus status;

  FutureOr<List<ArtworkQuarantine>> build({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  });
}

/// Watch Artwork Quarantines By Customer ID And Status Provider
///
/// Watches Quarantines by Customer ID and Status
/// Listens to updates and deletions
///
/// Deletion Stream provides IDs of deleted quarantines
///
/// Copied from [WatchArtworkQuarantinesByCustomerIdAndStatus].
@ProviderFor(WatchArtworkQuarantinesByCustomerIdAndStatus)
const watchArtworkQuarantinesByCustomerIdAndStatusProvider =
    WatchArtworkQuarantinesByCustomerIdAndStatusFamily();

/// Watch Artwork Quarantines By Customer ID And Status Provider
///
/// Watches Quarantines by Customer ID and Status
/// Listens to updates and deletions
///
/// Deletion Stream provides IDs of deleted quarantines
///
/// Copied from [WatchArtworkQuarantinesByCustomerIdAndStatus].
class WatchArtworkQuarantinesByCustomerIdAndStatusFamily
    extends Family<AsyncValue<List<ArtworkQuarantine>>> {
  /// Watch Artwork Quarantines By Customer ID And Status Provider
  ///
  /// Watches Quarantines by Customer ID and Status
  /// Listens to updates and deletions
  ///
  /// Deletion Stream provides IDs of deleted quarantines
  ///
  /// Copied from [WatchArtworkQuarantinesByCustomerIdAndStatus].
  const WatchArtworkQuarantinesByCustomerIdAndStatusFamily();

  /// Watch Artwork Quarantines By Customer ID And Status Provider
  ///
  /// Watches Quarantines by Customer ID and Status
  /// Listens to updates and deletions
  ///
  /// Deletion Stream provides IDs of deleted quarantines
  ///
  /// Copied from [WatchArtworkQuarantinesByCustomerIdAndStatus].
  WatchArtworkQuarantinesByCustomerIdAndStatusProvider call({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) {
    return WatchArtworkQuarantinesByCustomerIdAndStatusProvider(
      customerId: customerId,
      status: status,
    );
  }

  @override
  WatchArtworkQuarantinesByCustomerIdAndStatusProvider getProviderOverride(
    covariant WatchArtworkQuarantinesByCustomerIdAndStatusProvider provider,
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
  String? get name => r'watchArtworkQuarantinesByCustomerIdAndStatusProvider';
}

/// Watch Artwork Quarantines By Customer ID And Status Provider
///
/// Watches Quarantines by Customer ID and Status
/// Listens to updates and deletions
///
/// Deletion Stream provides IDs of deleted quarantines
///
/// Copied from [WatchArtworkQuarantinesByCustomerIdAndStatus].
class WatchArtworkQuarantinesByCustomerIdAndStatusProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        WatchArtworkQuarantinesByCustomerIdAndStatus, List<ArtworkQuarantine>> {
  /// Watch Artwork Quarantines By Customer ID And Status Provider
  ///
  /// Watches Quarantines by Customer ID and Status
  /// Listens to updates and deletions
  ///
  /// Deletion Stream provides IDs of deleted quarantines
  ///
  /// Copied from [WatchArtworkQuarantinesByCustomerIdAndStatus].
  WatchArtworkQuarantinesByCustomerIdAndStatusProvider({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) : this._internal(
          () => WatchArtworkQuarantinesByCustomerIdAndStatus()
            ..customerId = customerId
            ..status = status,
          from: watchArtworkQuarantinesByCustomerIdAndStatusProvider,
          name: r'watchArtworkQuarantinesByCustomerIdAndStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantinesByCustomerIdAndStatusHash,
          dependencies:
              WatchArtworkQuarantinesByCustomerIdAndStatusFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkQuarantinesByCustomerIdAndStatusFamily
                  ._allTransitiveDependencies,
          customerId: customerId,
          status: status,
        );

  WatchArtworkQuarantinesByCustomerIdAndStatusProvider._internal(
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
  FutureOr<List<ArtworkQuarantine>> runNotifierBuild(
    covariant WatchArtworkQuarantinesByCustomerIdAndStatus notifier,
  ) {
    return notifier.build(
      customerId: customerId,
      status: status,
    );
  }

  @override
  Override overrideWith(
      WatchArtworkQuarantinesByCustomerIdAndStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkQuarantinesByCustomerIdAndStatusProvider._internal(
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
      WatchArtworkQuarantinesByCustomerIdAndStatus,
      List<ArtworkQuarantine>> createElement() {
    return _WatchArtworkQuarantinesByCustomerIdAndStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantinesByCustomerIdAndStatusProvider &&
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
mixin WatchArtworkQuarantinesByCustomerIdAndStatusRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArtworkQuarantine>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `status` of this provider.
  ArtworkQuarantineGroupStatus get status;
}

class _WatchArtworkQuarantinesByCustomerIdAndStatusProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchArtworkQuarantinesByCustomerIdAndStatus, List<ArtworkQuarantine>>
    with WatchArtworkQuarantinesByCustomerIdAndStatusRef {
  _WatchArtworkQuarantinesByCustomerIdAndStatusProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as WatchArtworkQuarantinesByCustomerIdAndStatusProvider)
          .customerId;
  @override
  ArtworkQuarantineGroupStatus get status =>
      (origin as WatchArtworkQuarantinesByCustomerIdAndStatusProvider).status;
}

String _$watchArtworkQuarantinesByGroupIdHash() =>
    r'eaf54549766fd66f1f70c9a5d7196119a2b5bf98';

abstract class _$WatchArtworkQuarantinesByGroupId
    extends BuildlessAutoDisposeAsyncNotifier<List<ArtworkQuarantine>> {
  late final int groupId;

  FutureOr<List<ArtworkQuarantine>> build(
    int groupId,
  );
}

/// Watch Artwork Quarantines By Group ID Provider
///
/// Watches Quarantines by Group ID
/// Listens to updates and deletions
///
/// Copied from [WatchArtworkQuarantinesByGroupId].
@ProviderFor(WatchArtworkQuarantinesByGroupId)
const watchArtworkQuarantinesByGroupIdProvider =
    WatchArtworkQuarantinesByGroupIdFamily();

/// Watch Artwork Quarantines By Group ID Provider
///
/// Watches Quarantines by Group ID
/// Listens to updates and deletions
///
/// Copied from [WatchArtworkQuarantinesByGroupId].
class WatchArtworkQuarantinesByGroupIdFamily
    extends Family<AsyncValue<List<ArtworkQuarantine>>> {
  /// Watch Artwork Quarantines By Group ID Provider
  ///
  /// Watches Quarantines by Group ID
  /// Listens to updates and deletions
  ///
  /// Copied from [WatchArtworkQuarantinesByGroupId].
  const WatchArtworkQuarantinesByGroupIdFamily();

  /// Watch Artwork Quarantines By Group ID Provider
  ///
  /// Watches Quarantines by Group ID
  /// Listens to updates and deletions
  ///
  /// Copied from [WatchArtworkQuarantinesByGroupId].
  WatchArtworkQuarantinesByGroupIdProvider call(
    int groupId,
  ) {
    return WatchArtworkQuarantinesByGroupIdProvider(
      groupId,
    );
  }

  @override
  WatchArtworkQuarantinesByGroupIdProvider getProviderOverride(
    covariant WatchArtworkQuarantinesByGroupIdProvider provider,
  ) {
    return call(
      provider.groupId,
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
  String? get name => r'watchArtworkQuarantinesByGroupIdProvider';
}

/// Watch Artwork Quarantines By Group ID Provider
///
/// Watches Quarantines by Group ID
/// Listens to updates and deletions
///
/// Copied from [WatchArtworkQuarantinesByGroupId].
class WatchArtworkQuarantinesByGroupIdProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        WatchArtworkQuarantinesByGroupId, List<ArtworkQuarantine>> {
  /// Watch Artwork Quarantines By Group ID Provider
  ///
  /// Watches Quarantines by Group ID
  /// Listens to updates and deletions
  ///
  /// Copied from [WatchArtworkQuarantinesByGroupId].
  WatchArtworkQuarantinesByGroupIdProvider(
    int groupId,
  ) : this._internal(
          () => WatchArtworkQuarantinesByGroupId()..groupId = groupId,
          from: watchArtworkQuarantinesByGroupIdProvider,
          name: r'watchArtworkQuarantinesByGroupIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantinesByGroupIdHash,
          dependencies: WatchArtworkQuarantinesByGroupIdFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkQuarantinesByGroupIdFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  WatchArtworkQuarantinesByGroupIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final int groupId;

  @override
  FutureOr<List<ArtworkQuarantine>> runNotifierBuild(
    covariant WatchArtworkQuarantinesByGroupId notifier,
  ) {
    return notifier.build(
      groupId,
    );
  }

  @override
  Override overrideWith(WatchArtworkQuarantinesByGroupId Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkQuarantinesByGroupIdProvider._internal(
        () => create()..groupId = groupId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WatchArtworkQuarantinesByGroupId,
      List<ArtworkQuarantine>> createElement() {
    return _WatchArtworkQuarantinesByGroupIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantinesByGroupIdProvider &&
        other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkQuarantinesByGroupIdRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArtworkQuarantine>> {
  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _WatchArtworkQuarantinesByGroupIdProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchArtworkQuarantinesByGroupId,
        List<ArtworkQuarantine>> with WatchArtworkQuarantinesByGroupIdRef {
  _WatchArtworkQuarantinesByGroupIdProviderElement(super.provider);

  @override
  int get groupId =>
      (origin as WatchArtworkQuarantinesByGroupIdProvider).groupId;
}

String _$watchArtworkQuarantinesByGroupIdAndStatusHash() =>
    r'fbcba786532a63d151f276bcd6c10137fa62957c';

abstract class _$WatchArtworkQuarantinesByGroupIdAndStatus
    extends BuildlessAutoDisposeAsyncNotifier<List<ArtworkQuarantine>> {
  late final int groupId;
  late final ArtworkQuarantineGroupStatus status;

  FutureOr<List<ArtworkQuarantine>> build({
    required int groupId,
    required ArtworkQuarantineGroupStatus status,
  });
}

/// Watch Artwork Quarantines By Group ID And Status Provider
///
/// Watches Quarantines by Group ID and Status
/// Listens to updates and deletions
///
/// Copied from [WatchArtworkQuarantinesByGroupIdAndStatus].
@ProviderFor(WatchArtworkQuarantinesByGroupIdAndStatus)
const watchArtworkQuarantinesByGroupIdAndStatusProvider =
    WatchArtworkQuarantinesByGroupIdAndStatusFamily();

/// Watch Artwork Quarantines By Group ID And Status Provider
///
/// Watches Quarantines by Group ID and Status
/// Listens to updates and deletions
///
/// Copied from [WatchArtworkQuarantinesByGroupIdAndStatus].
class WatchArtworkQuarantinesByGroupIdAndStatusFamily
    extends Family<AsyncValue<List<ArtworkQuarantine>>> {
  /// Watch Artwork Quarantines By Group ID And Status Provider
  ///
  /// Watches Quarantines by Group ID and Status
  /// Listens to updates and deletions
  ///
  /// Copied from [WatchArtworkQuarantinesByGroupIdAndStatus].
  const WatchArtworkQuarantinesByGroupIdAndStatusFamily();

  /// Watch Artwork Quarantines By Group ID And Status Provider
  ///
  /// Watches Quarantines by Group ID and Status
  /// Listens to updates and deletions
  ///
  /// Copied from [WatchArtworkQuarantinesByGroupIdAndStatus].
  WatchArtworkQuarantinesByGroupIdAndStatusProvider call({
    required int groupId,
    required ArtworkQuarantineGroupStatus status,
  }) {
    return WatchArtworkQuarantinesByGroupIdAndStatusProvider(
      groupId: groupId,
      status: status,
    );
  }

  @override
  WatchArtworkQuarantinesByGroupIdAndStatusProvider getProviderOverride(
    covariant WatchArtworkQuarantinesByGroupIdAndStatusProvider provider,
  ) {
    return call(
      groupId: provider.groupId,
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
  String? get name => r'watchArtworkQuarantinesByGroupIdAndStatusProvider';
}

/// Watch Artwork Quarantines By Group ID And Status Provider
///
/// Watches Quarantines by Group ID and Status
/// Listens to updates and deletions
///
/// Copied from [WatchArtworkQuarantinesByGroupIdAndStatus].
class WatchArtworkQuarantinesByGroupIdAndStatusProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        WatchArtworkQuarantinesByGroupIdAndStatus, List<ArtworkQuarantine>> {
  /// Watch Artwork Quarantines By Group ID And Status Provider
  ///
  /// Watches Quarantines by Group ID and Status
  /// Listens to updates and deletions
  ///
  /// Copied from [WatchArtworkQuarantinesByGroupIdAndStatus].
  WatchArtworkQuarantinesByGroupIdAndStatusProvider({
    required int groupId,
    required ArtworkQuarantineGroupStatus status,
  }) : this._internal(
          () => WatchArtworkQuarantinesByGroupIdAndStatus()
            ..groupId = groupId
            ..status = status,
          from: watchArtworkQuarantinesByGroupIdAndStatusProvider,
          name: r'watchArtworkQuarantinesByGroupIdAndStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkQuarantinesByGroupIdAndStatusHash,
          dependencies:
              WatchArtworkQuarantinesByGroupIdAndStatusFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkQuarantinesByGroupIdAndStatusFamily
                  ._allTransitiveDependencies,
          groupId: groupId,
          status: status,
        );

  WatchArtworkQuarantinesByGroupIdAndStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
    required this.status,
  }) : super.internal();

  final int groupId;
  final ArtworkQuarantineGroupStatus status;

  @override
  FutureOr<List<ArtworkQuarantine>> runNotifierBuild(
    covariant WatchArtworkQuarantinesByGroupIdAndStatus notifier,
  ) {
    return notifier.build(
      groupId: groupId,
      status: status,
    );
  }

  @override
  Override overrideWith(
      WatchArtworkQuarantinesByGroupIdAndStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkQuarantinesByGroupIdAndStatusProvider._internal(
        () => create()
          ..groupId = groupId
          ..status = status,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
      WatchArtworkQuarantinesByGroupIdAndStatus,
      List<ArtworkQuarantine>> createElement() {
    return _WatchArtworkQuarantinesByGroupIdAndStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkQuarantinesByGroupIdAndStatusProvider &&
        other.groupId == groupId &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkQuarantinesByGroupIdAndStatusRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArtworkQuarantine>> {
  /// The parameter `groupId` of this provider.
  int get groupId;

  /// The parameter `status` of this provider.
  ArtworkQuarantineGroupStatus get status;
}

class _WatchArtworkQuarantinesByGroupIdAndStatusProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchArtworkQuarantinesByGroupIdAndStatus, List<ArtworkQuarantine>>
    with WatchArtworkQuarantinesByGroupIdAndStatusRef {
  _WatchArtworkQuarantinesByGroupIdAndStatusProviderElement(super.provider);

  @override
  int get groupId =>
      (origin as WatchArtworkQuarantinesByGroupIdAndStatusProvider).groupId;
  @override
  ArtworkQuarantineGroupStatus get status =>
      (origin as WatchArtworkQuarantinesByGroupIdAndStatusProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
