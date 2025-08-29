// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soi_consulting_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$soiConsultingStateHash() =>
    r'3dce55bf7bf78624c26aa8570eac31ef8ce6f7cb';

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

abstract class _$SoiConsultingState
    extends BuildlessAutoDisposeAsyncNotifier<SoiConsulting> {
  late final int entityId;
  late final String sessionId;

  FutureOr<SoiConsulting> build(
    int entityId,
    String sessionId,
  );
}

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SoiConsultingState].
@ProviderFor(SoiConsultingState)
const soiConsultingStateProvider = SoiConsultingStateFamily();

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SoiConsultingState].
class SoiConsultingStateFamily extends Family<AsyncValue<SoiConsulting>> {
  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SoiConsultingState].
  const SoiConsultingStateFamily();

  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SoiConsultingState].
  SoiConsultingStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return SoiConsultingStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  SoiConsultingStateProvider getProviderOverride(
    covariant SoiConsultingStateProvider provider,
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
  String? get name => r'soiConsultingStateProvider';
}

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SoiConsultingState].
class SoiConsultingStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SoiConsultingState, SoiConsulting> {
  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SoiConsultingState].
  SoiConsultingStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => SoiConsultingState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: soiConsultingStateProvider,
          name: r'soiConsultingStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$soiConsultingStateHash,
          dependencies: SoiConsultingStateFamily._dependencies,
          allTransitiveDependencies:
              SoiConsultingStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  SoiConsultingStateProvider._internal(
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
  FutureOr<SoiConsulting> runNotifierBuild(
    covariant SoiConsultingState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(SoiConsultingState Function() create) {
    return ProviderOverride(
      origin: this,
      override: SoiConsultingStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SoiConsultingState, SoiConsulting>
      createElement() {
    return _SoiConsultingStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SoiConsultingStateProvider &&
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
mixin SoiConsultingStateRef
    on AutoDisposeAsyncNotifierProviderRef<SoiConsulting> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SoiConsultingStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SoiConsultingState,
        SoiConsulting> with SoiConsultingStateRef {
  _SoiConsultingStateProviderElement(super.provider);

  @override
  int get entityId => (origin as SoiConsultingStateProvider).entityId;
  @override
  String get sessionId => (origin as SoiConsultingStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
