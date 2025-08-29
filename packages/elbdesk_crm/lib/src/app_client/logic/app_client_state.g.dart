// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_client_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchAppClientHash() => r'40bfb126c8e814f710c5315a1ac406be05cf77d9';

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

/// See also [watchAppClient].
@ProviderFor(watchAppClient)
const watchAppClientProvider = WatchAppClientFamily();

/// See also [watchAppClient].
class WatchAppClientFamily extends Family<AsyncValue<AppClient>> {
  /// See also [watchAppClient].
  const WatchAppClientFamily();

  /// See also [watchAppClient].
  WatchAppClientProvider call({
    required String sessionId,
    required int appClientId,
  }) {
    return WatchAppClientProvider(
      sessionId: sessionId,
      appClientId: appClientId,
    );
  }

  @override
  WatchAppClientProvider getProviderOverride(
    covariant WatchAppClientProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      appClientId: provider.appClientId,
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
  String? get name => r'watchAppClientProvider';
}

/// See also [watchAppClient].
class WatchAppClientProvider extends AutoDisposeStreamProvider<AppClient> {
  /// See also [watchAppClient].
  WatchAppClientProvider({
    required String sessionId,
    required int appClientId,
  }) : this._internal(
          (ref) => watchAppClient(
            ref as WatchAppClientRef,
            sessionId: sessionId,
            appClientId: appClientId,
          ),
          from: watchAppClientProvider,
          name: r'watchAppClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchAppClientHash,
          dependencies: WatchAppClientFamily._dependencies,
          allTransitiveDependencies:
              WatchAppClientFamily._allTransitiveDependencies,
          sessionId: sessionId,
          appClientId: appClientId,
        );

  WatchAppClientProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.appClientId,
  }) : super.internal();

  final String sessionId;
  final int appClientId;

  @override
  Override overrideWith(
    Stream<AppClient> Function(WatchAppClientRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchAppClientProvider._internal(
        (ref) => create(ref as WatchAppClientRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        appClientId: appClientId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<AppClient> createElement() {
    return _WatchAppClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchAppClientProvider &&
        other.sessionId == sessionId &&
        other.appClientId == appClientId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, appClientId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchAppClientRef on AutoDisposeStreamProviderRef<AppClient> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `appClientId` of this provider.
  int get appClientId;
}

class _WatchAppClientProviderElement
    extends AutoDisposeStreamProviderElement<AppClient> with WatchAppClientRef {
  _WatchAppClientProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchAppClientProvider).sessionId;
  @override
  int get appClientId => (origin as WatchAppClientProvider).appClientId;
}

String _$appClientStateHash() => r'2b9338c0e1a0a0731171c320782f2baa9a7fd1a4';

abstract class _$AppClientState
    extends BuildlessAutoDisposeAsyncNotifier<AppClient> {
  late final int entityId;
  late final String sessionId;

  FutureOr<AppClient> build(
    int entityId,
    String sessionId,
  );
}

/// @nodoc
///
/// Copied from [AppClientState].
@ProviderFor(AppClientState)
const appClientStateProvider = AppClientStateFamily();

/// @nodoc
///
/// Copied from [AppClientState].
class AppClientStateFamily extends Family<AsyncValue<AppClient>> {
  /// @nodoc
  ///
  /// Copied from [AppClientState].
  const AppClientStateFamily();

  /// @nodoc
  ///
  /// Copied from [AppClientState].
  AppClientStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return AppClientStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  AppClientStateProvider getProviderOverride(
    covariant AppClientStateProvider provider,
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
  String? get name => r'appClientStateProvider';
}

/// @nodoc
///
/// Copied from [AppClientState].
class AppClientStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AppClientState, AppClient> {
  /// @nodoc
  ///
  /// Copied from [AppClientState].
  AppClientStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => AppClientState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: appClientStateProvider,
          name: r'appClientStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appClientStateHash,
          dependencies: AppClientStateFamily._dependencies,
          allTransitiveDependencies:
              AppClientStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  AppClientStateProvider._internal(
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
  FutureOr<AppClient> runNotifierBuild(
    covariant AppClientState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(AppClientState Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppClientStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<AppClientState, AppClient>
      createElement() {
    return _AppClientStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppClientStateProvider &&
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
mixin AppClientStateRef on AutoDisposeAsyncNotifierProviderRef<AppClient> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _AppClientStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AppClientState, AppClient>
    with AppClientStateRef {
  _AppClientStateProviderElement(super.provider);

  @override
  int get entityId => (origin as AppClientStateProvider).entityId;
  @override
  String get sessionId => (origin as AppClientStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
