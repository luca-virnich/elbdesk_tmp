// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drucklayout_selections_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$drucklayoutPreSelectionRepositoryHash() =>
    r'2fc950f77bce3048fbd7c53950a958845e44eab4';

/// All Providers used for the Drucklayout Selection and Pre Selection
/// Drucklayout Pre Selection Repository Provider
///
/// Copied from [drucklayoutPreSelectionRepository].
@ProviderFor(drucklayoutPreSelectionRepository)
final drucklayoutPreSelectionRepositoryProvider =
    AutoDisposeProvider<DrucklayoutPreSelectionRepository>.internal(
  drucklayoutPreSelectionRepository,
  name: r'drucklayoutPreSelectionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$drucklayoutPreSelectionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DrucklayoutPreSelectionRepositoryRef
    = AutoDisposeProviderRef<DrucklayoutPreSelectionRepository>;
String _$drucklayoutSelectionRepositoryHash() =>
    r'78177f45b794ae74a45520460cbbea4750bcc34a';

/// Drucklayout Selection Repository Provider
///
/// Copied from [drucklayoutSelectionRepository].
@ProviderFor(drucklayoutSelectionRepository)
final drucklayoutSelectionRepositoryProvider =
    AutoDisposeProvider<DrucklayoutSelectionRepository>.internal(
  drucklayoutSelectionRepository,
  name: r'drucklayoutSelectionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$drucklayoutSelectionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DrucklayoutSelectionRepositoryRef
    = AutoDisposeProviderRef<DrucklayoutSelectionRepository>;
String _$fetchDrucklayoutSelectionsHash() =>
    r'8277319e066002eefd5b722648d480603a6a8c1c';

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

/// Fetch Drucklayout Selections Provider
///
/// Copied from [fetchDrucklayoutSelections].
@ProviderFor(fetchDrucklayoutSelections)
const fetchDrucklayoutSelectionsProvider = FetchDrucklayoutSelectionsFamily();

/// Fetch Drucklayout Selections Provider
///
/// Copied from [fetchDrucklayoutSelections].
class FetchDrucklayoutSelectionsFamily
    extends Family<AsyncValue<List<DrucklayoutSelection>>> {
  /// Fetch Drucklayout Selections Provider
  ///
  /// Copied from [fetchDrucklayoutSelections].
  const FetchDrucklayoutSelectionsFamily();

  /// Fetch Drucklayout Selections Provider
  ///
  /// Copied from [fetchDrucklayoutSelections].
  FetchDrucklayoutSelectionsProvider call(
    int? preSelectionId,
  ) {
    return FetchDrucklayoutSelectionsProvider(
      preSelectionId,
    );
  }

  @override
  FetchDrucklayoutSelectionsProvider getProviderOverride(
    covariant FetchDrucklayoutSelectionsProvider provider,
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
  String? get name => r'fetchDrucklayoutSelectionsProvider';
}

/// Fetch Drucklayout Selections Provider
///
/// Copied from [fetchDrucklayoutSelections].
class FetchDrucklayoutSelectionsProvider
    extends AutoDisposeFutureProvider<List<DrucklayoutSelection>> {
  /// Fetch Drucklayout Selections Provider
  ///
  /// Copied from [fetchDrucklayoutSelections].
  FetchDrucklayoutSelectionsProvider(
    int? preSelectionId,
  ) : this._internal(
          (ref) => fetchDrucklayoutSelections(
            ref as FetchDrucklayoutSelectionsRef,
            preSelectionId,
          ),
          from: fetchDrucklayoutSelectionsProvider,
          name: r'fetchDrucklayoutSelectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchDrucklayoutSelectionsHash,
          dependencies: FetchDrucklayoutSelectionsFamily._dependencies,
          allTransitiveDependencies:
              FetchDrucklayoutSelectionsFamily._allTransitiveDependencies,
          preSelectionId: preSelectionId,
        );

  FetchDrucklayoutSelectionsProvider._internal(
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
    FutureOr<List<DrucklayoutSelection>> Function(
            FetchDrucklayoutSelectionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchDrucklayoutSelectionsProvider._internal(
        (ref) => create(ref as FetchDrucklayoutSelectionsRef),
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
  AutoDisposeFutureProviderElement<List<DrucklayoutSelection>> createElement() {
    return _FetchDrucklayoutSelectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchDrucklayoutSelectionsProvider &&
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
mixin FetchDrucklayoutSelectionsRef
    on AutoDisposeFutureProviderRef<List<DrucklayoutSelection>> {
  /// The parameter `preSelectionId` of this provider.
  int? get preSelectionId;
}

class _FetchDrucklayoutSelectionsProviderElement
    extends AutoDisposeFutureProviderElement<List<DrucklayoutSelection>>
    with FetchDrucklayoutSelectionsRef {
  _FetchDrucklayoutSelectionsProviderElement(super.provider);

  @override
  int? get preSelectionId =>
      (origin as FetchDrucklayoutSelectionsProvider).preSelectionId;
}

String _$watchDrucklayoutPreSelectionHash() =>
    r'832613b87aae67dc8274b5f569ea349ef6ce1313';

/// Watch Single Drucklayout Pre Selection Provider
///
/// Copied from [watchDrucklayoutPreSelection].
@ProviderFor(watchDrucklayoutPreSelection)
const watchDrucklayoutPreSelectionProvider =
    WatchDrucklayoutPreSelectionFamily();

/// Watch Single Drucklayout Pre Selection Provider
///
/// Copied from [watchDrucklayoutPreSelection].
class WatchDrucklayoutPreSelectionFamily
    extends Family<AsyncValue<DrucklayoutPreSelection>> {
  /// Watch Single Drucklayout Pre Selection Provider
  ///
  /// Copied from [watchDrucklayoutPreSelection].
  const WatchDrucklayoutPreSelectionFamily();

  /// Watch Single Drucklayout Pre Selection Provider
  ///
  /// Copied from [watchDrucklayoutPreSelection].
  WatchDrucklayoutPreSelectionProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchDrucklayoutPreSelectionProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchDrucklayoutPreSelectionProvider getProviderOverride(
    covariant WatchDrucklayoutPreSelectionProvider provider,
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
  String? get name => r'watchDrucklayoutPreSelectionProvider';
}

/// Watch Single Drucklayout Pre Selection Provider
///
/// Copied from [watchDrucklayoutPreSelection].
class WatchDrucklayoutPreSelectionProvider
    extends AutoDisposeStreamProvider<DrucklayoutPreSelection> {
  /// Watch Single Drucklayout Pre Selection Provider
  ///
  /// Copied from [watchDrucklayoutPreSelection].
  WatchDrucklayoutPreSelectionProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchDrucklayoutPreSelection(
            ref as WatchDrucklayoutPreSelectionRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchDrucklayoutPreSelectionProvider,
          name: r'watchDrucklayoutPreSelectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDrucklayoutPreSelectionHash,
          dependencies: WatchDrucklayoutPreSelectionFamily._dependencies,
          allTransitiveDependencies:
              WatchDrucklayoutPreSelectionFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchDrucklayoutPreSelectionProvider._internal(
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
    Stream<DrucklayoutPreSelection> Function(
            WatchDrucklayoutPreSelectionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchDrucklayoutPreSelectionProvider._internal(
        (ref) => create(ref as WatchDrucklayoutPreSelectionRef),
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
  AutoDisposeStreamProviderElement<DrucklayoutPreSelection> createElement() {
    return _WatchDrucklayoutPreSelectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDrucklayoutPreSelectionProvider &&
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
mixin WatchDrucklayoutPreSelectionRef
    on AutoDisposeStreamProviderRef<DrucklayoutPreSelection> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchDrucklayoutPreSelectionProviderElement
    extends AutoDisposeStreamProviderElement<DrucklayoutPreSelection>
    with WatchDrucklayoutPreSelectionRef {
  _WatchDrucklayoutPreSelectionProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchDrucklayoutPreSelectionProvider).sessionId;
  @override
  int get id => (origin as WatchDrucklayoutPreSelectionProvider).id;
}

String _$watchDrucklayoutSelectionHash() =>
    r'2084c32c5b05b6c3f5fb085f33b944897ef48c4c';

/// Watch Single Drucklayout Selection Provider
///
/// Copied from [watchDrucklayoutSelection].
@ProviderFor(watchDrucklayoutSelection)
const watchDrucklayoutSelectionProvider = WatchDrucklayoutSelectionFamily();

/// Watch Single Drucklayout Selection Provider
///
/// Copied from [watchDrucklayoutSelection].
class WatchDrucklayoutSelectionFamily
    extends Family<AsyncValue<DrucklayoutSelection>> {
  /// Watch Single Drucklayout Selection Provider
  ///
  /// Copied from [watchDrucklayoutSelection].
  const WatchDrucklayoutSelectionFamily();

  /// Watch Single Drucklayout Selection Provider
  ///
  /// Copied from [watchDrucklayoutSelection].
  WatchDrucklayoutSelectionProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchDrucklayoutSelectionProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchDrucklayoutSelectionProvider getProviderOverride(
    covariant WatchDrucklayoutSelectionProvider provider,
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
  String? get name => r'watchDrucklayoutSelectionProvider';
}

/// Watch Single Drucklayout Selection Provider
///
/// Copied from [watchDrucklayoutSelection].
class WatchDrucklayoutSelectionProvider
    extends AutoDisposeStreamProvider<DrucklayoutSelection> {
  /// Watch Single Drucklayout Selection Provider
  ///
  /// Copied from [watchDrucklayoutSelection].
  WatchDrucklayoutSelectionProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchDrucklayoutSelection(
            ref as WatchDrucklayoutSelectionRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchDrucklayoutSelectionProvider,
          name: r'watchDrucklayoutSelectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDrucklayoutSelectionHash,
          dependencies: WatchDrucklayoutSelectionFamily._dependencies,
          allTransitiveDependencies:
              WatchDrucklayoutSelectionFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchDrucklayoutSelectionProvider._internal(
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
    Stream<DrucklayoutSelection> Function(WatchDrucklayoutSelectionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchDrucklayoutSelectionProvider._internal(
        (ref) => create(ref as WatchDrucklayoutSelectionRef),
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
  AutoDisposeStreamProviderElement<DrucklayoutSelection> createElement() {
    return _WatchDrucklayoutSelectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDrucklayoutSelectionProvider &&
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
mixin WatchDrucklayoutSelectionRef
    on AutoDisposeStreamProviderRef<DrucklayoutSelection> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchDrucklayoutSelectionProviderElement
    extends AutoDisposeStreamProviderElement<DrucklayoutSelection>
    with WatchDrucklayoutSelectionRef {
  _WatchDrucklayoutSelectionProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchDrucklayoutSelectionProvider).sessionId;
  @override
  int get id => (origin as WatchDrucklayoutSelectionProvider).id;
}

String _$watchDrucklayoutSelectionsHash() =>
    r'd377e8841b52d28c5d1e504634625ca311977a14';

/// Watch Drucklayout Selections Provider
///
/// Copied from [watchDrucklayoutSelections].
@ProviderFor(watchDrucklayoutSelections)
const watchDrucklayoutSelectionsProvider = WatchDrucklayoutSelectionsFamily();

/// Watch Drucklayout Selections Provider
///
/// Copied from [watchDrucklayoutSelections].
class WatchDrucklayoutSelectionsFamily
    extends Family<AsyncValue<DrucklayoutSelection>> {
  /// Watch Drucklayout Selections Provider
  ///
  /// Copied from [watchDrucklayoutSelections].
  const WatchDrucklayoutSelectionsFamily();

  /// Watch Drucklayout Selections Provider
  ///
  /// Copied from [watchDrucklayoutSelections].
  WatchDrucklayoutSelectionsProvider call({
    required int preSelectionId,
  }) {
    return WatchDrucklayoutSelectionsProvider(
      preSelectionId: preSelectionId,
    );
  }

  @override
  WatchDrucklayoutSelectionsProvider getProviderOverride(
    covariant WatchDrucklayoutSelectionsProvider provider,
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
  String? get name => r'watchDrucklayoutSelectionsProvider';
}

/// Watch Drucklayout Selections Provider
///
/// Copied from [watchDrucklayoutSelections].
class WatchDrucklayoutSelectionsProvider
    extends AutoDisposeStreamProvider<DrucklayoutSelection> {
  /// Watch Drucklayout Selections Provider
  ///
  /// Copied from [watchDrucklayoutSelections].
  WatchDrucklayoutSelectionsProvider({
    required int preSelectionId,
  }) : this._internal(
          (ref) => watchDrucklayoutSelections(
            ref as WatchDrucklayoutSelectionsRef,
            preSelectionId: preSelectionId,
          ),
          from: watchDrucklayoutSelectionsProvider,
          name: r'watchDrucklayoutSelectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDrucklayoutSelectionsHash,
          dependencies: WatchDrucklayoutSelectionsFamily._dependencies,
          allTransitiveDependencies:
              WatchDrucklayoutSelectionsFamily._allTransitiveDependencies,
          preSelectionId: preSelectionId,
        );

  WatchDrucklayoutSelectionsProvider._internal(
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
    Stream<DrucklayoutSelection> Function(
            WatchDrucklayoutSelectionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchDrucklayoutSelectionsProvider._internal(
        (ref) => create(ref as WatchDrucklayoutSelectionsRef),
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
  AutoDisposeStreamProviderElement<DrucklayoutSelection> createElement() {
    return _WatchDrucklayoutSelectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDrucklayoutSelectionsProvider &&
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
mixin WatchDrucklayoutSelectionsRef
    on AutoDisposeStreamProviderRef<DrucklayoutSelection> {
  /// The parameter `preSelectionId` of this provider.
  int get preSelectionId;
}

class _WatchDrucklayoutSelectionsProviderElement
    extends AutoDisposeStreamProviderElement<DrucklayoutSelection>
    with WatchDrucklayoutSelectionsRef {
  _WatchDrucklayoutSelectionsProviderElement(super.provider);

  @override
  int get preSelectionId =>
      (origin as WatchDrucklayoutSelectionsProvider).preSelectionId;
}

String _$watchDrucklayoutPreSelectionsHash() =>
    r'd651dc01cd18b9ad3270f4599e05699c7c3b0440';

/// Watch Drucklayout Pre Selections Provider
///
/// Copied from [watchDrucklayoutPreSelections].
@ProviderFor(watchDrucklayoutPreSelections)
const watchDrucklayoutPreSelectionsProvider =
    WatchDrucklayoutPreSelectionsFamily();

/// Watch Drucklayout Pre Selections Provider
///
/// Copied from [watchDrucklayoutPreSelections].
class WatchDrucklayoutPreSelectionsFamily
    extends Family<AsyncValue<DrucklayoutPreSelection>> {
  /// Watch Drucklayout Pre Selections Provider
  ///
  /// Copied from [watchDrucklayoutPreSelections].
  const WatchDrucklayoutPreSelectionsFamily();

  /// Watch Drucklayout Pre Selections Provider
  ///
  /// Copied from [watchDrucklayoutPreSelections].
  WatchDrucklayoutPreSelectionsProvider call({
    required int? customerId,
  }) {
    return WatchDrucklayoutPreSelectionsProvider(
      customerId: customerId,
    );
  }

  @override
  WatchDrucklayoutPreSelectionsProvider getProviderOverride(
    covariant WatchDrucklayoutPreSelectionsProvider provider,
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
  String? get name => r'watchDrucklayoutPreSelectionsProvider';
}

/// Watch Drucklayout Pre Selections Provider
///
/// Copied from [watchDrucklayoutPreSelections].
class WatchDrucklayoutPreSelectionsProvider
    extends AutoDisposeStreamProvider<DrucklayoutPreSelection> {
  /// Watch Drucklayout Pre Selections Provider
  ///
  /// Copied from [watchDrucklayoutPreSelections].
  WatchDrucklayoutPreSelectionsProvider({
    required int? customerId,
  }) : this._internal(
          (ref) => watchDrucklayoutPreSelections(
            ref as WatchDrucklayoutPreSelectionsRef,
            customerId: customerId,
          ),
          from: watchDrucklayoutPreSelectionsProvider,
          name: r'watchDrucklayoutPreSelectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDrucklayoutPreSelectionsHash,
          dependencies: WatchDrucklayoutPreSelectionsFamily._dependencies,
          allTransitiveDependencies:
              WatchDrucklayoutPreSelectionsFamily._allTransitiveDependencies,
          customerId: customerId,
        );

  WatchDrucklayoutPreSelectionsProvider._internal(
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
    Stream<DrucklayoutPreSelection> Function(
            WatchDrucklayoutPreSelectionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchDrucklayoutPreSelectionsProvider._internal(
        (ref) => create(ref as WatchDrucklayoutPreSelectionsRef),
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
  AutoDisposeStreamProviderElement<DrucklayoutPreSelection> createElement() {
    return _WatchDrucklayoutPreSelectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDrucklayoutPreSelectionsProvider &&
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
mixin WatchDrucklayoutPreSelectionsRef
    on AutoDisposeStreamProviderRef<DrucklayoutPreSelection> {
  /// The parameter `customerId` of this provider.
  int? get customerId;
}

class _WatchDrucklayoutPreSelectionsProviderElement
    extends AutoDisposeStreamProviderElement<DrucklayoutPreSelection>
    with WatchDrucklayoutPreSelectionsRef {
  _WatchDrucklayoutPreSelectionsProviderElement(super.provider);

  @override
  int? get customerId =>
      (origin as WatchDrucklayoutPreSelectionsProvider).customerId;
}

String _$fetchAndWatchDrucklayoutPreSelectionsHash() =>
    r'2826ae2fff27cbc3d53dbdc46efc731759c5a930';

abstract class _$FetchAndWatchDrucklayoutPreSelections
    extends BuildlessAutoDisposeAsyncNotifier<List<DrucklayoutPreSelection>> {
  late final int? customerId;

  FutureOr<List<DrucklayoutPreSelection>> build(
    int? customerId,
  );
}

/// Fetch and Watch Drucklayout Pre Selections State Provider
///
/// Copied from [FetchAndWatchDrucklayoutPreSelections].
@ProviderFor(FetchAndWatchDrucklayoutPreSelections)
const fetchAndWatchDrucklayoutPreSelectionsProvider =
    FetchAndWatchDrucklayoutPreSelectionsFamily();

/// Fetch and Watch Drucklayout Pre Selections State Provider
///
/// Copied from [FetchAndWatchDrucklayoutPreSelections].
class FetchAndWatchDrucklayoutPreSelectionsFamily
    extends Family<AsyncValue<List<DrucklayoutPreSelection>>> {
  /// Fetch and Watch Drucklayout Pre Selections State Provider
  ///
  /// Copied from [FetchAndWatchDrucklayoutPreSelections].
  const FetchAndWatchDrucklayoutPreSelectionsFamily();

  /// Fetch and Watch Drucklayout Pre Selections State Provider
  ///
  /// Copied from [FetchAndWatchDrucklayoutPreSelections].
  FetchAndWatchDrucklayoutPreSelectionsProvider call(
    int? customerId,
  ) {
    return FetchAndWatchDrucklayoutPreSelectionsProvider(
      customerId,
    );
  }

  @override
  FetchAndWatchDrucklayoutPreSelectionsProvider getProviderOverride(
    covariant FetchAndWatchDrucklayoutPreSelectionsProvider provider,
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
  String? get name => r'fetchAndWatchDrucklayoutPreSelectionsProvider';
}

/// Fetch and Watch Drucklayout Pre Selections State Provider
///
/// Copied from [FetchAndWatchDrucklayoutPreSelections].
class FetchAndWatchDrucklayoutPreSelectionsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        FetchAndWatchDrucklayoutPreSelections, List<DrucklayoutPreSelection>> {
  /// Fetch and Watch Drucklayout Pre Selections State Provider
  ///
  /// Copied from [FetchAndWatchDrucklayoutPreSelections].
  FetchAndWatchDrucklayoutPreSelectionsProvider(
    int? customerId,
  ) : this._internal(
          () =>
              FetchAndWatchDrucklayoutPreSelections()..customerId = customerId,
          from: fetchAndWatchDrucklayoutPreSelectionsProvider,
          name: r'fetchAndWatchDrucklayoutPreSelectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchDrucklayoutPreSelectionsHash,
          dependencies:
              FetchAndWatchDrucklayoutPreSelectionsFamily._dependencies,
          allTransitiveDependencies: FetchAndWatchDrucklayoutPreSelectionsFamily
              ._allTransitiveDependencies,
          customerId: customerId,
        );

  FetchAndWatchDrucklayoutPreSelectionsProvider._internal(
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
  FutureOr<List<DrucklayoutPreSelection>> runNotifierBuild(
    covariant FetchAndWatchDrucklayoutPreSelections notifier,
  ) {
    return notifier.build(
      customerId,
    );
  }

  @override
  Override overrideWith(
      FetchAndWatchDrucklayoutPreSelections Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchAndWatchDrucklayoutPreSelectionsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FetchAndWatchDrucklayoutPreSelections,
      List<DrucklayoutPreSelection>> createElement() {
    return _FetchAndWatchDrucklayoutPreSelectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAndWatchDrucklayoutPreSelectionsProvider &&
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
mixin FetchAndWatchDrucklayoutPreSelectionsRef
    on AutoDisposeAsyncNotifierProviderRef<List<DrucklayoutPreSelection>> {
  /// The parameter `customerId` of this provider.
  int? get customerId;
}

class _FetchAndWatchDrucklayoutPreSelectionsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        FetchAndWatchDrucklayoutPreSelections, List<DrucklayoutPreSelection>>
    with FetchAndWatchDrucklayoutPreSelectionsRef {
  _FetchAndWatchDrucklayoutPreSelectionsProviderElement(super.provider);

  @override
  int? get customerId =>
      (origin as FetchAndWatchDrucklayoutPreSelectionsProvider).customerId;
}

String _$fetchAndWatchDrucklayoutSelectionsHash() =>
    r'0282229731528abcf7c2ce7bdf54f9c79e96859d';

abstract class _$FetchAndWatchDrucklayoutSelections
    extends BuildlessAutoDisposeAsyncNotifier<List<DrucklayoutSelection>> {
  late final int preSelectionId;

  FutureOr<List<DrucklayoutSelection>> build(
    int preSelectionId,
  );
}

/// Fetch and Watch Drucklayout Selections State Provider
///
/// Copied from [FetchAndWatchDrucklayoutSelections].
@ProviderFor(FetchAndWatchDrucklayoutSelections)
const fetchAndWatchDrucklayoutSelectionsProvider =
    FetchAndWatchDrucklayoutSelectionsFamily();

/// Fetch and Watch Drucklayout Selections State Provider
///
/// Copied from [FetchAndWatchDrucklayoutSelections].
class FetchAndWatchDrucklayoutSelectionsFamily
    extends Family<AsyncValue<List<DrucklayoutSelection>>> {
  /// Fetch and Watch Drucklayout Selections State Provider
  ///
  /// Copied from [FetchAndWatchDrucklayoutSelections].
  const FetchAndWatchDrucklayoutSelectionsFamily();

  /// Fetch and Watch Drucklayout Selections State Provider
  ///
  /// Copied from [FetchAndWatchDrucklayoutSelections].
  FetchAndWatchDrucklayoutSelectionsProvider call(
    int preSelectionId,
  ) {
    return FetchAndWatchDrucklayoutSelectionsProvider(
      preSelectionId,
    );
  }

  @override
  FetchAndWatchDrucklayoutSelectionsProvider getProviderOverride(
    covariant FetchAndWatchDrucklayoutSelectionsProvider provider,
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
  String? get name => r'fetchAndWatchDrucklayoutSelectionsProvider';
}

/// Fetch and Watch Drucklayout Selections State Provider
///
/// Copied from [FetchAndWatchDrucklayoutSelections].
class FetchAndWatchDrucklayoutSelectionsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        FetchAndWatchDrucklayoutSelections, List<DrucklayoutSelection>> {
  /// Fetch and Watch Drucklayout Selections State Provider
  ///
  /// Copied from [FetchAndWatchDrucklayoutSelections].
  FetchAndWatchDrucklayoutSelectionsProvider(
    int preSelectionId,
  ) : this._internal(
          () => FetchAndWatchDrucklayoutSelections()
            ..preSelectionId = preSelectionId,
          from: fetchAndWatchDrucklayoutSelectionsProvider,
          name: r'fetchAndWatchDrucklayoutSelectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchDrucklayoutSelectionsHash,
          dependencies: FetchAndWatchDrucklayoutSelectionsFamily._dependencies,
          allTransitiveDependencies: FetchAndWatchDrucklayoutSelectionsFamily
              ._allTransitiveDependencies,
          preSelectionId: preSelectionId,
        );

  FetchAndWatchDrucklayoutSelectionsProvider._internal(
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
  FutureOr<List<DrucklayoutSelection>> runNotifierBuild(
    covariant FetchAndWatchDrucklayoutSelections notifier,
  ) {
    return notifier.build(
      preSelectionId,
    );
  }

  @override
  Override overrideWith(FetchAndWatchDrucklayoutSelections Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchAndWatchDrucklayoutSelectionsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FetchAndWatchDrucklayoutSelections,
      List<DrucklayoutSelection>> createElement() {
    return _FetchAndWatchDrucklayoutSelectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAndWatchDrucklayoutSelectionsProvider &&
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
mixin FetchAndWatchDrucklayoutSelectionsRef
    on AutoDisposeAsyncNotifierProviderRef<List<DrucklayoutSelection>> {
  /// The parameter `preSelectionId` of this provider.
  int get preSelectionId;
}

class _FetchAndWatchDrucklayoutSelectionsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        FetchAndWatchDrucklayoutSelections,
        List<DrucklayoutSelection>> with FetchAndWatchDrucklayoutSelectionsRef {
  _FetchAndWatchDrucklayoutSelectionsProviderElement(super.provider);

  @override
  int get preSelectionId =>
      (origin as FetchAndWatchDrucklayoutSelectionsProvider).preSelectionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
