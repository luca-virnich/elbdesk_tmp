// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_log_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchEntityLogsHash() => r'540eb9b9ee0f902e2ed4082e0ee973ab55b1ebf9';

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

/// See also [fetchEntityLogs].
@ProviderFor(fetchEntityLogs)
const fetchEntityLogsProvider = FetchEntityLogsFamily();

/// See also [fetchEntityLogs].
class FetchEntityLogsFamily extends Family<AsyncValue<List<EntityLogDTO>>> {
  /// See also [fetchEntityLogs].
  const FetchEntityLogsFamily();

  /// See also [fetchEntityLogs].
  FetchEntityLogsProvider call({
    required int entityId,
    required TableType tableType,
    required String sessionId,
  }) {
    return FetchEntityLogsProvider(
      entityId: entityId,
      tableType: tableType,
      sessionId: sessionId,
    );
  }

  @override
  FetchEntityLogsProvider getProviderOverride(
    covariant FetchEntityLogsProvider provider,
  ) {
    return call(
      entityId: provider.entityId,
      tableType: provider.tableType,
      sessionId: provider.sessionId,
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
  String? get name => r'fetchEntityLogsProvider';
}

/// See also [fetchEntityLogs].
class FetchEntityLogsProvider
    extends AutoDisposeFutureProvider<List<EntityLogDTO>> {
  /// See also [fetchEntityLogs].
  FetchEntityLogsProvider({
    required int entityId,
    required TableType tableType,
    required String sessionId,
  }) : this._internal(
          (ref) => fetchEntityLogs(
            ref as FetchEntityLogsRef,
            entityId: entityId,
            tableType: tableType,
            sessionId: sessionId,
          ),
          from: fetchEntityLogsProvider,
          name: r'fetchEntityLogsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchEntityLogsHash,
          dependencies: FetchEntityLogsFamily._dependencies,
          allTransitiveDependencies:
              FetchEntityLogsFamily._allTransitiveDependencies,
          entityId: entityId,
          tableType: tableType,
          sessionId: sessionId,
        );

  FetchEntityLogsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityId,
    required this.tableType,
    required this.sessionId,
  }) : super.internal();

  final int entityId;
  final TableType tableType;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<EntityLogDTO>> Function(FetchEntityLogsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchEntityLogsProvider._internal(
        (ref) => create(ref as FetchEntityLogsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityId: entityId,
        tableType: tableType,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<EntityLogDTO>> createElement() {
    return _FetchEntityLogsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEntityLogsProvider &&
        other.entityId == entityId &&
        other.tableType == tableType &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchEntityLogsRef on AutoDisposeFutureProviderRef<List<EntityLogDTO>> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `tableType` of this provider.
  TableType get tableType;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchEntityLogsProviderElement
    extends AutoDisposeFutureProviderElement<List<EntityLogDTO>>
    with FetchEntityLogsRef {
  _FetchEntityLogsProviderElement(super.provider);

  @override
  int get entityId => (origin as FetchEntityLogsProvider).entityId;
  @override
  TableType get tableType => (origin as FetchEntityLogsProvider).tableType;
  @override
  String get sessionId => (origin as FetchEntityLogsProvider).sessionId;
}

String _$entityLogRepositoryHash() =>
    r'c7d738133db8008f88ca96478c6017a67c47758d';

/// See also [entityLogRepository].
@ProviderFor(entityLogRepository)
final entityLogRepositoryProvider =
    AutoDisposeProvider<EntityLogRepository>.internal(
  entityLogRepository,
  name: r'entityLogRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$entityLogRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EntityLogRepositoryRef = AutoDisposeProviderRef<EntityLogRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
