// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_request_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchEditRequestsHash() => r'b4af947f059715e5b7e93498cc3321750807638b';

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

/// See also [watchEditRequests].
@ProviderFor(watchEditRequests)
const watchEditRequestsProvider = WatchEditRequestsFamily();

/// See also [watchEditRequests].
class WatchEditRequestsFamily extends Family<AsyncValue<EditRequest>> {
  /// See also [watchEditRequests].
  const WatchEditRequestsFamily();

  /// See also [watchEditRequests].
  WatchEditRequestsProvider call({
    required String tableType,
    required int primaryKey,
  }) {
    return WatchEditRequestsProvider(
      tableType: tableType,
      primaryKey: primaryKey,
    );
  }

  @override
  WatchEditRequestsProvider getProviderOverride(
    covariant WatchEditRequestsProvider provider,
  ) {
    return call(
      tableType: provider.tableType,
      primaryKey: provider.primaryKey,
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
  String? get name => r'watchEditRequestsProvider';
}

/// See also [watchEditRequests].
class WatchEditRequestsProvider extends AutoDisposeStreamProvider<EditRequest> {
  /// See also [watchEditRequests].
  WatchEditRequestsProvider({
    required String tableType,
    required int primaryKey,
  }) : this._internal(
          (ref) => watchEditRequests(
            ref as WatchEditRequestsRef,
            tableType: tableType,
            primaryKey: primaryKey,
          ),
          from: watchEditRequestsProvider,
          name: r'watchEditRequestsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchEditRequestsHash,
          dependencies: WatchEditRequestsFamily._dependencies,
          allTransitiveDependencies:
              WatchEditRequestsFamily._allTransitiveDependencies,
          tableType: tableType,
          primaryKey: primaryKey,
        );

  WatchEditRequestsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.primaryKey,
  }) : super.internal();

  final String tableType;
  final int primaryKey;

  @override
  Override overrideWith(
    Stream<EditRequest> Function(WatchEditRequestsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchEditRequestsProvider._internal(
        (ref) => create(ref as WatchEditRequestsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        primaryKey: primaryKey,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<EditRequest> createElement() {
    return _WatchEditRequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEditRequestsProvider &&
        other.tableType == tableType &&
        other.primaryKey == primaryKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, primaryKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchEditRequestsRef on AutoDisposeStreamProviderRef<EditRequest> {
  /// The parameter `tableType` of this provider.
  String get tableType;

  /// The parameter `primaryKey` of this provider.
  int get primaryKey;
}

class _WatchEditRequestsProviderElement
    extends AutoDisposeStreamProviderElement<EditRequest>
    with WatchEditRequestsRef {
  _WatchEditRequestsProviderElement(super.provider);

  @override
  String get tableType => (origin as WatchEditRequestsProvider).tableType;
  @override
  int get primaryKey => (origin as WatchEditRequestsProvider).primaryKey;
}

String _$watchRejectEditRequestsHash() =>
    r'03b870191fcc60e7d7bea2ffddb05bbef3ea3428';

/// See also [watchRejectEditRequests].
@ProviderFor(watchRejectEditRequests)
const watchRejectEditRequestsProvider = WatchRejectEditRequestsFamily();

/// See also [watchRejectEditRequests].
class WatchRejectEditRequestsFamily
    extends Family<AsyncValue<RejectEditRequest>> {
  /// See also [watchRejectEditRequests].
  const WatchRejectEditRequestsFamily();

  /// See also [watchRejectEditRequests].
  WatchRejectEditRequestsProvider call({
    required String tableType,
    required int primaryKey,
  }) {
    return WatchRejectEditRequestsProvider(
      tableType: tableType,
      primaryKey: primaryKey,
    );
  }

  @override
  WatchRejectEditRequestsProvider getProviderOverride(
    covariant WatchRejectEditRequestsProvider provider,
  ) {
    return call(
      tableType: provider.tableType,
      primaryKey: provider.primaryKey,
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
  String? get name => r'watchRejectEditRequestsProvider';
}

/// See also [watchRejectEditRequests].
class WatchRejectEditRequestsProvider
    extends AutoDisposeStreamProvider<RejectEditRequest> {
  /// See also [watchRejectEditRequests].
  WatchRejectEditRequestsProvider({
    required String tableType,
    required int primaryKey,
  }) : this._internal(
          (ref) => watchRejectEditRequests(
            ref as WatchRejectEditRequestsRef,
            tableType: tableType,
            primaryKey: primaryKey,
          ),
          from: watchRejectEditRequestsProvider,
          name: r'watchRejectEditRequestsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchRejectEditRequestsHash,
          dependencies: WatchRejectEditRequestsFamily._dependencies,
          allTransitiveDependencies:
              WatchRejectEditRequestsFamily._allTransitiveDependencies,
          tableType: tableType,
          primaryKey: primaryKey,
        );

  WatchRejectEditRequestsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.primaryKey,
  }) : super.internal();

  final String tableType;
  final int primaryKey;

  @override
  Override overrideWith(
    Stream<RejectEditRequest> Function(WatchRejectEditRequestsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchRejectEditRequestsProvider._internal(
        (ref) => create(ref as WatchRejectEditRequestsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        primaryKey: primaryKey,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<RejectEditRequest> createElement() {
    return _WatchRejectEditRequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchRejectEditRequestsProvider &&
        other.tableType == tableType &&
        other.primaryKey == primaryKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, primaryKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchRejectEditRequestsRef
    on AutoDisposeStreamProviderRef<RejectEditRequest> {
  /// The parameter `tableType` of this provider.
  String get tableType;

  /// The parameter `primaryKey` of this provider.
  int get primaryKey;
}

class _WatchRejectEditRequestsProviderElement
    extends AutoDisposeStreamProviderElement<RejectEditRequest>
    with WatchRejectEditRequestsRef {
  _WatchRejectEditRequestsProviderElement(super.provider);

  @override
  String get tableType => (origin as WatchRejectEditRequestsProvider).tableType;
  @override
  int get primaryKey => (origin as WatchRejectEditRequestsProvider).primaryKey;
}

String _$watchRejectEditRequestsByWindowIdHash() =>
    r'5cfe6cc545f0dd27b431569e7913c0d3f768e10e';

/// See also [watchRejectEditRequestsByWindowId].
@ProviderFor(watchRejectEditRequestsByWindowId)
const watchRejectEditRequestsByWindowIdProvider =
    WatchRejectEditRequestsByWindowIdFamily();

/// See also [watchRejectEditRequestsByWindowId].
class WatchRejectEditRequestsByWindowIdFamily
    extends Family<AsyncValue<RejectEditRequest>> {
  /// See also [watchRejectEditRequestsByWindowId].
  const WatchRejectEditRequestsByWindowIdFamily();

  /// See also [watchRejectEditRequestsByWindowId].
  WatchRejectEditRequestsByWindowIdProvider call({
    required String tableType,
    required int primaryKey,
    required String requestingFloatingWindowId,
  }) {
    return WatchRejectEditRequestsByWindowIdProvider(
      tableType: tableType,
      primaryKey: primaryKey,
      requestingFloatingWindowId: requestingFloatingWindowId,
    );
  }

  @override
  WatchRejectEditRequestsByWindowIdProvider getProviderOverride(
    covariant WatchRejectEditRequestsByWindowIdProvider provider,
  ) {
    return call(
      tableType: provider.tableType,
      primaryKey: provider.primaryKey,
      requestingFloatingWindowId: provider.requestingFloatingWindowId,
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
  String? get name => r'watchRejectEditRequestsByWindowIdProvider';
}

/// See also [watchRejectEditRequestsByWindowId].
class WatchRejectEditRequestsByWindowIdProvider
    extends AutoDisposeStreamProvider<RejectEditRequest> {
  /// See also [watchRejectEditRequestsByWindowId].
  WatchRejectEditRequestsByWindowIdProvider({
    required String tableType,
    required int primaryKey,
    required String requestingFloatingWindowId,
  }) : this._internal(
          (ref) => watchRejectEditRequestsByWindowId(
            ref as WatchRejectEditRequestsByWindowIdRef,
            tableType: tableType,
            primaryKey: primaryKey,
            requestingFloatingWindowId: requestingFloatingWindowId,
          ),
          from: watchRejectEditRequestsByWindowIdProvider,
          name: r'watchRejectEditRequestsByWindowIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchRejectEditRequestsByWindowIdHash,
          dependencies: WatchRejectEditRequestsByWindowIdFamily._dependencies,
          allTransitiveDependencies: WatchRejectEditRequestsByWindowIdFamily
              ._allTransitiveDependencies,
          tableType: tableType,
          primaryKey: primaryKey,
          requestingFloatingWindowId: requestingFloatingWindowId,
        );

  WatchRejectEditRequestsByWindowIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.primaryKey,
    required this.requestingFloatingWindowId,
  }) : super.internal();

  final String tableType;
  final int primaryKey;
  final String requestingFloatingWindowId;

  @override
  Override overrideWith(
    Stream<RejectEditRequest> Function(
            WatchRejectEditRequestsByWindowIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchRejectEditRequestsByWindowIdProvider._internal(
        (ref) => create(ref as WatchRejectEditRequestsByWindowIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        primaryKey: primaryKey,
        requestingFloatingWindowId: requestingFloatingWindowId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<RejectEditRequest> createElement() {
    return _WatchRejectEditRequestsByWindowIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchRejectEditRequestsByWindowIdProvider &&
        other.tableType == tableType &&
        other.primaryKey == primaryKey &&
        other.requestingFloatingWindowId == requestingFloatingWindowId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, primaryKey.hashCode);
    hash = _SystemHash.combine(hash, requestingFloatingWindowId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchRejectEditRequestsByWindowIdRef
    on AutoDisposeStreamProviderRef<RejectEditRequest> {
  /// The parameter `tableType` of this provider.
  String get tableType;

  /// The parameter `primaryKey` of this provider.
  int get primaryKey;

  /// The parameter `requestingFloatingWindowId` of this provider.
  String get requestingFloatingWindowId;
}

class _WatchRejectEditRequestsByWindowIdProviderElement
    extends AutoDisposeStreamProviderElement<RejectEditRequest>
    with WatchRejectEditRequestsByWindowIdRef {
  _WatchRejectEditRequestsByWindowIdProviderElement(super.provider);

  @override
  String get tableType =>
      (origin as WatchRejectEditRequestsByWindowIdProvider).tableType;
  @override
  int get primaryKey =>
      (origin as WatchRejectEditRequestsByWindowIdProvider).primaryKey;
  @override
  String get requestingFloatingWindowId =>
      (origin as WatchRejectEditRequestsByWindowIdProvider)
          .requestingFloatingWindowId;
}

String _$editRequestRepositoryHash() =>
    r'94c40b682ff37446a74d2e4a48a533340ef04280';

/// See also [editRequestRepository].
@ProviderFor(editRequestRepository)
final editRequestRepositoryProvider =
    AutoDisposeProvider<EditRequestRepository>.internal(
  editRequestRepository,
  name: r'editRequestRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$editRequestRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EditRequestRepositoryRef
    = AutoDisposeProviderRef<EditRequestRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
