// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soi_prepare_artwork_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$soiPrepareArtworkRepositoryHash() =>
    r'3ac60f716e166ee0d81df1379d3c1e052f8f1f69';

/// See also [soiPrepareArtworkRepository].
@ProviderFor(soiPrepareArtworkRepository)
final soiPrepareArtworkRepositoryProvider =
    AutoDisposeProvider<SoiPrepareArtworkRepository>.internal(
  soiPrepareArtworkRepository,
  name: r'soiPrepareArtworkRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$soiPrepareArtworkRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SoiPrepareArtworkRepositoryRef
    = AutoDisposeProviderRef<SoiPrepareArtworkRepository>;
String _$fetchSoiPrepareArtworksBySalesOrderHash() =>
    r'03d16a76c0dea287c4d33db8e0a0ca322327d34a';

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

/// See also [fetchSoiPrepareArtworksBySalesOrder].
@ProviderFor(fetchSoiPrepareArtworksBySalesOrder)
const fetchSoiPrepareArtworksBySalesOrderProvider =
    FetchSoiPrepareArtworksBySalesOrderFamily();

/// See also [fetchSoiPrepareArtworksBySalesOrder].
class FetchSoiPrepareArtworksBySalesOrderFamily
    extends Family<AsyncValue<List<SoiPrepareArtwork>>> {
  /// See also [fetchSoiPrepareArtworksBySalesOrder].
  const FetchSoiPrepareArtworksBySalesOrderFamily();

  /// See also [fetchSoiPrepareArtworksBySalesOrder].
  FetchSoiPrepareArtworksBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return FetchSoiPrepareArtworksBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  FetchSoiPrepareArtworksBySalesOrderProvider getProviderOverride(
    covariant FetchSoiPrepareArtworksBySalesOrderProvider provider,
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
  String? get name => r'fetchSoiPrepareArtworksBySalesOrderProvider';
}

/// See also [fetchSoiPrepareArtworksBySalesOrder].
class FetchSoiPrepareArtworksBySalesOrderProvider
    extends AutoDisposeFutureProvider<List<SoiPrepareArtwork>> {
  /// See also [fetchSoiPrepareArtworksBySalesOrder].
  FetchSoiPrepareArtworksBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => fetchSoiPrepareArtworksBySalesOrder(
            ref as FetchSoiPrepareArtworksBySalesOrderRef,
            salesOrderId,
          ),
          from: fetchSoiPrepareArtworksBySalesOrderProvider,
          name: r'fetchSoiPrepareArtworksBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchSoiPrepareArtworksBySalesOrderHash,
          dependencies: FetchSoiPrepareArtworksBySalesOrderFamily._dependencies,
          allTransitiveDependencies: FetchSoiPrepareArtworksBySalesOrderFamily
              ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  FetchSoiPrepareArtworksBySalesOrderProvider._internal(
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
    FutureOr<List<SoiPrepareArtwork>> Function(
            FetchSoiPrepareArtworksBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchSoiPrepareArtworksBySalesOrderProvider._internal(
        (ref) => create(ref as FetchSoiPrepareArtworksBySalesOrderRef),
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
  AutoDisposeFutureProviderElement<List<SoiPrepareArtwork>> createElement() {
    return _FetchSoiPrepareArtworksBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSoiPrepareArtworksBySalesOrderProvider &&
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
mixin FetchSoiPrepareArtworksBySalesOrderRef
    on AutoDisposeFutureProviderRef<List<SoiPrepareArtwork>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _FetchSoiPrepareArtworksBySalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<SoiPrepareArtwork>>
    with FetchSoiPrepareArtworksBySalesOrderRef {
  _FetchSoiPrepareArtworksBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as FetchSoiPrepareArtworksBySalesOrderProvider).salesOrderId;
}

String _$watchSoiPrepareArtworkDeletionsBySalesOrderHash() =>
    r'b805abf7687b63083f2623905ca39ed053fd0069';

/// See also [watchSoiPrepareArtworkDeletionsBySalesOrder].
@ProviderFor(watchSoiPrepareArtworkDeletionsBySalesOrder)
const watchSoiPrepareArtworkDeletionsBySalesOrderProvider =
    WatchSoiPrepareArtworkDeletionsBySalesOrderFamily();

/// See also [watchSoiPrepareArtworkDeletionsBySalesOrder].
class WatchSoiPrepareArtworkDeletionsBySalesOrderFamily
    extends Family<AsyncValue<int>> {
  /// See also [watchSoiPrepareArtworkDeletionsBySalesOrder].
  const WatchSoiPrepareArtworkDeletionsBySalesOrderFamily();

  /// See also [watchSoiPrepareArtworkDeletionsBySalesOrder].
  WatchSoiPrepareArtworkDeletionsBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return WatchSoiPrepareArtworkDeletionsBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  WatchSoiPrepareArtworkDeletionsBySalesOrderProvider getProviderOverride(
    covariant WatchSoiPrepareArtworkDeletionsBySalesOrderProvider provider,
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
  String? get name => r'watchSoiPrepareArtworkDeletionsBySalesOrderProvider';
}

/// See also [watchSoiPrepareArtworkDeletionsBySalesOrder].
class WatchSoiPrepareArtworkDeletionsBySalesOrderProvider
    extends AutoDisposeStreamProvider<int> {
  /// See also [watchSoiPrepareArtworkDeletionsBySalesOrder].
  WatchSoiPrepareArtworkDeletionsBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => watchSoiPrepareArtworkDeletionsBySalesOrder(
            ref as WatchSoiPrepareArtworkDeletionsBySalesOrderRef,
            salesOrderId,
          ),
          from: watchSoiPrepareArtworkDeletionsBySalesOrderProvider,
          name: r'watchSoiPrepareArtworkDeletionsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSoiPrepareArtworkDeletionsBySalesOrderHash,
          dependencies:
              WatchSoiPrepareArtworkDeletionsBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              WatchSoiPrepareArtworkDeletionsBySalesOrderFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  WatchSoiPrepareArtworkDeletionsBySalesOrderProvider._internal(
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
    Stream<int> Function(
            WatchSoiPrepareArtworkDeletionsBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSoiPrepareArtworkDeletionsBySalesOrderProvider._internal(
        (ref) => create(ref as WatchSoiPrepareArtworkDeletionsBySalesOrderRef),
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
    return _WatchSoiPrepareArtworkDeletionsBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSoiPrepareArtworkDeletionsBySalesOrderProvider &&
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
mixin WatchSoiPrepareArtworkDeletionsBySalesOrderRef
    on AutoDisposeStreamProviderRef<int> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchSoiPrepareArtworkDeletionsBySalesOrderProviderElement
    extends AutoDisposeStreamProviderElement<int>
    with WatchSoiPrepareArtworkDeletionsBySalesOrderRef {
  _WatchSoiPrepareArtworkDeletionsBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchSoiPrepareArtworkDeletionsBySalesOrderProvider)
          .salesOrderId;
}

String _$watchSoiPrepareArtworkHash() =>
    r'7505e94d1b1eb7a804eccb514de4eae8257303f9';

/// See also [watchSoiPrepareArtwork].
@ProviderFor(watchSoiPrepareArtwork)
const watchSoiPrepareArtworkProvider = WatchSoiPrepareArtworkFamily();

/// See also [watchSoiPrepareArtwork].
class WatchSoiPrepareArtworkFamily
    extends Family<AsyncValue<SoiPrepareArtwork>> {
  /// See also [watchSoiPrepareArtwork].
  const WatchSoiPrepareArtworkFamily();

  /// See also [watchSoiPrepareArtwork].
  WatchSoiPrepareArtworkProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchSoiPrepareArtworkProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchSoiPrepareArtworkProvider getProviderOverride(
    covariant WatchSoiPrepareArtworkProvider provider,
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
  String? get name => r'watchSoiPrepareArtworkProvider';
}

/// See also [watchSoiPrepareArtwork].
class WatchSoiPrepareArtworkProvider
    extends AutoDisposeStreamProvider<SoiPrepareArtwork> {
  /// See also [watchSoiPrepareArtwork].
  WatchSoiPrepareArtworkProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchSoiPrepareArtwork(
            ref as WatchSoiPrepareArtworkRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchSoiPrepareArtworkProvider,
          name: r'watchSoiPrepareArtworkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSoiPrepareArtworkHash,
          dependencies: WatchSoiPrepareArtworkFamily._dependencies,
          allTransitiveDependencies:
              WatchSoiPrepareArtworkFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchSoiPrepareArtworkProvider._internal(
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
    Stream<SoiPrepareArtwork> Function(WatchSoiPrepareArtworkRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSoiPrepareArtworkProvider._internal(
        (ref) => create(ref as WatchSoiPrepareArtworkRef),
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
  AutoDisposeStreamProviderElement<SoiPrepareArtwork> createElement() {
    return _WatchSoiPrepareArtworkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSoiPrepareArtworkProvider &&
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
mixin WatchSoiPrepareArtworkRef
    on AutoDisposeStreamProviderRef<SoiPrepareArtwork> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchSoiPrepareArtworkProviderElement
    extends AutoDisposeStreamProviderElement<SoiPrepareArtwork>
    with WatchSoiPrepareArtworkRef {
  _WatchSoiPrepareArtworkProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchSoiPrepareArtworkProvider).sessionId;
  @override
  int get id => (origin as WatchSoiPrepareArtworkProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
