// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_note_core_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$entityNoteCoreRepositoryHash() =>
    r'd8fb8063ca182e58b8d04da38bfa093b44e1d262';

/// See also [entityNoteCoreRepository].
@ProviderFor(entityNoteCoreRepository)
final entityNoteCoreRepositoryProvider =
    AutoDisposeProvider<EntityNoteCoreRepository>.internal(
  entityNoteCoreRepository,
  name: r'entityNoteCoreRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$entityNoteCoreRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EntityNoteCoreRepositoryRef
    = AutoDisposeProviderRef<EntityNoteCoreRepository>;
String _$fetchNotesHash() => r'9bd87950b1322dfe55d03637413edbcf86b5364d';

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

/// See also [fetchNotes].
@ProviderFor(fetchNotes)
const fetchNotesProvider = FetchNotesFamily();

/// See also [fetchNotes].
class FetchNotesFamily extends Family<AsyncValue<List<EntityNote>>> {
  /// See also [fetchNotes].
  const FetchNotesFamily();

  /// See also [fetchNotes].
  FetchNotesProvider call(
    String tableType,
    int entityId,
  ) {
    return FetchNotesProvider(
      tableType,
      entityId,
    );
  }

  @override
  FetchNotesProvider getProviderOverride(
    covariant FetchNotesProvider provider,
  ) {
    return call(
      provider.tableType,
      provider.entityId,
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
  String? get name => r'fetchNotesProvider';
}

/// See also [fetchNotes].
class FetchNotesProvider extends AutoDisposeFutureProvider<List<EntityNote>> {
  /// See also [fetchNotes].
  FetchNotesProvider(
    String tableType,
    int entityId,
  ) : this._internal(
          (ref) => fetchNotes(
            ref as FetchNotesRef,
            tableType,
            entityId,
          ),
          from: fetchNotesProvider,
          name: r'fetchNotesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchNotesHash,
          dependencies: FetchNotesFamily._dependencies,
          allTransitiveDependencies:
              FetchNotesFamily._allTransitiveDependencies,
          tableType: tableType,
          entityId: entityId,
        );

  FetchNotesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.entityId,
  }) : super.internal();

  final String tableType;
  final int entityId;

  @override
  Override overrideWith(
    FutureOr<List<EntityNote>> Function(FetchNotesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchNotesProvider._internal(
        (ref) => create(ref as FetchNotesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        entityId: entityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<EntityNote>> createElement() {
    return _FetchNotesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchNotesProvider &&
        other.tableType == tableType &&
        other.entityId == entityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchNotesRef on AutoDisposeFutureProviderRef<List<EntityNote>> {
  /// The parameter `tableType` of this provider.
  String get tableType;

  /// The parameter `entityId` of this provider.
  int get entityId;
}

class _FetchNotesProviderElement
    extends AutoDisposeFutureProviderElement<List<EntityNote>>
    with FetchNotesRef {
  _FetchNotesProviderElement(super.provider);

  @override
  String get tableType => (origin as FetchNotesProvider).tableType;
  @override
  int get entityId => (origin as FetchNotesProvider).entityId;
}

String _$watchNotesStreamHash() => r'76edab401a192e441bf4ec9ec4a9c00d78d879e7';

/// See also [watchNotesStream].
@ProviderFor(watchNotesStream)
const watchNotesStreamProvider = WatchNotesStreamFamily();

/// See also [watchNotesStream].
class WatchNotesStreamFamily extends Family<AsyncValue<EntityNote>> {
  /// See also [watchNotesStream].
  const WatchNotesStreamFamily();

  /// See also [watchNotesStream].
  WatchNotesStreamProvider call(
    String tableType,
    int entityId,
  ) {
    return WatchNotesStreamProvider(
      tableType,
      entityId,
    );
  }

  @override
  WatchNotesStreamProvider getProviderOverride(
    covariant WatchNotesStreamProvider provider,
  ) {
    return call(
      provider.tableType,
      provider.entityId,
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
  String? get name => r'watchNotesStreamProvider';
}

/// See also [watchNotesStream].
class WatchNotesStreamProvider extends AutoDisposeStreamProvider<EntityNote> {
  /// See also [watchNotesStream].
  WatchNotesStreamProvider(
    String tableType,
    int entityId,
  ) : this._internal(
          (ref) => watchNotesStream(
            ref as WatchNotesStreamRef,
            tableType,
            entityId,
          ),
          from: watchNotesStreamProvider,
          name: r'watchNotesStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchNotesStreamHash,
          dependencies: WatchNotesStreamFamily._dependencies,
          allTransitiveDependencies:
              WatchNotesStreamFamily._allTransitiveDependencies,
          tableType: tableType,
          entityId: entityId,
        );

  WatchNotesStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.entityId,
  }) : super.internal();

  final String tableType;
  final int entityId;

  @override
  Override overrideWith(
    Stream<EntityNote> Function(WatchNotesStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchNotesStreamProvider._internal(
        (ref) => create(ref as WatchNotesStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        entityId: entityId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<EntityNote> createElement() {
    return _WatchNotesStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchNotesStreamProvider &&
        other.tableType == tableType &&
        other.entityId == entityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchNotesStreamRef on AutoDisposeStreamProviderRef<EntityNote> {
  /// The parameter `tableType` of this provider.
  String get tableType;

  /// The parameter `entityId` of this provider.
  int get entityId;
}

class _WatchNotesStreamProviderElement
    extends AutoDisposeStreamProviderElement<EntityNote>
    with WatchNotesStreamRef {
  _WatchNotesStreamProviderElement(super.provider);

  @override
  String get tableType => (origin as WatchNotesStreamProvider).tableType;
  @override
  int get entityId => (origin as WatchNotesStreamProvider).entityId;
}

String _$entityNoteThreadHash() => r'1126888d27481f3d23b5e098b02d281a8da5634c';

/// See also [entityNoteThread].
@ProviderFor(entityNoteThread)
const entityNoteThreadProvider = EntityNoteThreadFamily();

/// See also [entityNoteThread].
class EntityNoteThreadFamily extends Family<AsyncValue<List<EntityNote>>> {
  /// See also [entityNoteThread].
  const EntityNoteThreadFamily();

  /// See also [entityNoteThread].
  EntityNoteThreadProvider call(
    String tableType,
    int entityId,
    String floatingWindowId,
  ) {
    return EntityNoteThreadProvider(
      tableType,
      entityId,
      floatingWindowId,
    );
  }

  @override
  EntityNoteThreadProvider getProviderOverride(
    covariant EntityNoteThreadProvider provider,
  ) {
    return call(
      provider.tableType,
      provider.entityId,
      provider.floatingWindowId,
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
  String? get name => r'entityNoteThreadProvider';
}

/// See also [entityNoteThread].
class EntityNoteThreadProvider
    extends AutoDisposeFutureProvider<List<EntityNote>> {
  /// See also [entityNoteThread].
  EntityNoteThreadProvider(
    String tableType,
    int entityId,
    String floatingWindowId,
  ) : this._internal(
          (ref) => entityNoteThread(
            ref as EntityNoteThreadRef,
            tableType,
            entityId,
            floatingWindowId,
          ),
          from: entityNoteThreadProvider,
          name: r'entityNoteThreadProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$entityNoteThreadHash,
          dependencies: EntityNoteThreadFamily._dependencies,
          allTransitiveDependencies:
              EntityNoteThreadFamily._allTransitiveDependencies,
          tableType: tableType,
          entityId: entityId,
          floatingWindowId: floatingWindowId,
        );

  EntityNoteThreadProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.entityId,
    required this.floatingWindowId,
  }) : super.internal();

  final String tableType;
  final int entityId;
  final String floatingWindowId;

  @override
  Override overrideWith(
    FutureOr<List<EntityNote>> Function(EntityNoteThreadRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EntityNoteThreadProvider._internal(
        (ref) => create(ref as EntityNoteThreadRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        entityId: entityId,
        floatingWindowId: floatingWindowId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<EntityNote>> createElement() {
    return _EntityNoteThreadProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EntityNoteThreadProvider &&
        other.tableType == tableType &&
        other.entityId == entityId &&
        other.floatingWindowId == floatingWindowId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);
    hash = _SystemHash.combine(hash, floatingWindowId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EntityNoteThreadRef on AutoDisposeFutureProviderRef<List<EntityNote>> {
  /// The parameter `tableType` of this provider.
  String get tableType;

  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `floatingWindowId` of this provider.
  String get floatingWindowId;
}

class _EntityNoteThreadProviderElement
    extends AutoDisposeFutureProviderElement<List<EntityNote>>
    with EntityNoteThreadRef {
  _EntityNoteThreadProviderElement(super.provider);

  @override
  String get tableType => (origin as EntityNoteThreadProvider).tableType;
  @override
  int get entityId => (origin as EntityNoteThreadProvider).entityId;
  @override
  String get floatingWindowId =>
      (origin as EntityNoteThreadProvider).floatingWindowId;
}

String _$watchNotesHash() => r'db756429eed970eeab7c9db35a03072aa63a4b1a';

abstract class _$WatchNotes
    extends BuildlessAutoDisposeAsyncNotifier<List<EntityNote>> {
  late final String tableType;
  late final int entityId;

  FutureOr<List<EntityNote>> build(
    String tableType,
    int entityId,
  );
}

/// See also [WatchNotes].
@ProviderFor(WatchNotes)
const watchNotesProvider = WatchNotesFamily();

/// See also [WatchNotes].
class WatchNotesFamily extends Family<AsyncValue<List<EntityNote>>> {
  /// See also [WatchNotes].
  const WatchNotesFamily();

  /// See also [WatchNotes].
  WatchNotesProvider call(
    String tableType,
    int entityId,
  ) {
    return WatchNotesProvider(
      tableType,
      entityId,
    );
  }

  @override
  WatchNotesProvider getProviderOverride(
    covariant WatchNotesProvider provider,
  ) {
    return call(
      provider.tableType,
      provider.entityId,
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
  String? get name => r'watchNotesProvider';
}

/// See also [WatchNotes].
class WatchNotesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchNotes, List<EntityNote>> {
  /// See also [WatchNotes].
  WatchNotesProvider(
    String tableType,
    int entityId,
  ) : this._internal(
          () => WatchNotes()
            ..tableType = tableType
            ..entityId = entityId,
          from: watchNotesProvider,
          name: r'watchNotesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchNotesHash,
          dependencies: WatchNotesFamily._dependencies,
          allTransitiveDependencies:
              WatchNotesFamily._allTransitiveDependencies,
          tableType: tableType,
          entityId: entityId,
        );

  WatchNotesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.entityId,
  }) : super.internal();

  final String tableType;
  final int entityId;

  @override
  FutureOr<List<EntityNote>> runNotifierBuild(
    covariant WatchNotes notifier,
  ) {
    return notifier.build(
      tableType,
      entityId,
    );
  }

  @override
  Override overrideWith(WatchNotes Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchNotesProvider._internal(
        () => create()
          ..tableType = tableType
          ..entityId = entityId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        entityId: entityId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WatchNotes, List<EntityNote>>
      createElement() {
    return _WatchNotesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchNotesProvider &&
        other.tableType == tableType &&
        other.entityId == entityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchNotesRef on AutoDisposeAsyncNotifierProviderRef<List<EntityNote>> {
  /// The parameter `tableType` of this provider.
  String get tableType;

  /// The parameter `entityId` of this provider.
  int get entityId;
}

class _WatchNotesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WatchNotes,
        List<EntityNote>> with WatchNotesRef {
  _WatchNotesProviderElement(super.provider);

  @override
  String get tableType => (origin as WatchNotesProvider).tableType;
  @override
  int get entityId => (origin as WatchNotesProvider).entityId;
}

String _$noteThreadIdHash() => r'de825c6dbb27255d1ff42146bef1aaa23c3a0da9';

abstract class _$NoteThreadId extends BuildlessAutoDisposeNotifier<int?> {
  late final String tableType;
  late final int entityId;
  late final String floatingWindowId;

  int? build(
    String tableType,
    int entityId,
    String floatingWindowId,
  );
}

/// See also [NoteThreadId].
@ProviderFor(NoteThreadId)
const noteThreadIdProvider = NoteThreadIdFamily();

/// See also [NoteThreadId].
class NoteThreadIdFamily extends Family<int?> {
  /// See also [NoteThreadId].
  const NoteThreadIdFamily();

  /// See also [NoteThreadId].
  NoteThreadIdProvider call(
    String tableType,
    int entityId,
    String floatingWindowId,
  ) {
    return NoteThreadIdProvider(
      tableType,
      entityId,
      floatingWindowId,
    );
  }

  @override
  NoteThreadIdProvider getProviderOverride(
    covariant NoteThreadIdProvider provider,
  ) {
    return call(
      provider.tableType,
      provider.entityId,
      provider.floatingWindowId,
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
  String? get name => r'noteThreadIdProvider';
}

/// See also [NoteThreadId].
class NoteThreadIdProvider
    extends AutoDisposeNotifierProviderImpl<NoteThreadId, int?> {
  /// See also [NoteThreadId].
  NoteThreadIdProvider(
    String tableType,
    int entityId,
    String floatingWindowId,
  ) : this._internal(
          () => NoteThreadId()
            ..tableType = tableType
            ..entityId = entityId
            ..floatingWindowId = floatingWindowId,
          from: noteThreadIdProvider,
          name: r'noteThreadIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$noteThreadIdHash,
          dependencies: NoteThreadIdFamily._dependencies,
          allTransitiveDependencies:
              NoteThreadIdFamily._allTransitiveDependencies,
          tableType: tableType,
          entityId: entityId,
          floatingWindowId: floatingWindowId,
        );

  NoteThreadIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tableType,
    required this.entityId,
    required this.floatingWindowId,
  }) : super.internal();

  final String tableType;
  final int entityId;
  final String floatingWindowId;

  @override
  int? runNotifierBuild(
    covariant NoteThreadId notifier,
  ) {
    return notifier.build(
      tableType,
      entityId,
      floatingWindowId,
    );
  }

  @override
  Override overrideWith(NoteThreadId Function() create) {
    return ProviderOverride(
      origin: this,
      override: NoteThreadIdProvider._internal(
        () => create()
          ..tableType = tableType
          ..entityId = entityId
          ..floatingWindowId = floatingWindowId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tableType: tableType,
        entityId: entityId,
        floatingWindowId: floatingWindowId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<NoteThreadId, int?> createElement() {
    return _NoteThreadIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NoteThreadIdProvider &&
        other.tableType == tableType &&
        other.entityId == entityId &&
        other.floatingWindowId == floatingWindowId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tableType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);
    hash = _SystemHash.combine(hash, floatingWindowId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NoteThreadIdRef on AutoDisposeNotifierProviderRef<int?> {
  /// The parameter `tableType` of this provider.
  String get tableType;

  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `floatingWindowId` of this provider.
  String get floatingWindowId;
}

class _NoteThreadIdProviderElement
    extends AutoDisposeNotifierProviderElement<NoteThreadId, int?>
    with NoteThreadIdRef {
  _NoteThreadIdProviderElement(super.provider);

  @override
  String get tableType => (origin as NoteThreadIdProvider).tableType;
  @override
  int get entityId => (origin as NoteThreadIdProvider).entityId;
  @override
  String get floatingWindowId =>
      (origin as NoteThreadIdProvider).floatingWindowId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
