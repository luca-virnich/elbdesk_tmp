// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_artworks_for_multi_nutzenlayout.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedArtworksForSammelformaufbauHash() =>
    r'8ab7bb23cff874fa3f9e963a224fdb344febb8fb';

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

abstract class _$SelectedArtworksForSammelformaufbau
    extends BuildlessAutoDisposeNotifier<
        Set<MultiNutzenlayoutArtworkSelection>> {
  late final String sessionId;

  Set<MultiNutzenlayoutArtworkSelection> build(
    String sessionId,
  );
}

/// See also [SelectedArtworksForSammelformaufbau].
@ProviderFor(SelectedArtworksForSammelformaufbau)
const selectedArtworksForSammelformaufbauProvider =
    SelectedArtworksForSammelformaufbauFamily();

/// See also [SelectedArtworksForSammelformaufbau].
class SelectedArtworksForSammelformaufbauFamily
    extends Family<Set<MultiNutzenlayoutArtworkSelection>> {
  /// See also [SelectedArtworksForSammelformaufbau].
  const SelectedArtworksForSammelformaufbauFamily();

  /// See also [SelectedArtworksForSammelformaufbau].
  SelectedArtworksForSammelformaufbauProvider call(
    String sessionId,
  ) {
    return SelectedArtworksForSammelformaufbauProvider(
      sessionId,
    );
  }

  @override
  SelectedArtworksForSammelformaufbauProvider getProviderOverride(
    covariant SelectedArtworksForSammelformaufbauProvider provider,
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
  String? get name => r'selectedArtworksForSammelformaufbauProvider';
}

/// See also [SelectedArtworksForSammelformaufbau].
class SelectedArtworksForSammelformaufbauProvider
    extends AutoDisposeNotifierProviderImpl<SelectedArtworksForSammelformaufbau,
        Set<MultiNutzenlayoutArtworkSelection>> {
  /// See also [SelectedArtworksForSammelformaufbau].
  SelectedArtworksForSammelformaufbauProvider(
    String sessionId,
  ) : this._internal(
          () => SelectedArtworksForSammelformaufbau()..sessionId = sessionId,
          from: selectedArtworksForSammelformaufbauProvider,
          name: r'selectedArtworksForSammelformaufbauProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedArtworksForSammelformaufbauHash,
          dependencies: SelectedArtworksForSammelformaufbauFamily._dependencies,
          allTransitiveDependencies: SelectedArtworksForSammelformaufbauFamily
              ._allTransitiveDependencies,
          sessionId: sessionId,
        );

  SelectedArtworksForSammelformaufbauProvider._internal(
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
  Set<MultiNutzenlayoutArtworkSelection> runNotifierBuild(
    covariant SelectedArtworksForSammelformaufbau notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(SelectedArtworksForSammelformaufbau Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedArtworksForSammelformaufbauProvider._internal(
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
  AutoDisposeNotifierProviderElement<SelectedArtworksForSammelformaufbau,
      Set<MultiNutzenlayoutArtworkSelection>> createElement() {
    return _SelectedArtworksForSammelformaufbauProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedArtworksForSammelformaufbauProvider &&
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
mixin SelectedArtworksForSammelformaufbauRef
    on AutoDisposeNotifierProviderRef<Set<MultiNutzenlayoutArtworkSelection>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SelectedArtworksForSammelformaufbauProviderElement
    extends AutoDisposeNotifierProviderElement<
        SelectedArtworksForSammelformaufbau,
        Set<MultiNutzenlayoutArtworkSelection>>
    with SelectedArtworksForSammelformaufbauRef {
  _SelectedArtworksForSammelformaufbauProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as SelectedArtworksForSammelformaufbauProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
