// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_artworks_for_single_nutzenlayout.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedArtworksForEinzelformaufbauHash() =>
    r'6183845f226234d1d6b047b9ded3679c4f6753b3';

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

abstract class _$SelectedArtworksForEinzelformaufbau
    extends BuildlessAutoDisposeNotifier<Set<Artwork>> {
  late final String sessionId;

  Set<Artwork> build(
    String sessionId,
  );
}

/// See also [SelectedArtworksForEinzelformaufbau].
@ProviderFor(SelectedArtworksForEinzelformaufbau)
const selectedArtworksForEinzelformaufbauProvider =
    SelectedArtworksForEinzelformaufbauFamily();

/// See also [SelectedArtworksForEinzelformaufbau].
class SelectedArtworksForEinzelformaufbauFamily extends Family<Set<Artwork>> {
  /// See also [SelectedArtworksForEinzelformaufbau].
  const SelectedArtworksForEinzelformaufbauFamily();

  /// See also [SelectedArtworksForEinzelformaufbau].
  SelectedArtworksForEinzelformaufbauProvider call(
    String sessionId,
  ) {
    return SelectedArtworksForEinzelformaufbauProvider(
      sessionId,
    );
  }

  @override
  SelectedArtworksForEinzelformaufbauProvider getProviderOverride(
    covariant SelectedArtworksForEinzelformaufbauProvider provider,
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
  String? get name => r'selectedArtworksForEinzelformaufbauProvider';
}

/// See also [SelectedArtworksForEinzelformaufbau].
class SelectedArtworksForEinzelformaufbauProvider
    extends AutoDisposeNotifierProviderImpl<SelectedArtworksForEinzelformaufbau,
        Set<Artwork>> {
  /// See also [SelectedArtworksForEinzelformaufbau].
  SelectedArtworksForEinzelformaufbauProvider(
    String sessionId,
  ) : this._internal(
          () => SelectedArtworksForEinzelformaufbau()..sessionId = sessionId,
          from: selectedArtworksForEinzelformaufbauProvider,
          name: r'selectedArtworksForEinzelformaufbauProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedArtworksForEinzelformaufbauHash,
          dependencies: SelectedArtworksForEinzelformaufbauFamily._dependencies,
          allTransitiveDependencies: SelectedArtworksForEinzelformaufbauFamily
              ._allTransitiveDependencies,
          sessionId: sessionId,
        );

  SelectedArtworksForEinzelformaufbauProvider._internal(
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
  Set<Artwork> runNotifierBuild(
    covariant SelectedArtworksForEinzelformaufbau notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(SelectedArtworksForEinzelformaufbau Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedArtworksForEinzelformaufbauProvider._internal(
        () => create()..sessionId = sessionId,
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
  AutoDisposeNotifierProviderElement<SelectedArtworksForEinzelformaufbau,
      Set<Artwork>> createElement() {
    return _SelectedArtworksForEinzelformaufbauProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedArtworksForEinzelformaufbauProvider &&
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
mixin SelectedArtworksForEinzelformaufbauRef
    on AutoDisposeNotifierProviderRef<Set<Artwork>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SelectedArtworksForEinzelformaufbauProviderElement
    extends AutoDisposeNotifierProviderElement<
        SelectedArtworksForEinzelformaufbau,
        Set<Artwork>> with SelectedArtworksForEinzelformaufbauRef {
  _SelectedArtworksForEinzelformaufbauProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as SelectedArtworksForEinzelformaufbauProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
