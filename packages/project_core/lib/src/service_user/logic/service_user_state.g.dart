// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_user_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchServiceUserHash() => r'781e4f58e57fa5083ebfa737f05c975882a42adc';

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

/// See also [watchServiceUser].
@ProviderFor(watchServiceUser)
const watchServiceUserProvider = WatchServiceUserFamily();

/// See also [watchServiceUser].
class WatchServiceUserFamily extends Family<AsyncValue<ServiceUser>> {
  /// See also [watchServiceUser].
  const WatchServiceUserFamily();

  /// See also [watchServiceUser].
  WatchServiceUserProvider call({
    required String sessionId,
    required int serviceUserId,
  }) {
    return WatchServiceUserProvider(
      sessionId: sessionId,
      serviceUserId: serviceUserId,
    );
  }

  @override
  WatchServiceUserProvider getProviderOverride(
    covariant WatchServiceUserProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      serviceUserId: provider.serviceUserId,
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
  String? get name => r'watchServiceUserProvider';
}

/// See also [watchServiceUser].
class WatchServiceUserProvider extends AutoDisposeStreamProvider<ServiceUser> {
  /// See also [watchServiceUser].
  WatchServiceUserProvider({
    required String sessionId,
    required int serviceUserId,
  }) : this._internal(
          (ref) => watchServiceUser(
            ref as WatchServiceUserRef,
            sessionId: sessionId,
            serviceUserId: serviceUserId,
          ),
          from: watchServiceUserProvider,
          name: r'watchServiceUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchServiceUserHash,
          dependencies: WatchServiceUserFamily._dependencies,
          allTransitiveDependencies:
              WatchServiceUserFamily._allTransitiveDependencies,
          sessionId: sessionId,
          serviceUserId: serviceUserId,
        );

  WatchServiceUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.serviceUserId,
  }) : super.internal();

  final String sessionId;
  final int serviceUserId;

  @override
  Override overrideWith(
    Stream<ServiceUser> Function(WatchServiceUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchServiceUserProvider._internal(
        (ref) => create(ref as WatchServiceUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        serviceUserId: serviceUserId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ServiceUser> createElement() {
    return _WatchServiceUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchServiceUserProvider &&
        other.sessionId == sessionId &&
        other.serviceUserId == serviceUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, serviceUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchServiceUserRef on AutoDisposeStreamProviderRef<ServiceUser> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `serviceUserId` of this provider.
  int get serviceUserId;
}

class _WatchServiceUserProviderElement
    extends AutoDisposeStreamProviderElement<ServiceUser>
    with WatchServiceUserRef {
  _WatchServiceUserProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchServiceUserProvider).sessionId;
  @override
  int get serviceUserId => (origin as WatchServiceUserProvider).serviceUserId;
}

String _$serviceUserStateHash() => r'bcc90de2557d34963a9d8f945674b80271567d7a';

abstract class _$ServiceUserState
    extends BuildlessAutoDisposeAsyncNotifier<ServiceUser> {
  late final int entityId;
  late final String sessionId;

  FutureOr<ServiceUser> build(
    int entityId,
    String sessionId,
  );
}

/// ServiceUser State
///
/// This state is used to manage and update the serviceUser details
///
/// Copied from [ServiceUserState].
@ProviderFor(ServiceUserState)
const serviceUserStateProvider = ServiceUserStateFamily();

/// ServiceUser State
///
/// This state is used to manage and update the serviceUser details
///
/// Copied from [ServiceUserState].
class ServiceUserStateFamily extends Family<AsyncValue<ServiceUser>> {
  /// ServiceUser State
  ///
  /// This state is used to manage and update the serviceUser details
  ///
  /// Copied from [ServiceUserState].
  const ServiceUserStateFamily();

  /// ServiceUser State
  ///
  /// This state is used to manage and update the serviceUser details
  ///
  /// Copied from [ServiceUserState].
  ServiceUserStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return ServiceUserStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  ServiceUserStateProvider getProviderOverride(
    covariant ServiceUserStateProvider provider,
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
  String? get name => r'serviceUserStateProvider';
}

/// ServiceUser State
///
/// This state is used to manage and update the serviceUser details
///
/// Copied from [ServiceUserState].
class ServiceUserStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ServiceUserState, ServiceUser> {
  /// ServiceUser State
  ///
  /// This state is used to manage and update the serviceUser details
  ///
  /// Copied from [ServiceUserState].
  ServiceUserStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => ServiceUserState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: serviceUserStateProvider,
          name: r'serviceUserStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$serviceUserStateHash,
          dependencies: ServiceUserStateFamily._dependencies,
          allTransitiveDependencies:
              ServiceUserStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  ServiceUserStateProvider._internal(
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
  FutureOr<ServiceUser> runNotifierBuild(
    covariant ServiceUserState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(ServiceUserState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ServiceUserStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ServiceUserState, ServiceUser>
      createElement() {
    return _ServiceUserStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ServiceUserStateProvider &&
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
mixin ServiceUserStateRef on AutoDisposeAsyncNotifierProviderRef<ServiceUser> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ServiceUserStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ServiceUserState,
        ServiceUser> with ServiceUserStateRef {
  _ServiceUserStateProviderElement(super.provider);

  @override
  int get entityId => (origin as ServiceUserStateProvider).entityId;
  @override
  String get sessionId => (origin as ServiceUserStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
