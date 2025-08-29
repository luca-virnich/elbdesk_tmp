// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_quarantine_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkQuarantineStateHash() =>
    r'f0f06ed599097ac64c1cee19f3f5586934a03e6a';

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

abstract class _$ArtworkQuarantineState
    extends BuildlessAutoDisposeAsyncNotifier<ArtworkQuarantine> {
  late final int entityId;
  late final String sessionId;

  FutureOr<ArtworkQuarantine> build(
    int entityId,
    String sessionId,
  );
}

/// Artwork Quarantine State
///
/// This state is used to manage artwork quarantine items
///
/// Copied from [ArtworkQuarantineState].
@ProviderFor(ArtworkQuarantineState)
const artworkQuarantineStateProvider = ArtworkQuarantineStateFamily();

/// Artwork Quarantine State
///
/// This state is used to manage artwork quarantine items
///
/// Copied from [ArtworkQuarantineState].
class ArtworkQuarantineStateFamily
    extends Family<AsyncValue<ArtworkQuarantine>> {
  /// Artwork Quarantine State
  ///
  /// This state is used to manage artwork quarantine items
  ///
  /// Copied from [ArtworkQuarantineState].
  const ArtworkQuarantineStateFamily();

  /// Artwork Quarantine State
  ///
  /// This state is used to manage artwork quarantine items
  ///
  /// Copied from [ArtworkQuarantineState].
  ArtworkQuarantineStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return ArtworkQuarantineStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  ArtworkQuarantineStateProvider getProviderOverride(
    covariant ArtworkQuarantineStateProvider provider,
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
  String? get name => r'artworkQuarantineStateProvider';
}

/// Artwork Quarantine State
///
/// This state is used to manage artwork quarantine items
///
/// Copied from [ArtworkQuarantineState].
class ArtworkQuarantineStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ArtworkQuarantineState,
        ArtworkQuarantine> {
  /// Artwork Quarantine State
  ///
  /// This state is used to manage artwork quarantine items
  ///
  /// Copied from [ArtworkQuarantineState].
  ArtworkQuarantineStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => ArtworkQuarantineState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: artworkQuarantineStateProvider,
          name: r'artworkQuarantineStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artworkQuarantineStateHash,
          dependencies: ArtworkQuarantineStateFamily._dependencies,
          allTransitiveDependencies:
              ArtworkQuarantineStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  ArtworkQuarantineStateProvider._internal(
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
  FutureOr<ArtworkQuarantine> runNotifierBuild(
    covariant ArtworkQuarantineState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(ArtworkQuarantineState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArtworkQuarantineStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ArtworkQuarantineState,
      ArtworkQuarantine> createElement() {
    return _ArtworkQuarantineStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtworkQuarantineStateProvider &&
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
mixin ArtworkQuarantineStateRef
    on AutoDisposeAsyncNotifierProviderRef<ArtworkQuarantine> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ArtworkQuarantineStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ArtworkQuarantineState,
        ArtworkQuarantine> with ArtworkQuarantineStateRef {
  _ArtworkQuarantineStateProviderElement(super.provider);

  @override
  int get entityId => (origin as ArtworkQuarantineStateProvider).entityId;
  @override
  String get sessionId => (origin as ArtworkQuarantineStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
