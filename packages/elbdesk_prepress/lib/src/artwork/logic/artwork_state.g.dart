// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchArtworkColorsHash() =>
    r'21670e8528f575291b6188e7568084f216b892e8';

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

/// See also [watchArtworkColors].
@ProviderFor(watchArtworkColors)
const watchArtworkColorsProvider = WatchArtworkColorsFamily();

/// See also [watchArtworkColors].
class WatchArtworkColorsFamily extends Family<AsyncValue<List<ArtworkColor>>> {
  /// See also [watchArtworkColors].
  const WatchArtworkColorsFamily();

  /// See also [watchArtworkColors].
  WatchArtworkColorsProvider call(
    int artworkId,
    String artworkStateSessionId,
  ) {
    return WatchArtworkColorsProvider(
      artworkId,
      artworkStateSessionId,
    );
  }

  @override
  WatchArtworkColorsProvider getProviderOverride(
    covariant WatchArtworkColorsProvider provider,
  ) {
    return call(
      provider.artworkId,
      provider.artworkStateSessionId,
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
  String? get name => r'watchArtworkColorsProvider';
}

/// See also [watchArtworkColors].
class WatchArtworkColorsProvider
    extends AutoDisposeFutureProvider<List<ArtworkColor>> {
  /// See also [watchArtworkColors].
  WatchArtworkColorsProvider(
    int artworkId,
    String artworkStateSessionId,
  ) : this._internal(
          (ref) => watchArtworkColors(
            ref as WatchArtworkColorsRef,
            artworkId,
            artworkStateSessionId,
          ),
          from: watchArtworkColorsProvider,
          name: r'watchArtworkColorsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkColorsHash,
          dependencies: WatchArtworkColorsFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkColorsFamily._allTransitiveDependencies,
          artworkId: artworkId,
          artworkStateSessionId: artworkStateSessionId,
        );

  WatchArtworkColorsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkId,
    required this.artworkStateSessionId,
  }) : super.internal();

  final int artworkId;
  final String artworkStateSessionId;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkColor>> Function(WatchArtworkColorsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkColorsProvider._internal(
        (ref) => create(ref as WatchArtworkColorsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkId: artworkId,
        artworkStateSessionId: artworkStateSessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkColor>> createElement() {
    return _WatchArtworkColorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkColorsProvider &&
        other.artworkId == artworkId &&
        other.artworkStateSessionId == artworkStateSessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);
    hash = _SystemHash.combine(hash, artworkStateSessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkColorsRef
    on AutoDisposeFutureProviderRef<List<ArtworkColor>> {
  /// The parameter `artworkId` of this provider.
  int get artworkId;

  /// The parameter `artworkStateSessionId` of this provider.
  String get artworkStateSessionId;
}

class _WatchArtworkColorsProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkColor>>
    with WatchArtworkColorsRef {
  _WatchArtworkColorsProviderElement(super.provider);

  @override
  int get artworkId => (origin as WatchArtworkColorsProvider).artworkId;
  @override
  String get artworkStateSessionId =>
      (origin as WatchArtworkColorsProvider).artworkStateSessionId;
}

String _$fetchArtworkQuarantineColorsHash() =>
    r'f14f16e0b4137b646aa8b8c30d38796e7432dcdc';

/// See also [fetchArtworkQuarantineColors].
@ProviderFor(fetchArtworkQuarantineColors)
const fetchArtworkQuarantineColorsProvider =
    FetchArtworkQuarantineColorsFamily();

/// See also [fetchArtworkQuarantineColors].
class FetchArtworkQuarantineColorsFamily
    extends Family<AsyncValue<List<ArtworkColor>>> {
  /// See also [fetchArtworkQuarantineColors].
  const FetchArtworkQuarantineColorsFamily();

  /// See also [fetchArtworkQuarantineColors].
  FetchArtworkQuarantineColorsProvider call(
    int artworkQuarantineId,
  ) {
    return FetchArtworkQuarantineColorsProvider(
      artworkQuarantineId,
    );
  }

  @override
  FetchArtworkQuarantineColorsProvider getProviderOverride(
    covariant FetchArtworkQuarantineColorsProvider provider,
  ) {
    return call(
      provider.artworkQuarantineId,
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
  String? get name => r'fetchArtworkQuarantineColorsProvider';
}

/// See also [fetchArtworkQuarantineColors].
class FetchArtworkQuarantineColorsProvider
    extends AutoDisposeFutureProvider<List<ArtworkColor>> {
  /// See also [fetchArtworkQuarantineColors].
  FetchArtworkQuarantineColorsProvider(
    int artworkQuarantineId,
  ) : this._internal(
          (ref) => fetchArtworkQuarantineColors(
            ref as FetchArtworkQuarantineColorsRef,
            artworkQuarantineId,
          ),
          from: fetchArtworkQuarantineColorsProvider,
          name: r'fetchArtworkQuarantineColorsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchArtworkQuarantineColorsHash,
          dependencies: FetchArtworkQuarantineColorsFamily._dependencies,
          allTransitiveDependencies:
              FetchArtworkQuarantineColorsFamily._allTransitiveDependencies,
          artworkQuarantineId: artworkQuarantineId,
        );

  FetchArtworkQuarantineColorsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkQuarantineId,
  }) : super.internal();

  final int artworkQuarantineId;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkColor>> Function(
            FetchArtworkQuarantineColorsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchArtworkQuarantineColorsProvider._internal(
        (ref) => create(ref as FetchArtworkQuarantineColorsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkQuarantineId: artworkQuarantineId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkColor>> createElement() {
    return _FetchArtworkQuarantineColorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchArtworkQuarantineColorsProvider &&
        other.artworkQuarantineId == artworkQuarantineId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkQuarantineId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchArtworkQuarantineColorsRef
    on AutoDisposeFutureProviderRef<List<ArtworkColor>> {
  /// The parameter `artworkQuarantineId` of this provider.
  int get artworkQuarantineId;
}

class _FetchArtworkQuarantineColorsProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkColor>>
    with FetchArtworkQuarantineColorsRef {
  _FetchArtworkQuarantineColorsProviderElement(super.provider);

  @override
  int get artworkQuarantineId =>
      (origin as FetchArtworkQuarantineColorsProvider).artworkQuarantineId;
}

String _$watchArtworkLayersHash() =>
    r'1df351ff1da5ea7dfe69a35d6f9f54874c459a1b';

/// See also [watchArtworkLayers].
@ProviderFor(watchArtworkLayers)
const watchArtworkLayersProvider = WatchArtworkLayersFamily();

/// See also [watchArtworkLayers].
class WatchArtworkLayersFamily extends Family<AsyncValue<List<ArtworkLayer>>> {
  /// See also [watchArtworkLayers].
  const WatchArtworkLayersFamily();

  /// See also [watchArtworkLayers].
  WatchArtworkLayersProvider call(
    int artworkId,
    String artworkStateSessionId,
  ) {
    return WatchArtworkLayersProvider(
      artworkId,
      artworkStateSessionId,
    );
  }

  @override
  WatchArtworkLayersProvider getProviderOverride(
    covariant WatchArtworkLayersProvider provider,
  ) {
    return call(
      provider.artworkId,
      provider.artworkStateSessionId,
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
  String? get name => r'watchArtworkLayersProvider';
}

/// See also [watchArtworkLayers].
class WatchArtworkLayersProvider
    extends AutoDisposeFutureProvider<List<ArtworkLayer>> {
  /// See also [watchArtworkLayers].
  WatchArtworkLayersProvider(
    int artworkId,
    String artworkStateSessionId,
  ) : this._internal(
          (ref) => watchArtworkLayers(
            ref as WatchArtworkLayersRef,
            artworkId,
            artworkStateSessionId,
          ),
          from: watchArtworkLayersProvider,
          name: r'watchArtworkLayersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkLayersHash,
          dependencies: WatchArtworkLayersFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkLayersFamily._allTransitiveDependencies,
          artworkId: artworkId,
          artworkStateSessionId: artworkStateSessionId,
        );

  WatchArtworkLayersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkId,
    required this.artworkStateSessionId,
  }) : super.internal();

  final int artworkId;
  final String artworkStateSessionId;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkLayer>> Function(WatchArtworkLayersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkLayersProvider._internal(
        (ref) => create(ref as WatchArtworkLayersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkId: artworkId,
        artworkStateSessionId: artworkStateSessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkLayer>> createElement() {
    return _WatchArtworkLayersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkLayersProvider &&
        other.artworkId == artworkId &&
        other.artworkStateSessionId == artworkStateSessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);
    hash = _SystemHash.combine(hash, artworkStateSessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkLayersRef
    on AutoDisposeFutureProviderRef<List<ArtworkLayer>> {
  /// The parameter `artworkId` of this provider.
  int get artworkId;

  /// The parameter `artworkStateSessionId` of this provider.
  String get artworkStateSessionId;
}

class _WatchArtworkLayersProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkLayer>>
    with WatchArtworkLayersRef {
  _WatchArtworkLayersProviderElement(super.provider);

  @override
  int get artworkId => (origin as WatchArtworkLayersProvider).artworkId;
  @override
  String get artworkStateSessionId =>
      (origin as WatchArtworkLayersProvider).artworkStateSessionId;
}

String _$artworkStateHash() => r'cdcd8024158878701d64867bbd5a473d5ffcdef5';

abstract class _$ArtworkState
    extends BuildlessAutoDisposeAsyncNotifier<Artwork> {
  late final int entityId;
  late final String sessionId;

  FutureOr<Artwork> build(
    int entityId,
    String sessionId,
  );
}

/// Contact State
///
/// This state is used to manage and update the contact details
///
/// Copied from [ArtworkState].
@ProviderFor(ArtworkState)
const artworkStateProvider = ArtworkStateFamily();

/// Contact State
///
/// This state is used to manage and update the contact details
///
/// Copied from [ArtworkState].
class ArtworkStateFamily extends Family<AsyncValue<Artwork>> {
  /// Contact State
  ///
  /// This state is used to manage and update the contact details
  ///
  /// Copied from [ArtworkState].
  const ArtworkStateFamily();

  /// Contact State
  ///
  /// This state is used to manage and update the contact details
  ///
  /// Copied from [ArtworkState].
  ArtworkStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return ArtworkStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  ArtworkStateProvider getProviderOverride(
    covariant ArtworkStateProvider provider,
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
  String? get name => r'artworkStateProvider';
}

/// Contact State
///
/// This state is used to manage and update the contact details
///
/// Copied from [ArtworkState].
class ArtworkStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ArtworkState, Artwork> {
  /// Contact State
  ///
  /// This state is used to manage and update the contact details
  ///
  /// Copied from [ArtworkState].
  ArtworkStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => ArtworkState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: artworkStateProvider,
          name: r'artworkStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artworkStateHash,
          dependencies: ArtworkStateFamily._dependencies,
          allTransitiveDependencies:
              ArtworkStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  ArtworkStateProvider._internal(
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
  FutureOr<Artwork> runNotifierBuild(
    covariant ArtworkState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(ArtworkState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArtworkStateProvider._internal(
        () => create()
          ..entityId = entityId
          ..sessionId = sessionId,
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
  AutoDisposeAsyncNotifierProviderElement<ArtworkState, Artwork>
      createElement() {
    return _ArtworkStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtworkStateProvider &&
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
mixin ArtworkStateRef on AutoDisposeAsyncNotifierProviderRef<Artwork> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ArtworkStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ArtworkState, Artwork>
    with ArtworkStateRef {
  _ArtworkStateProviderElement(super.provider);

  @override
  int get entityId => (origin as ArtworkStateProvider).entityId;
  @override
  String get sessionId => (origin as ArtworkStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
