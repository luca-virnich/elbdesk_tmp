// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contactRepositoryHash() => r'ce613464847239824a0c30e62d1fff73bb6ed384';

/// See also [contactRepository].
@ProviderFor(contactRepository)
final contactRepositoryProvider =
    AutoDisposeProvider<ContactRepository>.internal(
  contactRepository,
  name: r'contactRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$contactRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ContactRepositoryRef = AutoDisposeProviderRef<ContactRepository>;
String _$findContactsHash() => r'dc1f756cc194f6118839bc6a389e0d453f7e87cb';

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

/// See also [findContacts].
@ProviderFor(findContacts)
const findContactsProvider = FindContactsFamily();

/// See also [findContacts].
class FindContactsFamily extends Family<AsyncValue<List<Contact>>> {
  /// See also [findContacts].
  const FindContactsFamily();

  /// See also [findContacts].
  FindContactsProvider call(
    String sessionId,
  ) {
    return FindContactsProvider(
      sessionId,
    );
  }

  @override
  FindContactsProvider getProviderOverride(
    covariant FindContactsProvider provider,
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
  String? get name => r'findContactsProvider';
}

/// See also [findContacts].
class FindContactsProvider extends AutoDisposeFutureProvider<List<Contact>> {
  /// See also [findContacts].
  FindContactsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findContacts(
            ref as FindContactsRef,
            sessionId,
          ),
          from: findContactsProvider,
          name: r'findContactsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findContactsHash,
          dependencies: FindContactsFamily._dependencies,
          allTransitiveDependencies:
              FindContactsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindContactsProvider._internal(
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
    FutureOr<List<Contact>> Function(FindContactsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindContactsProvider._internal(
        (ref) => create(ref as FindContactsRef),
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
  AutoDisposeFutureProviderElement<List<Contact>> createElement() {
    return _FindContactsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindContactsProvider && other.sessionId == sessionId;
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
mixin FindContactsRef on AutoDisposeFutureProviderRef<List<Contact>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindContactsProviderElement
    extends AutoDisposeFutureProviderElement<List<Contact>>
    with FindContactsRef {
  _FindContactsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindContactsProvider).sessionId;
}

String _$findCompanyContactsHash() =>
    r'3d9b3b3e1f908a9db20517e3558d454425b8b2c7';

/// See also [findCompanyContacts].
@ProviderFor(findCompanyContacts)
const findCompanyContactsProvider = FindCompanyContactsFamily();

/// See also [findCompanyContacts].
class FindCompanyContactsFamily extends Family<AsyncValue<List<Contact>>> {
  /// See also [findCompanyContacts].
  const FindCompanyContactsFamily();

  /// See also [findCompanyContacts].
  FindCompanyContactsProvider call(
    String sessionId, {
    Sort? sort,
    Filter? filter,
  }) {
    return FindCompanyContactsProvider(
      sessionId,
      sort: sort,
      filter: filter,
    );
  }

  @override
  FindCompanyContactsProvider getProviderOverride(
    covariant FindCompanyContactsProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'findCompanyContactsProvider';
}

/// See also [findCompanyContacts].
class FindCompanyContactsProvider
    extends AutoDisposeFutureProvider<List<Contact>> {
  /// See also [findCompanyContacts].
  FindCompanyContactsProvider(
    String sessionId, {
    Sort? sort,
    Filter? filter,
  }) : this._internal(
          (ref) => findCompanyContacts(
            ref as FindCompanyContactsRef,
            sessionId,
            sort: sort,
            filter: filter,
          ),
          from: findCompanyContactsProvider,
          name: r'findCompanyContactsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findCompanyContactsHash,
          dependencies: FindCompanyContactsFamily._dependencies,
          allTransitiveDependencies:
              FindCompanyContactsFamily._allTransitiveDependencies,
          sessionId: sessionId,
          sort: sort,
          filter: filter,
        );

  FindCompanyContactsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.sort,
    required this.filter,
  }) : super.internal();

  final String sessionId;
  final Sort? sort;
  final Filter? filter;

  @override
  Override overrideWith(
    FutureOr<List<Contact>> Function(FindCompanyContactsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindCompanyContactsProvider._internal(
        (ref) => create(ref as FindCompanyContactsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        sort: sort,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Contact>> createElement() {
    return _FindCompanyContactsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindCompanyContactsProvider &&
        other.sessionId == sessionId &&
        other.sort == sort &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, sort.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindCompanyContactsRef on AutoDisposeFutureProviderRef<List<Contact>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `sort` of this provider.
  Sort? get sort;

  /// The parameter `filter` of this provider.
  Filter? get filter;
}

class _FindCompanyContactsProviderElement
    extends AutoDisposeFutureProviderElement<List<Contact>>
    with FindCompanyContactsRef {
  _FindCompanyContactsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindCompanyContactsProvider).sessionId;
  @override
  Sort? get sort => (origin as FindCompanyContactsProvider).sort;
  @override
  Filter? get filter => (origin as FindCompanyContactsProvider).filter;
}

String _$findPersonContactsHash() =>
    r'5252e30d532d150236307a6ecc6bd8067a9bd653';

/// See also [findPersonContacts].
@ProviderFor(findPersonContacts)
const findPersonContactsProvider = FindPersonContactsFamily();

/// See also [findPersonContacts].
class FindPersonContactsFamily extends Family<AsyncValue<List<Contact>>> {
  /// See also [findPersonContacts].
  const FindPersonContactsFamily();

  /// See also [findPersonContacts].
  FindPersonContactsProvider call(
    String sessionId, {
    Sort? sort,
    Filter? filter,
  }) {
    return FindPersonContactsProvider(
      sessionId,
      sort: sort,
      filter: filter,
    );
  }

  @override
  FindPersonContactsProvider getProviderOverride(
    covariant FindPersonContactsProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'findPersonContactsProvider';
}

/// See also [findPersonContacts].
class FindPersonContactsProvider
    extends AutoDisposeFutureProvider<List<Contact>> {
  /// See also [findPersonContacts].
  FindPersonContactsProvider(
    String sessionId, {
    Sort? sort,
    Filter? filter,
  }) : this._internal(
          (ref) => findPersonContacts(
            ref as FindPersonContactsRef,
            sessionId,
            sort: sort,
            filter: filter,
          ),
          from: findPersonContactsProvider,
          name: r'findPersonContactsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findPersonContactsHash,
          dependencies: FindPersonContactsFamily._dependencies,
          allTransitiveDependencies:
              FindPersonContactsFamily._allTransitiveDependencies,
          sessionId: sessionId,
          sort: sort,
          filter: filter,
        );

  FindPersonContactsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.sort,
    required this.filter,
  }) : super.internal();

  final String sessionId;
  final Sort? sort;
  final Filter? filter;

  @override
  Override overrideWith(
    FutureOr<List<Contact>> Function(FindPersonContactsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindPersonContactsProvider._internal(
        (ref) => create(ref as FindPersonContactsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        sort: sort,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Contact>> createElement() {
    return _FindPersonContactsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindPersonContactsProvider &&
        other.sessionId == sessionId &&
        other.sort == sort &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, sort.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindPersonContactsRef on AutoDisposeFutureProviderRef<List<Contact>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `sort` of this provider.
  Sort? get sort;

  /// The parameter `filter` of this provider.
  Filter? get filter;
}

class _FindPersonContactsProviderElement
    extends AutoDisposeFutureProviderElement<List<Contact>>
    with FindPersonContactsRef {
  _FindPersonContactsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindPersonContactsProvider).sessionId;
  @override
  Sort? get sort => (origin as FindPersonContactsProvider).sort;
  @override
  Filter? get filter => (origin as FindPersonContactsProvider).filter;
}

String _$watchContactEntityCardHash() =>
    r'c5961529f4bbbd42218f89ffc987407d1bbf46e0';

/// See also [watchContactEntityCard].
@ProviderFor(watchContactEntityCard)
const watchContactEntityCardProvider = WatchContactEntityCardFamily();

/// See also [watchContactEntityCard].
class WatchContactEntityCardFamily extends Family<AsyncValue<Contact>> {
  /// See also [watchContactEntityCard].
  const WatchContactEntityCardFamily();

  /// See also [watchContactEntityCard].
  WatchContactEntityCardProvider call({
    required String sessionId,
    required int contactId,
  }) {
    return WatchContactEntityCardProvider(
      sessionId: sessionId,
      contactId: contactId,
    );
  }

  @override
  WatchContactEntityCardProvider getProviderOverride(
    covariant WatchContactEntityCardProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      contactId: provider.contactId,
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
  String? get name => r'watchContactEntityCardProvider';
}

/// See also [watchContactEntityCard].
class WatchContactEntityCardProvider
    extends AutoDisposeStreamProvider<Contact> {
  /// See also [watchContactEntityCard].
  WatchContactEntityCardProvider({
    required String sessionId,
    required int contactId,
  }) : this._internal(
          (ref) => watchContactEntityCard(
            ref as WatchContactEntityCardRef,
            sessionId: sessionId,
            contactId: contactId,
          ),
          from: watchContactEntityCardProvider,
          name: r'watchContactEntityCardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchContactEntityCardHash,
          dependencies: WatchContactEntityCardFamily._dependencies,
          allTransitiveDependencies:
              WatchContactEntityCardFamily._allTransitiveDependencies,
          sessionId: sessionId,
          contactId: contactId,
        );

  WatchContactEntityCardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.contactId,
  }) : super.internal();

  final String sessionId;
  final int contactId;

  @override
  Override overrideWith(
    Stream<Contact> Function(WatchContactEntityCardRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchContactEntityCardProvider._internal(
        (ref) => create(ref as WatchContactEntityCardRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        contactId: contactId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Contact> createElement() {
    return _WatchContactEntityCardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchContactEntityCardProvider &&
        other.sessionId == sessionId &&
        other.contactId == contactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, contactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchContactEntityCardRef on AutoDisposeStreamProviderRef<Contact> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _WatchContactEntityCardProviderElement
    extends AutoDisposeStreamProviderElement<Contact>
    with WatchContactEntityCardRef {
  _WatchContactEntityCardProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchContactEntityCardProvider).sessionId;
  @override
  int get contactId => (origin as WatchContactEntityCardProvider).contactId;
}

String _$fetchContactByIdHash() => r'dbc8032e9effe9d0d24d425e243cbb957f44533c';

/// See also [fetchContactById].
@ProviderFor(fetchContactById)
const fetchContactByIdProvider = FetchContactByIdFamily();

/// See also [fetchContactById].
class FetchContactByIdFamily extends Family<AsyncValue<Contact>> {
  /// See also [fetchContactById].
  const FetchContactByIdFamily();

  /// See also [fetchContactById].
  FetchContactByIdProvider call(
    int contactId,
  ) {
    return FetchContactByIdProvider(
      contactId,
    );
  }

  @override
  FetchContactByIdProvider getProviderOverride(
    covariant FetchContactByIdProvider provider,
  ) {
    return call(
      provider.contactId,
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
  String? get name => r'fetchContactByIdProvider';
}

/// See also [fetchContactById].
class FetchContactByIdProvider extends AutoDisposeFutureProvider<Contact> {
  /// See also [fetchContactById].
  FetchContactByIdProvider(
    int contactId,
  ) : this._internal(
          (ref) => fetchContactById(
            ref as FetchContactByIdRef,
            contactId,
          ),
          from: fetchContactByIdProvider,
          name: r'fetchContactByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchContactByIdHash,
          dependencies: FetchContactByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchContactByIdFamily._allTransitiveDependencies,
          contactId: contactId,
        );

  FetchContactByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.contactId,
  }) : super.internal();

  final int contactId;

  @override
  Override overrideWith(
    FutureOr<Contact> Function(FetchContactByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchContactByIdProvider._internal(
        (ref) => create(ref as FetchContactByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        contactId: contactId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Contact> createElement() {
    return _FetchContactByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchContactByIdProvider && other.contactId == contactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchContactByIdRef on AutoDisposeFutureProviderRef<Contact> {
  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _FetchContactByIdProviderElement
    extends AutoDisposeFutureProviderElement<Contact> with FetchContactByIdRef {
  _FetchContactByIdProviderElement(super.provider);

  @override
  int get contactId => (origin as FetchContactByIdProvider).contactId;
}

String _$findContactsSpotlightHash() =>
    r'15cc088003be2e5a673aa081d9af1e3b7792d42f';

/// See also [findContactsSpotlight].
@ProviderFor(findContactsSpotlight)
const findContactsSpotlightProvider = FindContactsSpotlightFamily();

/// See also [findContactsSpotlight].
class FindContactsSpotlightFamily
    extends Family<AsyncValue<List<SpotlightItem>>> {
  /// See also [findContactsSpotlight].
  const FindContactsSpotlightFamily();

  /// See also [findContactsSpotlight].
  FindContactsSpotlightProvider call(
    String query,
  ) {
    return FindContactsSpotlightProvider(
      query,
    );
  }

  @override
  FindContactsSpotlightProvider getProviderOverride(
    covariant FindContactsSpotlightProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'findContactsSpotlightProvider';
}

/// See also [findContactsSpotlight].
class FindContactsSpotlightProvider
    extends AutoDisposeFutureProvider<List<SpotlightItem>> {
  /// See also [findContactsSpotlight].
  FindContactsSpotlightProvider(
    String query,
  ) : this._internal(
          (ref) => findContactsSpotlight(
            ref as FindContactsSpotlightRef,
            query,
          ),
          from: findContactsSpotlightProvider,
          name: r'findContactsSpotlightProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findContactsSpotlightHash,
          dependencies: FindContactsSpotlightFamily._dependencies,
          allTransitiveDependencies:
              FindContactsSpotlightFamily._allTransitiveDependencies,
          query: query,
        );

  FindContactsSpotlightProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<SpotlightItem>> Function(FindContactsSpotlightRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindContactsSpotlightProvider._internal(
        (ref) => create(ref as FindContactsSpotlightRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SpotlightItem>> createElement() {
    return _FindContactsSpotlightProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindContactsSpotlightProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindContactsSpotlightRef
    on AutoDisposeFutureProviderRef<List<SpotlightItem>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FindContactsSpotlightProviderElement
    extends AutoDisposeFutureProviderElement<List<SpotlightItem>>
    with FindContactsSpotlightRef {
  _FindContactsSpotlightProviderElement(super.provider);

  @override
  String get query => (origin as FindContactsSpotlightProvider).query;
}

String _$watchContactUpdatesHash() =>
    r'453ab6c481ebba8cd80c4e5c59c3d90ba4105dfc';

/// See also [watchContactUpdates].
@ProviderFor(watchContactUpdates)
const watchContactUpdatesProvider = WatchContactUpdatesFamily();

/// See also [watchContactUpdates].
class WatchContactUpdatesFamily extends Family<AsyncValue<Contact>> {
  /// See also [watchContactUpdates].
  const WatchContactUpdatesFamily();

  /// See also [watchContactUpdates].
  WatchContactUpdatesProvider call({
    required int contactId,
  }) {
    return WatchContactUpdatesProvider(
      contactId: contactId,
    );
  }

  @override
  WatchContactUpdatesProvider getProviderOverride(
    covariant WatchContactUpdatesProvider provider,
  ) {
    return call(
      contactId: provider.contactId,
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
  String? get name => r'watchContactUpdatesProvider';
}

/// See also [watchContactUpdates].
class WatchContactUpdatesProvider extends AutoDisposeStreamProvider<Contact> {
  /// See also [watchContactUpdates].
  WatchContactUpdatesProvider({
    required int contactId,
  }) : this._internal(
          (ref) => watchContactUpdates(
            ref as WatchContactUpdatesRef,
            contactId: contactId,
          ),
          from: watchContactUpdatesProvider,
          name: r'watchContactUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchContactUpdatesHash,
          dependencies: WatchContactUpdatesFamily._dependencies,
          allTransitiveDependencies:
              WatchContactUpdatesFamily._allTransitiveDependencies,
          contactId: contactId,
        );

  WatchContactUpdatesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.contactId,
  }) : super.internal();

  final int contactId;

  @override
  Override overrideWith(
    Stream<Contact> Function(WatchContactUpdatesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchContactUpdatesProvider._internal(
        (ref) => create(ref as WatchContactUpdatesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        contactId: contactId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Contact> createElement() {
    return _WatchContactUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchContactUpdatesProvider && other.contactId == contactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchContactUpdatesRef on AutoDisposeStreamProviderRef<Contact> {
  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _WatchContactUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<Contact>
    with WatchContactUpdatesRef {
  _WatchContactUpdatesProviderElement(super.provider);

  @override
  int get contactId => (origin as WatchContactUpdatesProvider).contactId;
}

String _$fetchAndWatchContactHash() =>
    r'3134131658f0ef90cfda6165e355c8d95b1baa86';

abstract class _$FetchAndWatchContact
    extends BuildlessAutoDisposeAsyncNotifier<Contact> {
  late final int contactId;

  FutureOr<Contact> build(
    int contactId,
  );
}

/// See also [FetchAndWatchContact].
@ProviderFor(FetchAndWatchContact)
const fetchAndWatchContactProvider = FetchAndWatchContactFamily();

/// See also [FetchAndWatchContact].
class FetchAndWatchContactFamily extends Family<AsyncValue<Contact>> {
  /// See also [FetchAndWatchContact].
  const FetchAndWatchContactFamily();

  /// See also [FetchAndWatchContact].
  FetchAndWatchContactProvider call(
    int contactId,
  ) {
    return FetchAndWatchContactProvider(
      contactId,
    );
  }

  @override
  FetchAndWatchContactProvider getProviderOverride(
    covariant FetchAndWatchContactProvider provider,
  ) {
    return call(
      provider.contactId,
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
  String? get name => r'fetchAndWatchContactProvider';
}

/// See also [FetchAndWatchContact].
class FetchAndWatchContactProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FetchAndWatchContact, Contact> {
  /// See also [FetchAndWatchContact].
  FetchAndWatchContactProvider(
    int contactId,
  ) : this._internal(
          () => FetchAndWatchContact()..contactId = contactId,
          from: fetchAndWatchContactProvider,
          name: r'fetchAndWatchContactProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchContactHash,
          dependencies: FetchAndWatchContactFamily._dependencies,
          allTransitiveDependencies:
              FetchAndWatchContactFamily._allTransitiveDependencies,
          contactId: contactId,
        );

  FetchAndWatchContactProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.contactId,
  }) : super.internal();

  final int contactId;

  @override
  FutureOr<Contact> runNotifierBuild(
    covariant FetchAndWatchContact notifier,
  ) {
    return notifier.build(
      contactId,
    );
  }

  @override
  Override overrideWith(FetchAndWatchContact Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchAndWatchContactProvider._internal(
        () => create()..contactId = contactId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        contactId: contactId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FetchAndWatchContact, Contact>
      createElement() {
    return _FetchAndWatchContactProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAndWatchContactProvider &&
        other.contactId == contactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchAndWatchContactRef on AutoDisposeAsyncNotifierProviderRef<Contact> {
  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _FetchAndWatchContactProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FetchAndWatchContact,
        Contact> with FetchAndWatchContactRef {
  _FetchAndWatchContactProviderElement(super.provider);

  @override
  int get contactId => (origin as FetchAndWatchContactProvider).contactId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
