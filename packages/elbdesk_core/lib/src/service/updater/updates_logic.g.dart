// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updates_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchAppVersionUpdatesHash() =>
    r'df0dfc285f163b298cc0d7613ec3f372552385e5';

/// See also [watchAppVersionUpdates].
@ProviderFor(watchAppVersionUpdates)
final watchAppVersionUpdatesProvider =
    AutoDisposeStreamProvider<AppVersionManifest>.internal(
  watchAppVersionUpdates,
  name: r'watchAppVersionUpdatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAppVersionUpdatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAppVersionUpdatesRef
    = AutoDisposeStreamProviderRef<AppVersionManifest>;
String _$appUpdateRepositoryHash() =>
    r'a830752f29a4f6b56f76312b07f297f9232a80e4';

/// See also [appUpdateRepository].
@ProviderFor(appUpdateRepository)
final appUpdateRepositoryProvider =
    AutoDisposeProvider<AppUpdateRepository>.internal(
  appUpdateRepository,
  name: r'appUpdateRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appUpdateRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppUpdateRepositoryRef = AutoDisposeProviderRef<AppUpdateRepository>;
String _$newestAppVersionManifestHash() =>
    r'13dae3cf00102f555ecd6dc3c5645fcfbb59d356';

/// See also [NewestAppVersionManifest].
@ProviderFor(NewestAppVersionManifest)
final newestAppVersionManifestProvider = AutoDisposeAsyncNotifierProvider<
    NewestAppVersionManifest, AppVersionManifest>.internal(
  NewestAppVersionManifest.new,
  name: r'newestAppVersionManifestProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newestAppVersionManifestHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewestAppVersionManifest
    = AutoDisposeAsyncNotifier<AppVersionManifest>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
