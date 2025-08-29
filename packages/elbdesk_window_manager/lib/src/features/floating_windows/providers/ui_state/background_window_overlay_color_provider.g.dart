// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_window_overlay_color_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$backgroundWindowOverlayColorHash() =>
    r'd23d19ed0fe02893946009b5b63489cfc6aabff6';

/// Provider for the overlay color applied to windows that are not in the foreground
/// Set to null to disable the overlay
///
/// Copied from [BackgroundWindowOverlayColor].
@ProviderFor(BackgroundWindowOverlayColor)
final backgroundWindowOverlayColorProvider =
    NotifierProvider<BackgroundWindowOverlayColor, Color?>.internal(
      BackgroundWindowOverlayColor.new,
      name: r'backgroundWindowOverlayColorProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$backgroundWindowOverlayColorHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BackgroundWindowOverlayColor = Notifier<Color?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
