// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_template_selection_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkTemplateSelectionStateHash() =>
    r'f34ac6729d003b27acdc8347cbcd66a9c9f79afd';

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

abstract class _$ArtworkTemplateSelectionState
    extends BuildlessAutoDisposeAsyncNotifier<ArtworkTemplateSelection> {
  late final int entityId;
  late final String sessionId;

  FutureOr<ArtworkTemplateSelection> build(
    int entityId,
    String sessionId,
  );
}

/// See also [ArtworkTemplateSelectionState].
@ProviderFor(ArtworkTemplateSelectionState)
const artworkTemplateSelectionStateProvider =
    ArtworkTemplateSelectionStateFamily();

/// See also [ArtworkTemplateSelectionState].
class ArtworkTemplateSelectionStateFamily
    extends Family<AsyncValue<ArtworkTemplateSelection>> {
  /// See also [ArtworkTemplateSelectionState].
  const ArtworkTemplateSelectionStateFamily();

  /// See also [ArtworkTemplateSelectionState].
  ArtworkTemplateSelectionStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return ArtworkTemplateSelectionStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  ArtworkTemplateSelectionStateProvider getProviderOverride(
    covariant ArtworkTemplateSelectionStateProvider provider,
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
  String? get name => r'artworkTemplateSelectionStateProvider';
}

/// See also [ArtworkTemplateSelectionState].
class ArtworkTemplateSelectionStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ArtworkTemplateSelectionState,
        ArtworkTemplateSelection> {
  /// See also [ArtworkTemplateSelectionState].
  ArtworkTemplateSelectionStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => ArtworkTemplateSelectionState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: artworkTemplateSelectionStateProvider,
          name: r'artworkTemplateSelectionStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artworkTemplateSelectionStateHash,
          dependencies: ArtworkTemplateSelectionStateFamily._dependencies,
          allTransitiveDependencies:
              ArtworkTemplateSelectionStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  ArtworkTemplateSelectionStateProvider._internal(
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
  FutureOr<ArtworkTemplateSelection> runNotifierBuild(
    covariant ArtworkTemplateSelectionState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(ArtworkTemplateSelectionState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArtworkTemplateSelectionStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ArtworkTemplateSelectionState,
      ArtworkTemplateSelection> createElement() {
    return _ArtworkTemplateSelectionStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtworkTemplateSelectionStateProvider &&
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
mixin ArtworkTemplateSelectionStateRef
    on AutoDisposeAsyncNotifierProviderRef<ArtworkTemplateSelection> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ArtworkTemplateSelectionStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        ArtworkTemplateSelectionState,
        ArtworkTemplateSelection> with ArtworkTemplateSelectionStateRef {
  _ArtworkTemplateSelectionStateProviderElement(super.provider);

  @override
  int get entityId =>
      (origin as ArtworkTemplateSelectionStateProvider).entityId;
  @override
  String get sessionId =>
      (origin as ArtworkTemplateSelectionStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
