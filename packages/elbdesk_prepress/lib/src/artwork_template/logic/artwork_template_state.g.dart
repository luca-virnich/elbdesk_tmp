// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_template_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchArtworkTemplateColorsHash() =>
    r'f3959061cd58c5bee7b5bfa65e7b2a381faaadf6';

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

/// See also [watchArtworkTemplateColors].
@ProviderFor(watchArtworkTemplateColors)
const watchArtworkTemplateColorsProvider = WatchArtworkTemplateColorsFamily();

/// See also [watchArtworkTemplateColors].
class WatchArtworkTemplateColorsFamily
    extends Family<AsyncValue<List<ArtworkColor>>> {
  /// See also [watchArtworkTemplateColors].
  const WatchArtworkTemplateColorsFamily();

  /// See also [watchArtworkTemplateColors].
  WatchArtworkTemplateColorsProvider call(
    int artworkTemplateId,
    String artworkTemplateStateSessionId,
  ) {
    return WatchArtworkTemplateColorsProvider(
      artworkTemplateId,
      artworkTemplateStateSessionId,
    );
  }

  @override
  WatchArtworkTemplateColorsProvider getProviderOverride(
    covariant WatchArtworkTemplateColorsProvider provider,
  ) {
    return call(
      provider.artworkTemplateId,
      provider.artworkTemplateStateSessionId,
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
  String? get name => r'watchArtworkTemplateColorsProvider';
}

/// See also [watchArtworkTemplateColors].
class WatchArtworkTemplateColorsProvider
    extends AutoDisposeFutureProvider<List<ArtworkColor>> {
  /// See also [watchArtworkTemplateColors].
  WatchArtworkTemplateColorsProvider(
    int artworkTemplateId,
    String artworkTemplateStateSessionId,
  ) : this._internal(
          (ref) => watchArtworkTemplateColors(
            ref as WatchArtworkTemplateColorsRef,
            artworkTemplateId,
            artworkTemplateStateSessionId,
          ),
          from: watchArtworkTemplateColorsProvider,
          name: r'watchArtworkTemplateColorsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkTemplateColorsHash,
          dependencies: WatchArtworkTemplateColorsFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkTemplateColorsFamily._allTransitiveDependencies,
          artworkTemplateId: artworkTemplateId,
          artworkTemplateStateSessionId: artworkTemplateStateSessionId,
        );

  WatchArtworkTemplateColorsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkTemplateId,
    required this.artworkTemplateStateSessionId,
  }) : super.internal();

  final int artworkTemplateId;
  final String artworkTemplateStateSessionId;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkColor>> Function(
            WatchArtworkTemplateColorsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkTemplateColorsProvider._internal(
        (ref) => create(ref as WatchArtworkTemplateColorsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkTemplateId: artworkTemplateId,
        artworkTemplateStateSessionId: artworkTemplateStateSessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkColor>> createElement() {
    return _WatchArtworkTemplateColorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkTemplateColorsProvider &&
        other.artworkTemplateId == artworkTemplateId &&
        other.artworkTemplateStateSessionId == artworkTemplateStateSessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkTemplateId.hashCode);
    hash = _SystemHash.combine(hash, artworkTemplateStateSessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkTemplateColorsRef
    on AutoDisposeFutureProviderRef<List<ArtworkColor>> {
  /// The parameter `artworkTemplateId` of this provider.
  int get artworkTemplateId;

  /// The parameter `artworkTemplateStateSessionId` of this provider.
  String get artworkTemplateStateSessionId;
}

class _WatchArtworkTemplateColorsProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkColor>>
    with WatchArtworkTemplateColorsRef {
  _WatchArtworkTemplateColorsProviderElement(super.provider);

  @override
  int get artworkTemplateId =>
      (origin as WatchArtworkTemplateColorsProvider).artworkTemplateId;
  @override
  String get artworkTemplateStateSessionId =>
      (origin as WatchArtworkTemplateColorsProvider)
          .artworkTemplateStateSessionId;
}

String _$watchArtworkTemplateLayersHash() =>
    r'd347ed9ee560bf78cddfb6f1fa9341137cf86306';

/// See also [watchArtworkTemplateLayers].
@ProviderFor(watchArtworkTemplateLayers)
const watchArtworkTemplateLayersProvider = WatchArtworkTemplateLayersFamily();

/// See also [watchArtworkTemplateLayers].
class WatchArtworkTemplateLayersFamily
    extends Family<AsyncValue<List<ArtworkLayer>>> {
  /// See also [watchArtworkTemplateLayers].
  const WatchArtworkTemplateLayersFamily();

  /// See also [watchArtworkTemplateLayers].
  WatchArtworkTemplateLayersProvider call(
    int artworkTemplateId,
    String artworkTemplateStateSessionId,
  ) {
    return WatchArtworkTemplateLayersProvider(
      artworkTemplateId,
      artworkTemplateStateSessionId,
    );
  }

  @override
  WatchArtworkTemplateLayersProvider getProviderOverride(
    covariant WatchArtworkTemplateLayersProvider provider,
  ) {
    return call(
      provider.artworkTemplateId,
      provider.artworkTemplateStateSessionId,
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
  String? get name => r'watchArtworkTemplateLayersProvider';
}

/// See also [watchArtworkTemplateLayers].
class WatchArtworkTemplateLayersProvider
    extends AutoDisposeFutureProvider<List<ArtworkLayer>> {
  /// See also [watchArtworkTemplateLayers].
  WatchArtworkTemplateLayersProvider(
    int artworkTemplateId,
    String artworkTemplateStateSessionId,
  ) : this._internal(
          (ref) => watchArtworkTemplateLayers(
            ref as WatchArtworkTemplateLayersRef,
            artworkTemplateId,
            artworkTemplateStateSessionId,
          ),
          from: watchArtworkTemplateLayersProvider,
          name: r'watchArtworkTemplateLayersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkTemplateLayersHash,
          dependencies: WatchArtworkTemplateLayersFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkTemplateLayersFamily._allTransitiveDependencies,
          artworkTemplateId: artworkTemplateId,
          artworkTemplateStateSessionId: artworkTemplateStateSessionId,
        );

  WatchArtworkTemplateLayersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkTemplateId,
    required this.artworkTemplateStateSessionId,
  }) : super.internal();

  final int artworkTemplateId;
  final String artworkTemplateStateSessionId;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkLayer>> Function(
            WatchArtworkTemplateLayersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkTemplateLayersProvider._internal(
        (ref) => create(ref as WatchArtworkTemplateLayersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkTemplateId: artworkTemplateId,
        artworkTemplateStateSessionId: artworkTemplateStateSessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkLayer>> createElement() {
    return _WatchArtworkTemplateLayersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkTemplateLayersProvider &&
        other.artworkTemplateId == artworkTemplateId &&
        other.artworkTemplateStateSessionId == artworkTemplateStateSessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkTemplateId.hashCode);
    hash = _SystemHash.combine(hash, artworkTemplateStateSessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkTemplateLayersRef
    on AutoDisposeFutureProviderRef<List<ArtworkLayer>> {
  /// The parameter `artworkTemplateId` of this provider.
  int get artworkTemplateId;

  /// The parameter `artworkTemplateStateSessionId` of this provider.
  String get artworkTemplateStateSessionId;
}

class _WatchArtworkTemplateLayersProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkLayer>>
    with WatchArtworkTemplateLayersRef {
  _WatchArtworkTemplateLayersProviderElement(super.provider);

  @override
  int get artworkTemplateId =>
      (origin as WatchArtworkTemplateLayersProvider).artworkTemplateId;
  @override
  String get artworkTemplateStateSessionId =>
      (origin as WatchArtworkTemplateLayersProvider)
          .artworkTemplateStateSessionId;
}

String _$artworkTemplateStateHash() =>
    r'35b5aeb84691afb4f6f5db4eb8545b8dea024e62';

abstract class _$ArtworkTemplateState
    extends BuildlessAutoDisposeAsyncNotifier<ArtworkTemplate> {
  late final int entityId;
  late final String sessionId;

  FutureOr<ArtworkTemplate> build(
    int entityId,
    String sessionId,
  );
}

/// Contact State
///
/// This state is used to manage and update the contact details
///
/// Copied from [ArtworkTemplateState].
@ProviderFor(ArtworkTemplateState)
const artworkTemplateStateProvider = ArtworkTemplateStateFamily();

/// Contact State
///
/// This state is used to manage and update the contact details
///
/// Copied from [ArtworkTemplateState].
class ArtworkTemplateStateFamily extends Family<AsyncValue<ArtworkTemplate>> {
  /// Contact State
  ///
  /// This state is used to manage and update the contact details
  ///
  /// Copied from [ArtworkTemplateState].
  const ArtworkTemplateStateFamily();

  /// Contact State
  ///
  /// This state is used to manage and update the contact details
  ///
  /// Copied from [ArtworkTemplateState].
  ArtworkTemplateStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return ArtworkTemplateStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  ArtworkTemplateStateProvider getProviderOverride(
    covariant ArtworkTemplateStateProvider provider,
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
  String? get name => r'artworkTemplateStateProvider';
}

/// Contact State
///
/// This state is used to manage and update the contact details
///
/// Copied from [ArtworkTemplateState].
class ArtworkTemplateStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ArtworkTemplateState, ArtworkTemplate> {
  /// Contact State
  ///
  /// This state is used to manage and update the contact details
  ///
  /// Copied from [ArtworkTemplateState].
  ArtworkTemplateStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => ArtworkTemplateState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: artworkTemplateStateProvider,
          name: r'artworkTemplateStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artworkTemplateStateHash,
          dependencies: ArtworkTemplateStateFamily._dependencies,
          allTransitiveDependencies:
              ArtworkTemplateStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  ArtworkTemplateStateProvider._internal(
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
  FutureOr<ArtworkTemplate> runNotifierBuild(
    covariant ArtworkTemplateState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(ArtworkTemplateState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArtworkTemplateStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ArtworkTemplateState, ArtworkTemplate>
      createElement() {
    return _ArtworkTemplateStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtworkTemplateStateProvider &&
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
mixin ArtworkTemplateStateRef
    on AutoDisposeAsyncNotifierProviderRef<ArtworkTemplate> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ArtworkTemplateStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ArtworkTemplateState,
        ArtworkTemplate> with ArtworkTemplateStateRef {
  _ArtworkTemplateStateProviderElement(super.provider);

  @override
  int get entityId => (origin as ArtworkTemplateStateProvider).entityId;
  @override
  String get sessionId => (origin as ArtworkTemplateStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
