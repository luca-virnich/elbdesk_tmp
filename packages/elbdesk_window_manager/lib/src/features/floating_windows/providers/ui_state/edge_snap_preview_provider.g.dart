// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edge_snap_preview_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$edgeSnapPreviewHash() => r'271f38b67110688af80427c4461ca7e099a6aa21';

/// Provider for edge snap preview position
/// Shows preview when dragging window near screen edges
///
/// Copied from [EdgeSnapPreview].
@ProviderFor(EdgeSnapPreview)
final edgeSnapPreviewProvider =
    AutoDisposeNotifierProvider<EdgeSnapPreview, SnapPosition?>.internal(
      EdgeSnapPreview.new,
      name: r'edgeSnapPreviewProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$edgeSnapPreviewHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$EdgeSnapPreview = AutoDisposeNotifier<SnapPosition?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
