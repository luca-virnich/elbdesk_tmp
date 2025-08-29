// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topmost_window_positions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$topmostWindowPositionsHash() =>
    r'aadb55fa8147f19795e0338eba3e60d781c5b4bf';

/// Tracks the position of the topmost (most recently used) window of each type
///
/// Copied from [TopmostWindowPositions].
@ProviderFor(TopmostWindowPositions)
final topmostWindowPositionsProvider = AutoDisposeNotifierProvider<
  TopmostWindowPositions,
  Map<String, Offset>
>.internal(
  TopmostWindowPositions.new,
  name: r'topmostWindowPositionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$topmostWindowPositionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TopmostWindowPositions = AutoDisposeNotifier<Map<String, Offset>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
