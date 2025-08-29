// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_windows_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$openWindowsHash() => r'7f8dbd0d575020294f94020a7e7139521465ba21';

/// Optimized provider that manages all open windows using a Map for efficient updates
///
/// Copied from [OpenWindows].
@ProviderFor(OpenWindows)
final openWindowsProvider = AutoDisposeNotifierProvider<
  OpenWindows,
  Map<String, FloatingWindowData>
>.internal(
  OpenWindows.new,
  name: r'openWindowsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$openWindowsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OpenWindows = AutoDisposeNotifier<Map<String, FloatingWindowData>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
