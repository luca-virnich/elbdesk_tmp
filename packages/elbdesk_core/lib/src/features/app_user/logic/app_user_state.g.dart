// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchAppUserHash() => r'c769a8070302d06702c9e264f0b186d31a3dbd56';

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

/// See also [watchAppUser].
@ProviderFor(watchAppUser)
const watchAppUserProvider = WatchAppUserFamily();

/// See also [watchAppUser].
class WatchAppUserFamily extends Family<AsyncValue<AppUser>> {
  /// See also [watchAppUser].
  const WatchAppUserFamily();

  /// See also [watchAppUser].
  WatchAppUserProvider call({
    required String sessionId,
    required int appUserId,
  }) {
    return WatchAppUserProvider(
      sessionId: sessionId,
      appUserId: appUserId,
    );
  }

  @override
  WatchAppUserProvider getProviderOverride(
    covariant WatchAppUserProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      appUserId: provider.appUserId,
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
  String? get name => r'watchAppUserProvider';
}

/// See also [watchAppUser].
class WatchAppUserProvider extends AutoDisposeStreamProvider<AppUser> {
  /// See also [watchAppUser].
  WatchAppUserProvider({
    required String sessionId,
    required int appUserId,
  }) : this._internal(
          (ref) => watchAppUser(
            ref as WatchAppUserRef,
            sessionId: sessionId,
            appUserId: appUserId,
          ),
          from: watchAppUserProvider,
          name: r'watchAppUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchAppUserHash,
          dependencies: WatchAppUserFamily._dependencies,
          allTransitiveDependencies:
              WatchAppUserFamily._allTransitiveDependencies,
          sessionId: sessionId,
          appUserId: appUserId,
        );

  WatchAppUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.appUserId,
  }) : super.internal();

  final String sessionId;
  final int appUserId;

  @override
  Override overrideWith(
    Stream<AppUser> Function(WatchAppUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchAppUserProvider._internal(
        (ref) => create(ref as WatchAppUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        appUserId: appUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<AppUser> createElement() {
    return _WatchAppUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchAppUserProvider &&
        other.sessionId == sessionId &&
        other.appUserId == appUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, appUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchAppUserRef on AutoDisposeStreamProviderRef<AppUser> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `appUserId` of this provider.
  int get appUserId;
}

class _WatchAppUserProviderElement
    extends AutoDisposeStreamProviderElement<AppUser> with WatchAppUserRef {
  _WatchAppUserProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchAppUserProvider).sessionId;
  @override
  int get appUserId => (origin as WatchAppUserProvider).appUserId;
}

String _$appUserStateHash() => r'5741c708ebe40360d4b0ce464c31e9290d5cb1bd';

abstract class _$AppUserState
    extends BuildlessAutoDisposeAsyncNotifier<AppUser> {
  late final int entityId;
  late final String sessionId;

  FutureOr<AppUser> build(
    int entityId,
    String sessionId,
  );
}

/// AppUser State
///
/// This state is used to manage and update the appUser details
///
/// Copied from [AppUserState].
@ProviderFor(AppUserState)
const appUserStateProvider = AppUserStateFamily();

/// AppUser State
///
/// This state is used to manage and update the appUser details
///
/// Copied from [AppUserState].
class AppUserStateFamily extends Family<AsyncValue<AppUser>> {
  /// AppUser State
  ///
  /// This state is used to manage and update the appUser details
  ///
  /// Copied from [AppUserState].
  const AppUserStateFamily();

  /// AppUser State
  ///
  /// This state is used to manage and update the appUser details
  ///
  /// Copied from [AppUserState].
  AppUserStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return AppUserStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  AppUserStateProvider getProviderOverride(
    covariant AppUserStateProvider provider,
  ) {
    return call(
      provider.entityId,
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
  String? get name => r'appUserStateProvider';
}

/// AppUser State
///
/// This state is used to manage and update the appUser details
///
/// Copied from [AppUserState].
class AppUserStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AppUserState, AppUser> {
  /// AppUser State
  ///
  /// This state is used to manage and update the appUser details
  ///
  /// Copied from [AppUserState].
  AppUserStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => AppUserState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: appUserStateProvider,
          name: r'appUserStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appUserStateHash,
          dependencies: AppUserStateFamily._dependencies,
          allTransitiveDependencies:
              AppUserStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  AppUserStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entityId,
    required this.sessionId,
  }) : super.internal();

  final int entityId;
  final String sessionId;

  @override
  FutureOr<AppUser> runNotifierBuild(
    covariant AppUserState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(AppUserState Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppUserStateProvider._internal(
        () => create()
          ..entityId = entityId
          ..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entityId: entityId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AppUserState, AppUser>
      createElement() {
    return _AppUserStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppUserStateProvider &&
        other.entityId == entityId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppUserStateRef on AutoDisposeAsyncNotifierProviderRef<AppUser> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _AppUserStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AppUserState, AppUser>
    with AppUserStateRef {
  _AppUserStateProviderElement(super.provider);

  @override
  int get entityId => (origin as AppUserStateProvider).entityId;
  @override
  String get sessionId => (origin as AppUserStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
