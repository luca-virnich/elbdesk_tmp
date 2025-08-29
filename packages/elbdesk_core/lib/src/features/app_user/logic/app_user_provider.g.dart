// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appUserRepositoryHash() => r'5499cef53dd9ee854bcbfacd5539c93ba1418e8e';

/// App User Repository Provider
///
/// Copied from [appUserRepository].
@ProviderFor(appUserRepository)
final appUserRepositoryProvider =
    AutoDisposeProvider<AppUserRepository>.internal(
  appUserRepository,
  name: r'appUserRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appUserRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppUserRepositoryRef = AutoDisposeProviderRef<AppUserRepository>;
String _$hasAppUsersHash() => r'da183fa30ec84991146d6090dd5e674320d3ffe3';

/// See also [hasAppUsers].
@ProviderFor(hasAppUsers)
final hasAppUsersProvider = AutoDisposeFutureProvider<bool>.internal(
  hasAppUsers,
  name: r'hasAppUsersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$hasAppUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HasAppUsersRef = AutoDisposeFutureProviderRef<bool>;
String _$fetchAppUserHash() => r'cbc1bbce0e184ee3f1fe5495db24ef55b1fe9058';

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

/// Fetch App User Provider
///
/// Copied from [fetchAppUser].
@ProviderFor(fetchAppUser)
const fetchAppUserProvider = FetchAppUserFamily();

/// Fetch App User Provider
///
/// Copied from [fetchAppUser].
class FetchAppUserFamily extends Family<AsyncValue<AppUser?>> {
  /// Fetch App User Provider
  ///
  /// Copied from [fetchAppUser].
  const FetchAppUserFamily();

  /// Fetch App User Provider
  ///
  /// Copied from [fetchAppUser].
  FetchAppUserProvider call(
    int appUserId,
    String sessionId,
  ) {
    return FetchAppUserProvider(
      appUserId,
      sessionId,
    );
  }

  @override
  FetchAppUserProvider getProviderOverride(
    covariant FetchAppUserProvider provider,
  ) {
    return call(
      provider.appUserId,
      provider.sessionId,
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
  String? get name => r'fetchAppUserProvider';
}

/// Fetch App User Provider
///
/// Copied from [fetchAppUser].
class FetchAppUserProvider extends AutoDisposeFutureProvider<AppUser?> {
  /// Fetch App User Provider
  ///
  /// Copied from [fetchAppUser].
  FetchAppUserProvider(
    int appUserId,
    String sessionId,
  ) : this._internal(
          (ref) => fetchAppUser(
            ref as FetchAppUserRef,
            appUserId,
            sessionId,
          ),
          from: fetchAppUserProvider,
          name: r'fetchAppUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAppUserHash,
          dependencies: FetchAppUserFamily._dependencies,
          allTransitiveDependencies:
              FetchAppUserFamily._allTransitiveDependencies,
          appUserId: appUserId,
          sessionId: sessionId,
        );

  FetchAppUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appUserId,
    required this.sessionId,
  }) : super.internal();

  final int appUserId;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<AppUser?> Function(FetchAppUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAppUserProvider._internal(
        (ref) => create(ref as FetchAppUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appUserId: appUserId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AppUser?> createElement() {
    return _FetchAppUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAppUserProvider &&
        other.appUserId == appUserId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appUserId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchAppUserRef on AutoDisposeFutureProviderRef<AppUser?> {
  /// The parameter `appUserId` of this provider.
  int get appUserId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchAppUserProviderElement
    extends AutoDisposeFutureProviderElement<AppUser?> with FetchAppUserRef {
  _FetchAppUserProviderElement(super.provider);

  @override
  int get appUserId => (origin as FetchAppUserProvider).appUserId;
  @override
  String get sessionId => (origin as FetchAppUserProvider).sessionId;
}

String _$findAppUsersHash() => r'2f6a3765da2670c84dead6d86f5679c12d285028';

/// Fetch App Users Provider
///
/// Fetches a list of app users from the server
/// Sort and Filter are fetched from the table state through the sessionId
///
/// Copied from [findAppUsers].
@ProviderFor(findAppUsers)
const findAppUsersProvider = FindAppUsersFamily();

/// Fetch App Users Provider
///
/// Fetches a list of app users from the server
/// Sort and Filter are fetched from the table state through the sessionId
///
/// Copied from [findAppUsers].
class FindAppUsersFamily extends Family<AsyncValue<List<AppUser>>> {
  /// Fetch App Users Provider
  ///
  /// Fetches a list of app users from the server
  /// Sort and Filter are fetched from the table state through the sessionId
  ///
  /// Copied from [findAppUsers].
  const FindAppUsersFamily();

  /// Fetch App Users Provider
  ///
  /// Fetches a list of app users from the server
  /// Sort and Filter are fetched from the table state through the sessionId
  ///
  /// Copied from [findAppUsers].
  FindAppUsersProvider call(
    String sessionId,
  ) {
    return FindAppUsersProvider(
      sessionId,
    );
  }

  @override
  FindAppUsersProvider getProviderOverride(
    covariant FindAppUsersProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'findAppUsersProvider';
}

/// Fetch App Users Provider
///
/// Fetches a list of app users from the server
/// Sort and Filter are fetched from the table state through the sessionId
///
/// Copied from [findAppUsers].
class FindAppUsersProvider extends AutoDisposeFutureProvider<List<AppUser>> {
  /// Fetch App Users Provider
  ///
  /// Fetches a list of app users from the server
  /// Sort and Filter are fetched from the table state through the sessionId
  ///
  /// Copied from [findAppUsers].
  FindAppUsersProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findAppUsers(
            ref as FindAppUsersRef,
            sessionId,
          ),
          from: findAppUsersProvider,
          name: r'findAppUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findAppUsersHash,
          dependencies: FindAppUsersFamily._dependencies,
          allTransitiveDependencies:
              FindAppUsersFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindAppUsersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<AppUser>> Function(FindAppUsersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindAppUsersProvider._internal(
        (ref) => create(ref as FindAppUsersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<AppUser>> createElement() {
    return _FindAppUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindAppUsersProvider && other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindAppUsersRef on AutoDisposeFutureProviderRef<List<AppUser>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindAppUsersProviderElement
    extends AutoDisposeFutureProviderElement<List<AppUser>>
    with FindAppUsersRef {
  _FindAppUsersProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindAppUsersProvider).sessionId;
}

String _$fetchAllAppUsersHash() => r'33e0699c5b496bcb95b87f4cb1514c8fee09ac08';

/// See also [fetchAllAppUsers].
@ProviderFor(fetchAllAppUsers)
const fetchAllAppUsersProvider = FetchAllAppUsersFamily();

/// See also [fetchAllAppUsers].
class FetchAllAppUsersFamily extends Family<AsyncValue<List<AppUser>>> {
  /// See also [fetchAllAppUsers].
  const FetchAllAppUsersFamily();

  /// See also [fetchAllAppUsers].
  FetchAllAppUsersProvider call(
    String sessionId,
  ) {
    return FetchAllAppUsersProvider(
      sessionId,
    );
  }

  @override
  FetchAllAppUsersProvider getProviderOverride(
    covariant FetchAllAppUsersProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'fetchAllAppUsersProvider';
}

/// See also [fetchAllAppUsers].
class FetchAllAppUsersProvider
    extends AutoDisposeFutureProvider<List<AppUser>> {
  /// See also [fetchAllAppUsers].
  FetchAllAppUsersProvider(
    String sessionId,
  ) : this._internal(
          (ref) => fetchAllAppUsers(
            ref as FetchAllAppUsersRef,
            sessionId,
          ),
          from: fetchAllAppUsersProvider,
          name: r'fetchAllAppUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAllAppUsersHash,
          dependencies: FetchAllAppUsersFamily._dependencies,
          allTransitiveDependencies:
              FetchAllAppUsersFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FetchAllAppUsersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<AppUser>> Function(FetchAllAppUsersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAllAppUsersProvider._internal(
        (ref) => create(ref as FetchAllAppUsersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<AppUser>> createElement() {
    return _FetchAllAppUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAllAppUsersProvider && other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchAllAppUsersRef on AutoDisposeFutureProviderRef<List<AppUser>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchAllAppUsersProviderElement
    extends AutoDisposeFutureProviderElement<List<AppUser>>
    with FetchAllAppUsersRef {
  _FetchAllAppUsersProviderElement(super.provider);

  @override
  String get sessionId => (origin as FetchAllAppUsersProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
