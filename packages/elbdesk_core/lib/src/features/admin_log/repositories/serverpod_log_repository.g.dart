// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serverpod_log_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchAdminLogsHash() => r'3cf35d85a11f0b54d07805c3284fd6ad1a378925';

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

/// See also [fetchAdminLogs].
@ProviderFor(fetchAdminLogs)
const fetchAdminLogsProvider = FetchAdminLogsFamily();

/// See also [fetchAdminLogs].
class FetchAdminLogsFamily extends Family<AsyncValue<List<ServerpodLog>>> {
  /// See also [fetchAdminLogs].
  const FetchAdminLogsFamily();

  /// See also [fetchAdminLogs].
  FetchAdminLogsProvider call(
    String sessionId,
  ) {
    return FetchAdminLogsProvider(
      sessionId,
    );
  }

  @override
  FetchAdminLogsProvider getProviderOverride(
    covariant FetchAdminLogsProvider provider,
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
  String? get name => r'fetchAdminLogsProvider';
}

/// See also [fetchAdminLogs].
class FetchAdminLogsProvider
    extends AutoDisposeFutureProvider<List<ServerpodLog>> {
  /// See also [fetchAdminLogs].
  FetchAdminLogsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => fetchAdminLogs(
            ref as FetchAdminLogsRef,
            sessionId,
          ),
          from: fetchAdminLogsProvider,
          name: r'fetchAdminLogsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAdminLogsHash,
          dependencies: FetchAdminLogsFamily._dependencies,
          allTransitiveDependencies:
              FetchAdminLogsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FetchAdminLogsProvider._internal(
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
    FutureOr<List<ServerpodLog>> Function(FetchAdminLogsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAdminLogsProvider._internal(
        (ref) => create(ref as FetchAdminLogsRef),
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
  AutoDisposeFutureProviderElement<List<ServerpodLog>> createElement() {
    return _FetchAdminLogsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAdminLogsProvider && other.sessionId == sessionId;
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
mixin FetchAdminLogsRef on AutoDisposeFutureProviderRef<List<ServerpodLog>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchAdminLogsProviderElement
    extends AutoDisposeFutureProviderElement<List<ServerpodLog>>
    with FetchAdminLogsRef {
  _FetchAdminLogsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FetchAdminLogsProvider).sessionId;
}

String _$fetchAdminLogByIdHash() => r'dc9192a9d214221322f12ffa42aad59d1736c3d9';

/// See also [fetchAdminLogById].
@ProviderFor(fetchAdminLogById)
const fetchAdminLogByIdProvider = FetchAdminLogByIdFamily();

/// See also [fetchAdminLogById].
class FetchAdminLogByIdFamily extends Family<AsyncValue<ServerpodLog?>> {
  /// See also [fetchAdminLogById].
  const FetchAdminLogByIdFamily();

  /// See also [fetchAdminLogById].
  FetchAdminLogByIdProvider call({
    required int id,
  }) {
    return FetchAdminLogByIdProvider(
      id: id,
    );
  }

  @override
  FetchAdminLogByIdProvider getProviderOverride(
    covariant FetchAdminLogByIdProvider provider,
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
  String? get name => r'fetchAdminLogByIdProvider';
}

/// See also [fetchAdminLogById].
class FetchAdminLogByIdProvider
    extends AutoDisposeFutureProvider<ServerpodLog?> {
  /// See also [fetchAdminLogById].
  FetchAdminLogByIdProvider({
    required int id,
  }) : this._internal(
          (ref) => fetchAdminLogById(
            ref as FetchAdminLogByIdRef,
            id: id,
          ),
          from: fetchAdminLogByIdProvider,
          name: r'fetchAdminLogByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAdminLogByIdHash,
          dependencies: FetchAdminLogByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchAdminLogByIdFamily._allTransitiveDependencies,
          id: id,
        );

  FetchAdminLogByIdProvider._internal(
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
    FutureOr<ServerpodLog?> Function(FetchAdminLogByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAdminLogByIdProvider._internal(
        (ref) => create(ref as FetchAdminLogByIdRef),
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
  AutoDisposeFutureProviderElement<ServerpodLog?> createElement() {
    return _FetchAdminLogByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAdminLogByIdProvider && other.id == id;
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
mixin FetchAdminLogByIdRef on AutoDisposeFutureProviderRef<ServerpodLog?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchAdminLogByIdProviderElement
    extends AutoDisposeFutureProviderElement<ServerpodLog?>
    with FetchAdminLogByIdRef {
  _FetchAdminLogByIdProviderElement(super.provider);

  @override
  int get id => (origin as FetchAdminLogByIdProvider).id;
}

String _$serverpodLogRepositoryHash() =>
    r'd9ba6f0598c08e018de394d608116d3819efda57';

/// See also [serverpodLogRepository].
@ProviderFor(serverpodLogRepository)
final serverpodLogRepositoryProvider =
    AutoDisposeProvider<ServerpodLogRepository>.internal(
  serverpodLogRepository,
  name: r'serverpodLogRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serverpodLogRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ServerpodLogRepositoryRef
    = AutoDisposeProviderRef<ServerpodLogRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
