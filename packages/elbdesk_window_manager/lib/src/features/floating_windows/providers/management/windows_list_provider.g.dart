// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'windows_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$windowsListHash() => r'9e5bc0c62e7a62d37d08e5ea837859e57835df8e';

/// Provider that returns ordered list of windows for compatibility
///
/// Copied from [windowsList].
@ProviderFor(windowsList)
final windowsListProvider =
    AutoDisposeProvider<List<FloatingWindowData>>.internal(
      windowsList,
      name: r'windowsListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$windowsListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WindowsListRef = AutoDisposeProviderRef<List<FloatingWindowData>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
