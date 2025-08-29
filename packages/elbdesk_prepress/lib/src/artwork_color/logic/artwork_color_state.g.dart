// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_color_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkColorStateHash() => r'c0ad4e840008b5f3ea30de7e06a8e80d815bf03a';

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

abstract class _$ArtworkColorState
    extends BuildlessAutoDisposeAsyncNotifier<ArtworkColor> {
  late final int entityId;
  late final String sessionId;

  FutureOr<ArtworkColor> build(
    int entityId,
    String sessionId,
  );
}

/// ArtworkColor State
///
/// This state is used to manage and update the color currently displayed
///
/// Copied from [ArtworkColorState].
@ProviderFor(ArtworkColorState)
const artworkColorStateProvider = ArtworkColorStateFamily();

/// ArtworkColor State
///
/// This state is used to manage and update the color currently displayed
///
/// Copied from [ArtworkColorState].
class ArtworkColorStateFamily extends Family<AsyncValue<ArtworkColor>> {
  /// ArtworkColor State
  ///
  /// This state is used to manage and update the color currently displayed
  ///
  /// Copied from [ArtworkColorState].
  const ArtworkColorStateFamily();

  /// ArtworkColor State
  ///
  /// This state is used to manage and update the color currently displayed
  ///
  /// Copied from [ArtworkColorState].
  ArtworkColorStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return ArtworkColorStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  ArtworkColorStateProvider getProviderOverride(
    covariant ArtworkColorStateProvider provider,
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
  String? get name => r'artworkColorStateProvider';
}

/// ArtworkColor State
///
/// This state is used to manage and update the color currently displayed
///
/// Copied from [ArtworkColorState].
class ArtworkColorStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ArtworkColorState, ArtworkColor> {
  /// ArtworkColor State
  ///
  /// This state is used to manage and update the color currently displayed
  ///
  /// Copied from [ArtworkColorState].
  ArtworkColorStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => ArtworkColorState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: artworkColorStateProvider,
          name: r'artworkColorStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artworkColorStateHash,
          dependencies: ArtworkColorStateFamily._dependencies,
          allTransitiveDependencies:
              ArtworkColorStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  ArtworkColorStateProvider._internal(
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
  FutureOr<ArtworkColor> runNotifierBuild(
    covariant ArtworkColorState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(ArtworkColorState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArtworkColorStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ArtworkColorState, ArtworkColor>
      createElement() {
    return _ArtworkColorStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtworkColorStateProvider &&
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
mixin ArtworkColorStateRef
    on AutoDisposeAsyncNotifierProviderRef<ArtworkColor> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ArtworkColorStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ArtworkColorState,
        ArtworkColor> with ArtworkColorStateRef {
  _ArtworkColorStateProviderElement(super.provider);

  @override
  int get entityId => (origin as ArtworkColorStateProvider).entityId;
  @override
  String get sessionId => (origin as ArtworkColorStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
