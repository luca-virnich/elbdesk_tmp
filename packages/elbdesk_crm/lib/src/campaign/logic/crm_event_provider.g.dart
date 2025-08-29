// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crm_event_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$crmEventRepositoryHash() =>
    r'2e41dc3d0fb9db644ff53434f92e0822f22426cf';

/// Provider for CRM event repository
///
/// Copied from [crmEventRepository].
@ProviderFor(crmEventRepository)
final crmEventRepositoryProvider =
    AutoDisposeProvider<CrmEventRepository>.internal(
  crmEventRepository,
  name: r'crmEventRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$crmEventRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CrmEventRepositoryRef = AutoDisposeProviderRef<CrmEventRepository>;
String _$fetchCrmEventHash() => r'237c098dcdafca53e4f224474728cedad2201850';

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

/// Provider to fetch a CRM event by ID
///
/// Copied from [fetchCrmEvent].
@ProviderFor(fetchCrmEvent)
const fetchCrmEventProvider = FetchCrmEventFamily();

/// Provider to fetch a CRM event by ID
///
/// Copied from [fetchCrmEvent].
class FetchCrmEventFamily extends Family<AsyncValue<CrmEvent?>> {
  /// Provider to fetch a CRM event by ID
  ///
  /// Copied from [fetchCrmEvent].
  const FetchCrmEventFamily();

  /// Provider to fetch a CRM event by ID
  ///
  /// Copied from [fetchCrmEvent].
  FetchCrmEventProvider call(
    int id,
  ) {
    return FetchCrmEventProvider(
      id,
    );
  }

  @override
  FetchCrmEventProvider getProviderOverride(
    covariant FetchCrmEventProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'fetchCrmEventProvider';
}

/// Provider to fetch a CRM event by ID
///
/// Copied from [fetchCrmEvent].
class FetchCrmEventProvider extends AutoDisposeFutureProvider<CrmEvent?> {
  /// Provider to fetch a CRM event by ID
  ///
  /// Copied from [fetchCrmEvent].
  FetchCrmEventProvider(
    int id,
  ) : this._internal(
          (ref) => fetchCrmEvent(
            ref as FetchCrmEventRef,
            id,
          ),
          from: fetchCrmEventProvider,
          name: r'fetchCrmEventProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCrmEventHash,
          dependencies: FetchCrmEventFamily._dependencies,
          allTransitiveDependencies:
              FetchCrmEventFamily._allTransitiveDependencies,
          id: id,
        );

  FetchCrmEventProvider._internal(
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
    FutureOr<CrmEvent?> Function(FetchCrmEventRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCrmEventProvider._internal(
        (ref) => create(ref as FetchCrmEventRef),
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
  AutoDisposeFutureProviderElement<CrmEvent?> createElement() {
    return _FetchCrmEventProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCrmEventProvider && other.id == id;
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
mixin FetchCrmEventRef on AutoDisposeFutureProviderRef<CrmEvent?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchCrmEventProviderElement
    extends AutoDisposeFutureProviderElement<CrmEvent?> with FetchCrmEventRef {
  _FetchCrmEventProviderElement(super.provider);

  @override
  int get id => (origin as FetchCrmEventProvider).id;
}

String _$fetchContactsNotInEventHash() =>
    r'06eef80504e30ebf3e93fac0bc3e80ddd019c2ed';

/// Provider that fetches all contacts but filters out contacts that are already
/// assigned to the event
///
/// Copied from [fetchContactsNotInEvent].
@ProviderFor(fetchContactsNotInEvent)
const fetchContactsNotInEventProvider = FetchContactsNotInEventFamily();

/// Provider that fetches all contacts but filters out contacts that are already
/// assigned to the event
///
/// Copied from [fetchContactsNotInEvent].
class FetchContactsNotInEventFamily extends Family<AsyncValue<List<Contact>>> {
  /// Provider that fetches all contacts but filters out contacts that are already
  /// assigned to the event
  ///
  /// Copied from [fetchContactsNotInEvent].
  const FetchContactsNotInEventFamily();

  /// Provider that fetches all contacts but filters out contacts that are already
  /// assigned to the event
  ///
  /// Copied from [fetchContactsNotInEvent].
  FetchContactsNotInEventProvider call(
    int eventId,
    String sessionId,
  ) {
    return FetchContactsNotInEventProvider(
      eventId,
      sessionId,
    );
  }

  @override
  FetchContactsNotInEventProvider getProviderOverride(
    covariant FetchContactsNotInEventProvider provider,
  ) {
    return call(
      provider.eventId,
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
  String? get name => r'fetchContactsNotInEventProvider';
}

/// Provider that fetches all contacts but filters out contacts that are already
/// assigned to the event
///
/// Copied from [fetchContactsNotInEvent].
class FetchContactsNotInEventProvider
    extends AutoDisposeFutureProvider<List<Contact>> {
  /// Provider that fetches all contacts but filters out contacts that are already
  /// assigned to the event
  ///
  /// Copied from [fetchContactsNotInEvent].
  FetchContactsNotInEventProvider(
    int eventId,
    String sessionId,
  ) : this._internal(
          (ref) => fetchContactsNotInEvent(
            ref as FetchContactsNotInEventRef,
            eventId,
            sessionId,
          ),
          from: fetchContactsNotInEventProvider,
          name: r'fetchContactsNotInEventProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchContactsNotInEventHash,
          dependencies: FetchContactsNotInEventFamily._dependencies,
          allTransitiveDependencies:
              FetchContactsNotInEventFamily._allTransitiveDependencies,
          eventId: eventId,
          sessionId: sessionId,
        );

  FetchContactsNotInEventProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventId,
    required this.sessionId,
  }) : super.internal();

  final int eventId;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<Contact>> Function(FetchContactsNotInEventRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchContactsNotInEventProvider._internal(
        (ref) => create(ref as FetchContactsNotInEventRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventId: eventId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Contact>> createElement() {
    return _FetchContactsNotInEventProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchContactsNotInEventProvider &&
        other.eventId == eventId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchContactsNotInEventRef
    on AutoDisposeFutureProviderRef<List<Contact>> {
  /// The parameter `eventId` of this provider.
  int get eventId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchContactsNotInEventProviderElement
    extends AutoDisposeFutureProviderElement<List<Contact>>
    with FetchContactsNotInEventRef {
  _FetchContactsNotInEventProviderElement(super.provider);

  @override
  int get eventId => (origin as FetchContactsNotInEventProvider).eventId;
  @override
  String get sessionId => (origin as FetchContactsNotInEventProvider).sessionId;
}

String _$watchCrmEventHash() => r'd280f626d30045cde3dfadea8409da165e2e16e1';

/// Provider to watch a specific event by ID
///
/// Copied from [watchCrmEvent].
@ProviderFor(watchCrmEvent)
const watchCrmEventProvider = WatchCrmEventFamily();

/// Provider to watch a specific event by ID
///
/// Copied from [watchCrmEvent].
class WatchCrmEventFamily extends Family<AsyncValue<CrmEvent>> {
  /// Provider to watch a specific event by ID
  ///
  /// Copied from [watchCrmEvent].
  const WatchCrmEventFamily();

  /// Provider to watch a specific event by ID
  ///
  /// Copied from [watchCrmEvent].
  WatchCrmEventProvider call({
    required int entityId,
    required String sessionId,
  }) {
    return WatchCrmEventProvider(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  WatchCrmEventProvider getProviderOverride(
    covariant WatchCrmEventProvider provider,
  ) {
    return call(
      entityId: provider.entityId,
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
  String? get name => r'watchCrmEventProvider';
}

/// Provider to watch a specific event by ID
///
/// Copied from [watchCrmEvent].
class WatchCrmEventProvider extends AutoDisposeStreamProvider<CrmEvent> {
  /// Provider to watch a specific event by ID
  ///
  /// Copied from [watchCrmEvent].
  WatchCrmEventProvider({
    required int entityId,
    required String sessionId,
  }) : this._internal(
          (ref) => watchCrmEvent(
            ref as WatchCrmEventRef,
            entityId: entityId,
            sessionId: sessionId,
          ),
          from: watchCrmEventProvider,
          name: r'watchCrmEventProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCrmEventHash,
          dependencies: WatchCrmEventFamily._dependencies,
          allTransitiveDependencies:
              WatchCrmEventFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  WatchCrmEventProvider._internal(
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
    Stream<CrmEvent> Function(WatchCrmEventRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCrmEventProvider._internal(
        (ref) => create(ref as WatchCrmEventRef),
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
  AutoDisposeStreamProviderElement<CrmEvent> createElement() {
    return _WatchCrmEventProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCrmEventProvider &&
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
mixin WatchCrmEventRef on AutoDisposeStreamProviderRef<CrmEvent> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _WatchCrmEventProviderElement
    extends AutoDisposeStreamProviderElement<CrmEvent> with WatchCrmEventRef {
  _WatchCrmEventProviderElement(super.provider);

  @override
  int get entityId => (origin as WatchCrmEventProvider).entityId;
  @override
  String get sessionId => (origin as WatchCrmEventProvider).sessionId;
}

String _$watchEventContactsWithFilterHash() =>
    r'e49ed8ae25df67488122deac2f77ea3df7a36b23';

/// Provider that watches contacts for a CRM event
/// and filters them according to the table filter provided through the
/// tableSessionId
///
/// Copied from [watchEventContactsWithFilter].
@ProviderFor(watchEventContactsWithFilter)
const watchEventContactsWithFilterProvider =
    WatchEventContactsWithFilterFamily();

/// Provider that watches contacts for a CRM event
/// and filters them according to the table filter provided through the
/// tableSessionId
///
/// Copied from [watchEventContactsWithFilter].
class WatchEventContactsWithFilterFamily extends Family<AsyncValue<Contact?>> {
  /// Provider that watches contacts for a CRM event
  /// and filters them according to the table filter provided through the
  /// tableSessionId
  ///
  /// Copied from [watchEventContactsWithFilter].
  const WatchEventContactsWithFilterFamily();

  /// Provider that watches contacts for a CRM event
  /// and filters them according to the table filter provided through the
  /// tableSessionId
  ///
  /// Copied from [watchEventContactsWithFilter].
  WatchEventContactsWithFilterProvider call(
    int eventId,
    String tableSessionId,
  ) {
    return WatchEventContactsWithFilterProvider(
      eventId,
      tableSessionId,
    );
  }

  @override
  WatchEventContactsWithFilterProvider getProviderOverride(
    covariant WatchEventContactsWithFilterProvider provider,
  ) {
    return call(
      provider.eventId,
      provider.tableSessionId,
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
  String? get name => r'watchEventContactsWithFilterProvider';
}

/// Provider that watches contacts for a CRM event
/// and filters them according to the table filter provided through the
/// tableSessionId
///
/// Copied from [watchEventContactsWithFilter].
class WatchEventContactsWithFilterProvider
    extends AutoDisposeStreamProvider<Contact?> {
  /// Provider that watches contacts for a CRM event
  /// and filters them according to the table filter provided through the
  /// tableSessionId
  ///
  /// Copied from [watchEventContactsWithFilter].
  WatchEventContactsWithFilterProvider(
    int eventId,
    String tableSessionId,
  ) : this._internal(
          (ref) => watchEventContactsWithFilter(
            ref as WatchEventContactsWithFilterRef,
            eventId,
            tableSessionId,
          ),
          from: watchEventContactsWithFilterProvider,
          name: r'watchEventContactsWithFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchEventContactsWithFilterHash,
          dependencies: WatchEventContactsWithFilterFamily._dependencies,
          allTransitiveDependencies:
              WatchEventContactsWithFilterFamily._allTransitiveDependencies,
          eventId: eventId,
          tableSessionId: tableSessionId,
        );

  WatchEventContactsWithFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventId,
    required this.tableSessionId,
  }) : super.internal();

  final int eventId;
  final String tableSessionId;

  @override
  Override overrideWith(
    Stream<Contact?> Function(WatchEventContactsWithFilterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchEventContactsWithFilterProvider._internal(
        (ref) => create(ref as WatchEventContactsWithFilterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventId: eventId,
        tableSessionId: tableSessionId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Contact?> createElement() {
    return _WatchEventContactsWithFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEventContactsWithFilterProvider &&
        other.eventId == eventId &&
        other.tableSessionId == tableSessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);
    hash = _SystemHash.combine(hash, tableSessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchEventContactsWithFilterRef
    on AutoDisposeStreamProviderRef<Contact?> {
  /// The parameter `eventId` of this provider.
  int get eventId;

  /// The parameter `tableSessionId` of this provider.
  String get tableSessionId;
}

class _WatchEventContactsWithFilterProviderElement
    extends AutoDisposeStreamProviderElement<Contact?>
    with WatchEventContactsWithFilterRef {
  _WatchEventContactsWithFilterProviderElement(super.provider);

  @override
  int get eventId => (origin as WatchEventContactsWithFilterProvider).eventId;
  @override
  String get tableSessionId =>
      (origin as WatchEventContactsWithFilterProvider).tableSessionId;
}

String _$watchAllCrmEventsHash() => r'4b1908a58b65ed4bd15cc401cbae236a4485710b';

/// Provider to watch all CRM events
///
/// Copied from [watchAllCrmEvents].
@ProviderFor(watchAllCrmEvents)
final watchAllCrmEventsProvider = AutoDisposeStreamProvider<CrmEvent>.internal(
  watchAllCrmEvents,
  name: r'watchAllCrmEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAllCrmEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllCrmEventsRef = AutoDisposeStreamProviderRef<CrmEvent>;
String _$findCrmEventsHash() => r'fc99a41d9c9fd5a374c90513e0be51ee8d82bc80';

/// Provider to find CRM events by session ID with table sorting and filtering
///
/// Copied from [findCrmEvents].
@ProviderFor(findCrmEvents)
const findCrmEventsProvider = FindCrmEventsFamily();

/// Provider to find CRM events by session ID with table sorting and filtering
///
/// Copied from [findCrmEvents].
class FindCrmEventsFamily extends Family<AsyncValue<List<CrmEvent>>> {
  /// Provider to find CRM events by session ID with table sorting and filtering
  ///
  /// Copied from [findCrmEvents].
  const FindCrmEventsFamily();

  /// Provider to find CRM events by session ID with table sorting and filtering
  ///
  /// Copied from [findCrmEvents].
  FindCrmEventsProvider call(
    String sessionId,
  ) {
    return FindCrmEventsProvider(
      sessionId,
    );
  }

  @override
  FindCrmEventsProvider getProviderOverride(
    covariant FindCrmEventsProvider provider,
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
  String? get name => r'findCrmEventsProvider';
}

/// Provider to find CRM events by session ID with table sorting and filtering
///
/// Copied from [findCrmEvents].
class FindCrmEventsProvider extends AutoDisposeFutureProvider<List<CrmEvent>> {
  /// Provider to find CRM events by session ID with table sorting and filtering
  ///
  /// Copied from [findCrmEvents].
  FindCrmEventsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findCrmEvents(
            ref as FindCrmEventsRef,
            sessionId,
          ),
          from: findCrmEventsProvider,
          name: r'findCrmEventsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findCrmEventsHash,
          dependencies: FindCrmEventsFamily._dependencies,
          allTransitiveDependencies:
              FindCrmEventsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindCrmEventsProvider._internal(
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
    FutureOr<List<CrmEvent>> Function(FindCrmEventsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindCrmEventsProvider._internal(
        (ref) => create(ref as FindCrmEventsRef),
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
  AutoDisposeFutureProviderElement<List<CrmEvent>> createElement() {
    return _FindCrmEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindCrmEventsProvider && other.sessionId == sessionId;
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
mixin FindCrmEventsRef on AutoDisposeFutureProviderRef<List<CrmEvent>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindCrmEventsProviderElement
    extends AutoDisposeFutureProviderElement<List<CrmEvent>>
    with FindCrmEventsRef {
  _FindCrmEventsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindCrmEventsProvider).sessionId;
}

String _$findEventsHash() => r'a02ef501b5e2d33e3a56fb5a4d5c2b45053d4bc0';

/// Provider to find CRM events with filter and sort
///
/// Copied from [findEvents].
@ProviderFor(findEvents)
const findEventsProvider = FindEventsFamily();

/// Provider to find CRM events with filter and sort
///
/// Copied from [findEvents].
class FindEventsFamily extends Family<AsyncValue<List<CrmEvent>>> {
  /// Provider to find CRM events with filter and sort
  ///
  /// Copied from [findEvents].
  const FindEventsFamily();

  /// Provider to find CRM events with filter and sort
  ///
  /// Copied from [findEvents].
  FindEventsProvider call({
    Sort? sort,
    Filter? filter,
  }) {
    return FindEventsProvider(
      sort: sort,
      filter: filter,
    );
  }

  @override
  FindEventsProvider getProviderOverride(
    covariant FindEventsProvider provider,
  ) {
    return call(
      sort: provider.sort,
      filter: provider.filter,
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
  String? get name => r'findEventsProvider';
}

/// Provider to find CRM events with filter and sort
///
/// Copied from [findEvents].
class FindEventsProvider extends AutoDisposeFutureProvider<List<CrmEvent>> {
  /// Provider to find CRM events with filter and sort
  ///
  /// Copied from [findEvents].
  FindEventsProvider({
    Sort? sort,
    Filter? filter,
  }) : this._internal(
          (ref) => findEvents(
            ref as FindEventsRef,
            sort: sort,
            filter: filter,
          ),
          from: findEventsProvider,
          name: r'findEventsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findEventsHash,
          dependencies: FindEventsFamily._dependencies,
          allTransitiveDependencies:
              FindEventsFamily._allTransitiveDependencies,
          sort: sort,
          filter: filter,
        );

  FindEventsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sort,
    required this.filter,
  }) : super.internal();

  final Sort? sort;
  final Filter? filter;

  @override
  Override overrideWith(
    FutureOr<List<CrmEvent>> Function(FindEventsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindEventsProvider._internal(
        (ref) => create(ref as FindEventsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sort: sort,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CrmEvent>> createElement() {
    return _FindEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindEventsProvider &&
        other.sort == sort &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sort.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindEventsRef on AutoDisposeFutureProviderRef<List<CrmEvent>> {
  /// The parameter `sort` of this provider.
  Sort? get sort;

  /// The parameter `filter` of this provider.
  Filter? get filter;
}

class _FindEventsProviderElement
    extends AutoDisposeFutureProviderElement<List<CrmEvent>>
    with FindEventsRef {
  _FindEventsProviderElement(super.provider);

  @override
  Sort? get sort => (origin as FindEventsProvider).sort;
  @override
  Filter? get filter => (origin as FindEventsProvider).filter;
}

String _$watchEventContactDeletionsHash() =>
    r'f970ab9bdeac8aa1a0e882bdd151ee1e1bbb44e5';

/// Provider that watches contact deletions for a CRM event
///
/// Copied from [watchEventContactDeletions].
@ProviderFor(watchEventContactDeletions)
const watchEventContactDeletionsProvider = WatchEventContactDeletionsFamily();

/// Provider that watches contact deletions for a CRM event
///
/// Copied from [watchEventContactDeletions].
class WatchEventContactDeletionsFamily extends Family<AsyncValue<int>> {
  /// Provider that watches contact deletions for a CRM event
  ///
  /// Copied from [watchEventContactDeletions].
  const WatchEventContactDeletionsFamily();

  /// Provider that watches contact deletions for a CRM event
  ///
  /// Copied from [watchEventContactDeletions].
  WatchEventContactDeletionsProvider call(
    int eventId,
  ) {
    return WatchEventContactDeletionsProvider(
      eventId,
    );
  }

  @override
  WatchEventContactDeletionsProvider getProviderOverride(
    covariant WatchEventContactDeletionsProvider provider,
  ) {
    return call(
      provider.eventId,
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
  String? get name => r'watchEventContactDeletionsProvider';
}

/// Provider that watches contact deletions for a CRM event
///
/// Copied from [watchEventContactDeletions].
class WatchEventContactDeletionsProvider
    extends AutoDisposeStreamProvider<int> {
  /// Provider that watches contact deletions for a CRM event
  ///
  /// Copied from [watchEventContactDeletions].
  WatchEventContactDeletionsProvider(
    int eventId,
  ) : this._internal(
          (ref) => watchEventContactDeletions(
            ref as WatchEventContactDeletionsRef,
            eventId,
          ),
          from: watchEventContactDeletionsProvider,
          name: r'watchEventContactDeletionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchEventContactDeletionsHash,
          dependencies: WatchEventContactDeletionsFamily._dependencies,
          allTransitiveDependencies:
              WatchEventContactDeletionsFamily._allTransitiveDependencies,
          eventId: eventId,
        );

  WatchEventContactDeletionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventId,
  }) : super.internal();

  final int eventId;

  @override
  Override overrideWith(
    Stream<int> Function(WatchEventContactDeletionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchEventContactDeletionsProvider._internal(
        (ref) => create(ref as WatchEventContactDeletionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventId: eventId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<int> createElement() {
    return _WatchEventContactDeletionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEventContactDeletionsProvider &&
        other.eventId == eventId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchEventContactDeletionsRef on AutoDisposeStreamProviderRef<int> {
  /// The parameter `eventId` of this provider.
  int get eventId;
}

class _WatchEventContactDeletionsProviderElement
    extends AutoDisposeStreamProviderElement<int>
    with WatchEventContactDeletionsRef {
  _WatchEventContactDeletionsProviderElement(super.provider);

  @override
  int get eventId => (origin as WatchEventContactDeletionsProvider).eventId;
}

String _$fetchAndWatchAllCrmEventsHash() =>
    r'a9c096478157ab5c1e9d58d6d3e67b4bf19b42ba';

/// Provider that combines initial fetching with watching for updates
///
/// Copied from [FetchAndWatchAllCrmEvents].
@ProviderFor(FetchAndWatchAllCrmEvents)
final fetchAndWatchAllCrmEventsProvider = AutoDisposeAsyncNotifierProvider<
    FetchAndWatchAllCrmEvents, List<CrmEvent>>.internal(
  FetchAndWatchAllCrmEvents.new,
  name: r'fetchAndWatchAllCrmEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAndWatchAllCrmEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FetchAndWatchAllCrmEvents = AutoDisposeAsyncNotifier<List<CrmEvent>>;
String _$fetchAndWatchEventContactsHash() =>
    r'af30d1b0dcb87c98e374cb9b38a815e50a7da2f7';

abstract class _$FetchAndWatchEventContacts
    extends BuildlessAutoDisposeAsyncNotifier<List<Contact>> {
  late final int eventId;
  late final String tableSessionId;

  FutureOr<List<Contact>> build(
    int eventId,
    String tableSessionId,
  );
}

/// Provider that fetches all contacts for a CRM event and watches for changes
/// Filters according to the table filter provided through the tableSessionId
///
/// Copied from [FetchAndWatchEventContacts].
@ProviderFor(FetchAndWatchEventContacts)
const fetchAndWatchEventContactsProvider = FetchAndWatchEventContactsFamily();

/// Provider that fetches all contacts for a CRM event and watches for changes
/// Filters according to the table filter provided through the tableSessionId
///
/// Copied from [FetchAndWatchEventContacts].
class FetchAndWatchEventContactsFamily
    extends Family<AsyncValue<List<Contact>>> {
  /// Provider that fetches all contacts for a CRM event and watches for changes
  /// Filters according to the table filter provided through the tableSessionId
  ///
  /// Copied from [FetchAndWatchEventContacts].
  const FetchAndWatchEventContactsFamily();

  /// Provider that fetches all contacts for a CRM event and watches for changes
  /// Filters according to the table filter provided through the tableSessionId
  ///
  /// Copied from [FetchAndWatchEventContacts].
  FetchAndWatchEventContactsProvider call(
    int eventId,
    String tableSessionId,
  ) {
    return FetchAndWatchEventContactsProvider(
      eventId,
      tableSessionId,
    );
  }

  @override
  FetchAndWatchEventContactsProvider getProviderOverride(
    covariant FetchAndWatchEventContactsProvider provider,
  ) {
    return call(
      provider.eventId,
      provider.tableSessionId,
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
  String? get name => r'fetchAndWatchEventContactsProvider';
}

/// Provider that fetches all contacts for a CRM event and watches for changes
/// Filters according to the table filter provided through the tableSessionId
///
/// Copied from [FetchAndWatchEventContacts].
class FetchAndWatchEventContactsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FetchAndWatchEventContacts,
        List<Contact>> {
  /// Provider that fetches all contacts for a CRM event and watches for changes
  /// Filters according to the table filter provided through the tableSessionId
  ///
  /// Copied from [FetchAndWatchEventContacts].
  FetchAndWatchEventContactsProvider(
    int eventId,
    String tableSessionId,
  ) : this._internal(
          () => FetchAndWatchEventContacts()
            ..eventId = eventId
            ..tableSessionId = tableSessionId,
          from: fetchAndWatchEventContactsProvider,
          name: r'fetchAndWatchEventContactsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchEventContactsHash,
          dependencies: FetchAndWatchEventContactsFamily._dependencies,
          allTransitiveDependencies:
              FetchAndWatchEventContactsFamily._allTransitiveDependencies,
          eventId: eventId,
          tableSessionId: tableSessionId,
        );

  FetchAndWatchEventContactsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventId,
    required this.tableSessionId,
  }) : super.internal();

  final int eventId;
  final String tableSessionId;

  @override
  FutureOr<List<Contact>> runNotifierBuild(
    covariant FetchAndWatchEventContacts notifier,
  ) {
    return notifier.build(
      eventId,
      tableSessionId,
    );
  }

  @override
  Override overrideWith(FetchAndWatchEventContacts Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchAndWatchEventContactsProvider._internal(
        () => create()
          ..eventId = eventId
          ..tableSessionId = tableSessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventId: eventId,
        tableSessionId: tableSessionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FetchAndWatchEventContacts,
      List<Contact>> createElement() {
    return _FetchAndWatchEventContactsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAndWatchEventContactsProvider &&
        other.eventId == eventId &&
        other.tableSessionId == tableSessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);
    hash = _SystemHash.combine(hash, tableSessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchAndWatchEventContactsRef
    on AutoDisposeAsyncNotifierProviderRef<List<Contact>> {
  /// The parameter `eventId` of this provider.
  int get eventId;

  /// The parameter `tableSessionId` of this provider.
  String get tableSessionId;
}

class _FetchAndWatchEventContactsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FetchAndWatchEventContacts,
        List<Contact>> with FetchAndWatchEventContactsRef {
  _FetchAndWatchEventContactsProviderElement(super.provider);

  @override
  int get eventId => (origin as FetchAndWatchEventContactsProvider).eventId;
  @override
  String get tableSessionId =>
      (origin as FetchAndWatchEventContactsProvider).tableSessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
