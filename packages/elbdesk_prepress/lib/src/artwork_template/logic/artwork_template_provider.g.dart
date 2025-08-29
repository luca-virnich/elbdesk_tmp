// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_template_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkTemplateRepositoryHash() =>
    r'cdf820c5c5293bf098df9a0ede32c60fb1684b32';

/// See also [artworkTemplateRepository].
@ProviderFor(artworkTemplateRepository)
final artworkTemplateRepositoryProvider =
    AutoDisposeProvider<ArtworkTemplateRepository>.internal(
  artworkTemplateRepository,
  name: r'artworkTemplateRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$artworkTemplateRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArtworkTemplateRepositoryRef
    = AutoDisposeProviderRef<ArtworkTemplateRepository>;
String _$artworkTemplatePreSelectionRepositoryHash() =>
    r'df10451fc3e10159ae0a49257a14b1589799242d';

/// See also [artworkTemplatePreSelectionRepository].
@ProviderFor(artworkTemplatePreSelectionRepository)
final artworkTemplatePreSelectionRepositoryProvider =
    AutoDisposeProvider<ArtworkTemplatePreSelectionRepository>.internal(
  artworkTemplatePreSelectionRepository,
  name: r'artworkTemplatePreSelectionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$artworkTemplatePreSelectionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArtworkTemplatePreSelectionRepositoryRef
    = AutoDisposeProviderRef<ArtworkTemplatePreSelectionRepository>;
String _$artworkTemplateSelectionRepositoryHash() =>
    r'67037d09307e60547aab42e1cface7fc1eb216fb';

/// See also [artworkTemplateSelectionRepository].
@ProviderFor(artworkTemplateSelectionRepository)
final artworkTemplateSelectionRepositoryProvider =
    AutoDisposeProvider<ArtworkTemplateSelectionRepository>.internal(
  artworkTemplateSelectionRepository,
  name: r'artworkTemplateSelectionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$artworkTemplateSelectionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArtworkTemplateSelectionRepositoryRef
    = AutoDisposeProviderRef<ArtworkTemplateSelectionRepository>;
String _$findArtworkTemplatesHash() =>
    r'498e9581eb99683a0fcb2c32d18065a657c4f6a9';

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

/// See also [findArtworkTemplates].
@ProviderFor(findArtworkTemplates)
const findArtworkTemplatesProvider = FindArtworkTemplatesFamily();

/// See also [findArtworkTemplates].
class FindArtworkTemplatesFamily
    extends Family<AsyncValue<List<ArtworkTemplate>>> {
  /// See also [findArtworkTemplates].
  const FindArtworkTemplatesFamily();

  /// See also [findArtworkTemplates].
  FindArtworkTemplatesProvider call(
    String sessionId,
  ) {
    return FindArtworkTemplatesProvider(
      sessionId,
    );
  }

  @override
  FindArtworkTemplatesProvider getProviderOverride(
    covariant FindArtworkTemplatesProvider provider,
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
  String? get name => r'findArtworkTemplatesProvider';
}

/// See also [findArtworkTemplates].
class FindArtworkTemplatesProvider
    extends AutoDisposeFutureProvider<List<ArtworkTemplate>> {
  /// See also [findArtworkTemplates].
  FindArtworkTemplatesProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findArtworkTemplates(
            ref as FindArtworkTemplatesRef,
            sessionId,
          ),
          from: findArtworkTemplatesProvider,
          name: r'findArtworkTemplatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findArtworkTemplatesHash,
          dependencies: FindArtworkTemplatesFamily._dependencies,
          allTransitiveDependencies:
              FindArtworkTemplatesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindArtworkTemplatesProvider._internal(
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
    FutureOr<List<ArtworkTemplate>> Function(FindArtworkTemplatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindArtworkTemplatesProvider._internal(
        (ref) => create(ref as FindArtworkTemplatesRef),
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
  AutoDisposeFutureProviderElement<List<ArtworkTemplate>> createElement() {
    return _FindArtworkTemplatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindArtworkTemplatesProvider &&
        other.sessionId == sessionId;
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
mixin FindArtworkTemplatesRef
    on AutoDisposeFutureProviderRef<List<ArtworkTemplate>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindArtworkTemplatesProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkTemplate>>
    with FindArtworkTemplatesRef {
  _FindArtworkTemplatesProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindArtworkTemplatesProvider).sessionId;
}

String _$findGeneralArtworkTemplatesHash() =>
    r'ee3d663540b2c33ab947d3a2c330bd249e78c5d3';

/// See also [findGeneralArtworkTemplates].
@ProviderFor(findGeneralArtworkTemplates)
const findGeneralArtworkTemplatesProvider = FindGeneralArtworkTemplatesFamily();

/// See also [findGeneralArtworkTemplates].
class FindGeneralArtworkTemplatesFamily
    extends Family<AsyncValue<List<ArtworkTemplate>>> {
  /// See also [findGeneralArtworkTemplates].
  const FindGeneralArtworkTemplatesFamily();

  /// See also [findGeneralArtworkTemplates].
  FindGeneralArtworkTemplatesProvider call(
    String sessionId,
  ) {
    return FindGeneralArtworkTemplatesProvider(
      sessionId,
    );
  }

  @override
  FindGeneralArtworkTemplatesProvider getProviderOverride(
    covariant FindGeneralArtworkTemplatesProvider provider,
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
  String? get name => r'findGeneralArtworkTemplatesProvider';
}

/// See also [findGeneralArtworkTemplates].
class FindGeneralArtworkTemplatesProvider
    extends AutoDisposeFutureProvider<List<ArtworkTemplate>> {
  /// See also [findGeneralArtworkTemplates].
  FindGeneralArtworkTemplatesProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findGeneralArtworkTemplates(
            ref as FindGeneralArtworkTemplatesRef,
            sessionId,
          ),
          from: findGeneralArtworkTemplatesProvider,
          name: r'findGeneralArtworkTemplatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findGeneralArtworkTemplatesHash,
          dependencies: FindGeneralArtworkTemplatesFamily._dependencies,
          allTransitiveDependencies:
              FindGeneralArtworkTemplatesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindGeneralArtworkTemplatesProvider._internal(
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
    FutureOr<List<ArtworkTemplate>> Function(
            FindGeneralArtworkTemplatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindGeneralArtworkTemplatesProvider._internal(
        (ref) => create(ref as FindGeneralArtworkTemplatesRef),
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
  AutoDisposeFutureProviderElement<List<ArtworkTemplate>> createElement() {
    return _FindGeneralArtworkTemplatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindGeneralArtworkTemplatesProvider &&
        other.sessionId == sessionId;
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
mixin FindGeneralArtworkTemplatesRef
    on AutoDisposeFutureProviderRef<List<ArtworkTemplate>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindGeneralArtworkTemplatesProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkTemplate>>
    with FindGeneralArtworkTemplatesRef {
  _FindGeneralArtworkTemplatesProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FindGeneralArtworkTemplatesProvider).sessionId;
}

String _$findArtworkTemplatesByCustomerHash() =>
    r'642d6eee6cd61d4caef91257f9c70144643f2176';

/// See also [findArtworkTemplatesByCustomer].
@ProviderFor(findArtworkTemplatesByCustomer)
const findArtworkTemplatesByCustomerProvider =
    FindArtworkTemplatesByCustomerFamily();

/// See also [findArtworkTemplatesByCustomer].
class FindArtworkTemplatesByCustomerFamily
    extends Family<AsyncValue<List<ArtworkTemplate>>> {
  /// See also [findArtworkTemplatesByCustomer].
  const FindArtworkTemplatesByCustomerFamily();

  /// See also [findArtworkTemplatesByCustomer].
  FindArtworkTemplatesByCustomerProvider call(
    int customerId,
    String sessionId, {
    bool includeGeneralTemplates = false,
  }) {
    return FindArtworkTemplatesByCustomerProvider(
      customerId,
      sessionId,
      includeGeneralTemplates: includeGeneralTemplates,
    );
  }

  @override
  FindArtworkTemplatesByCustomerProvider getProviderOverride(
    covariant FindArtworkTemplatesByCustomerProvider provider,
  ) {
    return call(
      provider.customerId,
      provider.sessionId,
      includeGeneralTemplates: provider.includeGeneralTemplates,
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
  String? get name => r'findArtworkTemplatesByCustomerProvider';
}

/// See also [findArtworkTemplatesByCustomer].
class FindArtworkTemplatesByCustomerProvider
    extends AutoDisposeFutureProvider<List<ArtworkTemplate>> {
  /// See also [findArtworkTemplatesByCustomer].
  FindArtworkTemplatesByCustomerProvider(
    int customerId,
    String sessionId, {
    bool includeGeneralTemplates = false,
  }) : this._internal(
          (ref) => findArtworkTemplatesByCustomer(
            ref as FindArtworkTemplatesByCustomerRef,
            customerId,
            sessionId,
            includeGeneralTemplates: includeGeneralTemplates,
          ),
          from: findArtworkTemplatesByCustomerProvider,
          name: r'findArtworkTemplatesByCustomerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findArtworkTemplatesByCustomerHash,
          dependencies: FindArtworkTemplatesByCustomerFamily._dependencies,
          allTransitiveDependencies:
              FindArtworkTemplatesByCustomerFamily._allTransitiveDependencies,
          customerId: customerId,
          sessionId: sessionId,
          includeGeneralTemplates: includeGeneralTemplates,
        );

  FindArtworkTemplatesByCustomerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
    required this.sessionId,
    required this.includeGeneralTemplates,
  }) : super.internal();

  final int customerId;
  final String sessionId;
  final bool includeGeneralTemplates;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkTemplate>> Function(
            FindArtworkTemplatesByCustomerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindArtworkTemplatesByCustomerProvider._internal(
        (ref) => create(ref as FindArtworkTemplatesByCustomerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
        sessionId: sessionId,
        includeGeneralTemplates: includeGeneralTemplates,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkTemplate>> createElement() {
    return _FindArtworkTemplatesByCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindArtworkTemplatesByCustomerProvider &&
        other.customerId == customerId &&
        other.sessionId == sessionId &&
        other.includeGeneralTemplates == includeGeneralTemplates;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, includeGeneralTemplates.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindArtworkTemplatesByCustomerRef
    on AutoDisposeFutureProviderRef<List<ArtworkTemplate>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `includeGeneralTemplates` of this provider.
  bool get includeGeneralTemplates;
}

class _FindArtworkTemplatesByCustomerProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkTemplate>>
    with FindArtworkTemplatesByCustomerRef {
  _FindArtworkTemplatesByCustomerProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as FindArtworkTemplatesByCustomerProvider).customerId;
  @override
  String get sessionId =>
      (origin as FindArtworkTemplatesByCustomerProvider).sessionId;
  @override
  bool get includeGeneralTemplates =>
      (origin as FindArtworkTemplatesByCustomerProvider)
          .includeGeneralTemplates;
}

String _$fetchArtworkTemplateSelectionsHash() =>
    r'49c6c58c0536aa1f238e79f24bd5946635ee7405';

/// See also [fetchArtworkTemplateSelections].
@ProviderFor(fetchArtworkTemplateSelections)
const fetchArtworkTemplateSelectionsProvider =
    FetchArtworkTemplateSelectionsFamily();

/// See also [fetchArtworkTemplateSelections].
class FetchArtworkTemplateSelectionsFamily
    extends Family<AsyncValue<List<ArtworkTemplateSelection>>> {
  /// See also [fetchArtworkTemplateSelections].
  const FetchArtworkTemplateSelectionsFamily();

  /// See also [fetchArtworkTemplateSelections].
  FetchArtworkTemplateSelectionsProvider call(
    int? preSelectionId,
  ) {
    return FetchArtworkTemplateSelectionsProvider(
      preSelectionId,
    );
  }

  @override
  FetchArtworkTemplateSelectionsProvider getProviderOverride(
    covariant FetchArtworkTemplateSelectionsProvider provider,
  ) {
    return call(
      provider.preSelectionId,
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
  String? get name => r'fetchArtworkTemplateSelectionsProvider';
}

/// See also [fetchArtworkTemplateSelections].
class FetchArtworkTemplateSelectionsProvider
    extends AutoDisposeFutureProvider<List<ArtworkTemplateSelection>> {
  /// See also [fetchArtworkTemplateSelections].
  FetchArtworkTemplateSelectionsProvider(
    int? preSelectionId,
  ) : this._internal(
          (ref) => fetchArtworkTemplateSelections(
            ref as FetchArtworkTemplateSelectionsRef,
            preSelectionId,
          ),
          from: fetchArtworkTemplateSelectionsProvider,
          name: r'fetchArtworkTemplateSelectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkTemplateSelectionsHash,
          dependencies: FetchArtworkTemplateSelectionsFamily._dependencies,
          allTransitiveDependencies:
              FetchArtworkTemplateSelectionsFamily._allTransitiveDependencies,
          preSelectionId: preSelectionId,
        );

  FetchArtworkTemplateSelectionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.preSelectionId,
  }) : super.internal();

  final int? preSelectionId;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkTemplateSelection>> Function(
            FetchArtworkTemplateSelectionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkTemplateSelectionsProvider._internal(
        (ref) => create(ref as FetchArtworkTemplateSelectionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        preSelectionId: preSelectionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkTemplateSelection>>
      createElement() {
    return _FetchArtworkTemplateSelectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkTemplateSelectionsProvider &&
        other.preSelectionId == preSelectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, preSelectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchArtworkTemplateSelectionsRef
    on AutoDisposeFutureProviderRef<List<ArtworkTemplateSelection>> {
  /// The parameter `preSelectionId` of this provider.
  int? get preSelectionId;
}

class _FetchArtworkTemplateSelectionsProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkTemplateSelection>>
    with FetchArtworkTemplateSelectionsRef {
  _FetchArtworkTemplateSelectionsProviderElement(super.provider);

  @override
  int? get preSelectionId =>
      (origin as FetchArtworkTemplateSelectionsProvider).preSelectionId;
}

String _$watchArtworkTemplatePreSelectionHash() =>
    r'95b744278ebe0df03bbf3361b069902a05687f43';

/// See also [watchArtworkTemplatePreSelection].
@ProviderFor(watchArtworkTemplatePreSelection)
const watchArtworkTemplatePreSelectionProvider =
    WatchArtworkTemplatePreSelectionFamily();

/// See also [watchArtworkTemplatePreSelection].
class WatchArtworkTemplatePreSelectionFamily
    extends Family<AsyncValue<ArtworkTemplatePreSelection>> {
  /// See also [watchArtworkTemplatePreSelection].
  const WatchArtworkTemplatePreSelectionFamily();

  /// See also [watchArtworkTemplatePreSelection].
  WatchArtworkTemplatePreSelectionProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchArtworkTemplatePreSelectionProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchArtworkTemplatePreSelectionProvider getProviderOverride(
    covariant WatchArtworkTemplatePreSelectionProvider provider,
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
  String? get name => r'watchArtworkTemplatePreSelectionProvider';
}

/// See also [watchArtworkTemplatePreSelection].
class WatchArtworkTemplatePreSelectionProvider
    extends AutoDisposeStreamProvider<ArtworkTemplatePreSelection> {
  /// See also [watchArtworkTemplatePreSelection].
  WatchArtworkTemplatePreSelectionProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchArtworkTemplatePreSelection(
            ref as WatchArtworkTemplatePreSelectionRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchArtworkTemplatePreSelectionProvider,
          name: r'watchArtworkTemplatePreSelectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkTemplatePreSelectionHash,
          dependencies: WatchArtworkTemplatePreSelectionFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkTemplatePreSelectionFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchArtworkTemplatePreSelectionProvider._internal(
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
    Stream<ArtworkTemplatePreSelection> Function(
            WatchArtworkTemplatePreSelectionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkTemplatePreSelectionProvider._internal(
        (ref) => create(ref as WatchArtworkTemplatePreSelectionRef),
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
  AutoDisposeStreamProviderElement<ArtworkTemplatePreSelection>
      createElement() {
    return _WatchArtworkTemplatePreSelectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkTemplatePreSelectionProvider &&
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
mixin WatchArtworkTemplatePreSelectionRef
    on AutoDisposeStreamProviderRef<ArtworkTemplatePreSelection> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchArtworkTemplatePreSelectionProviderElement
    extends AutoDisposeStreamProviderElement<ArtworkTemplatePreSelection>
    with WatchArtworkTemplatePreSelectionRef {
  _WatchArtworkTemplatePreSelectionProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchArtworkTemplatePreSelectionProvider).sessionId;
  @override
  int get id => (origin as WatchArtworkTemplatePreSelectionProvider).id;
}

String _$watchArtworkTemplateSelectionHash() =>
    r'f051b4d6c014f1e5e05993632e6c7d45bcd1570f';

/// See also [watchArtworkTemplateSelection].
@ProviderFor(watchArtworkTemplateSelection)
const watchArtworkTemplateSelectionProvider =
    WatchArtworkTemplateSelectionFamily();

/// See also [watchArtworkTemplateSelection].
class WatchArtworkTemplateSelectionFamily
    extends Family<AsyncValue<ArtworkTemplateSelection>> {
  /// See also [watchArtworkTemplateSelection].
  const WatchArtworkTemplateSelectionFamily();

  /// See also [watchArtworkTemplateSelection].
  WatchArtworkTemplateSelectionProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchArtworkTemplateSelectionProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchArtworkTemplateSelectionProvider getProviderOverride(
    covariant WatchArtworkTemplateSelectionProvider provider,
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
  String? get name => r'watchArtworkTemplateSelectionProvider';
}

/// See also [watchArtworkTemplateSelection].
class WatchArtworkTemplateSelectionProvider
    extends AutoDisposeStreamProvider<ArtworkTemplateSelection> {
  /// See also [watchArtworkTemplateSelection].
  WatchArtworkTemplateSelectionProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchArtworkTemplateSelection(
            ref as WatchArtworkTemplateSelectionRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchArtworkTemplateSelectionProvider,
          name: r'watchArtworkTemplateSelectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkTemplateSelectionHash,
          dependencies: WatchArtworkTemplateSelectionFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkTemplateSelectionFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchArtworkTemplateSelectionProvider._internal(
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
    Stream<ArtworkTemplateSelection> Function(
            WatchArtworkTemplateSelectionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkTemplateSelectionProvider._internal(
        (ref) => create(ref as WatchArtworkTemplateSelectionRef),
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
  AutoDisposeStreamProviderElement<ArtworkTemplateSelection> createElement() {
    return _WatchArtworkTemplateSelectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkTemplateSelectionProvider &&
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
mixin WatchArtworkTemplateSelectionRef
    on AutoDisposeStreamProviderRef<ArtworkTemplateSelection> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchArtworkTemplateSelectionProviderElement
    extends AutoDisposeStreamProviderElement<ArtworkTemplateSelection>
    with WatchArtworkTemplateSelectionRef {
  _WatchArtworkTemplateSelectionProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchArtworkTemplateSelectionProvider).sessionId;
  @override
  int get id => (origin as WatchArtworkTemplateSelectionProvider).id;
}

String _$watchArtworkTemplateHash() =>
    r'e484a48bfea06b668728a52747decfd74925db4e';

/// See also [watchArtworkTemplate].
@ProviderFor(watchArtworkTemplate)
const watchArtworkTemplateProvider = WatchArtworkTemplateFamily();

/// See also [watchArtworkTemplate].
class WatchArtworkTemplateFamily extends Family<AsyncValue<ArtworkTemplate>> {
  /// See also [watchArtworkTemplate].
  const WatchArtworkTemplateFamily();

  /// See also [watchArtworkTemplate].
  WatchArtworkTemplateProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchArtworkTemplateProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchArtworkTemplateProvider getProviderOverride(
    covariant WatchArtworkTemplateProvider provider,
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
  String? get name => r'watchArtworkTemplateProvider';
}

/// See also [watchArtworkTemplate].
class WatchArtworkTemplateProvider
    extends AutoDisposeStreamProvider<ArtworkTemplate> {
  /// See also [watchArtworkTemplate].
  WatchArtworkTemplateProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchArtworkTemplate(
            ref as WatchArtworkTemplateRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchArtworkTemplateProvider,
          name: r'watchArtworkTemplateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkTemplateHash,
          dependencies: WatchArtworkTemplateFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkTemplateFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchArtworkTemplateProvider._internal(
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
    Stream<ArtworkTemplate> Function(WatchArtworkTemplateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkTemplateProvider._internal(
        (ref) => create(ref as WatchArtworkTemplateRef),
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
  AutoDisposeStreamProviderElement<ArtworkTemplate> createElement() {
    return _WatchArtworkTemplateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkTemplateProvider &&
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
mixin WatchArtworkTemplateRef on AutoDisposeStreamProviderRef<ArtworkTemplate> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchArtworkTemplateProviderElement
    extends AutoDisposeStreamProviderElement<ArtworkTemplate>
    with WatchArtworkTemplateRef {
  _WatchArtworkTemplateProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchArtworkTemplateProvider).sessionId;
  @override
  int get id => (origin as WatchArtworkTemplateProvider).id;
}

String _$watchArtworkTemplateSelectionsHash() =>
    r'98a480741b16b88090da96004d9f9dbc5af19292';

/// See also [watchArtworkTemplateSelections].
@ProviderFor(watchArtworkTemplateSelections)
const watchArtworkTemplateSelectionsProvider =
    WatchArtworkTemplateSelectionsFamily();

/// See also [watchArtworkTemplateSelections].
class WatchArtworkTemplateSelectionsFamily
    extends Family<AsyncValue<ArtworkTemplateSelection>> {
  /// See also [watchArtworkTemplateSelections].
  const WatchArtworkTemplateSelectionsFamily();

  /// See also [watchArtworkTemplateSelections].
  WatchArtworkTemplateSelectionsProvider call({
    required int preSelectionId,
  }) {
    return WatchArtworkTemplateSelectionsProvider(
      preSelectionId: preSelectionId,
    );
  }

  @override
  WatchArtworkTemplateSelectionsProvider getProviderOverride(
    covariant WatchArtworkTemplateSelectionsProvider provider,
  ) {
    return call(
      preSelectionId: provider.preSelectionId,
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
  String? get name => r'watchArtworkTemplateSelectionsProvider';
}

/// See also [watchArtworkTemplateSelections].
class WatchArtworkTemplateSelectionsProvider
    extends AutoDisposeStreamProvider<ArtworkTemplateSelection> {
  /// See also [watchArtworkTemplateSelections].
  WatchArtworkTemplateSelectionsProvider({
    required int preSelectionId,
  }) : this._internal(
          (ref) => watchArtworkTemplateSelections(
            ref as WatchArtworkTemplateSelectionsRef,
            preSelectionId: preSelectionId,
          ),
          from: watchArtworkTemplateSelectionsProvider,
          name: r'watchArtworkTemplateSelectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkTemplateSelectionsHash,
          dependencies: WatchArtworkTemplateSelectionsFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkTemplateSelectionsFamily._allTransitiveDependencies,
          preSelectionId: preSelectionId,
        );

  WatchArtworkTemplateSelectionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.preSelectionId,
  }) : super.internal();

  final int preSelectionId;

  @override
  Override overrideWith(
    Stream<ArtworkTemplateSelection> Function(
            WatchArtworkTemplateSelectionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkTemplateSelectionsProvider._internal(
        (ref) => create(ref as WatchArtworkTemplateSelectionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        preSelectionId: preSelectionId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ArtworkTemplateSelection> createElement() {
    return _WatchArtworkTemplateSelectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkTemplateSelectionsProvider &&
        other.preSelectionId == preSelectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, preSelectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkTemplateSelectionsRef
    on AutoDisposeStreamProviderRef<ArtworkTemplateSelection> {
  /// The parameter `preSelectionId` of this provider.
  int get preSelectionId;
}

class _WatchArtworkTemplateSelectionsProviderElement
    extends AutoDisposeStreamProviderElement<ArtworkTemplateSelection>
    with WatchArtworkTemplateSelectionsRef {
  _WatchArtworkTemplateSelectionsProviderElement(super.provider);

  @override
  int get preSelectionId =>
      (origin as WatchArtworkTemplateSelectionsProvider).preSelectionId;
}

String _$watchArtworkTemplatePreSelectionsHash() =>
    r'3cfd98201baf3e9c621af9455740af12af5ebb58';

/// See also [watchArtworkTemplatePreSelections].
@ProviderFor(watchArtworkTemplatePreSelections)
const watchArtworkTemplatePreSelectionsProvider =
    WatchArtworkTemplatePreSelectionsFamily();

/// See also [watchArtworkTemplatePreSelections].
class WatchArtworkTemplatePreSelectionsFamily
    extends Family<AsyncValue<ArtworkTemplatePreSelection>> {
  /// See also [watchArtworkTemplatePreSelections].
  const WatchArtworkTemplatePreSelectionsFamily();

  /// See also [watchArtworkTemplatePreSelections].
  WatchArtworkTemplatePreSelectionsProvider call({
    required int? customerId,
  }) {
    return WatchArtworkTemplatePreSelectionsProvider(
      customerId: customerId,
    );
  }

  @override
  WatchArtworkTemplatePreSelectionsProvider getProviderOverride(
    covariant WatchArtworkTemplatePreSelectionsProvider provider,
  ) {
    return call(
      customerId: provider.customerId,
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
  String? get name => r'watchArtworkTemplatePreSelectionsProvider';
}

/// See also [watchArtworkTemplatePreSelections].
class WatchArtworkTemplatePreSelectionsProvider
    extends AutoDisposeStreamProvider<ArtworkTemplatePreSelection> {
  /// See also [watchArtworkTemplatePreSelections].
  WatchArtworkTemplatePreSelectionsProvider({
    required int? customerId,
  }) : this._internal(
          (ref) => watchArtworkTemplatePreSelections(
            ref as WatchArtworkTemplatePreSelectionsRef,
            customerId: customerId,
          ),
          from: watchArtworkTemplatePreSelectionsProvider,
          name: r'watchArtworkTemplatePreSelectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkTemplatePreSelectionsHash,
          dependencies: WatchArtworkTemplatePreSelectionsFamily._dependencies,
          allTransitiveDependencies: WatchArtworkTemplatePreSelectionsFamily
              ._allTransitiveDependencies,
          customerId: customerId,
        );

  WatchArtworkTemplatePreSelectionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
  }) : super.internal();

  final int? customerId;

  @override
  Override overrideWith(
    Stream<ArtworkTemplatePreSelection> Function(
            WatchArtworkTemplatePreSelectionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkTemplatePreSelectionsProvider._internal(
        (ref) => create(ref as WatchArtworkTemplatePreSelectionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ArtworkTemplatePreSelection>
      createElement() {
    return _WatchArtworkTemplatePreSelectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkTemplatePreSelectionsProvider &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkTemplatePreSelectionsRef
    on AutoDisposeStreamProviderRef<ArtworkTemplatePreSelection> {
  /// The parameter `customerId` of this provider.
  int? get customerId;
}

class _WatchArtworkTemplatePreSelectionsProviderElement
    extends AutoDisposeStreamProviderElement<ArtworkTemplatePreSelection>
    with WatchArtworkTemplatePreSelectionsRef {
  _WatchArtworkTemplatePreSelectionsProviderElement(super.provider);

  @override
  int? get customerId =>
      (origin as WatchArtworkTemplatePreSelectionsProvider).customerId;
}

String _$fetchAndWatchArtworkTemplatePreSelectionsHash() =>
    r'c9ea6b75a0b193f876e8a26724058623f3342309';

abstract class _$FetchAndWatchArtworkTemplatePreSelections
    extends BuildlessAutoDisposeAsyncNotifier<
        List<ArtworkTemplatePreSelection>> {
  late final int? customerId;

  FutureOr<List<ArtworkTemplatePreSelection>> build(
    int? customerId,
  );
}

/// See also [FetchAndWatchArtworkTemplatePreSelections].
@ProviderFor(FetchAndWatchArtworkTemplatePreSelections)
const fetchAndWatchArtworkTemplatePreSelectionsProvider =
    FetchAndWatchArtworkTemplatePreSelectionsFamily();

/// See also [FetchAndWatchArtworkTemplatePreSelections].
class FetchAndWatchArtworkTemplatePreSelectionsFamily
    extends Family<AsyncValue<List<ArtworkTemplatePreSelection>>> {
  /// See also [FetchAndWatchArtworkTemplatePreSelections].
  const FetchAndWatchArtworkTemplatePreSelectionsFamily();

  /// See also [FetchAndWatchArtworkTemplatePreSelections].
  FetchAndWatchArtworkTemplatePreSelectionsProvider call(
    int? customerId,
  ) {
    return FetchAndWatchArtworkTemplatePreSelectionsProvider(
      customerId,
    );
  }

  @override
  FetchAndWatchArtworkTemplatePreSelectionsProvider getProviderOverride(
    covariant FetchAndWatchArtworkTemplatePreSelectionsProvider provider,
  ) {
    return call(
      provider.customerId,
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
  String? get name => r'fetchAndWatchArtworkTemplatePreSelectionsProvider';
}

/// See also [FetchAndWatchArtworkTemplatePreSelections].
class FetchAndWatchArtworkTemplatePreSelectionsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        FetchAndWatchArtworkTemplatePreSelections,
        List<ArtworkTemplatePreSelection>> {
  /// See also [FetchAndWatchArtworkTemplatePreSelections].
  FetchAndWatchArtworkTemplatePreSelectionsProvider(
    int? customerId,
  ) : this._internal(
          () => FetchAndWatchArtworkTemplatePreSelections()
            ..customerId = customerId,
          from: fetchAndWatchArtworkTemplatePreSelectionsProvider,
          name: r'fetchAndWatchArtworkTemplatePreSelectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchArtworkTemplatePreSelectionsHash,
          dependencies:
              FetchAndWatchArtworkTemplatePreSelectionsFamily._dependencies,
          allTransitiveDependencies:
              FetchAndWatchArtworkTemplatePreSelectionsFamily
                  ._allTransitiveDependencies,
          customerId: customerId,
        );

  FetchAndWatchArtworkTemplatePreSelectionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
  }) : super.internal();

  final int? customerId;

  @override
  FutureOr<List<ArtworkTemplatePreSelection>> runNotifierBuild(
    covariant FetchAndWatchArtworkTemplatePreSelections notifier,
  ) {
    return notifier.build(
      customerId,
    );
  }

  @override
  Override overrideWith(
      FetchAndWatchArtworkTemplatePreSelections Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchAndWatchArtworkTemplatePreSelectionsProvider._internal(
        () => create()..customerId = customerId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
      FetchAndWatchArtworkTemplatePreSelections,
      List<ArtworkTemplatePreSelection>> createElement() {
    return _FetchAndWatchArtworkTemplatePreSelectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAndWatchArtworkTemplatePreSelectionsProvider &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchAndWatchArtworkTemplatePreSelectionsRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArtworkTemplatePreSelection>> {
  /// The parameter `customerId` of this provider.
  int? get customerId;
}

class _FetchAndWatchArtworkTemplatePreSelectionsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        FetchAndWatchArtworkTemplatePreSelections,
        List<ArtworkTemplatePreSelection>>
    with FetchAndWatchArtworkTemplatePreSelectionsRef {
  _FetchAndWatchArtworkTemplatePreSelectionsProviderElement(super.provider);

  @override
  int? get customerId =>
      (origin as FetchAndWatchArtworkTemplatePreSelectionsProvider).customerId;
}

String _$fetchAndWatchArtworkTemplateSelectionsHash() =>
    r'522b3dba7293af684dc355b07fff738cd69fb24b';

abstract class _$FetchAndWatchArtworkTemplateSelections
    extends BuildlessAutoDisposeAsyncNotifier<List<ArtworkTemplateSelection>> {
  late final int preSelectionId;

  FutureOr<List<ArtworkTemplateSelection>> build(
    int preSelectionId,
  );
}

/// See also [FetchAndWatchArtworkTemplateSelections].
@ProviderFor(FetchAndWatchArtworkTemplateSelections)
const fetchAndWatchArtworkTemplateSelectionsProvider =
    FetchAndWatchArtworkTemplateSelectionsFamily();

/// See also [FetchAndWatchArtworkTemplateSelections].
class FetchAndWatchArtworkTemplateSelectionsFamily
    extends Family<AsyncValue<List<ArtworkTemplateSelection>>> {
  /// See also [FetchAndWatchArtworkTemplateSelections].
  const FetchAndWatchArtworkTemplateSelectionsFamily();

  /// See also [FetchAndWatchArtworkTemplateSelections].
  FetchAndWatchArtworkTemplateSelectionsProvider call(
    int preSelectionId,
  ) {
    return FetchAndWatchArtworkTemplateSelectionsProvider(
      preSelectionId,
    );
  }

  @override
  FetchAndWatchArtworkTemplateSelectionsProvider getProviderOverride(
    covariant FetchAndWatchArtworkTemplateSelectionsProvider provider,
  ) {
    return call(
      provider.preSelectionId,
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
  String? get name => r'fetchAndWatchArtworkTemplateSelectionsProvider';
}

/// See also [FetchAndWatchArtworkTemplateSelections].
class FetchAndWatchArtworkTemplateSelectionsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        FetchAndWatchArtworkTemplateSelections,
        List<ArtworkTemplateSelection>> {
  /// See also [FetchAndWatchArtworkTemplateSelections].
  FetchAndWatchArtworkTemplateSelectionsProvider(
    int preSelectionId,
  ) : this._internal(
          () => FetchAndWatchArtworkTemplateSelections()
            ..preSelectionId = preSelectionId,
          from: fetchAndWatchArtworkTemplateSelectionsProvider,
          name: r'fetchAndWatchArtworkTemplateSelectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchArtworkTemplateSelectionsHash,
          dependencies:
              FetchAndWatchArtworkTemplateSelectionsFamily._dependencies,
          allTransitiveDependencies:
              FetchAndWatchArtworkTemplateSelectionsFamily
                  ._allTransitiveDependencies,
          preSelectionId: preSelectionId,
        );

  FetchAndWatchArtworkTemplateSelectionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.preSelectionId,
  }) : super.internal();

  final int preSelectionId;

  @override
  FutureOr<List<ArtworkTemplateSelection>> runNotifierBuild(
    covariant FetchAndWatchArtworkTemplateSelections notifier,
  ) {
    return notifier.build(
      preSelectionId,
    );
  }

  @override
  Override overrideWith(
      FetchAndWatchArtworkTemplateSelections Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchAndWatchArtworkTemplateSelectionsProvider._internal(
        () => create()..preSelectionId = preSelectionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        preSelectionId: preSelectionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
      FetchAndWatchArtworkTemplateSelections,
      List<ArtworkTemplateSelection>> createElement() {
    return _FetchAndWatchArtworkTemplateSelectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAndWatchArtworkTemplateSelectionsProvider &&
        other.preSelectionId == preSelectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, preSelectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchAndWatchArtworkTemplateSelectionsRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArtworkTemplateSelection>> {
  /// The parameter `preSelectionId` of this provider.
  int get preSelectionId;
}

class _FetchAndWatchArtworkTemplateSelectionsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        FetchAndWatchArtworkTemplateSelections, List<ArtworkTemplateSelection>>
    with FetchAndWatchArtworkTemplateSelectionsRef {
  _FetchAndWatchArtworkTemplateSelectionsProviderElement(super.provider);

  @override
  int get preSelectionId =>
      (origin as FetchAndWatchArtworkTemplateSelectionsProvider).preSelectionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
