// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_z_order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$windowZOrderHash() => r'd0ef5469bd38c3a6a5dd8b420a92f1bb2c24da34';

/// Optimized provider that manages the z-order of windows
/// The last item in the list is the topmost window
///
/// Copied from [WindowZOrder].
@ProviderFor(WindowZOrder)
final windowZOrderProvider =
    AutoDisposeNotifierProvider<WindowZOrder, List<String>>.internal(
      WindowZOrder.new,
      name: r'windowZOrderProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$windowZOrderHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WindowZOrder = AutoDisposeNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
