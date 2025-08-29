// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lightUserRepositoryHash() =>
    r'a6c44785b33a1e2d935fdd761a92b5979e7e0d74';

/// See also [lightUserRepository].
@ProviderFor(lightUserRepository)
final lightUserRepositoryProvider =
    AutoDisposeProvider<LightUserRepository>.internal(
  lightUserRepository,
  name: r'lightUserRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lightUserRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LightUserRepositoryRef = AutoDisposeProviderRef<LightUserRepository>;
String _$watchLightUserStreamHash() =>
    r'918e0701967c650abec68db0591b0b149fdf7896';

/// See also [watchLightUserStream].
@ProviderFor(watchLightUserStream)
final watchLightUserStreamProvider =
    AutoDisposeStreamProvider<LightUser>.internal(
  watchLightUserStream,
  name: r'watchLightUserStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchLightUserStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchLightUserStreamRef = AutoDisposeStreamProviderRef<LightUser>;
String _$watchAllActiveLightUsersHash() =>
    r'bec3ec9fde8a11460f380c80c8c8478df2696be2';

/// See also [watchAllActiveLightUsers].
@ProviderFor(watchAllActiveLightUsers)
final watchAllActiveLightUsersProvider =
    AutoDisposeFutureProvider<List<LightUser>>.internal(
  watchAllActiveLightUsers,
  name: r'watchAllActiveLightUsersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAllActiveLightUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllActiveLightUsersRef
    = AutoDisposeFutureProviderRef<List<LightUser>>;
String _$watchAllInactiveLightUsersHash() =>
    r'adf1c836958ce8157745a68bb7057a7f33787a23';

/// See also [watchAllInactiveLightUsers].
@ProviderFor(watchAllInactiveLightUsers)
final watchAllInactiveLightUsersProvider =
    AutoDisposeFutureProvider<List<LightUser>>.internal(
  watchAllInactiveLightUsers,
  name: r'watchAllInactiveLightUsersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAllInactiveLightUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllInactiveLightUsersRef
    = AutoDisposeFutureProviderRef<List<LightUser>>;
String _$fetchLocalLightUserByUserInfoIdHash() =>
    r'8f399495754b829a763ca4e6979fe02884d9687e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchLocalLightUserByUserInfoId].
@ProviderFor(fetchLocalLightUserByUserInfoId)
const fetchLocalLightUserByUserInfoIdProvider =
    FetchLocalLightUserByUserInfoIdFamily();

/// See also [fetchLocalLightUserByUserInfoId].
class FetchLocalLightUserByUserInfoIdFamily extends Family<LightUser> {
  /// See also [fetchLocalLightUserByUserInfoId].
  const FetchLocalLightUserByUserInfoIdFamily();

  /// See also [fetchLocalLightUserByUserInfoId].
  FetchLocalLightUserByUserInfoIdProvider call(
    int userInfoId,
  ) {
    return FetchLocalLightUserByUserInfoIdProvider(
      userInfoId,
    );
  }

  @override
  FetchLocalLightUserByUserInfoIdProvider getProviderOverride(
    covariant FetchLocalLightUserByUserInfoIdProvider provider,
  ) {
    return call(
      provider.userInfoId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchLocalLightUserByUserInfoIdProvider';
}

/// See also [fetchLocalLightUserByUserInfoId].
class FetchLocalLightUserByUserInfoIdProvider
    extends AutoDisposeProvider<LightUser> {
  /// See also [fetchLocalLightUserByUserInfoId].
  FetchLocalLightUserByUserInfoIdProvider(
    int userInfoId,
  ) : this._internal(
          (ref) => fetchLocalLightUserByUserInfoId(
            ref as FetchLocalLightUserByUserInfoIdRef,
            userInfoId,
          ),
          from: fetchLocalLightUserByUserInfoIdProvider,
          name: r'fetchLocalLightUserByUserInfoIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchLocalLightUserByUserInfoIdHash,
          dependencies: FetchLocalLightUserByUserInfoIdFamily._dependencies,
          allTransitiveDependencies:
              FetchLocalLightUserByUserInfoIdFamily._allTransitiveDependencies,
          userInfoId: userInfoId,
        );

  FetchLocalLightUserByUserInfoIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userInfoId,
  }) : super.internal();

  final int userInfoId;

  @override
  Override overrideWith(
    LightUser Function(FetchLocalLightUserByUserInfoIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchLocalLightUserByUserInfoIdProvider._internal(
        (ref) => create(ref as FetchLocalLightUserByUserInfoIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userInfoId: userInfoId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<LightUser> createElement() {
    return _FetchLocalLightUserByUserInfoIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchLocalLightUserByUserInfoIdProvider &&
        other.userInfoId == userInfoId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userInfoId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchLocalLightUserByUserInfoIdRef on AutoDisposeProviderRef<LightUser> {
  /// The parameter `userInfoId` of this provider.
  int get userInfoId;
}

class _FetchLocalLightUserByUserInfoIdProviderElement
    extends AutoDisposeProviderElement<LightUser>
    with FetchLocalLightUserByUserInfoIdRef {
  _FetchLocalLightUserByUserInfoIdProviderElement(super.provider);

  @override
  int get userInfoId =>
      (origin as FetchLocalLightUserByUserInfoIdProvider).userInfoId;
}

String _$fetchLocalLightUserByLightUserIdHash() =>
    r'30ca7781d904e8ff5715df54890356660c29569d';

/// See also [fetchLocalLightUserByLightUserId].
@ProviderFor(fetchLocalLightUserByLightUserId)
const fetchLocalLightUserByLightUserIdProvider =
    FetchLocalLightUserByLightUserIdFamily();

/// See also [fetchLocalLightUserByLightUserId].
class FetchLocalLightUserByLightUserIdFamily extends Family<LightUser> {
  /// See also [fetchLocalLightUserByLightUserId].
  const FetchLocalLightUserByLightUserIdFamily();

  /// See also [fetchLocalLightUserByLightUserId].
  FetchLocalLightUserByLightUserIdProvider call(
    int lightUserId,
  ) {
    return FetchLocalLightUserByLightUserIdProvider(
      lightUserId,
    );
  }

  @override
  FetchLocalLightUserByLightUserIdProvider getProviderOverride(
    covariant FetchLocalLightUserByLightUserIdProvider provider,
  ) {
    return call(
      provider.lightUserId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchLocalLightUserByLightUserIdProvider';
}

/// See also [fetchLocalLightUserByLightUserId].
class FetchLocalLightUserByLightUserIdProvider
    extends AutoDisposeProvider<LightUser> {
  /// See also [fetchLocalLightUserByLightUserId].
  FetchLocalLightUserByLightUserIdProvider(
    int lightUserId,
  ) : this._internal(
          (ref) => fetchLocalLightUserByLightUserId(
            ref as FetchLocalLightUserByLightUserIdRef,
            lightUserId,
          ),
          from: fetchLocalLightUserByLightUserIdProvider,
          name: r'fetchLocalLightUserByLightUserIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchLocalLightUserByLightUserIdHash,
          dependencies: FetchLocalLightUserByLightUserIdFamily._dependencies,
          allTransitiveDependencies:
              FetchLocalLightUserByLightUserIdFamily._allTransitiveDependencies,
          lightUserId: lightUserId,
        );

  FetchLocalLightUserByLightUserIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lightUserId,
  }) : super.internal();

  final int lightUserId;

  @override
  Override overrideWith(
    LightUser Function(FetchLocalLightUserByLightUserIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchLocalLightUserByLightUserIdProvider._internal(
        (ref) => create(ref as FetchLocalLightUserByLightUserIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lightUserId: lightUserId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<LightUser> createElement() {
    return _FetchLocalLightUserByLightUserIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchLocalLightUserByLightUserIdProvider &&
        other.lightUserId == lightUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lightUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchLocalLightUserByLightUserIdRef on AutoDisposeProviderRef<LightUser> {
  /// The parameter `lightUserId` of this provider.
  int get lightUserId;
}

class _FetchLocalLightUserByLightUserIdProviderElement
    extends AutoDisposeProviderElement<LightUser>
    with FetchLocalLightUserByLightUserIdRef {
  _FetchLocalLightUserByLightUserIdProviderElement(super.provider);

  @override
  int get lightUserId =>
      (origin as FetchLocalLightUserByLightUserIdProvider).lightUserId;
}

String _$cachedLightUserMapByUserInfoIdHash() =>
    r'4ebc0ff733d1e8406f593867f632c50a448219fc';

/// See also [CachedLightUserMapByUserInfoId].
@ProviderFor(CachedLightUserMapByUserInfoId)
final cachedLightUserMapByUserInfoIdProvider = AutoDisposeNotifierProvider<
    CachedLightUserMapByUserInfoId, Map<int, LightUser>>.internal(
  CachedLightUserMapByUserInfoId.new,
  name: r'cachedLightUserMapByUserInfoIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cachedLightUserMapByUserInfoIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CachedLightUserMapByUserInfoId
    = AutoDisposeNotifier<Map<int, LightUser>>;
String _$cachedLightUserMapByLightUserIdHash() =>
    r'ef804734483c421151f2e0c51dd7f88c610a4fd4';

/// See also [CachedLightUserMapByLightUserId].
@ProviderFor(CachedLightUserMapByLightUserId)
final cachedLightUserMapByLightUserIdProvider = AutoDisposeNotifierProvider<
    CachedLightUserMapByLightUserId, Map<int, LightUser>>.internal(
  CachedLightUserMapByLightUserId.new,
  name: r'cachedLightUserMapByLightUserIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cachedLightUserMapByLightUserIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CachedLightUserMapByLightUserId
    = AutoDisposeNotifier<Map<int, LightUser>>;
String _$watchAllLightUsersHash() =>
    r'4295ec6e47aae5c7abca3b50285607fce0415058';

/// See also [WatchAllLightUsers].
@ProviderFor(WatchAllLightUsers)
final watchAllLightUsersProvider = AutoDisposeAsyncNotifierProvider<
    WatchAllLightUsers, List<LightUser>>.internal(
  WatchAllLightUsers.new,
  name: r'watchAllLightUsersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAllLightUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WatchAllLightUsers = AutoDisposeAsyncNotifier<List<LightUser>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
