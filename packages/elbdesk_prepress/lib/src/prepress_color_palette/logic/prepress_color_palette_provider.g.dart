// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prepress_color_palette_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$prepressColorPaletteRepositoryHash() =>
    r'945f2dd4d242df49eb5e8baffaf540009ad8e7c7';

/// See also [prepressColorPaletteRepository].
@ProviderFor(prepressColorPaletteRepository)
final prepressColorPaletteRepositoryProvider =
    AutoDisposeProvider<PrepressColorPaletteRepository>.internal(
  prepressColorPaletteRepository,
  name: r'prepressColorPaletteRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$prepressColorPaletteRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PrepressColorPaletteRepositoryRef
    = AutoDisposeProviderRef<PrepressColorPaletteRepository>;
String _$findPrepressColorPalettesHash() =>
    r'23db94303fa05098e73457739ad2dd5703be6699';

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

/// See also [findPrepressColorPalettes].
@ProviderFor(findPrepressColorPalettes)
const findPrepressColorPalettesProvider = FindPrepressColorPalettesFamily();

/// See also [findPrepressColorPalettes].
class FindPrepressColorPalettesFamily
    extends Family<AsyncValue<List<PrepressColorPalette>>> {
  /// See also [findPrepressColorPalettes].
  const FindPrepressColorPalettesFamily();

  /// See also [findPrepressColorPalettes].
  FindPrepressColorPalettesProvider call(
    String sessionId,
  ) {
    return FindPrepressColorPalettesProvider(
      sessionId,
    );
  }

  @override
  FindPrepressColorPalettesProvider getProviderOverride(
    covariant FindPrepressColorPalettesProvider provider,
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
  String? get name => r'findPrepressColorPalettesProvider';
}

/// See also [findPrepressColorPalettes].
class FindPrepressColorPalettesProvider
    extends AutoDisposeFutureProvider<List<PrepressColorPalette>> {
  /// See also [findPrepressColorPalettes].
  FindPrepressColorPalettesProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findPrepressColorPalettes(
            ref as FindPrepressColorPalettesRef,
            sessionId,
          ),
          from: findPrepressColorPalettesProvider,
          name: r'findPrepressColorPalettesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findPrepressColorPalettesHash,
          dependencies: FindPrepressColorPalettesFamily._dependencies,
          allTransitiveDependencies:
              FindPrepressColorPalettesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindPrepressColorPalettesProvider._internal(
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
    FutureOr<List<PrepressColorPalette>> Function(
            FindPrepressColorPalettesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindPrepressColorPalettesProvider._internal(
        (ref) => create(ref as FindPrepressColorPalettesRef),
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
  AutoDisposeFutureProviderElement<List<PrepressColorPalette>> createElement() {
    return _FindPrepressColorPalettesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindPrepressColorPalettesProvider &&
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
mixin FindPrepressColorPalettesRef
    on AutoDisposeFutureProviderRef<List<PrepressColorPalette>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindPrepressColorPalettesProviderElement
    extends AutoDisposeFutureProviderElement<List<PrepressColorPalette>>
    with FindPrepressColorPalettesRef {
  _FindPrepressColorPalettesProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FindPrepressColorPalettesProvider).sessionId;
}

String _$fetchGlobalAndCustomerColorBooksHash() =>
    r'37c20d1942b45565ed842138f75df1ce9dabc92f';

/// See also [fetchGlobalAndCustomerColorBooks].
@ProviderFor(fetchGlobalAndCustomerColorBooks)
const fetchGlobalAndCustomerColorBooksProvider =
    FetchGlobalAndCustomerColorBooksFamily();

/// See also [fetchGlobalAndCustomerColorBooks].
class FetchGlobalAndCustomerColorBooksFamily
    extends Family<AsyncValue<List<PrepressColorPalette>>> {
  /// See also [fetchGlobalAndCustomerColorBooks].
  const FetchGlobalAndCustomerColorBooksFamily();

  /// See also [fetchGlobalAndCustomerColorBooks].
  FetchGlobalAndCustomerColorBooksProvider call(
    int customerId,
    String sessionId,
  ) {
    return FetchGlobalAndCustomerColorBooksProvider(
      customerId,
      sessionId,
    );
  }

  @override
  FetchGlobalAndCustomerColorBooksProvider getProviderOverride(
    covariant FetchGlobalAndCustomerColorBooksProvider provider,
  ) {
    return call(
      provider.customerId,
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
  String? get name => r'fetchGlobalAndCustomerColorBooksProvider';
}

/// See also [fetchGlobalAndCustomerColorBooks].
class FetchGlobalAndCustomerColorBooksProvider
    extends AutoDisposeFutureProvider<List<PrepressColorPalette>> {
  /// See also [fetchGlobalAndCustomerColorBooks].
  FetchGlobalAndCustomerColorBooksProvider(
    int customerId,
    String sessionId,
  ) : this._internal(
          (ref) => fetchGlobalAndCustomerColorBooks(
            ref as FetchGlobalAndCustomerColorBooksRef,
            customerId,
            sessionId,
          ),
          from: fetchGlobalAndCustomerColorBooksProvider,
          name: r'fetchGlobalAndCustomerColorBooksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchGlobalAndCustomerColorBooksHash,
          dependencies: FetchGlobalAndCustomerColorBooksFamily._dependencies,
          allTransitiveDependencies:
              FetchGlobalAndCustomerColorBooksFamily._allTransitiveDependencies,
          customerId: customerId,
          sessionId: sessionId,
        );

  FetchGlobalAndCustomerColorBooksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
    required this.sessionId,
  }) : super.internal();

  final int customerId;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<PrepressColorPalette>> Function(
            FetchGlobalAndCustomerColorBooksRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchGlobalAndCustomerColorBooksProvider._internal(
        (ref) => create(ref as FetchGlobalAndCustomerColorBooksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PrepressColorPalette>> createElement() {
    return _FetchGlobalAndCustomerColorBooksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchGlobalAndCustomerColorBooksProvider &&
        other.customerId == customerId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchGlobalAndCustomerColorBooksRef
    on AutoDisposeFutureProviderRef<List<PrepressColorPalette>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchGlobalAndCustomerColorBooksProviderElement
    extends AutoDisposeFutureProviderElement<List<PrepressColorPalette>>
    with FetchGlobalAndCustomerColorBooksRef {
  _FetchGlobalAndCustomerColorBooksProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as FetchGlobalAndCustomerColorBooksProvider).customerId;
  @override
  String get sessionId =>
      (origin as FetchGlobalAndCustomerColorBooksProvider).sessionId;
}

String _$watchPrepressColorPaletteHash() =>
    r'fe48b9892d073b5c760b5803b3b5612cebede260';

/// See also [watchPrepressColorPalette].
@ProviderFor(watchPrepressColorPalette)
const watchPrepressColorPaletteProvider = WatchPrepressColorPaletteFamily();

/// See also [watchPrepressColorPalette].
class WatchPrepressColorPaletteFamily
    extends Family<AsyncValue<PrepressColorPalette>> {
  /// See also [watchPrepressColorPalette].
  const WatchPrepressColorPaletteFamily();

  /// See also [watchPrepressColorPalette].
  WatchPrepressColorPaletteProvider call({
    required String sessionId,
    required int colorPaletteId,
  }) {
    return WatchPrepressColorPaletteProvider(
      sessionId: sessionId,
      colorPaletteId: colorPaletteId,
    );
  }

  @override
  WatchPrepressColorPaletteProvider getProviderOverride(
    covariant WatchPrepressColorPaletteProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      colorPaletteId: provider.colorPaletteId,
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
  String? get name => r'watchPrepressColorPaletteProvider';
}

/// See also [watchPrepressColorPalette].
class WatchPrepressColorPaletteProvider
    extends AutoDisposeStreamProvider<PrepressColorPalette> {
  /// See also [watchPrepressColorPalette].
  WatchPrepressColorPaletteProvider({
    required String sessionId,
    required int colorPaletteId,
  }) : this._internal(
          (ref) => watchPrepressColorPalette(
            ref as WatchPrepressColorPaletteRef,
            sessionId: sessionId,
            colorPaletteId: colorPaletteId,
          ),
          from: watchPrepressColorPaletteProvider,
          name: r'watchPrepressColorPaletteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchPrepressColorPaletteHash,
          dependencies: WatchPrepressColorPaletteFamily._dependencies,
          allTransitiveDependencies:
              WatchPrepressColorPaletteFamily._allTransitiveDependencies,
          sessionId: sessionId,
          colorPaletteId: colorPaletteId,
        );

  WatchPrepressColorPaletteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.colorPaletteId,
  }) : super.internal();

  final String sessionId;
  final int colorPaletteId;

  @override
  Override overrideWith(
    Stream<PrepressColorPalette> Function(WatchPrepressColorPaletteRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchPrepressColorPaletteProvider._internal(
        (ref) => create(ref as WatchPrepressColorPaletteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        colorPaletteId: colorPaletteId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<PrepressColorPalette> createElement() {
    return _WatchPrepressColorPaletteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchPrepressColorPaletteProvider &&
        other.sessionId == sessionId &&
        other.colorPaletteId == colorPaletteId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, colorPaletteId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchPrepressColorPaletteRef
    on AutoDisposeStreamProviderRef<PrepressColorPalette> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `colorPaletteId` of this provider.
  int get colorPaletteId;
}

class _WatchPrepressColorPaletteProviderElement
    extends AutoDisposeStreamProviderElement<PrepressColorPalette>
    with WatchPrepressColorPaletteRef {
  _WatchPrepressColorPaletteProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchPrepressColorPaletteProvider).sessionId;
  @override
  int get colorPaletteId =>
      (origin as WatchPrepressColorPaletteProvider).colorPaletteId;
}

String _$watchColorPaletteColorsHash() =>
    r'028b2ce2fa8a654749bdd31fbd40dea1f0ab55bb';

/// See also [watchColorPaletteColors].
@ProviderFor(watchColorPaletteColors)
const watchColorPaletteColorsProvider = WatchColorPaletteColorsFamily();

/// See also [watchColorPaletteColors].
class WatchColorPaletteColorsFamily
    extends Family<AsyncValue<List<ArtworkColor>>> {
  /// See also [watchColorPaletteColors].
  const WatchColorPaletteColorsFamily();

  /// See also [watchColorPaletteColors].
  WatchColorPaletteColorsProvider call({
    required String sessionId,
    required int colorPaletteId,
  }) {
    return WatchColorPaletteColorsProvider(
      sessionId: sessionId,
      colorPaletteId: colorPaletteId,
    );
  }

  @override
  WatchColorPaletteColorsProvider getProviderOverride(
    covariant WatchColorPaletteColorsProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      colorPaletteId: provider.colorPaletteId,
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
  String? get name => r'watchColorPaletteColorsProvider';
}

/// See also [watchColorPaletteColors].
class WatchColorPaletteColorsProvider
    extends AutoDisposeStreamProvider<List<ArtworkColor>> {
  /// See also [watchColorPaletteColors].
  WatchColorPaletteColorsProvider({
    required String sessionId,
    required int colorPaletteId,
  }) : this._internal(
          (ref) => watchColorPaletteColors(
            ref as WatchColorPaletteColorsRef,
            sessionId: sessionId,
            colorPaletteId: colorPaletteId,
          ),
          from: watchColorPaletteColorsProvider,
          name: r'watchColorPaletteColorsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchColorPaletteColorsHash,
          dependencies: WatchColorPaletteColorsFamily._dependencies,
          allTransitiveDependencies:
              WatchColorPaletteColorsFamily._allTransitiveDependencies,
          sessionId: sessionId,
          colorPaletteId: colorPaletteId,
        );

  WatchColorPaletteColorsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.colorPaletteId,
  }) : super.internal();

  final String sessionId;
  final int colorPaletteId;

  @override
  Override overrideWith(
    Stream<List<ArtworkColor>> Function(WatchColorPaletteColorsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchColorPaletteColorsProvider._internal(
        (ref) => create(ref as WatchColorPaletteColorsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        colorPaletteId: colorPaletteId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<ArtworkColor>> createElement() {
    return _WatchColorPaletteColorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchColorPaletteColorsProvider &&
        other.sessionId == sessionId &&
        other.colorPaletteId == colorPaletteId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, colorPaletteId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchColorPaletteColorsRef
    on AutoDisposeStreamProviderRef<List<ArtworkColor>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `colorPaletteId` of this provider.
  int get colorPaletteId;
}

class _WatchColorPaletteColorsProviderElement
    extends AutoDisposeStreamProviderElement<List<ArtworkColor>>
    with WatchColorPaletteColorsRef {
  _WatchColorPaletteColorsProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchColorPaletteColorsProvider).sessionId;
  @override
  int get colorPaletteId =>
      (origin as WatchColorPaletteColorsProvider).colorPaletteId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
