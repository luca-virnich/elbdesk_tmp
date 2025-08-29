// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soi_einzelformaufbau_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$soiEinzelformaufbauRepositoryHash() =>
    r'199315d76ce66eafa1577f363d53e15980c1a363';

/// See also [soiEinzelformaufbauRepository].
@ProviderFor(soiEinzelformaufbauRepository)
final soiEinzelformaufbauRepositoryProvider =
    AutoDisposeProvider<SoiEinzelformaufbauRepository>.internal(
  soiEinzelformaufbauRepository,
  name: r'soiEinzelformaufbauRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$soiEinzelformaufbauRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SoiEinzelformaufbauRepositoryRef
    = AutoDisposeProviderRef<SoiEinzelformaufbauRepository>;
String _$fetchSoiEinzelformaufbausBySalesOrderHash() =>
    r'b1d8e33ac52f7192e0a144bfeaf7c802967fb3ef';

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

/// See also [fetchSoiEinzelformaufbausBySalesOrder].
@ProviderFor(fetchSoiEinzelformaufbausBySalesOrder)
const fetchSoiEinzelformaufbausBySalesOrderProvider =
    FetchSoiEinzelformaufbausBySalesOrderFamily();

/// See also [fetchSoiEinzelformaufbausBySalesOrder].
class FetchSoiEinzelformaufbausBySalesOrderFamily
    extends Family<AsyncValue<List<SoiEinzelformaufbau>>> {
  /// See also [fetchSoiEinzelformaufbausBySalesOrder].
  const FetchSoiEinzelformaufbausBySalesOrderFamily();

  /// See also [fetchSoiEinzelformaufbausBySalesOrder].
  FetchSoiEinzelformaufbausBySalesOrderProvider call(
    int salesOrderId,
  ) {
    return FetchSoiEinzelformaufbausBySalesOrderProvider(
      salesOrderId,
    );
  }

  @override
  FetchSoiEinzelformaufbausBySalesOrderProvider getProviderOverride(
    covariant FetchSoiEinzelformaufbausBySalesOrderProvider provider,
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
  String? get name => r'fetchSoiEinzelformaufbausBySalesOrderProvider';
}

/// See also [fetchSoiEinzelformaufbausBySalesOrder].
class FetchSoiEinzelformaufbausBySalesOrderProvider
    extends AutoDisposeFutureProvider<List<SoiEinzelformaufbau>> {
  /// See also [fetchSoiEinzelformaufbausBySalesOrder].
  FetchSoiEinzelformaufbausBySalesOrderProvider(
    int salesOrderId,
  ) : this._internal(
          (ref) => fetchSoiEinzelformaufbausBySalesOrder(
            ref as FetchSoiEinzelformaufbausBySalesOrderRef,
            salesOrderId,
          ),
          from: fetchSoiEinzelformaufbausBySalesOrderProvider,
          name: r'fetchSoiEinzelformaufbausBySalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchSoiEinzelformaufbausBySalesOrderHash,
          dependencies:
              FetchSoiEinzelformaufbausBySalesOrderFamily._dependencies,
          allTransitiveDependencies: FetchSoiEinzelformaufbausBySalesOrderFamily
              ._allTransitiveDependencies,
          salesOrderId: salesOrderId,
        );

  FetchSoiEinzelformaufbausBySalesOrderProvider._internal(
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
    FutureOr<List<SoiEinzelformaufbau>> Function(
            FetchSoiEinzelformaufbausBySalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchSoiEinzelformaufbausBySalesOrderProvider._internal(
        (ref) => create(ref as FetchSoiEinzelformaufbausBySalesOrderRef),
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
  AutoDisposeFutureProviderElement<List<SoiEinzelformaufbau>> createElement() {
    return _FetchSoiEinzelformaufbausBySalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSoiEinzelformaufbausBySalesOrderProvider &&
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
mixin FetchSoiEinzelformaufbausBySalesOrderRef
    on AutoDisposeFutureProviderRef<List<SoiEinzelformaufbau>> {
  /// The parameter `salesOrderId` of this provider.
  int get salesOrderId;
}

class _FetchSoiEinzelformaufbausBySalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<SoiEinzelformaufbau>>
    with FetchSoiEinzelformaufbausBySalesOrderRef {
  _FetchSoiEinzelformaufbausBySalesOrderProviderElement(super.provider);

  @override
  int get salesOrderId =>
      (origin as FetchSoiEinzelformaufbausBySalesOrderProvider).salesOrderId;
}

String _$watchSoiEinzelformaufbauHash() =>
    r'240904dc0f0d08e7655a72bf591b744e445955c8';

/// See also [watchSoiEinzelformaufbau].
@ProviderFor(watchSoiEinzelformaufbau)
const watchSoiEinzelformaufbauProvider = WatchSoiEinzelformaufbauFamily();

/// See also [watchSoiEinzelformaufbau].
class WatchSoiEinzelformaufbauFamily
    extends Family<AsyncValue<SoiEinzelformaufbau>> {
  /// See also [watchSoiEinzelformaufbau].
  const WatchSoiEinzelformaufbauFamily();

  /// See also [watchSoiEinzelformaufbau].
  WatchSoiEinzelformaufbauProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchSoiEinzelformaufbauProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchSoiEinzelformaufbauProvider getProviderOverride(
    covariant WatchSoiEinzelformaufbauProvider provider,
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
  String? get name => r'watchSoiEinzelformaufbauProvider';
}

/// See also [watchSoiEinzelformaufbau].
class WatchSoiEinzelformaufbauProvider
    extends AutoDisposeStreamProvider<SoiEinzelformaufbau> {
  /// See also [watchSoiEinzelformaufbau].
  WatchSoiEinzelformaufbauProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchSoiEinzelformaufbau(
            ref as WatchSoiEinzelformaufbauRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchSoiEinzelformaufbauProvider,
          name: r'watchSoiEinzelformaufbauProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSoiEinzelformaufbauHash,
          dependencies: WatchSoiEinzelformaufbauFamily._dependencies,
          allTransitiveDependencies:
              WatchSoiEinzelformaufbauFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchSoiEinzelformaufbauProvider._internal(
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
    Stream<SoiEinzelformaufbau> Function(WatchSoiEinzelformaufbauRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSoiEinzelformaufbauProvider._internal(
        (ref) => create(ref as WatchSoiEinzelformaufbauRef),
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
  AutoDisposeStreamProviderElement<SoiEinzelformaufbau> createElement() {
    return _WatchSoiEinzelformaufbauProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSoiEinzelformaufbauProvider &&
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
mixin WatchSoiEinzelformaufbauRef
    on AutoDisposeStreamProviderRef<SoiEinzelformaufbau> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchSoiEinzelformaufbauProviderElement
    extends AutoDisposeStreamProviderElement<SoiEinzelformaufbau>
    with WatchSoiEinzelformaufbauRef {
  _WatchSoiEinzelformaufbauProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchSoiEinzelformaufbauProvider).sessionId;
  @override
  int get id => (origin as WatchSoiEinzelformaufbauProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
