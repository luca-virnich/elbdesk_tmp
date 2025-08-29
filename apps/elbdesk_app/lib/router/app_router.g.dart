// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appRouterHash() => r'69cfeb5a3004bc256ecf4d5ce1349c80bffa454b';

/// Router for the application
///
/// Copied from [appRouter].
@ProviderFor(appRouter)
final appRouterProvider = AutoDisposeProvider<GoRouter>.internal(
  appRouter,
  name: r'appRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppRouterRef = AutoDisposeProviderRef<GoRouter>;
String _$appRouterPathHash() => r'b7598a4fb7b0b901561c535d189e194f7dc7872a';

/// See also [AppRouterPath].
@ProviderFor(AppRouterPath)
final appRouterPathProvider =
    AutoDisposeNotifierProvider<AppRouterPath, String>.internal(
  AppRouterPath.new,
  name: r'appRouterPathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appRouterPathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppRouterPath = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
