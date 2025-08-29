// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isAdminHash() => r'7959d715a7703a03aa6dca1e9bd4410b0e6bad7b';

/// Is Admin Provider
///
/// This indicates if the current user is an admin
///
/// Copied from [isAdmin].
@ProviderFor(isAdmin)
final isAdminProvider = AutoDisposeProvider<bool>.internal(
  isAdmin,
  name: r'isAdminProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isAdminHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsAdminRef = AutoDisposeProviderRef<bool>;
String _$isCrmAdminHash() => r'e7b93d53d17691e6902fdadaeeb74700632e3f47';

/// Is CRM Admin Provider
///
/// This indicates if the current user is a CRM admin with access to
/// CRM resources and customer-specific data
///
/// Copied from [isCrmAdmin].
@ProviderFor(isCrmAdmin)
final isCrmAdminProvider = AutoDisposeProvider<bool>.internal(
  isCrmAdmin,
  name: r'isCrmAdminProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isCrmAdminHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsCrmAdminRef = AutoDisposeProviderRef<bool>;
String _$isMopAdminHash() => r'09f7faace42af214f02ef2b4ea4ed5a25035c92c';

/// Is MOP Admin Provider
///
/// This indicates if the current user is a Prepress admin with access to
/// prepress resources and artwork-related data
///
/// Copied from [isMopAdmin].
@ProviderFor(isMopAdmin)
final isMopAdminProvider = AutoDisposeProvider<bool>.internal(
  isMopAdmin,
  name: r'isMopAdminProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isMopAdminHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsMopAdminRef = AutoDisposeProviderRef<bool>;
String _$isSuperAdminHash() => r'61397fef5cd0664114014f510813830a41b52799';

/// Is super admin provider
///
/// Checks if the current user is a super admin
///
/// Copied from [isSuperAdmin].
@ProviderFor(isSuperAdmin)
final isSuperAdminProvider = AutoDisposeProvider<bool>.internal(
  isSuperAdmin,
  name: r'isSuperAdminProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isSuperAdminHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsSuperAdminRef = AutoDisposeProviderRef<bool>;
String _$authHash() => r'40b54a984f5f5476f583621a0944045aa364bed4';

/// The authentication provider
///
/// Copied from [auth].
@ProviderFor(auth)
final authProvider = AutoDisposeProvider<Auth>.internal(
  auth,
  name: r'authProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRef = AutoDisposeProviderRef<Auth>;
String _$watchAppUserUpdatesHash() =>
    r'018d9eec4bcaee4b1c31e74645cc84028033977b';

/// See also [watchAppUserUpdates].
@ProviderFor(watchAppUserUpdates)
final watchAppUserUpdatesProvider = AutoDisposeStreamProvider<AppUser>.internal(
  watchAppUserUpdates,
  name: r'watchAppUserUpdatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAppUserUpdatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAppUserUpdatesRef = AutoDisposeStreamProviderRef<AppUser>;
String _$currentAppUserStateHash() =>
    r'6a8e5ca4ccf242b18aeeb715a1a8eb3a5c0a22a0';

/// The state of the current logged in user from serverpod (Serverpod build-in
/// UserInfo model)
///
/// Copied from [CurrentAppUserState].
@ProviderFor(CurrentAppUserState)
final currentAppUserStateProvider =
    AutoDisposeAsyncNotifierProvider<CurrentAppUserState, AppUser>.internal(
  CurrentAppUserState.new,
  name: r'currentAppUserStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentAppUserStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentAppUserState = AutoDisposeAsyncNotifier<AppUser>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
