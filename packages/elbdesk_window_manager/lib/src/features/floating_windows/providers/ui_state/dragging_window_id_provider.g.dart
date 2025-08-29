// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dragging_window_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$draggingWindowIdHash() => r'f687744a8c45014ff980b985518b6cc03664883b';

/// Provider to track which window is currently being dragged
///
/// Copied from [DraggingWindowId].
@ProviderFor(DraggingWindowId)
final draggingWindowIdProvider =
    AutoDisposeNotifierProvider<DraggingWindowId, String?>.internal(
      DraggingWindowId.new,
      name: r'draggingWindowIdProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$draggingWindowIdHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DraggingWindowId = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
