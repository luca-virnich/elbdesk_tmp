// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$globalSettingsRepositoryHash() =>
    r'e898fa6af7f652ffec1c8597d256fe88236d077e';

/// Global Settings Repository Provider
///
/// Copied from [globalSettingsRepository].
@ProviderFor(globalSettingsRepository)
final globalSettingsRepositoryProvider =
    AutoDisposeProvider<GlobalSettingsRepository>.internal(
  globalSettingsRepository,
  name: r'globalSettingsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$globalSettingsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GlobalSettingsRepositoryRef
    = AutoDisposeProviderRef<GlobalSettingsRepository>;
String _$watchGlobalSettingsInAdminCardHash() =>
    r'eda1b39ac73e819e82c3a1630d2163426eb40d7b';

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

/// Global Settings Stream Provider
///
///
/// Copied from [watchGlobalSettingsInAdminCard].
@ProviderFor(watchGlobalSettingsInAdminCard)
const watchGlobalSettingsInAdminCardProvider =
    WatchGlobalSettingsInAdminCardFamily();

/// Global Settings Stream Provider
///
///
/// Copied from [watchGlobalSettingsInAdminCard].
class WatchGlobalSettingsInAdminCardFamily
    extends Family<AsyncValue<GlobalSettings>> {
  /// Global Settings Stream Provider
  ///
  ///
  /// Copied from [watchGlobalSettingsInAdminCard].
  const WatchGlobalSettingsInAdminCardFamily();

  /// Global Settings Stream Provider
  ///
  ///
  /// Copied from [watchGlobalSettingsInAdminCard].
  WatchGlobalSettingsInAdminCardProvider call({
    required String sessionId,
    required int entityId,
  }) {
    return WatchGlobalSettingsInAdminCardProvider(
      sessionId: sessionId,
      entityId: entityId,
    );
  }

  @override
  WatchGlobalSettingsInAdminCardProvider getProviderOverride(
    covariant WatchGlobalSettingsInAdminCardProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      entityId: provider.entityId,
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
  String? get name => r'watchGlobalSettingsInAdminCardProvider';
}

/// Global Settings Stream Provider
///
///
/// Copied from [watchGlobalSettingsInAdminCard].
class WatchGlobalSettingsInAdminCardProvider
    extends AutoDisposeStreamProvider<GlobalSettings> {
  /// Global Settings Stream Provider
  ///
  ///
  /// Copied from [watchGlobalSettingsInAdminCard].
  WatchGlobalSettingsInAdminCardProvider({
    required String sessionId,
    required int entityId,
  }) : this._internal(
          (ref) => watchGlobalSettingsInAdminCard(
            ref as WatchGlobalSettingsInAdminCardRef,
            sessionId: sessionId,
            entityId: entityId,
          ),
          from: watchGlobalSettingsInAdminCardProvider,
          name: r'watchGlobalSettingsInAdminCardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchGlobalSettingsInAdminCardHash,
          dependencies: WatchGlobalSettingsInAdminCardFamily._dependencies,
          allTransitiveDependencies:
              WatchGlobalSettingsInAdminCardFamily._allTransitiveDependencies,
          sessionId: sessionId,
          entityId: entityId,
        );

  WatchGlobalSettingsInAdminCardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.entityId,
  }) : super.internal();

  final String sessionId;
  final int entityId;

  @override
  Override overrideWith(
    Stream<GlobalSettings> Function(WatchGlobalSettingsInAdminCardRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchGlobalSettingsInAdminCardProvider._internal(
        (ref) => create(ref as WatchGlobalSettingsInAdminCardRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        entityId: entityId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<GlobalSettings> createElement() {
    return _WatchGlobalSettingsInAdminCardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchGlobalSettingsInAdminCardProvider &&
        other.sessionId == sessionId &&
        other.entityId == entityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, entityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchGlobalSettingsInAdminCardRef
    on AutoDisposeStreamProviderRef<GlobalSettings> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `entityId` of this provider.
  int get entityId;
}

class _WatchGlobalSettingsInAdminCardProviderElement
    extends AutoDisposeStreamProviderElement<GlobalSettings>
    with WatchGlobalSettingsInAdminCardRef {
  _WatchGlobalSettingsInAdminCardProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchGlobalSettingsInAdminCardProvider).sessionId;
  @override
  int get entityId =>
      (origin as WatchGlobalSettingsInAdminCardProvider).entityId;
}

String _$watchGlobalSettingsHash() =>
    r'628d15b89523a6e8732351acad9da7042da416af';

/// See also [watchGlobalSettings].
@ProviderFor(watchGlobalSettings)
final watchGlobalSettingsProvider =
    AutoDisposeStreamProvider<GlobalSettings>.internal(
  watchGlobalSettings,
  name: r'watchGlobalSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchGlobalSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchGlobalSettingsRef = AutoDisposeStreamProviderRef<GlobalSettings>;
String _$fetchGlobalSettingsHash() =>
    r'921b6a4999c2a4354c321fb3ab9ca6e80a09369a';

/// Fetch First Global Settings Provider
///
/// There should only ever be one global settings object - This provider
/// fetches the first global settings object and throws an exception if
/// it is not found
///
/// If this exception is thrown, something went wrong.
/// The server should create a global setting on startup
/// -> Check SetupGlobalSettingsFutureCall for more information
///
/// Copied from [fetchGlobalSettings].
@ProviderFor(fetchGlobalSettings)
final fetchGlobalSettingsProvider =
    AutoDisposeFutureProvider<GlobalSettings>.internal(
  fetchGlobalSettings,
  name: r'fetchGlobalSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchGlobalSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchGlobalSettingsRef = AutoDisposeFutureProviderRef<GlobalSettings>;
String _$artworkQuarantineBaseFolderHash() =>
    r'801c72ed49b8081a18f89687f2890007d98f8a7c';

/// See also [artworkQuarantineBaseFolder].
@ProviderFor(artworkQuarantineBaseFolder)
final artworkQuarantineBaseFolderProvider =
    AutoDisposeProvider<String>.internal(
  artworkQuarantineBaseFolder,
  name: r'artworkQuarantineBaseFolderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$artworkQuarantineBaseFolderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArtworkQuarantineBaseFolderRef = AutoDisposeProviderRef<String>;
String _$fetchAndWatchGlobalSettingsHash() =>
    r'bcceba4f8b622a3b659455bd68d7423b2e3f7f8a';

/// See also [FetchAndWatchGlobalSettings].
@ProviderFor(FetchAndWatchGlobalSettings)
final fetchAndWatchGlobalSettingsProvider = AutoDisposeAsyncNotifierProvider<
    FetchAndWatchGlobalSettings, GlobalSettings>.internal(
  FetchAndWatchGlobalSettings.new,
  name: r'fetchAndWatchGlobalSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAndWatchGlobalSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FetchAndWatchGlobalSettings
    = AutoDisposeAsyncNotifier<GlobalSettings>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
