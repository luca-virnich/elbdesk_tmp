// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crm_event_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$crmEventStateHash() => r'3dcd1bed23bd7a56e1c8a2fe79006f6642c6c324';

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

abstract class _$CrmEventState
    extends BuildlessAutoDisposeAsyncNotifier<CrmEvent> {
  late final int entityId;
  late final String sessionId;

  FutureOr<CrmEvent> build(
    int entityId,
    String sessionId,
  );
}

/// The State of the current CRM event.
///
/// Copied from [CrmEventState].
@ProviderFor(CrmEventState)
const crmEventStateProvider = CrmEventStateFamily();

/// The State of the current CRM event.
///
/// Copied from [CrmEventState].
class CrmEventStateFamily extends Family<AsyncValue<CrmEvent>> {
  /// The State of the current CRM event.
  ///
  /// Copied from [CrmEventState].
  const CrmEventStateFamily();

  /// The State of the current CRM event.
  ///
  /// Copied from [CrmEventState].
  CrmEventStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return CrmEventStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  CrmEventStateProvider getProviderOverride(
    covariant CrmEventStateProvider provider,
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
  String? get name => r'crmEventStateProvider';
}

/// The State of the current CRM event.
///
/// Copied from [CrmEventState].
class CrmEventStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CrmEventState, CrmEvent> {
  /// The State of the current CRM event.
  ///
  /// Copied from [CrmEventState].
  CrmEventStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => CrmEventState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: crmEventStateProvider,
          name: r'crmEventStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$crmEventStateHash,
          dependencies: CrmEventStateFamily._dependencies,
          allTransitiveDependencies:
              CrmEventStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  CrmEventStateProvider._internal(
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
  FutureOr<CrmEvent> runNotifierBuild(
    covariant CrmEventState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(CrmEventState Function() create) {
    return ProviderOverride(
      origin: this,
      override: CrmEventStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CrmEventState, CrmEvent>
      createElement() {
    return _CrmEventStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CrmEventStateProvider &&
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
mixin CrmEventStateRef on AutoDisposeAsyncNotifierProviderRef<CrmEvent> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _CrmEventStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CrmEventState, CrmEvent>
    with CrmEventStateRef {
  _CrmEventStateProviderElement(super.provider);

  @override
  int get entityId => (origin as CrmEventStateProvider).entityId;
  @override
  String get sessionId => (origin as CrmEventStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
