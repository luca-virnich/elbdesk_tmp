// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_log_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchProductLogsHash() => r'e85bae3278aa114b9ce05d0a1feea347f05ad072';

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

/// Provider to fetch product log entries
///
/// Copied from [fetchProductLogs].
@ProviderFor(fetchProductLogs)
const fetchProductLogsProvider = FetchProductLogsFamily();

/// Provider to fetch product log entries
///
/// Copied from [fetchProductLogs].
class FetchProductLogsFamily extends Family<AsyncValue<List<ProductLogDTO>>> {
  /// Provider to fetch product log entries
  ///
  /// Copied from [fetchProductLogs].
  const FetchProductLogsFamily();

  /// Provider to fetch product log entries
  ///
  /// Copied from [fetchProductLogs].
  FetchProductLogsProvider call(
    int entityId,
    String sessionId,
  ) {
    return FetchProductLogsProvider(
      entityId,
      sessionId,
    );
  }

  @override
  FetchProductLogsProvider getProviderOverride(
    covariant FetchProductLogsProvider provider,
  ) {
    return call(
      provider.entityId,
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
  String? get name => r'fetchProductLogsProvider';
}

/// Provider to fetch product log entries
///
/// Copied from [fetchProductLogs].
class FetchProductLogsProvider
    extends AutoDisposeFutureProvider<List<ProductLogDTO>> {
  /// Provider to fetch product log entries
  ///
  /// Copied from [fetchProductLogs].
  FetchProductLogsProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          (ref) => fetchProductLogs(
            ref as FetchProductLogsRef,
            entityId,
            sessionId,
          ),
          from: fetchProductLogsProvider,
          name: r'fetchProductLogsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchProductLogsHash,
          dependencies: FetchProductLogsFamily._dependencies,
          allTransitiveDependencies:
              FetchProductLogsFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  FetchProductLogsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityId,
    required this.sessionId,
  }) : super.internal();

  final int entityId;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<ProductLogDTO>> Function(FetchProductLogsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchProductLogsProvider._internal(
        (ref) => create(ref as FetchProductLogsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityId: entityId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductLogDTO>> createElement() {
    return _FetchProductLogsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProductLogsProvider &&
        other.entityId == entityId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchProductLogsRef on AutoDisposeFutureProviderRef<List<ProductLogDTO>> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchProductLogsProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductLogDTO>>
    with FetchProductLogsRef {
  _FetchProductLogsProviderElement(super.provider);

  @override
  int get entityId => (origin as FetchProductLogsProvider).entityId;
  @override
  String get sessionId => (origin as FetchProductLogsProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
