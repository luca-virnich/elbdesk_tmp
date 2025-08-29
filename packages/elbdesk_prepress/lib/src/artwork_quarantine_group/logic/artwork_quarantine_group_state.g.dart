// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_quarantine_group_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkQuarantineGroupDuplicateAttachmentsControllerHash() =>
    r'3d3e4346d9499a189f663fcf403a9e1817dda179';

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

/// Stream controller for duplicate attachment notifications
///
/// Broadcasts notifications when duplicate files are detected while adding
/// attachments to the group.
/// Used to trigger color animation highlight in attachment tiles.
/// This way the user can see which attachment is the duplicate.
///
/// Copied from [artworkQuarantineGroupDuplicateAttachmentsController].
@ProviderFor(artworkQuarantineGroupDuplicateAttachmentsController)
const artworkQuarantineGroupDuplicateAttachmentsControllerProvider =
    ArtworkQuarantineGroupDuplicateAttachmentsControllerFamily();

/// Stream controller for duplicate attachment notifications
///
/// Broadcasts notifications when duplicate files are detected while adding
/// attachments to the group.
/// Used to trigger color animation highlight in attachment tiles.
/// This way the user can see which attachment is the duplicate.
///
/// Copied from [artworkQuarantineGroupDuplicateAttachmentsController].
class ArtworkQuarantineGroupDuplicateAttachmentsControllerFamily
    extends Family<StreamController<({String uuid, List<String> paths})>> {
  /// Stream controller for duplicate attachment notifications
  ///
  /// Broadcasts notifications when duplicate files are detected while adding
  /// attachments to the group.
  /// Used to trigger color animation highlight in attachment tiles.
  /// This way the user can see which attachment is the duplicate.
  ///
  /// Copied from [artworkQuarantineGroupDuplicateAttachmentsController].
  const ArtworkQuarantineGroupDuplicateAttachmentsControllerFamily();

  /// Stream controller for duplicate attachment notifications
  ///
  /// Broadcasts notifications when duplicate files are detected while adding
  /// attachments to the group.
  /// Used to trigger color animation highlight in attachment tiles.
  /// This way the user can see which attachment is the duplicate.
  ///
  /// Copied from [artworkQuarantineGroupDuplicateAttachmentsController].
  ArtworkQuarantineGroupDuplicateAttachmentsControllerProvider call(
    int entityId,
    String sessionId,
  ) {
    return ArtworkQuarantineGroupDuplicateAttachmentsControllerProvider(
      entityId,
      sessionId,
    );
  }

  @override
  ArtworkQuarantineGroupDuplicateAttachmentsControllerProvider
      getProviderOverride(
    covariant ArtworkQuarantineGroupDuplicateAttachmentsControllerProvider
        provider,
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
  String? get name =>
      r'artworkQuarantineGroupDuplicateAttachmentsControllerProvider';
}

/// Stream controller for duplicate attachment notifications
///
/// Broadcasts notifications when duplicate files are detected while adding
/// attachments to the group.
/// Used to trigger color animation highlight in attachment tiles.
/// This way the user can see which attachment is the duplicate.
///
/// Copied from [artworkQuarantineGroupDuplicateAttachmentsController].
class ArtworkQuarantineGroupDuplicateAttachmentsControllerProvider
    extends AutoDisposeProvider<
        StreamController<({String uuid, List<String> paths})>> {
  /// Stream controller for duplicate attachment notifications
  ///
  /// Broadcasts notifications when duplicate files are detected while adding
  /// attachments to the group.
  /// Used to trigger color animation highlight in attachment tiles.
  /// This way the user can see which attachment is the duplicate.
  ///
  /// Copied from [artworkQuarantineGroupDuplicateAttachmentsController].
  ArtworkQuarantineGroupDuplicateAttachmentsControllerProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          (ref) => artworkQuarantineGroupDuplicateAttachmentsController(
            ref as ArtworkQuarantineGroupDuplicateAttachmentsControllerRef,
            entityId,
            sessionId,
          ),
          from: artworkQuarantineGroupDuplicateAttachmentsControllerProvider,
          name: r'artworkQuarantineGroupDuplicateAttachmentsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artworkQuarantineGroupDuplicateAttachmentsControllerHash,
          dependencies:
              ArtworkQuarantineGroupDuplicateAttachmentsControllerFamily
                  ._dependencies,
          allTransitiveDependencies:
              ArtworkQuarantineGroupDuplicateAttachmentsControllerFamily
                  ._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  ArtworkQuarantineGroupDuplicateAttachmentsControllerProvider._internal(
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
  Override overrideWith(
    StreamController<({String uuid, List<String> paths})> Function(
            ArtworkQuarantineGroupDuplicateAttachmentsControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArtworkQuarantineGroupDuplicateAttachmentsControllerProvider
          ._internal(
        (ref) => create(
            ref as ArtworkQuarantineGroupDuplicateAttachmentsControllerRef),
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
  AutoDisposeProviderElement<
      StreamController<({String uuid, List<String> paths})>> createElement() {
    return _ArtworkQuarantineGroupDuplicateAttachmentsControllerProviderElement(
        this);
  }

  @override
  bool operator ==(Object other) {
    return other
            is ArtworkQuarantineGroupDuplicateAttachmentsControllerProvider &&
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
mixin ArtworkQuarantineGroupDuplicateAttachmentsControllerRef
    on AutoDisposeProviderRef<
        StreamController<({String uuid, List<String> paths})>> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ArtworkQuarantineGroupDuplicateAttachmentsControllerProviderElement
    extends AutoDisposeProviderElement<
        StreamController<({String uuid, List<String> paths})>>
    with ArtworkQuarantineGroupDuplicateAttachmentsControllerRef {
  _ArtworkQuarantineGroupDuplicateAttachmentsControllerProviderElement(
      super.provider);

  @override
  int get entityId =>
      (origin as ArtworkQuarantineGroupDuplicateAttachmentsControllerProvider)
          .entityId;
  @override
  String get sessionId =>
      (origin as ArtworkQuarantineGroupDuplicateAttachmentsControllerProvider)
          .sessionId;
}

String _$artworkQuarantineGroupStateHash() =>
    r'582a4b85e1d587e9d437db1e329a7f631b9a55ed';

abstract class _$ArtworkQuarantineGroupState
    extends BuildlessAutoDisposeAsyncNotifier<ArtworkQuarantineGroup> {
  late final int entityId;
  late final String sessionId;

  FutureOr<ArtworkQuarantineGroup> build(
    int entityId,
    String sessionId,
  );
}

/// Artwork Quarantine Group State
///
/// This state is used to manage artwork quarantine group items
///
/// Copied from [ArtworkQuarantineGroupState].
@ProviderFor(ArtworkQuarantineGroupState)
const artworkQuarantineGroupStateProvider = ArtworkQuarantineGroupStateFamily();

/// Artwork Quarantine Group State
///
/// This state is used to manage artwork quarantine group items
///
/// Copied from [ArtworkQuarantineGroupState].
class ArtworkQuarantineGroupStateFamily
    extends Family<AsyncValue<ArtworkQuarantineGroup>> {
  /// Artwork Quarantine Group State
  ///
  /// This state is used to manage artwork quarantine group items
  ///
  /// Copied from [ArtworkQuarantineGroupState].
  const ArtworkQuarantineGroupStateFamily();

  /// Artwork Quarantine Group State
  ///
  /// This state is used to manage artwork quarantine group items
  ///
  /// Copied from [ArtworkQuarantineGroupState].
  ArtworkQuarantineGroupStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return ArtworkQuarantineGroupStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  ArtworkQuarantineGroupStateProvider getProviderOverride(
    covariant ArtworkQuarantineGroupStateProvider provider,
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
  String? get name => r'artworkQuarantineGroupStateProvider';
}

/// Artwork Quarantine Group State
///
/// This state is used to manage artwork quarantine group items
///
/// Copied from [ArtworkQuarantineGroupState].
class ArtworkQuarantineGroupStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ArtworkQuarantineGroupState,
        ArtworkQuarantineGroup> {
  /// Artwork Quarantine Group State
  ///
  /// This state is used to manage artwork quarantine group items
  ///
  /// Copied from [ArtworkQuarantineGroupState].
  ArtworkQuarantineGroupStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => ArtworkQuarantineGroupState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: artworkQuarantineGroupStateProvider,
          name: r'artworkQuarantineGroupStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artworkQuarantineGroupStateHash,
          dependencies: ArtworkQuarantineGroupStateFamily._dependencies,
          allTransitiveDependencies:
              ArtworkQuarantineGroupStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  ArtworkQuarantineGroupStateProvider._internal(
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
  FutureOr<ArtworkQuarantineGroup> runNotifierBuild(
    covariant ArtworkQuarantineGroupState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(ArtworkQuarantineGroupState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArtworkQuarantineGroupStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ArtworkQuarantineGroupState,
      ArtworkQuarantineGroup> createElement() {
    return _ArtworkQuarantineGroupStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtworkQuarantineGroupStateProvider &&
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
mixin ArtworkQuarantineGroupStateRef
    on AutoDisposeAsyncNotifierProviderRef<ArtworkQuarantineGroup> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ArtworkQuarantineGroupStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ArtworkQuarantineGroupState,
        ArtworkQuarantineGroup> with ArtworkQuarantineGroupStateRef {
  _ArtworkQuarantineGroupStateProviderElement(super.provider);

  @override
  int get entityId => (origin as ArtworkQuarantineGroupStateProvider).entityId;
  @override
  String get sessionId =>
      (origin as ArtworkQuarantineGroupStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
