// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_template_pre_selection_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkTemplatePreSelectionStateHash() =>
    r'3a8689938c61f53524887270c2e9bffd284064ca';

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

abstract class _$ArtworkTemplatePreSelectionState
    extends BuildlessAutoDisposeAsyncNotifier<ArtworkTemplatePreSelection> {
  late final int entityId;
  late final String sessionId;

  FutureOr<ArtworkTemplatePreSelection> build(
    int entityId,
    String sessionId,
  );
}

/// See also [ArtworkTemplatePreSelectionState].
@ProviderFor(ArtworkTemplatePreSelectionState)
const artworkTemplatePreSelectionStateProvider =
    ArtworkTemplatePreSelectionStateFamily();

/// See also [ArtworkTemplatePreSelectionState].
class ArtworkTemplatePreSelectionStateFamily
    extends Family<AsyncValue<ArtworkTemplatePreSelection>> {
  /// See also [ArtworkTemplatePreSelectionState].
  const ArtworkTemplatePreSelectionStateFamily();

  /// See also [ArtworkTemplatePreSelectionState].
  ArtworkTemplatePreSelectionStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return ArtworkTemplatePreSelectionStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  ArtworkTemplatePreSelectionStateProvider getProviderOverride(
    covariant ArtworkTemplatePreSelectionStateProvider provider,
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
  String? get name => r'artworkTemplatePreSelectionStateProvider';
}

/// See also [ArtworkTemplatePreSelectionState].
class ArtworkTemplatePreSelectionStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        ArtworkTemplatePreSelectionState, ArtworkTemplatePreSelection> {
  /// See also [ArtworkTemplatePreSelectionState].
  ArtworkTemplatePreSelectionStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => ArtworkTemplatePreSelectionState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: artworkTemplatePreSelectionStateProvider,
          name: r'artworkTemplatePreSelectionStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artworkTemplatePreSelectionStateHash,
          dependencies: ArtworkTemplatePreSelectionStateFamily._dependencies,
          allTransitiveDependencies:
              ArtworkTemplatePreSelectionStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  ArtworkTemplatePreSelectionStateProvider._internal(
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
  FutureOr<ArtworkTemplatePreSelection> runNotifierBuild(
    covariant ArtworkTemplatePreSelectionState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(ArtworkTemplatePreSelectionState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArtworkTemplatePreSelectionStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ArtworkTemplatePreSelectionState,
      ArtworkTemplatePreSelection> createElement() {
    return _ArtworkTemplatePreSelectionStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtworkTemplatePreSelectionStateProvider &&
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
mixin ArtworkTemplatePreSelectionStateRef
    on AutoDisposeAsyncNotifierProviderRef<ArtworkTemplatePreSelection> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ArtworkTemplatePreSelectionStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        ArtworkTemplatePreSelectionState,
        ArtworkTemplatePreSelection> with ArtworkTemplatePreSelectionStateRef {
  _ArtworkTemplatePreSelectionStateProviderElement(super.provider);

  @override
  int get entityId =>
      (origin as ArtworkTemplatePreSelectionStateProvider).entityId;
  @override
  String get sessionId =>
      (origin as ArtworkTemplatePreSelectionStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
