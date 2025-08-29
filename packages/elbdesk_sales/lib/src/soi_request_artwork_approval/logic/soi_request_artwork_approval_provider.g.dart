// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soi_request_artwork_approval_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$soiRequestArtworkApprovalRepositoryHash() =>
    r'e26f9fb7e553edd039beb3caad52807a9d429f88';

/// See also [soiRequestArtworkApprovalRepository].
@ProviderFor(soiRequestArtworkApprovalRepository)
final soiRequestArtworkApprovalRepositoryProvider =
    AutoDisposeProvider<SoiRequestArtworkApprovalRepository>.internal(
  soiRequestArtworkApprovalRepository,
  name: r'soiRequestArtworkApprovalRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$soiRequestArtworkApprovalRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SoiRequestArtworkApprovalRepositoryRef
    = AutoDisposeProviderRef<SoiRequestArtworkApprovalRepository>;
String _$fetchSoiRequestArtworkApprovalsBySalesOrderHash() =>
    r'4f43be10747718e5a115c9d088004b13c4f2c69d';

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

/// See also [fetchSoiRequestArtworkApprovalsBySalesOrder].
@ProviderFor(fetchSoiRequestArtworkApprovalsBySalesOrder)
const fetchSoiRequestArtworkApprovalsBySalesOrderProvider =
    FetchSoiRequestArtworkApprovalsBySalesOrderFamily();

/// See also [fetchSoiRequestArtworkApprovalsBySalesOrder].
class FetchSoiRequestArtworkApprovalsBySalesOrderFamily
    extends Family<AsyncValue<List<SoiRequestArtworkApproval>>> {
  /// See also [fetchSoiRequestArtworkApprovalsBySalesOrder].
  const FetchSoiRequestArtworkApprovalsBySalesOrderFamily();

  /// See also [fetchSoiRequestArtworkApprovalsBySalesOrder].
  FetchSoiRequestArtworkApprovalsBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return FetchSoiRequestArtworkApprovalsBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  FetchSoiRequestArtworkApprovalsBySalesOrderProvider getProviderOverride(
    covariant FetchSoiRequestArtworkApprovalsBySalesOrderProvider provider,
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
  String? get name => r'fetchSoiRequestArtworkApprovalsBySalesOrderProvider';
}

/// See also [fetchSoiRequestArtworkApprovalsBySalesOrder].
class FetchSoiRequestArtworkApprovalsBySalesOrderProvider
    extends AutoDisposeFutureProvider<List<SoiRequestArtworkApproval>> {
  /// See also [fetchSoiRequestArtworkApprovalsBySalesOrder].
  FetchSoiRequestArtworkApprovalsBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => fetchSoiRequestArtworkApprovalsBySalesOrder(
            ref as FetchSoiRequestArtworkApprovalsBySalesOrderRef,
            salesOrderId,
          ),
          from: fetchSoiRequestArtworkApprovalsBySalesOrderProvider,
          name: r'fetchSoiRequestArtworkApprovalsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchSoiRequestArtworkApprovalsBySalesOrderHash,
          dependencies:
              FetchSoiRequestArtworkApprovalsBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              FetchSoiRequestArtworkApprovalsBySalesOrderFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  FetchSoiRequestArtworkApprovalsBySalesOrderProvider._internal(
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
    FutureOr<List<SoiRequestArtworkApproval>> Function(
            FetchSoiRequestArtworkApprovalsBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchSoiRequestArtworkApprovalsBySalesOrderProvider._internal(
        (ref) => create(ref as FetchSoiRequestArtworkApprovalsBySalesOrderRef),
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
  AutoDisposeFutureProviderElement<List<SoiRequestArtworkApproval>>
      createElement() {
    return _FetchSoiRequestArtworkApprovalsBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSoiRequestArtworkApprovalsBySalesOrderProvider &&
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
mixin FetchSoiRequestArtworkApprovalsBySalesOrderRef
    on AutoDisposeFutureProviderRef<List<SoiRequestArtworkApproval>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _FetchSoiRequestArtworkApprovalsBySalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<SoiRequestArtworkApproval>>
    with FetchSoiRequestArtworkApprovalsBySalesOrderRef {
  _FetchSoiRequestArtworkApprovalsBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as FetchSoiRequestArtworkApprovalsBySalesOrderProvider)
          .salesOrderId;
}

String _$watchSoiRequestArtworkApprovalDeletionsBySalesOrderHash() =>
    r'75198faf6ad8dd2b05247a3bcb80b14941d21758';

/// See also [watchSoiRequestArtworkApprovalDeletionsBySalesOrder].
@ProviderFor(watchSoiRequestArtworkApprovalDeletionsBySalesOrder)
const watchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider =
    WatchSoiRequestArtworkApprovalDeletionsBySalesOrderFamily();

/// See also [watchSoiRequestArtworkApprovalDeletionsBySalesOrder].
class WatchSoiRequestArtworkApprovalDeletionsBySalesOrderFamily
    extends Family<AsyncValue<int>> {
  /// See also [watchSoiRequestArtworkApprovalDeletionsBySalesOrder].
  const WatchSoiRequestArtworkApprovalDeletionsBySalesOrderFamily();

  /// See also [watchSoiRequestArtworkApprovalDeletionsBySalesOrder].
  WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider
      getProviderOverride(
    covariant WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider
        provider,
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
  String? get name =>
      r'watchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider';
}

/// See also [watchSoiRequestArtworkApprovalDeletionsBySalesOrder].
class WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider
    extends AutoDisposeStreamProvider<int> {
  /// See also [watchSoiRequestArtworkApprovalDeletionsBySalesOrder].
  WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => watchSoiRequestArtworkApprovalDeletionsBySalesOrder(
            ref as WatchSoiRequestArtworkApprovalDeletionsBySalesOrderRef,
            salesOrderId,
          ),
          from: watchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider,
          name: r'watchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSoiRequestArtworkApprovalDeletionsBySalesOrderHash,
          dependencies:
              WatchSoiRequestArtworkApprovalDeletionsBySalesOrderFamily
                  ._dependencies,
          allTransitiveDependencies:
              WatchSoiRequestArtworkApprovalDeletionsBySalesOrderFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider._internal(
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
            WatchSoiRequestArtworkApprovalDeletionsBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override:
          WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider._internal(
        (ref) => create(
            ref as WatchSoiRequestArtworkApprovalDeletionsBySalesOrderRef),
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
    return _WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProviderElement(
        this);
  }

  @override
  bool operator ==(Object other) {
    return other
            is WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider &&
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
mixin WatchSoiRequestArtworkApprovalDeletionsBySalesOrderRef
    on AutoDisposeStreamProviderRef<int> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProviderElement
    extends AutoDisposeStreamProviderElement<int>
    with WatchSoiRequestArtworkApprovalDeletionsBySalesOrderRef {
  _WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProviderElement(
      super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchSoiRequestArtworkApprovalDeletionsBySalesOrderProvider)
          .salesOrderId;
}

String _$watchSoiRequestArtworkApprovalHash() =>
    r'df1e1c8b57723d51eb8cd4bba3df35eab210b2af';

/// See also [watchSoiRequestArtworkApproval].
@ProviderFor(watchSoiRequestArtworkApproval)
const watchSoiRequestArtworkApprovalProvider =
    WatchSoiRequestArtworkApprovalFamily();

/// See also [watchSoiRequestArtworkApproval].
class WatchSoiRequestArtworkApprovalFamily
    extends Family<AsyncValue<SoiRequestArtworkApproval>> {
  /// See also [watchSoiRequestArtworkApproval].
  const WatchSoiRequestArtworkApprovalFamily();

  /// See also [watchSoiRequestArtworkApproval].
  WatchSoiRequestArtworkApprovalProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchSoiRequestArtworkApprovalProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchSoiRequestArtworkApprovalProvider getProviderOverride(
    covariant WatchSoiRequestArtworkApprovalProvider provider,
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
  String? get name => r'watchSoiRequestArtworkApprovalProvider';
}

/// See also [watchSoiRequestArtworkApproval].
class WatchSoiRequestArtworkApprovalProvider
    extends AutoDisposeStreamProvider<SoiRequestArtworkApproval> {
  /// See also [watchSoiRequestArtworkApproval].
  WatchSoiRequestArtworkApprovalProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchSoiRequestArtworkApproval(
            ref as WatchSoiRequestArtworkApprovalRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchSoiRequestArtworkApprovalProvider,
          name: r'watchSoiRequestArtworkApprovalProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSoiRequestArtworkApprovalHash,
          dependencies: WatchSoiRequestArtworkApprovalFamily._dependencies,
          allTransitiveDependencies:
              WatchSoiRequestArtworkApprovalFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchSoiRequestArtworkApprovalProvider._internal(
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
    Stream<SoiRequestArtworkApproval> Function(
            WatchSoiRequestArtworkApprovalRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSoiRequestArtworkApprovalProvider._internal(
        (ref) => create(ref as WatchSoiRequestArtworkApprovalRef),
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
  AutoDisposeStreamProviderElement<SoiRequestArtworkApproval> createElement() {
    return _WatchSoiRequestArtworkApprovalProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSoiRequestArtworkApprovalProvider &&
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
mixin WatchSoiRequestArtworkApprovalRef
    on AutoDisposeStreamProviderRef<SoiRequestArtworkApproval> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchSoiRequestArtworkApprovalProviderElement
    extends AutoDisposeStreamProviderElement<SoiRequestArtworkApproval>
    with WatchSoiRequestArtworkApprovalRef {
  _WatchSoiRequestArtworkApprovalProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchSoiRequestArtworkApprovalProvider).sessionId;
  @override
  int get id => (origin as WatchSoiRequestArtworkApprovalProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
