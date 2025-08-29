// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimize_animation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$minimizeAnimationsHash() =>
    r'19c6b28d8823c8219a9b249649f0937df74e9491';

/// Manages minimize/restore animations for windows
///
/// Copied from [MinimizeAnimations].
@ProviderFor(MinimizeAnimations)
final minimizeAnimationsProvider = AutoDisposeNotifierProvider<
  MinimizeAnimations,
  Map<String, MinimizeAnimationState>
>.internal(
  MinimizeAnimations.new,
  name: r'minimizeAnimationsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$minimizeAnimationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MinimizeAnimations =
    AutoDisposeNotifier<Map<String, MinimizeAnimationState>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
