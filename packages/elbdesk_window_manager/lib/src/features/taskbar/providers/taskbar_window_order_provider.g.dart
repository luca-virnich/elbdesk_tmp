// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskbar_window_order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$windowsInTaskbarOrderHash() =>
    r'35ff8de999270f61edbb0c58f21569bdc16bf9f4';

/// Provider that returns windows in taskbar order
///
/// Copied from [windowsInTaskbarOrder].
@ProviderFor(windowsInTaskbarOrder)
final windowsInTaskbarOrderProvider =
    AutoDisposeProvider<List<FloatingWindowData>>.internal(
      windowsInTaskbarOrder,
      name: r'windowsInTaskbarOrderProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$windowsInTaskbarOrderHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WindowsInTaskbarOrderRef =
    AutoDisposeProviderRef<List<FloatingWindowData>>;
String _$taskbarWindowOrderHash() =>
    r'878bf47be344e2560aec0c496ac213bb9bd63b1c';

/// Provider that maintains the order of windows as shown in the taskbar
///
/// Copied from [TaskbarWindowOrder].
@ProviderFor(TaskbarWindowOrder)
final taskbarWindowOrderProvider =
    AutoDisposeNotifierProvider<TaskbarWindowOrder, List<String>>.internal(
      TaskbarWindowOrder.new,
      name: r'taskbarWindowOrderProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$taskbarWindowOrderHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TaskbarWindowOrder = AutoDisposeNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
