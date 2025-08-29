// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_log_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchFlutterLogsHash() => r'5db841959480d6cc3da683254a5dd59a855578de';

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

/// See also [fetchFlutterLogs].
@ProviderFor(fetchFlutterLogs)
const fetchFlutterLogsProvider = FetchFlutterLogsFamily();

/// See also [fetchFlutterLogs].
class FetchFlutterLogsFamily extends Family<AsyncValue<List<FlutterLog>>> {
  /// See also [fetchFlutterLogs].
  const FetchFlutterLogsFamily();

  /// See also [fetchFlutterLogs].
  FetchFlutterLogsProvider call(
    String sessionId,
  ) {
    return FetchFlutterLogsProvider(
      sessionId,
    );
  }

  @override
  FetchFlutterLogsProvider getProviderOverride(
    covariant FetchFlutterLogsProvider provider,
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
  String? get name => r'fetchFlutterLogsProvider';
}

/// See also [fetchFlutterLogs].
class FetchFlutterLogsProvider
    extends AutoDisposeFutureProvider<List<FlutterLog>> {
  /// See also [fetchFlutterLogs].
  FetchFlutterLogsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => fetchFlutterLogs(
            ref as FetchFlutterLogsRef,
            sessionId,
          ),
          from: fetchFlutterLogsProvider,
          name: r'fetchFlutterLogsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchFlutterLogsHash,
          dependencies: FetchFlutterLogsFamily._dependencies,
          allTransitiveDependencies:
              FetchFlutterLogsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FetchFlutterLogsProvider._internal(
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
    FutureOr<List<FlutterLog>> Function(FetchFlutterLogsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchFlutterLogsProvider._internal(
        (ref) => create(ref as FetchFlutterLogsRef),
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
  AutoDisposeFutureProviderElement<List<FlutterLog>> createElement() {
    return _FetchFlutterLogsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchFlutterLogsProvider && other.sessionId == sessionId;
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
mixin FetchFlutterLogsRef on AutoDisposeFutureProviderRef<List<FlutterLog>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchFlutterLogsProviderElement
    extends AutoDisposeFutureProviderElement<List<FlutterLog>>
    with FetchFlutterLogsRef {
  _FetchFlutterLogsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FetchFlutterLogsProvider).sessionId;
}

String _$fetchFlutterLogByIdHash() =>
    r'ff8cf193937c70aa4a34fbe01e3d333f45b7fab4';

/// See also [fetchFlutterLogById].
@ProviderFor(fetchFlutterLogById)
const fetchFlutterLogByIdProvider = FetchFlutterLogByIdFamily();

/// See also [fetchFlutterLogById].
class FetchFlutterLogByIdFamily extends Family<AsyncValue<FlutterLog?>> {
  /// See also [fetchFlutterLogById].
  const FetchFlutterLogByIdFamily();

  /// See also [fetchFlutterLogById].
  FetchFlutterLogByIdProvider call({
    required int id,
  }) {
    return FetchFlutterLogByIdProvider(
      id: id,
    );
  }

  @override
  FetchFlutterLogByIdProvider getProviderOverride(
    covariant FetchFlutterLogByIdProvider provider,
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
  String? get name => r'fetchFlutterLogByIdProvider';
}

/// See also [fetchFlutterLogById].
class FetchFlutterLogByIdProvider
    extends AutoDisposeFutureProvider<FlutterLog?> {
  /// See also [fetchFlutterLogById].
  FetchFlutterLogByIdProvider({
    required int id,
  }) : this._internal(
          (ref) => fetchFlutterLogById(
            ref as FetchFlutterLogByIdRef,
            id: id,
          ),
          from: fetchFlutterLogByIdProvider,
          name: r'fetchFlutterLogByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchFlutterLogByIdHash,
          dependencies: FetchFlutterLogByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchFlutterLogByIdFamily._allTransitiveDependencies,
          id: id,
        );

  FetchFlutterLogByIdProvider._internal(
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
    FutureOr<FlutterLog?> Function(FetchFlutterLogByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchFlutterLogByIdProvider._internal(
        (ref) => create(ref as FetchFlutterLogByIdRef),
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
  AutoDisposeFutureProviderElement<FlutterLog?> createElement() {
    return _FetchFlutterLogByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchFlutterLogByIdProvider && other.id == id;
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
mixin FetchFlutterLogByIdRef on AutoDisposeFutureProviderRef<FlutterLog?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchFlutterLogByIdProviderElement
    extends AutoDisposeFutureProviderElement<FlutterLog?>
    with FetchFlutterLogByIdRef {
  _FetchFlutterLogByIdProviderElement(super.provider);

  @override
  int get id => (origin as FetchFlutterLogByIdProvider).id;
}

String _$flutterLogRepositoryHash() =>
    r'1536af95ccc488210346e436c99a26850bb9b7dd';

/// See also [flutterLogRepository].
@ProviderFor(flutterLogRepository)
final flutterLogRepositoryProvider =
    AutoDisposeProvider<FlutterLogRepository>.internal(
  flutterLogRepository,
  name: r'flutterLogRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flutterLogRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FlutterLogRepositoryRef = AutoDisposeProviderRef<FlutterLogRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
