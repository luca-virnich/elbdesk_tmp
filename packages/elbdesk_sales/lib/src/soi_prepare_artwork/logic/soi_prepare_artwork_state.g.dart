// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soi_prepare_artwork_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$soiPrepareArtworkStateHash() =>
    r'7ebc66068612a6eaac42d0e29bb94ce712aa1511';

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

abstract class _$SoiPrepareArtworkState
    extends BuildlessAutoDisposeAsyncNotifier<SoiPrepareArtwork> {
  late final int entityId;
  late final String sessionId;

  FutureOr<SoiPrepareArtwork> build(
    int entityId,
    String sessionId,
  );
}

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SoiPrepareArtworkState].
@ProviderFor(SoiPrepareArtworkState)
const soiPrepareArtworkStateProvider = SoiPrepareArtworkStateFamily();

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SoiPrepareArtworkState].
class SoiPrepareArtworkStateFamily
    extends Family<AsyncValue<SoiPrepareArtwork>> {
  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SoiPrepareArtworkState].
  const SoiPrepareArtworkStateFamily();

  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SoiPrepareArtworkState].
  SoiPrepareArtworkStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return SoiPrepareArtworkStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  SoiPrepareArtworkStateProvider getProviderOverride(
    covariant SoiPrepareArtworkStateProvider provider,
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
  String? get name => r'soiPrepareArtworkStateProvider';
}

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SoiPrepareArtworkState].
class SoiPrepareArtworkStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SoiPrepareArtworkState,
        SoiPrepareArtwork> {
  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SoiPrepareArtworkState].
  SoiPrepareArtworkStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => SoiPrepareArtworkState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: soiPrepareArtworkStateProvider,
          name: r'soiPrepareArtworkStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$soiPrepareArtworkStateHash,
          dependencies: SoiPrepareArtworkStateFamily._dependencies,
          allTransitiveDependencies:
              SoiPrepareArtworkStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  SoiPrepareArtworkStateProvider._internal(
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
  FutureOr<SoiPrepareArtwork> runNotifierBuild(
    covariant SoiPrepareArtworkState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(SoiPrepareArtworkState Function() create) {
    return ProviderOverride(
      origin: this,
      override: SoiPrepareArtworkStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SoiPrepareArtworkState,
      SoiPrepareArtwork> createElement() {
    return _SoiPrepareArtworkStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SoiPrepareArtworkStateProvider &&
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
mixin SoiPrepareArtworkStateRef
    on AutoDisposeAsyncNotifierProviderRef<SoiPrepareArtwork> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SoiPrepareArtworkStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SoiPrepareArtworkState,
        SoiPrepareArtwork> with SoiPrepareArtworkStateRef {
  _SoiPrepareArtworkStateProviderElement(super.provider);

  @override
  int get entityId => (origin as SoiPrepareArtworkStateProvider).entityId;
  @override
  String get sessionId => (origin as SoiPrepareArtworkStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
