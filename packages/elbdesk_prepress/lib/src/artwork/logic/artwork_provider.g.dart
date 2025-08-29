// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkRepositoryHash() => r'078d4c40dff82edf99356afa0bfe64e6c3496c77';

/// See also [artworkRepository].
@ProviderFor(artworkRepository)
final artworkRepositoryProvider =
    AutoDisposeProvider<ArtworkRepository>.internal(
  artworkRepository,
  name: r'artworkRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$artworkRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArtworkRepositoryRef = AutoDisposeProviderRef<ArtworkRepository>;
String _$findArtworksHash() => r'9778ae92324e000723697737943b2777b6a37efa';

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

/// See also [findArtworks].
@ProviderFor(findArtworks)
const findArtworksProvider = FindArtworksFamily();

/// See also [findArtworks].
class FindArtworksFamily extends Family<AsyncValue<List<Artwork>>> {
  /// See also [findArtworks].
  const FindArtworksFamily();

  /// See also [findArtworks].
  FindArtworksProvider call(
    String sessionId,
  ) {
    return FindArtworksProvider(
      sessionId,
    );
  }

  @override
  FindArtworksProvider getProviderOverride(
    covariant FindArtworksProvider provider,
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
  String? get name => r'findArtworksProvider';
}

/// See also [findArtworks].
class FindArtworksProvider extends AutoDisposeFutureProvider<List<Artwork>> {
  /// See also [findArtworks].
  FindArtworksProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findArtworks(
            ref as FindArtworksRef,
            sessionId,
          ),
          from: findArtworksProvider,
          name: r'findArtworksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findArtworksHash,
          dependencies: FindArtworksFamily._dependencies,
          allTransitiveDependencies:
              FindArtworksFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindArtworksProvider._internal(
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
    FutureOr<List<Artwork>> Function(FindArtworksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindArtworksProvider._internal(
        (ref) => create(ref as FindArtworksRef),
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
  AutoDisposeFutureProviderElement<List<Artwork>> createElement() {
    return _FindArtworksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindArtworksProvider && other.sessionId == sessionId;
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
mixin FindArtworksRef on AutoDisposeFutureProviderRef<List<Artwork>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindArtworksProviderElement
    extends AutoDisposeFutureProviderElement<List<Artwork>>
    with FindArtworksRef {
  _FindArtworksProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindArtworksProvider).sessionId;
}

String _$fetchArtworkHistoryHash() =>
    r'401ed910313ac7d9a631c66742c34eb071b1e2d6';

/// See also [fetchArtworkHistory].
@ProviderFor(fetchArtworkHistory)
const fetchArtworkHistoryProvider = FetchArtworkHistoryFamily();

/// See also [fetchArtworkHistory].
class FetchArtworkHistoryFamily extends Family<AsyncValue<List<Artwork>>> {
  /// See also [fetchArtworkHistory].
  const FetchArtworkHistoryFamily();

  /// See also [fetchArtworkHistory].
  FetchArtworkHistoryProvider call(
    int artworkMasterId,
    String sessionId,
  ) {
    return FetchArtworkHistoryProvider(
      artworkMasterId,
      sessionId,
    );
  }

  @override
  FetchArtworkHistoryProvider getProviderOverride(
    covariant FetchArtworkHistoryProvider provider,
  ) {
    return call(
      provider.artworkMasterId,
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
  String? get name => r'fetchArtworkHistoryProvider';
}

/// See also [fetchArtworkHistory].
class FetchArtworkHistoryProvider
    extends AutoDisposeFutureProvider<List<Artwork>> {
  /// See also [fetchArtworkHistory].
  FetchArtworkHistoryProvider(
    int artworkMasterId,
    String sessionId,
  ) : this._internal(
          (ref) => fetchArtworkHistory(
            ref as FetchArtworkHistoryRef,
            artworkMasterId,
            sessionId,
          ),
          from: fetchArtworkHistoryProvider,
          name: r'fetchArtworkHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkHistoryHash,
          dependencies: FetchArtworkHistoryFamily._dependencies,
          allTransitiveDependencies:
              FetchArtworkHistoryFamily._allTransitiveDependencies,
          artworkMasterId: artworkMasterId,
          sessionId: sessionId,
        );

  FetchArtworkHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkMasterId,
    required this.sessionId,
  }) : super.internal();

  final int artworkMasterId;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<Artwork>> Function(FetchArtworkHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkHistoryProvider._internal(
        (ref) => create(ref as FetchArtworkHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkMasterId: artworkMasterId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Artwork>> createElement() {
    return _FetchArtworkHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkHistoryProvider &&
        other.artworkMasterId == artworkMasterId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkMasterId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchArtworkHistoryRef on AutoDisposeFutureProviderRef<List<Artwork>> {
  /// The parameter `artworkMasterId` of this provider.
  int get artworkMasterId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchArtworkHistoryProviderElement
    extends AutoDisposeFutureProviderElement<List<Artwork>>
    with FetchArtworkHistoryRef {
  _FetchArtworkHistoryProviderElement(super.provider);

  @override
  int get artworkMasterId =>
      (origin as FetchArtworkHistoryProvider).artworkMasterId;
  @override
  String get sessionId => (origin as FetchArtworkHistoryProvider).sessionId;
}

String _$fetchArtworkReadOnlyHash() =>
    r'586a3988d58b4a2588104a4f05ff633225f58427';

/// See also [fetchArtworkReadOnly].
@ProviderFor(fetchArtworkReadOnly)
const fetchArtworkReadOnlyProvider = FetchArtworkReadOnlyFamily();

/// See also [fetchArtworkReadOnly].
class FetchArtworkReadOnlyFamily extends Family<AsyncValue<Artwork?>> {
  /// See also [fetchArtworkReadOnly].
  const FetchArtworkReadOnlyFamily();

  /// See also [fetchArtworkReadOnly].
  FetchArtworkReadOnlyProvider call(
    int id,
    String sessionId,
  ) {
    return FetchArtworkReadOnlyProvider(
      id,
      sessionId,
    );
  }

  @override
  FetchArtworkReadOnlyProvider getProviderOverride(
    covariant FetchArtworkReadOnlyProvider provider,
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
  String? get name => r'fetchArtworkReadOnlyProvider';
}

/// See also [fetchArtworkReadOnly].
class FetchArtworkReadOnlyProvider extends AutoDisposeFutureProvider<Artwork?> {
  /// See also [fetchArtworkReadOnly].
  FetchArtworkReadOnlyProvider(
    int id,
    String sessionId,
  ) : this._internal(
          (ref) => fetchArtworkReadOnly(
            ref as FetchArtworkReadOnlyRef,
            id,
            sessionId,
          ),
          from: fetchArtworkReadOnlyProvider,
          name: r'fetchArtworkReadOnlyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkReadOnlyHash,
          dependencies: FetchArtworkReadOnlyFamily._dependencies,
          allTransitiveDependencies:
              FetchArtworkReadOnlyFamily._allTransitiveDependencies,
          id: id,
          sessionId: sessionId,
        );

  FetchArtworkReadOnlyProvider._internal(
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
    FutureOr<Artwork?> Function(FetchArtworkReadOnlyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkReadOnlyProvider._internal(
        (ref) => create(ref as FetchArtworkReadOnlyRef),
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
  AutoDisposeFutureProviderElement<Artwork?> createElement() {
    return _FetchArtworkReadOnlyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkReadOnlyProvider &&
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
mixin FetchArtworkReadOnlyRef on AutoDisposeFutureProviderRef<Artwork?> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchArtworkReadOnlyProviderElement
    extends AutoDisposeFutureProviderElement<Artwork?>
    with FetchArtworkReadOnlyRef {
  _FetchArtworkReadOnlyProviderElement(super.provider);

  @override
  int get id => (origin as FetchArtworkReadOnlyProvider).id;
  @override
  String get sessionId => (origin as FetchArtworkReadOnlyProvider).sessionId;
}

String _$watchArtworkHash() => r'74165e60c383ef05fac01eed26152412360c147c';

/// See also [watchArtwork].
@ProviderFor(watchArtwork)
const watchArtworkProvider = WatchArtworkFamily();

/// See also [watchArtwork].
class WatchArtworkFamily extends Family<AsyncValue<Artwork>> {
  /// See also [watchArtwork].
  const WatchArtworkFamily();

  /// See also [watchArtwork].
  WatchArtworkProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchArtworkProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchArtworkProvider getProviderOverride(
    covariant WatchArtworkProvider provider,
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
  String? get name => r'watchArtworkProvider';
}

/// See also [watchArtwork].
class WatchArtworkProvider extends AutoDisposeStreamProvider<Artwork> {
  /// See also [watchArtwork].
  WatchArtworkProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchArtwork(
            ref as WatchArtworkRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchArtworkProvider,
          name: r'watchArtworkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkHash,
          dependencies: WatchArtworkFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchArtworkProvider._internal(
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
    Stream<Artwork> Function(WatchArtworkRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkProvider._internal(
        (ref) => create(ref as WatchArtworkRef),
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
  AutoDisposeStreamProviderElement<Artwork> createElement() {
    return _WatchArtworkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkProvider &&
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
mixin WatchArtworkRef on AutoDisposeStreamProviderRef<Artwork> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchArtworkProviderElement
    extends AutoDisposeStreamProviderElement<Artwork> with WatchArtworkRef {
  _WatchArtworkProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchArtworkProvider).sessionId;
  @override
  int get id => (origin as WatchArtworkProvider).id;
}

String _$watchArtworkReadOnlyHash() =>
    r'8a7d7d0f04a3d3db6be341e7586411f79242dac6';

/// See also [watchArtworkReadOnly].
@ProviderFor(watchArtworkReadOnly)
const watchArtworkReadOnlyProvider = WatchArtworkReadOnlyFamily();

/// See also [watchArtworkReadOnly].
class WatchArtworkReadOnlyFamily extends Family<AsyncValue<Artwork>> {
  /// See also [watchArtworkReadOnly].
  const WatchArtworkReadOnlyFamily();

  /// See also [watchArtworkReadOnly].
  WatchArtworkReadOnlyProvider call({
    required int id,
  }) {
    return WatchArtworkReadOnlyProvider(
      id: id,
    );
  }

  @override
  WatchArtworkReadOnlyProvider getProviderOverride(
    covariant WatchArtworkReadOnlyProvider provider,
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
  String? get name => r'watchArtworkReadOnlyProvider';
}

/// See also [watchArtworkReadOnly].
class WatchArtworkReadOnlyProvider extends AutoDisposeStreamProvider<Artwork> {
  /// See also [watchArtworkReadOnly].
  WatchArtworkReadOnlyProvider({
    required int id,
  }) : this._internal(
          (ref) => watchArtworkReadOnly(
            ref as WatchArtworkReadOnlyRef,
            id: id,
          ),
          from: watchArtworkReadOnlyProvider,
          name: r'watchArtworkReadOnlyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkReadOnlyHash,
          dependencies: WatchArtworkReadOnlyFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkReadOnlyFamily._allTransitiveDependencies,
          id: id,
        );

  WatchArtworkReadOnlyProvider._internal(
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
    Stream<Artwork> Function(WatchArtworkReadOnlyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkReadOnlyProvider._internal(
        (ref) => create(ref as WatchArtworkReadOnlyRef),
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
  AutoDisposeStreamProviderElement<Artwork> createElement() {
    return _WatchArtworkReadOnlyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkReadOnlyProvider && other.id == id;
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
mixin WatchArtworkReadOnlyRef on AutoDisposeStreamProviderRef<Artwork> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WatchArtworkReadOnlyProviderElement
    extends AutoDisposeStreamProviderElement<Artwork>
    with WatchArtworkReadOnlyRef {
  _WatchArtworkReadOnlyProviderElement(super.provider);

  @override
  int get id => (origin as WatchArtworkReadOnlyProvider).id;
}

String _$fetchArtworksBySalesOrderHash() =>
    r'1aac4bf76ba29215eff4b0007568433e154eea81';

/// See also [fetchArtworksBySalesOrder].
@ProviderFor(fetchArtworksBySalesOrder)
const fetchArtworksBySalesOrderProvider = FetchArtworksBySalesOrderFamily();

/// See also [fetchArtworksBySalesOrder].
class FetchArtworksBySalesOrderFamily
    extends Family<AsyncValue<List<Artwork>>> {
  /// See also [fetchArtworksBySalesOrder].
  const FetchArtworksBySalesOrderFamily();

  /// See also [fetchArtworksBySalesOrder].
  FetchArtworksBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return FetchArtworksBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  FetchArtworksBySalesOrderProvider getProviderOverride(
    covariant FetchArtworksBySalesOrderProvider provider,
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
  String? get name => r'fetchArtworksBySalesOrderProvider';
}

/// See also [fetchArtworksBySalesOrder].
class FetchArtworksBySalesOrderProvider
    extends AutoDisposeFutureProvider<List<Artwork>> {
  /// See also [fetchArtworksBySalesOrder].
  FetchArtworksBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => fetchArtworksBySalesOrder(
            ref as FetchArtworksBySalesOrderRef,
            salesOrderId,
          ),
          from: fetchArtworksBySalesOrderProvider,
          name: r'fetchArtworksBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworksBySalesOrderHash,
          dependencies: FetchArtworksBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              FetchArtworksBySalesOrderFamily._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  FetchArtworksBySalesOrderProvider._internal(
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
    FutureOr<List<Artwork>> Function(FetchArtworksBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworksBySalesOrderProvider._internal(
        (ref) => create(ref as FetchArtworksBySalesOrderRef),
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
  AutoDisposeFutureProviderElement<List<Artwork>> createElement() {
    return _FetchArtworksBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworksBySalesOrderProvider &&
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
mixin FetchArtworksBySalesOrderRef
    on AutoDisposeFutureProviderRef<List<Artwork>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _FetchArtworksBySalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<Artwork>>
    with FetchArtworksBySalesOrderRef {
  _FetchArtworksBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as FetchArtworksBySalesOrderProvider).salesOrderId;
}

String _$watchArtworkUpdatesBySalesOrderHash() =>
    r'b9379dc27843a02f4140185f9d5153056eff92c1';

/// See also [watchArtworkUpdatesBySalesOrder].
@ProviderFor(watchArtworkUpdatesBySalesOrder)
const watchArtworkUpdatesBySalesOrderProvider =
    WatchArtworkUpdatesBySalesOrderFamily();

/// See also [watchArtworkUpdatesBySalesOrder].
class WatchArtworkUpdatesBySalesOrderFamily
    extends Family<AsyncValue<Artwork>> {
  /// See also [watchArtworkUpdatesBySalesOrder].
  const WatchArtworkUpdatesBySalesOrderFamily();

  /// See also [watchArtworkUpdatesBySalesOrder].
  WatchArtworkUpdatesBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return WatchArtworkUpdatesBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  WatchArtworkUpdatesBySalesOrderProvider getProviderOverride(
    covariant WatchArtworkUpdatesBySalesOrderProvider provider,
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
  String? get name => r'watchArtworkUpdatesBySalesOrderProvider';
}

/// See also [watchArtworkUpdatesBySalesOrder].
class WatchArtworkUpdatesBySalesOrderProvider
    extends AutoDisposeStreamProvider<Artwork> {
  /// See also [watchArtworkUpdatesBySalesOrder].
  WatchArtworkUpdatesBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => watchArtworkUpdatesBySalesOrder(
            ref as WatchArtworkUpdatesBySalesOrderRef,
            salesOrderId,
          ),
          from: watchArtworkUpdatesBySalesOrderProvider,
          name: r'watchArtworkUpdatesBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkUpdatesBySalesOrderHash,
          dependencies: WatchArtworkUpdatesBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkUpdatesBySalesOrderFamily._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  WatchArtworkUpdatesBySalesOrderProvider._internal(
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
    Stream<Artwork> Function(WatchArtworkUpdatesBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkUpdatesBySalesOrderProvider._internal(
        (ref) => create(ref as WatchArtworkUpdatesBySalesOrderRef),
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
  AutoDisposeStreamProviderElement<Artwork> createElement() {
    return _WatchArtworkUpdatesBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkUpdatesBySalesOrderProvider &&
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
mixin WatchArtworkUpdatesBySalesOrderRef
    on AutoDisposeStreamProviderRef<Artwork> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchArtworkUpdatesBySalesOrderProviderElement
    extends AutoDisposeStreamProviderElement<Artwork>
    with WatchArtworkUpdatesBySalesOrderRef {
  _WatchArtworkUpdatesBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchArtworkUpdatesBySalesOrderProvider).salesOrderId;
}

String _$watchArtworkDeletionsBySalesOrderHash() =>
    r'6ffc6702f90335e2bf35f1a9fbcf3f6d934c6b21';

/// See also [watchArtworkDeletionsBySalesOrder].
@ProviderFor(watchArtworkDeletionsBySalesOrder)
const watchArtworkDeletionsBySalesOrderProvider =
    WatchArtworkDeletionsBySalesOrderFamily();

/// See also [watchArtworkDeletionsBySalesOrder].
class WatchArtworkDeletionsBySalesOrderFamily extends Family<AsyncValue<int>> {
  /// See also [watchArtworkDeletionsBySalesOrder].
  const WatchArtworkDeletionsBySalesOrderFamily();

  /// See also [watchArtworkDeletionsBySalesOrder].
  WatchArtworkDeletionsBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return WatchArtworkDeletionsBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  WatchArtworkDeletionsBySalesOrderProvider getProviderOverride(
    covariant WatchArtworkDeletionsBySalesOrderProvider provider,
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
  String? get name => r'watchArtworkDeletionsBySalesOrderProvider';
}

/// See also [watchArtworkDeletionsBySalesOrder].
class WatchArtworkDeletionsBySalesOrderProvider
    extends AutoDisposeStreamProvider<int> {
  /// See also [watchArtworkDeletionsBySalesOrder].
  WatchArtworkDeletionsBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => watchArtworkDeletionsBySalesOrder(
            ref as WatchArtworkDeletionsBySalesOrderRef,
            salesOrderId,
          ),
          from: watchArtworkDeletionsBySalesOrderProvider,
          name: r'watchArtworkDeletionsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkDeletionsBySalesOrderHash,
          dependencies: WatchArtworkDeletionsBySalesOrderFamily._dependencies,
          allTransitiveDependencies: WatchArtworkDeletionsBySalesOrderFamily
              ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  WatchArtworkDeletionsBySalesOrderProvider._internal(
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
    Stream<int> Function(WatchArtworkDeletionsBySalesOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkDeletionsBySalesOrderProvider._internal(
        (ref) => create(ref as WatchArtworkDeletionsBySalesOrderRef),
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
  AutoDisposeStreamProviderElement<int> createElement() {
    return _WatchArtworkDeletionsBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkDeletionsBySalesOrderProvider &&
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
mixin WatchArtworkDeletionsBySalesOrderRef
    on AutoDisposeStreamProviderRef<int> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchArtworkDeletionsBySalesOrderProviderElement
    extends AutoDisposeStreamProviderElement<int>
    with WatchArtworkDeletionsBySalesOrderRef {
  _WatchArtworkDeletionsBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchArtworkDeletionsBySalesOrderProvider).salesOrderId;
}

String _$fetchArtworkLogsHash() => r'ed7aef4b8d8a1d752115a866afbabbc3a7ed5670';

/// See also [fetchArtworkLogs].
@ProviderFor(fetchArtworkLogs)
const fetchArtworkLogsProvider = FetchArtworkLogsFamily();

/// See also [fetchArtworkLogs].
class FetchArtworkLogsFamily extends Family<AsyncValue<List<ArtworkLogDTO>>> {
  /// See also [fetchArtworkLogs].
  const FetchArtworkLogsFamily();

  /// See also [fetchArtworkLogs].
  FetchArtworkLogsProvider call(
    int artworkMasterId,
    String sessionId,
  ) {
    return FetchArtworkLogsProvider(
      artworkMasterId,
      sessionId,
    );
  }

  @override
  FetchArtworkLogsProvider getProviderOverride(
    covariant FetchArtworkLogsProvider provider,
  ) {
    return call(
      provider.artworkMasterId,
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
  String? get name => r'fetchArtworkLogsProvider';
}

/// See also [fetchArtworkLogs].
class FetchArtworkLogsProvider
    extends AutoDisposeFutureProvider<List<ArtworkLogDTO>> {
  /// See also [fetchArtworkLogs].
  FetchArtworkLogsProvider(
    int artworkMasterId,
    String sessionId,
  ) : this._internal(
          (ref) => fetchArtworkLogs(
            ref as FetchArtworkLogsRef,
            artworkMasterId,
            sessionId,
          ),
          from: fetchArtworkLogsProvider,
          name: r'fetchArtworkLogsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkLogsHash,
          dependencies: FetchArtworkLogsFamily._dependencies,
          allTransitiveDependencies:
              FetchArtworkLogsFamily._allTransitiveDependencies,
          artworkMasterId: artworkMasterId,
          sessionId: sessionId,
        );

  FetchArtworkLogsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkMasterId,
    required this.sessionId,
  }) : super.internal();

  final int artworkMasterId;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkLogDTO>> Function(FetchArtworkLogsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkLogsProvider._internal(
        (ref) => create(ref as FetchArtworkLogsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkMasterId: artworkMasterId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkLogDTO>> createElement() {
    return _FetchArtworkLogsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkLogsProvider &&
        other.artworkMasterId == artworkMasterId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkMasterId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchArtworkLogsRef on AutoDisposeFutureProviderRef<List<ArtworkLogDTO>> {
  /// The parameter `artworkMasterId` of this provider.
  int get artworkMasterId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchArtworkLogsProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkLogDTO>>
    with FetchArtworkLogsRef {
  _FetchArtworkLogsProviderElement(super.provider);

  @override
  int get artworkMasterId =>
      (origin as FetchArtworkLogsProvider).artworkMasterId;
  @override
  String get sessionId => (origin as FetchArtworkLogsProvider).sessionId;
}

String _$watchArtworksBySalesOrderHash() =>
    r'82caea360e2e67a50b740b835fb6d2e48aff5cbd';

abstract class _$WatchArtworksBySalesOrder
    extends BuildlessAutoDisposeAsyncNotifier<List<Artwork>> {
  late final int salesOrderId;
  late final String sessionId;

  FutureOr<List<Artwork>> build(
    int salesOrderId,
    String sessionId,
  );
}

/// See also [WatchArtworksBySalesOrder].
@ProviderFor(WatchArtworksBySalesOrder)
const watchArtworksBySalesOrderProvider = WatchArtworksBySalesOrderFamily();

/// See also [WatchArtworksBySalesOrder].
class WatchArtworksBySalesOrderFamily
    extends Family<AsyncValue<List<Artwork>>> {
  /// See also [WatchArtworksBySalesOrder].
  const WatchArtworksBySalesOrderFamily();

  /// See also [WatchArtworksBySalesOrder].
  WatchArtworksBySalesOrderProvider call(
    int salesOrderId,
    String sessionId,
  ) {
    return WatchArtworksBySalesOrderProvider(
      salesOrderId,
      sessionId,
    );
  }

  @override
  WatchArtworksBySalesOrderProvider getProviderOverride(
    covariant WatchArtworksBySalesOrderProvider provider,
  ) {
    return call(
      provider.salesOrderId,
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
  String? get name => r'watchArtworksBySalesOrderProvider';
}

/// See also [WatchArtworksBySalesOrder].
class WatchArtworksBySalesOrderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchArtworksBySalesOrder,
        List<Artwork>> {
  /// See also [WatchArtworksBySalesOrder].
  WatchArtworksBySalesOrderProvider(
    int salesOrderId,
    String sessionId,
  ) : this._internal(
          () => WatchArtworksBySalesOrder()
            ..salesOrderId = salesOrderId
            ..sessionId = sessionId,
          from: watchArtworksBySalesOrderProvider,
          name: r'watchArtworksBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworksBySalesOrderHash,
          dependencies: WatchArtworksBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworksBySalesOrderFamily._allTransitiveDependencies,
          salesOrderId: salesOrderId,
          sessionId: sessionId,
        );

  WatchArtworksBySalesOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.salesOrderId,
    required this.sessionId,
  }) : super.internal();

  final int salesOrderId;
  final String sessionId;

  @override
  FutureOr<List<Artwork>> runNotifierBuild(
    covariant WatchArtworksBySalesOrder notifier,
  ) {
    return notifier.build(
      salesOrderId,
      sessionId,
    );
  }

  @override
  Override overrideWith(WatchArtworksBySalesOrder Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworksBySalesOrderProvider._internal(
        () => create()
          ..salesOrderId = salesOrderId
          ..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        salesOrderId: salesOrderId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WatchArtworksBySalesOrder,
      List<Artwork>> createElement() {
    return _WatchArtworksBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworksBySalesOrderProvider &&
        other.salesOrderId == salesOrderId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, salesOrderId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworksBySalesOrderRef
    on AutoDisposeAsyncNotifierProviderRef<List<Artwork>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _WatchArtworksBySalesOrderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WatchArtworksBySalesOrder,
        List<Artwork>> with WatchArtworksBySalesOrderRef {
  _WatchArtworksBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchArtworksBySalesOrderProvider).salesOrderId;
  @override
  String get sessionId =>
      (origin as WatchArtworksBySalesOrderProvider).sessionId;
}

String _$watchArtworkRealtimeHash() =>
    r'85a19e1198741a31b1bd7804986b38dbb14c54ae';

abstract class _$WatchArtworkRealtime
    extends BuildlessAutoDisposeAsyncNotifier<Artwork?> {
  late final int artworkId;
  late final String sessionId;

  FutureOr<Artwork?> build(
    int artworkId,
    String sessionId,
  );
}

/// See also [WatchArtworkRealtime].
@ProviderFor(WatchArtworkRealtime)
const watchArtworkRealtimeProvider = WatchArtworkRealtimeFamily();

/// See also [WatchArtworkRealtime].
class WatchArtworkRealtimeFamily extends Family<AsyncValue<Artwork?>> {
  /// See also [WatchArtworkRealtime].
  const WatchArtworkRealtimeFamily();

  /// See also [WatchArtworkRealtime].
  WatchArtworkRealtimeProvider call(
    int artworkId,
    String sessionId,
  ) {
    return WatchArtworkRealtimeProvider(
      artworkId,
      sessionId,
    );
  }

  @override
  WatchArtworkRealtimeProvider getProviderOverride(
    covariant WatchArtworkRealtimeProvider provider,
  ) {
    return call(
      provider.artworkId,
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
  String? get name => r'watchArtworkRealtimeProvider';
}

/// See also [WatchArtworkRealtime].
class WatchArtworkRealtimeProvider extends AutoDisposeAsyncNotifierProviderImpl<
    WatchArtworkRealtime, Artwork?> {
  /// See also [WatchArtworkRealtime].
  WatchArtworkRealtimeProvider(
    int artworkId,
    String sessionId,
  ) : this._internal(
          () => WatchArtworkRealtime()
            ..artworkId = artworkId
            ..sessionId = sessionId,
          from: watchArtworkRealtimeProvider,
          name: r'watchArtworkRealtimeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkRealtimeHash,
          dependencies: WatchArtworkRealtimeFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkRealtimeFamily._allTransitiveDependencies,
          artworkId: artworkId,
          sessionId: sessionId,
        );

  WatchArtworkRealtimeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkId,
    required this.sessionId,
  }) : super.internal();

  final int artworkId;
  final String sessionId;

  @override
  FutureOr<Artwork?> runNotifierBuild(
    covariant WatchArtworkRealtime notifier,
  ) {
    return notifier.build(
      artworkId,
      sessionId,
    );
  }

  @override
  Override overrideWith(WatchArtworkRealtime Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkRealtimeProvider._internal(
        () => create()
          ..artworkId = artworkId
          ..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkId: artworkId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WatchArtworkRealtime, Artwork?>
      createElement() {
    return _WatchArtworkRealtimeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkRealtimeProvider &&
        other.artworkId == artworkId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkRealtimeRef on AutoDisposeAsyncNotifierProviderRef<Artwork?> {
  /// The parameter `artworkId` of this provider.
  int get artworkId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _WatchArtworkRealtimeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WatchArtworkRealtime,
        Artwork?> with WatchArtworkRealtimeRef {
  _WatchArtworkRealtimeProviderElement(super.provider);

  @override
  int get artworkId => (origin as WatchArtworkRealtimeProvider).artworkId;
  @override
  String get sessionId => (origin as WatchArtworkRealtimeProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
