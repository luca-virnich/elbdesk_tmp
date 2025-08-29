// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soi_consulting_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$soiConsultingRepositoryHash() =>
    r'18b70592bd31376b1908bac4cb78a52520918679';

/// See also [soiConsultingRepository].
@ProviderFor(soiConsultingRepository)
final soiConsultingRepositoryProvider =
    AutoDisposeProvider<SoiConsultingRepository>.internal(
  soiConsultingRepository,
  name: r'soiConsultingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$soiConsultingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SoiConsultingRepositoryRef
    = AutoDisposeProviderRef<SoiConsultingRepository>;
String _$fetchSoiConsultingsBySalesOrderHash() =>
    r'891f553adef995d7557a1d8aeaa9a1f40df0cd62';

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

/// See also [fetchSoiConsultingsBySalesOrder].
@ProviderFor(fetchSoiConsultingsBySalesOrder)
const fetchSoiConsultingsBySalesOrderProvider =
    FetchSoiConsultingsBySalesOrderFamily();

/// See also [fetchSoiConsultingsBySalesOrder].
class FetchSoiConsultingsBySalesOrderFamily
    extends Family<AsyncValue<List<SoiConsulting>>> {
  /// See also [fetchSoiConsultingsBySalesOrder].
  const FetchSoiConsultingsBySalesOrderFamily();

  /// See also [fetchSoiConsultingsBySalesOrder].
  FetchSoiConsultingsBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return FetchSoiConsultingsBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  FetchSoiConsultingsBySalesOrderProvider getProviderOverride(
    covariant FetchSoiConsultingsBySalesOrderProvider provider,
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
  String? get name => r'fetchSoiConsultingsBySalesOrderProvider';
}

/// See also [fetchSoiConsultingsBySalesOrder].
class FetchSoiConsultingsBySalesOrderProvider
    extends AutoDisposeFutureProvider<List<SoiConsulting>> {
  /// See also [fetchSoiConsultingsBySalesOrder].
  FetchSoiConsultingsBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => fetchSoiConsultingsBySalesOrder(
            ref as FetchSoiConsultingsBySalesOrderRef,
            salesOrderId,
          ),
          from: fetchSoiConsultingsBySalesOrderProvider,
          name: r'fetchSoiConsultingsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchSoiConsultingsBySalesOrderHash,
          dependencies: FetchSoiConsultingsBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              FetchSoiConsultingsBySalesOrderFamily._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  FetchSoiConsultingsBySalesOrderProvider._internal(
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
    FutureOr<List<SoiConsulting>> Function(
            FetchSoiConsultingsBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchSoiConsultingsBySalesOrderProvider._internal(
        (ref) => create(ref as FetchSoiConsultingsBySalesOrderRef),
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
  AutoDisposeFutureProviderElement<List<SoiConsulting>> createElement() {
    return _FetchSoiConsultingsBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSoiConsultingsBySalesOrderProvider &&
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
mixin FetchSoiConsultingsBySalesOrderRef
    on AutoDisposeFutureProviderRef<List<SoiConsulting>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _FetchSoiConsultingsBySalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<SoiConsulting>>
    with FetchSoiConsultingsBySalesOrderRef {
  _FetchSoiConsultingsBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as FetchSoiConsultingsBySalesOrderProvider).salesOrderId;
}

String _$watchSoiConsultingUpdatesBySalesOrderHash() =>
    r'c04120dbf8b6ea4c151b4f71be9ee651435715f5';

/// See also [watchSoiConsultingUpdatesBySalesOrder].
@ProviderFor(watchSoiConsultingUpdatesBySalesOrder)
const watchSoiConsultingUpdatesBySalesOrderProvider =
    WatchSoiConsultingUpdatesBySalesOrderFamily();

/// See also [watchSoiConsultingUpdatesBySalesOrder].
class WatchSoiConsultingUpdatesBySalesOrderFamily
    extends Family<AsyncValue<SoiConsulting>> {
  /// See also [watchSoiConsultingUpdatesBySalesOrder].
  const WatchSoiConsultingUpdatesBySalesOrderFamily();

  /// See also [watchSoiConsultingUpdatesBySalesOrder].
  WatchSoiConsultingUpdatesBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return WatchSoiConsultingUpdatesBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  WatchSoiConsultingUpdatesBySalesOrderProvider getProviderOverride(
    covariant WatchSoiConsultingUpdatesBySalesOrderProvider provider,
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
  String? get name => r'watchSoiConsultingUpdatesBySalesOrderProvider';
}

/// See also [watchSoiConsultingUpdatesBySalesOrder].
class WatchSoiConsultingUpdatesBySalesOrderProvider
    extends AutoDisposeStreamProvider<SoiConsulting> {
  /// See also [watchSoiConsultingUpdatesBySalesOrder].
  WatchSoiConsultingUpdatesBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => watchSoiConsultingUpdatesBySalesOrder(
            ref as WatchSoiConsultingUpdatesBySalesOrderRef,
            salesOrderId,
          ),
          from: watchSoiConsultingUpdatesBySalesOrderProvider,
          name: r'watchSoiConsultingUpdatesBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSoiConsultingUpdatesBySalesOrderHash,
          dependencies:
              WatchSoiConsultingUpdatesBySalesOrderFamily._dependencies,
          allTransitiveDependencies: WatchSoiConsultingUpdatesBySalesOrderFamily
              ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  WatchSoiConsultingUpdatesBySalesOrderProvider._internal(
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
    Stream<SoiConsulting> Function(
            WatchSoiConsultingUpdatesBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSoiConsultingUpdatesBySalesOrderProvider._internal(
        (ref) => create(ref as WatchSoiConsultingUpdatesBySalesOrderRef),
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
  AutoDisposeStreamProviderElement<SoiConsulting> createElement() {
    return _WatchSoiConsultingUpdatesBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSoiConsultingUpdatesBySalesOrderProvider &&
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
mixin WatchSoiConsultingUpdatesBySalesOrderRef
    on AutoDisposeStreamProviderRef<SoiConsulting> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchSoiConsultingUpdatesBySalesOrderProviderElement
    extends AutoDisposeStreamProviderElement<SoiConsulting>
    with WatchSoiConsultingUpdatesBySalesOrderRef {
  _WatchSoiConsultingUpdatesBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchSoiConsultingUpdatesBySalesOrderProvider).salesOrderId;
}

String _$watchSoiConsultingDeletionsBySalesOrderHash() =>
    r'3e3fcf26b4fcbb019d30ba4759208329cbdb0b2d';

/// See also [watchSoiConsultingDeletionsBySalesOrder].
@ProviderFor(watchSoiConsultingDeletionsBySalesOrder)
const watchSoiConsultingDeletionsBySalesOrderProvider =
    WatchSoiConsultingDeletionsBySalesOrderFamily();

/// See also [watchSoiConsultingDeletionsBySalesOrder].
class WatchSoiConsultingDeletionsBySalesOrderFamily
    extends Family<AsyncValue<int>> {
  /// See also [watchSoiConsultingDeletionsBySalesOrder].
  const WatchSoiConsultingDeletionsBySalesOrderFamily();

  /// See also [watchSoiConsultingDeletionsBySalesOrder].
  WatchSoiConsultingDeletionsBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return WatchSoiConsultingDeletionsBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  WatchSoiConsultingDeletionsBySalesOrderProvider getProviderOverride(
    covariant WatchSoiConsultingDeletionsBySalesOrderProvider provider,
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
  String? get name => r'watchSoiConsultingDeletionsBySalesOrderProvider';
}

/// See also [watchSoiConsultingDeletionsBySalesOrder].
class WatchSoiConsultingDeletionsBySalesOrderProvider
    extends AutoDisposeStreamProvider<int> {
  /// See also [watchSoiConsultingDeletionsBySalesOrder].
  WatchSoiConsultingDeletionsBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => watchSoiConsultingDeletionsBySalesOrder(
            ref as WatchSoiConsultingDeletionsBySalesOrderRef,
            salesOrderId,
          ),
          from: watchSoiConsultingDeletionsBySalesOrderProvider,
          name: r'watchSoiConsultingDeletionsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSoiConsultingDeletionsBySalesOrderHash,
          dependencies:
              WatchSoiConsultingDeletionsBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              WatchSoiConsultingDeletionsBySalesOrderFamily
                  ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  WatchSoiConsultingDeletionsBySalesOrderProvider._internal(
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
    Stream<int> Function(WatchSoiConsultingDeletionsBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSoiConsultingDeletionsBySalesOrderProvider._internal(
        (ref) => create(ref as WatchSoiConsultingDeletionsBySalesOrderRef),
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
    return _WatchSoiConsultingDeletionsBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSoiConsultingDeletionsBySalesOrderProvider &&
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
mixin WatchSoiConsultingDeletionsBySalesOrderRef
    on AutoDisposeStreamProviderRef<int> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _WatchSoiConsultingDeletionsBySalesOrderProviderElement
    extends AutoDisposeStreamProviderElement<int>
    with WatchSoiConsultingDeletionsBySalesOrderRef {
  _WatchSoiConsultingDeletionsBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchSoiConsultingDeletionsBySalesOrderProvider).salesOrderId;
}

String _$watchSoiConsultingHash() =>
    r'd5e14ce58f0273ba90c2a3196ad927e4ff273042';

/// See also [watchSoiConsulting].
@ProviderFor(watchSoiConsulting)
const watchSoiConsultingProvider = WatchSoiConsultingFamily();

/// See also [watchSoiConsulting].
class WatchSoiConsultingFamily extends Family<AsyncValue<SoiConsulting>> {
  /// See also [watchSoiConsulting].
  const WatchSoiConsultingFamily();

  /// See also [watchSoiConsulting].
  WatchSoiConsultingProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchSoiConsultingProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchSoiConsultingProvider getProviderOverride(
    covariant WatchSoiConsultingProvider provider,
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
  String? get name => r'watchSoiConsultingProvider';
}

/// See also [watchSoiConsulting].
class WatchSoiConsultingProvider
    extends AutoDisposeStreamProvider<SoiConsulting> {
  /// See also [watchSoiConsulting].
  WatchSoiConsultingProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchSoiConsulting(
            ref as WatchSoiConsultingRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchSoiConsultingProvider,
          name: r'watchSoiConsultingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSoiConsultingHash,
          dependencies: WatchSoiConsultingFamily._dependencies,
          allTransitiveDependencies:
              WatchSoiConsultingFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchSoiConsultingProvider._internal(
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
    Stream<SoiConsulting> Function(WatchSoiConsultingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSoiConsultingProvider._internal(
        (ref) => create(ref as WatchSoiConsultingRef),
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
  AutoDisposeStreamProviderElement<SoiConsulting> createElement() {
    return _WatchSoiConsultingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSoiConsultingProvider &&
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
mixin WatchSoiConsultingRef on AutoDisposeStreamProviderRef<SoiConsulting> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchSoiConsultingProviderElement
    extends AutoDisposeStreamProviderElement<SoiConsulting>
    with WatchSoiConsultingRef {
  _WatchSoiConsultingProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchSoiConsultingProvider).sessionId;
  @override
  int get id => (origin as WatchSoiConsultingProvider).id;
}

String _$watchSoiConsultingsBySalesOrderHash() =>
    r'a3e71b6e3b59b7b08b90541d55f19e950c1352c9';

abstract class _$WatchSoiConsultingsBySalesOrder
    extends BuildlessAutoDisposeAsyncNotifier<List<SoiConsulting>> {
  late final int salesOrderId;
  late final String sessionId;

  FutureOr<List<SoiConsulting>> build(
    int salesOrderId,
    String sessionId,
  );
}

/// See also [WatchSoiConsultingsBySalesOrder].
@ProviderFor(WatchSoiConsultingsBySalesOrder)
const watchSoiConsultingsBySalesOrderProvider =
    WatchSoiConsultingsBySalesOrderFamily();

/// See also [WatchSoiConsultingsBySalesOrder].
class WatchSoiConsultingsBySalesOrderFamily
    extends Family<AsyncValue<List<SoiConsulting>>> {
  /// See also [WatchSoiConsultingsBySalesOrder].
  const WatchSoiConsultingsBySalesOrderFamily();

  /// See also [WatchSoiConsultingsBySalesOrder].
  WatchSoiConsultingsBySalesOrderProvider call(
    int salesOrderId,
    String sessionId,
  ) {
    return WatchSoiConsultingsBySalesOrderProvider(
      salesOrderId,
      sessionId,
    );
  }

  @override
  WatchSoiConsultingsBySalesOrderProvider getProviderOverride(
    covariant WatchSoiConsultingsBySalesOrderProvider provider,
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
  String? get name => r'watchSoiConsultingsBySalesOrderProvider';
}

/// See also [WatchSoiConsultingsBySalesOrder].
class WatchSoiConsultingsBySalesOrderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        WatchSoiConsultingsBySalesOrder, List<SoiConsulting>> {
  /// See also [WatchSoiConsultingsBySalesOrder].
  WatchSoiConsultingsBySalesOrderProvider(
    int salesOrderId,
    String sessionId,
  ) : this._internal(
          () => WatchSoiConsultingsBySalesOrder()
            ..salesOrderId = salesOrderId
            ..sessionId = sessionId,
          from: watchSoiConsultingsBySalesOrderProvider,
          name: r'watchSoiConsultingsBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSoiConsultingsBySalesOrderHash,
          dependencies: WatchSoiConsultingsBySalesOrderFamily._dependencies,
          allTransitiveDependencies:
              WatchSoiConsultingsBySalesOrderFamily._allTransitiveDependencies,
          salesOrderId: salesOrderId,
          sessionId: sessionId,
        );

  WatchSoiConsultingsBySalesOrderProvider._internal(
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
  FutureOr<List<SoiConsulting>> runNotifierBuild(
    covariant WatchSoiConsultingsBySalesOrder notifier,
  ) {
    return notifier.build(
      salesOrderId,
      sessionId,
    );
  }

  @override
  Override overrideWith(WatchSoiConsultingsBySalesOrder Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchSoiConsultingsBySalesOrderProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WatchSoiConsultingsBySalesOrder,
      List<SoiConsulting>> createElement() {
    return _WatchSoiConsultingsBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSoiConsultingsBySalesOrderProvider &&
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
mixin WatchSoiConsultingsBySalesOrderRef
    on AutoDisposeAsyncNotifierProviderRef<List<SoiConsulting>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _WatchSoiConsultingsBySalesOrderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchSoiConsultingsBySalesOrder,
        List<SoiConsulting>> with WatchSoiConsultingsBySalesOrderRef {
  _WatchSoiConsultingsBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as WatchSoiConsultingsBySalesOrderProvider).salesOrderId;
  @override
  String get sessionId =>
      (origin as WatchSoiConsultingsBySalesOrderProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
