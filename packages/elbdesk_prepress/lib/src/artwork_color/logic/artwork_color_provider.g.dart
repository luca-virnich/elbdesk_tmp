// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_color_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkColorRepositoryHash() =>
    r'd4b113d2e974801b7e5b86dda254e9e2e9fa1f99';

/// See also [artworkColorRepository].
@ProviderFor(artworkColorRepository)
final artworkColorRepositoryProvider =
    AutoDisposeProvider<ArtworkColorRepository>.internal(
  artworkColorRepository,
  name: r'artworkColorRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$artworkColorRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArtworkColorRepositoryRef
    = AutoDisposeProviderRef<ArtworkColorRepository>;
String _$findArtworkColorsHash() => r'9bccb25fb95ed99da3e4cc8accf3a8a4a6b5904e';

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

/// See also [findArtworkColors].
@ProviderFor(findArtworkColors)
const findArtworkColorsProvider = FindArtworkColorsFamily();

/// See also [findArtworkColors].
class FindArtworkColorsFamily extends Family<AsyncValue<List<ArtworkColor>>> {
  /// See also [findArtworkColors].
  const FindArtworkColorsFamily();

  /// See also [findArtworkColors].
  FindArtworkColorsProvider call(
    String sessionId,
  ) {
    return FindArtworkColorsProvider(
      sessionId,
    );
  }

  @override
  FindArtworkColorsProvider getProviderOverride(
    covariant FindArtworkColorsProvider provider,
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
  String? get name => r'findArtworkColorsProvider';
}

/// See also [findArtworkColors].
class FindArtworkColorsProvider
    extends AutoDisposeFutureProvider<List<ArtworkColor>> {
  /// See also [findArtworkColors].
  FindArtworkColorsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findArtworkColors(
            ref as FindArtworkColorsRef,
            sessionId,
          ),
          from: findArtworkColorsProvider,
          name: r'findArtworkColorsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findArtworkColorsHash,
          dependencies: FindArtworkColorsFamily._dependencies,
          allTransitiveDependencies:
              FindArtworkColorsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindArtworkColorsProvider._internal(
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
    FutureOr<List<ArtworkColor>> Function(FindArtworkColorsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindArtworkColorsProvider._internal(
        (ref) => create(ref as FindArtworkColorsRef),
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
  AutoDisposeFutureProviderElement<List<ArtworkColor>> createElement() {
    return _FindArtworkColorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindArtworkColorsProvider && other.sessionId == sessionId;
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
mixin FindArtworkColorsRef on AutoDisposeFutureProviderRef<List<ArtworkColor>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindArtworkColorsProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkColor>>
    with FindArtworkColorsRef {
  _FindArtworkColorsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindArtworkColorsProvider).sessionId;
}

String _$findArtworkColorsByCustomerIdHash() =>
    r'8549ac36b3b5595662b3b432c7ee16ba77da61b6';

/// See also [findArtworkColorsByCustomerId].
@ProviderFor(findArtworkColorsByCustomerId)
const findArtworkColorsByCustomerIdProvider =
    FindArtworkColorsByCustomerIdFamily();

/// See also [findArtworkColorsByCustomerId].
class FindArtworkColorsByCustomerIdFamily
    extends Family<AsyncValue<List<ArtworkColor>>> {
  /// See also [findArtworkColorsByCustomerId].
  const FindArtworkColorsByCustomerIdFamily();

  /// See also [findArtworkColorsByCustomerId].
  FindArtworkColorsByCustomerIdProvider call(
    String sessionId,
    int customerId,
  ) {
    return FindArtworkColorsByCustomerIdProvider(
      sessionId,
      customerId,
    );
  }

  @override
  FindArtworkColorsByCustomerIdProvider getProviderOverride(
    covariant FindArtworkColorsByCustomerIdProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'findArtworkColorsByCustomerIdProvider';
}

/// See also [findArtworkColorsByCustomerId].
class FindArtworkColorsByCustomerIdProvider
    extends AutoDisposeFutureProvider<List<ArtworkColor>> {
  /// See also [findArtworkColorsByCustomerId].
  FindArtworkColorsByCustomerIdProvider(
    String sessionId,
    int customerId,
  ) : this._internal(
          (ref) => findArtworkColorsByCustomerId(
            ref as FindArtworkColorsByCustomerIdRef,
            sessionId,
            customerId,
          ),
          from: findArtworkColorsByCustomerIdProvider,
          name: r'findArtworkColorsByCustomerIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findArtworkColorsByCustomerIdHash,
          dependencies: FindArtworkColorsByCustomerIdFamily._dependencies,
          allTransitiveDependencies:
              FindArtworkColorsByCustomerIdFamily._allTransitiveDependencies,
          sessionId: sessionId,
          customerId: customerId,
        );

  FindArtworkColorsByCustomerIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.customerId,
  }) : super.internal();

  final String sessionId;
  final int customerId;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkColor>> Function(
            FindArtworkColorsByCustomerIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindArtworkColorsByCustomerIdProvider._internal(
        (ref) => create(ref as FindArtworkColorsByCustomerIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkColor>> createElement() {
    return _FindArtworkColorsByCustomerIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindArtworkColorsByCustomerIdProvider &&
        other.sessionId == sessionId &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindArtworkColorsByCustomerIdRef
    on AutoDisposeFutureProviderRef<List<ArtworkColor>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _FindArtworkColorsByCustomerIdProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkColor>>
    with FindArtworkColorsByCustomerIdRef {
  _FindArtworkColorsByCustomerIdProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FindArtworkColorsByCustomerIdProvider).sessionId;
  @override
  int get customerId =>
      (origin as FindArtworkColorsByCustomerIdProvider).customerId;
}

String _$findArtworkColorsByColorBookIdHash() =>
    r'eec9985e822680cc56c4c5898e70b4e511f79d8d';

/// Find Colors by Color Book id
///
/// Copied from [findArtworkColorsByColorBookId].
@ProviderFor(findArtworkColorsByColorBookId)
const findArtworkColorsByColorBookIdProvider =
    FindArtworkColorsByColorBookIdFamily();

/// Find Colors by Color Book id
///
/// Copied from [findArtworkColorsByColorBookId].
class FindArtworkColorsByColorBookIdFamily
    extends Family<AsyncValue<List<ArtworkColor>>> {
  /// Find Colors by Color Book id
  ///
  /// Copied from [findArtworkColorsByColorBookId].
  const FindArtworkColorsByColorBookIdFamily();

  /// Find Colors by Color Book id
  ///
  /// Copied from [findArtworkColorsByColorBookId].
  FindArtworkColorsByColorBookIdProvider call(
    String sessionId,
    int? colorPaletteId,
  ) {
    return FindArtworkColorsByColorBookIdProvider(
      sessionId,
      colorPaletteId,
    );
  }

  @override
  FindArtworkColorsByColorBookIdProvider getProviderOverride(
    covariant FindArtworkColorsByColorBookIdProvider provider,
  ) {
    return call(
      provider.sessionId,
      provider.colorPaletteId,
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
  String? get name => r'findArtworkColorsByColorBookIdProvider';
}

/// Find Colors by Color Book id
///
/// Copied from [findArtworkColorsByColorBookId].
class FindArtworkColorsByColorBookIdProvider
    extends AutoDisposeFutureProvider<List<ArtworkColor>> {
  /// Find Colors by Color Book id
  ///
  /// Copied from [findArtworkColorsByColorBookId].
  FindArtworkColorsByColorBookIdProvider(
    String sessionId,
    int? colorPaletteId,
  ) : this._internal(
          (ref) => findArtworkColorsByColorBookId(
            ref as FindArtworkColorsByColorBookIdRef,
            sessionId,
            colorPaletteId,
          ),
          from: findArtworkColorsByColorBookIdProvider,
          name: r'findArtworkColorsByColorBookIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findArtworkColorsByColorBookIdHash,
          dependencies: FindArtworkColorsByColorBookIdFamily._dependencies,
          allTransitiveDependencies:
              FindArtworkColorsByColorBookIdFamily._allTransitiveDependencies,
          sessionId: sessionId,
          colorPaletteId: colorPaletteId,
        );

  FindArtworkColorsByColorBookIdProvider._internal(
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
  final int? colorPaletteId;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkColor>> Function(
            FindArtworkColorsByColorBookIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindArtworkColorsByColorBookIdProvider._internal(
        (ref) => create(ref as FindArtworkColorsByColorBookIdRef),
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
  AutoDisposeFutureProviderElement<List<ArtworkColor>> createElement() {
    return _FindArtworkColorsByColorBookIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindArtworkColorsByColorBookIdProvider &&
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
mixin FindArtworkColorsByColorBookIdRef
    on AutoDisposeFutureProviderRef<List<ArtworkColor>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `colorPaletteId` of this provider.
  int? get colorPaletteId;
}

class _FindArtworkColorsByColorBookIdProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkColor>>
    with FindArtworkColorsByColorBookIdRef {
  _FindArtworkColorsByColorBookIdProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FindArtworkColorsByColorBookIdProvider).sessionId;
  @override
  int? get colorPaletteId =>
      (origin as FindArtworkColorsByColorBookIdProvider).colorPaletteId;
}

String _$watchArtworkColorHash() => r'8b8d503e255f019648fab0279a5f5b3eb0ba874e';

/// See also [watchArtworkColor].
@ProviderFor(watchArtworkColor)
const watchArtworkColorProvider = WatchArtworkColorFamily();

/// See also [watchArtworkColor].
class WatchArtworkColorFamily extends Family<AsyncValue<ArtworkColor>> {
  /// See also [watchArtworkColor].
  const WatchArtworkColorFamily();

  /// See also [watchArtworkColor].
  WatchArtworkColorProvider call({
    required String sessionId,
    required int colorId,
  }) {
    return WatchArtworkColorProvider(
      sessionId: sessionId,
      colorId: colorId,
    );
  }

  @override
  WatchArtworkColorProvider getProviderOverride(
    covariant WatchArtworkColorProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      colorId: provider.colorId,
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
  String? get name => r'watchArtworkColorProvider';
}

/// See also [watchArtworkColor].
class WatchArtworkColorProvider
    extends AutoDisposeStreamProvider<ArtworkColor> {
  /// See also [watchArtworkColor].
  WatchArtworkColorProvider({
    required String sessionId,
    required int colorId,
  }) : this._internal(
          (ref) => watchArtworkColor(
            ref as WatchArtworkColorRef,
            sessionId: sessionId,
            colorId: colorId,
          ),
          from: watchArtworkColorProvider,
          name: r'watchArtworkColorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkColorHash,
          dependencies: WatchArtworkColorFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkColorFamily._allTransitiveDependencies,
          sessionId: sessionId,
          colorId: colorId,
        );

  WatchArtworkColorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.colorId,
  }) : super.internal();

  final String sessionId;
  final int colorId;

  @override
  Override overrideWith(
    Stream<ArtworkColor> Function(WatchArtworkColorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkColorProvider._internal(
        (ref) => create(ref as WatchArtworkColorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        colorId: colorId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ArtworkColor> createElement() {
    return _WatchArtworkColorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkColorProvider &&
        other.sessionId == sessionId &&
        other.colorId == colorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, colorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkColorRef on AutoDisposeStreamProviderRef<ArtworkColor> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `colorId` of this provider.
  int get colorId;
}

class _WatchArtworkColorProviderElement
    extends AutoDisposeStreamProviderElement<ArtworkColor>
    with WatchArtworkColorRef {
  _WatchArtworkColorProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchArtworkColorProvider).sessionId;
  @override
  int get colorId => (origin as WatchArtworkColorProvider).colorId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
