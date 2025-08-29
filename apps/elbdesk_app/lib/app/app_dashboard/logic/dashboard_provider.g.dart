// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$soiArtworksForLocalUserHash() =>
    r'c97e9e1e43cf4f2365f42e964499d78dc3aedfc7';

/// Find all SOI Artworks currently assigned to this user
///
/// Copied from [soiArtworksForLocalUser].
@ProviderFor(soiArtworksForLocalUser)
final soiArtworksForLocalUserProvider =
    AutoDisposeFutureProvider<List<SoiPrepareArtwork>>.internal(
  soiArtworksForLocalUser,
  name: r'soiArtworksForLocalUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$soiArtworksForLocalUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SoiArtworksForLocalUserRef
    = AutoDisposeFutureProviderRef<List<SoiPrepareArtwork>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
