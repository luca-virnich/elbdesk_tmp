// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prepress_color_palette_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$prepressColorPaletteStateHash() =>
    r'e07c995e798ece6c0fe0bd8c14e695818c185d6a';

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

abstract class _$PrepressColorPaletteState
    extends BuildlessAutoDisposeAsyncNotifier<PrepressColorPalette> {
  late final int entityId;
  late final String sessionId;

  FutureOr<PrepressColorPalette> build(
    int entityId,
    String sessionId,
  );
}

/// Color Book State
///
/// This state is used to manage and update the color book currently displayed
///
/// Copied from [PrepressColorPaletteState].
@ProviderFor(PrepressColorPaletteState)
const prepressColorPaletteStateProvider = PrepressColorPaletteStateFamily();

/// Color Book State
///
/// This state is used to manage and update the color book currently displayed
///
/// Copied from [PrepressColorPaletteState].
class PrepressColorPaletteStateFamily
    extends Family<AsyncValue<PrepressColorPalette>> {
  /// Color Book State
  ///
  /// This state is used to manage and update the color book currently displayed
  ///
  /// Copied from [PrepressColorPaletteState].
  const PrepressColorPaletteStateFamily();

  /// Color Book State
  ///
  /// This state is used to manage and update the color book currently displayed
  ///
  /// Copied from [PrepressColorPaletteState].
  PrepressColorPaletteStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return PrepressColorPaletteStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  PrepressColorPaletteStateProvider getProviderOverride(
    covariant PrepressColorPaletteStateProvider provider,
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
  String? get name => r'prepressColorPaletteStateProvider';
}

/// Color Book State
///
/// This state is used to manage and update the color book currently displayed
///
/// Copied from [PrepressColorPaletteState].
class PrepressColorPaletteStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PrepressColorPaletteState,
        PrepressColorPalette> {
  /// Color Book State
  ///
  /// This state is used to manage and update the color book currently displayed
  ///
  /// Copied from [PrepressColorPaletteState].
  PrepressColorPaletteStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => PrepressColorPaletteState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: prepressColorPaletteStateProvider,
          name: r'prepressColorPaletteStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$prepressColorPaletteStateHash,
          dependencies: PrepressColorPaletteStateFamily._dependencies,
          allTransitiveDependencies:
              PrepressColorPaletteStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  PrepressColorPaletteStateProvider._internal(
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
  FutureOr<PrepressColorPalette> runNotifierBuild(
    covariant PrepressColorPaletteState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(PrepressColorPaletteState Function() create) {
    return ProviderOverride(
      origin: this,
      override: PrepressColorPaletteStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PrepressColorPaletteState,
      PrepressColorPalette> createElement() {
    return _PrepressColorPaletteStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PrepressColorPaletteStateProvider &&
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
mixin PrepressColorPaletteStateRef
    on AutoDisposeAsyncNotifierProviderRef<PrepressColorPalette> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _PrepressColorPaletteStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PrepressColorPaletteState,
        PrepressColorPalette> with PrepressColorPaletteStateRef {
  _PrepressColorPaletteStateProviderElement(super.provider);

  @override
  int get entityId => (origin as PrepressColorPaletteStateProvider).entityId;
  @override
  String get sessionId =>
      (origin as PrepressColorPaletteStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
