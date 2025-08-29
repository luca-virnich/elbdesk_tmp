// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soi_request_artwork_approval_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$soiRequestArtworkApprovalStateHash() =>
    r'59c37a96171266fc58274b76db5d52739f3f1703';

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

abstract class _$SoiRequestArtworkApprovalState
    extends BuildlessAutoDisposeAsyncNotifier<SoiRequestArtworkApproval> {
  late final int entityId;
  late final String sessionId;

  FutureOr<SoiRequestArtworkApproval> build(
    int entityId,
    String sessionId,
  );
}

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SoiRequestArtworkApprovalState].
@ProviderFor(SoiRequestArtworkApprovalState)
const soiRequestArtworkApprovalStateProvider =
    SoiRequestArtworkApprovalStateFamily();

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SoiRequestArtworkApprovalState].
class SoiRequestArtworkApprovalStateFamily
    extends Family<AsyncValue<SoiRequestArtworkApproval>> {
  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SoiRequestArtworkApprovalState].
  const SoiRequestArtworkApprovalStateFamily();

  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SoiRequestArtworkApprovalState].
  SoiRequestArtworkApprovalStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return SoiRequestArtworkApprovalStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  SoiRequestArtworkApprovalStateProvider getProviderOverride(
    covariant SoiRequestArtworkApprovalStateProvider provider,
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
  String? get name => r'soiRequestArtworkApprovalStateProvider';
}

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SoiRequestArtworkApprovalState].
class SoiRequestArtworkApprovalStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SoiRequestArtworkApprovalState,
        SoiRequestArtworkApproval> {
  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SoiRequestArtworkApprovalState].
  SoiRequestArtworkApprovalStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => SoiRequestArtworkApprovalState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: soiRequestArtworkApprovalStateProvider,
          name: r'soiRequestArtworkApprovalStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$soiRequestArtworkApprovalStateHash,
          dependencies: SoiRequestArtworkApprovalStateFamily._dependencies,
          allTransitiveDependencies:
              SoiRequestArtworkApprovalStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  SoiRequestArtworkApprovalStateProvider._internal(
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
  FutureOr<SoiRequestArtworkApproval> runNotifierBuild(
    covariant SoiRequestArtworkApprovalState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(SoiRequestArtworkApprovalState Function() create) {
    return ProviderOverride(
      origin: this,
      override: SoiRequestArtworkApprovalStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SoiRequestArtworkApprovalState,
      SoiRequestArtworkApproval> createElement() {
    return _SoiRequestArtworkApprovalStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SoiRequestArtworkApprovalStateProvider &&
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
mixin SoiRequestArtworkApprovalStateRef
    on AutoDisposeAsyncNotifierProviderRef<SoiRequestArtworkApproval> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SoiRequestArtworkApprovalStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        SoiRequestArtworkApprovalState,
        SoiRequestArtworkApproval> with SoiRequestArtworkApprovalStateRef {
  _SoiRequestArtworkApprovalStateProviderElement(super.provider);

  @override
  int get entityId =>
      (origin as SoiRequestArtworkApprovalStateProvider).entityId;
  @override
  String get sessionId =>
      (origin as SoiRequestArtworkApprovalStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
