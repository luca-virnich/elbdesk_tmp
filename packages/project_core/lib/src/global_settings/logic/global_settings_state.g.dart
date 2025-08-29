// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_settings_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$globalSettingsStateHash() =>
    r'90b513350b869d972823e32181b1a73de291dcd1';

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

abstract class _$GlobalSettingsState
    extends BuildlessAutoDisposeAsyncNotifier<GlobalSettings> {
  late final int entityId;
  late final String sessionId;

  FutureOr<GlobalSettings> build(
    int entityId,
    String sessionId,
  );
}

/// GlobalSettings State
///
/// This state is used to manage and update the global settings
///
/// Copied from [GlobalSettingsState].
@ProviderFor(GlobalSettingsState)
const globalSettingsStateProvider = GlobalSettingsStateFamily();

/// GlobalSettings State
///
/// This state is used to manage and update the global settings
///
/// Copied from [GlobalSettingsState].
class GlobalSettingsStateFamily extends Family<AsyncValue<GlobalSettings>> {
  /// GlobalSettings State
  ///
  /// This state is used to manage and update the global settings
  ///
  /// Copied from [GlobalSettingsState].
  const GlobalSettingsStateFamily();

  /// GlobalSettings State
  ///
  /// This state is used to manage and update the global settings
  ///
  /// Copied from [GlobalSettingsState].
  GlobalSettingsStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return GlobalSettingsStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  GlobalSettingsStateProvider getProviderOverride(
    covariant GlobalSettingsStateProvider provider,
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
  String? get name => r'globalSettingsStateProvider';
}

/// GlobalSettings State
///
/// This state is used to manage and update the global settings
///
/// Copied from [GlobalSettingsState].
class GlobalSettingsStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    GlobalSettingsState, GlobalSettings> {
  /// GlobalSettings State
  ///
  /// This state is used to manage and update the global settings
  ///
  /// Copied from [GlobalSettingsState].
  GlobalSettingsStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => GlobalSettingsState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: globalSettingsStateProvider,
          name: r'globalSettingsStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$globalSettingsStateHash,
          dependencies: GlobalSettingsStateFamily._dependencies,
          allTransitiveDependencies:
              GlobalSettingsStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  GlobalSettingsStateProvider._internal(
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
  FutureOr<GlobalSettings> runNotifierBuild(
    covariant GlobalSettingsState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(GlobalSettingsState Function() create) {
    return ProviderOverride(
      origin: this,
      override: GlobalSettingsStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<GlobalSettingsState, GlobalSettings>
      createElement() {
    return _GlobalSettingsStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GlobalSettingsStateProvider &&
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
mixin GlobalSettingsStateRef
    on AutoDisposeAsyncNotifierProviderRef<GlobalSettings> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _GlobalSettingsStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GlobalSettingsState,
        GlobalSettings> with GlobalSettingsStateRef {
  _GlobalSettingsStateProviderElement(super.provider);

  @override
  int get entityId => (origin as GlobalSettingsStateProvider).entityId;
  @override
  String get sessionId => (origin as GlobalSettingsStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
