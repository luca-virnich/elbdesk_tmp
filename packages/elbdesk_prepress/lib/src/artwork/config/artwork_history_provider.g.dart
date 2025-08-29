// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchArtworkHistoryColorsHash() =>
    r'79feca8fe2369a710d4ee6d0a6835c1f72b078f1';

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

/// See also [watchArtworkHistoryColors].
@ProviderFor(watchArtworkHistoryColors)
const watchArtworkHistoryColorsProvider = WatchArtworkHistoryColorsFamily();

/// See also [watchArtworkHistoryColors].
class WatchArtworkHistoryColorsFamily
    extends Family<AsyncValue<List<ArtworkColor>>> {
  /// See also [watchArtworkHistoryColors].
  const WatchArtworkHistoryColorsFamily();

  /// See also [watchArtworkHistoryColors].
  WatchArtworkHistoryColorsProvider call(
    List<ArtworkColor> colors,
  ) {
    return WatchArtworkHistoryColorsProvider(
      colors,
    );
  }

  @override
  WatchArtworkHistoryColorsProvider getProviderOverride(
    covariant WatchArtworkHistoryColorsProvider provider,
  ) {
    return call(
      provider.colors,
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
  String? get name => r'watchArtworkHistoryColorsProvider';
}

/// See also [watchArtworkHistoryColors].
class WatchArtworkHistoryColorsProvider
    extends AutoDisposeFutureProvider<List<ArtworkColor>> {
  /// See also [watchArtworkHistoryColors].
  WatchArtworkHistoryColorsProvider(
    List<ArtworkColor> colors,
  ) : this._internal(
          (ref) => watchArtworkHistoryColors(
            ref as WatchArtworkHistoryColorsRef,
            colors,
          ),
          from: watchArtworkHistoryColorsProvider,
          name: r'watchArtworkHistoryColorsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkHistoryColorsHash,
          dependencies: WatchArtworkHistoryColorsFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkHistoryColorsFamily._allTransitiveDependencies,
          colors: colors,
        );

  WatchArtworkHistoryColorsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.colors,
  }) : super.internal();

  final List<ArtworkColor> colors;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkColor>> Function(WatchArtworkHistoryColorsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkHistoryColorsProvider._internal(
        (ref) => create(ref as WatchArtworkHistoryColorsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        colors: colors,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkColor>> createElement() {
    return _WatchArtworkHistoryColorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkHistoryColorsProvider && other.colors == colors;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, colors.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkHistoryColorsRef
    on AutoDisposeFutureProviderRef<List<ArtworkColor>> {
  /// The parameter `colors` of this provider.
  List<ArtworkColor> get colors;
}

class _WatchArtworkHistoryColorsProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkColor>>
    with WatchArtworkHistoryColorsRef {
  _WatchArtworkHistoryColorsProviderElement(super.provider);

  @override
  List<ArtworkColor> get colors =>
      (origin as WatchArtworkHistoryColorsProvider).colors;
}

String _$watchArtworkHistoryLayersHash() =>
    r'6351b3c7c4a625af1bca896b5b71aaec7b585f7f';

/// See also [watchArtworkHistoryLayers].
@ProviderFor(watchArtworkHistoryLayers)
const watchArtworkHistoryLayersProvider = WatchArtworkHistoryLayersFamily();

/// See also [watchArtworkHistoryLayers].
class WatchArtworkHistoryLayersFamily
    extends Family<AsyncValue<List<ArtworkLayer>>> {
  /// See also [watchArtworkHistoryLayers].
  const WatchArtworkHistoryLayersFamily();

  /// See also [watchArtworkHistoryLayers].
  WatchArtworkHistoryLayersProvider call(
    List<ArtworkLayer> layers,
  ) {
    return WatchArtworkHistoryLayersProvider(
      layers,
    );
  }

  @override
  WatchArtworkHistoryLayersProvider getProviderOverride(
    covariant WatchArtworkHistoryLayersProvider provider,
  ) {
    return call(
      provider.layers,
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
  String? get name => r'watchArtworkHistoryLayersProvider';
}

/// See also [watchArtworkHistoryLayers].
class WatchArtworkHistoryLayersProvider
    extends AutoDisposeFutureProvider<List<ArtworkLayer>> {
  /// See also [watchArtworkHistoryLayers].
  WatchArtworkHistoryLayersProvider(
    List<ArtworkLayer> layers,
  ) : this._internal(
          (ref) => watchArtworkHistoryLayers(
            ref as WatchArtworkHistoryLayersRef,
            layers,
          ),
          from: watchArtworkHistoryLayersProvider,
          name: r'watchArtworkHistoryLayersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchArtworkHistoryLayersHash,
          dependencies: WatchArtworkHistoryLayersFamily._dependencies,
          allTransitiveDependencies:
              WatchArtworkHistoryLayersFamily._allTransitiveDependencies,
          layers: layers,
        );

  WatchArtworkHistoryLayersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.layers,
  }) : super.internal();

  final List<ArtworkLayer> layers;

  @override
  Override overrideWith(
    FutureOr<List<ArtworkLayer>> Function(WatchArtworkHistoryLayersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchArtworkHistoryLayersProvider._internal(
        (ref) => create(ref as WatchArtworkHistoryLayersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        layers: layers,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ArtworkLayer>> createElement() {
    return _WatchArtworkHistoryLayersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchArtworkHistoryLayersProvider && other.layers == layers;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, layers.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchArtworkHistoryLayersRef
    on AutoDisposeFutureProviderRef<List<ArtworkLayer>> {
  /// The parameter `layers` of this provider.
  List<ArtworkLayer> get layers;
}

class _WatchArtworkHistoryLayersProviderElement
    extends AutoDisposeFutureProviderElement<List<ArtworkLayer>>
    with WatchArtworkHistoryLayersRef {
  _WatchArtworkHistoryLayersProviderElement(super.provider);

  @override
  List<ArtworkLayer> get layers =>
      (origin as WatchArtworkHistoryLayersProvider).layers;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
