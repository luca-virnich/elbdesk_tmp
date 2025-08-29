// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soi_einzelformaufbau_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$soiEinzelformaufbauStateHash() =>
    r'47f0e2ba658f6e733741e74f200e104ba52415b6';

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

abstract class _$SoiEinzelformaufbauState
    extends BuildlessAutoDisposeAsyncNotifier<SoiEinzelformaufbau> {
  late final int entityId;
  late final String sessionId;

  FutureOr<SoiEinzelformaufbau> build(
    int entityId,
    String sessionId,
  );
}

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SoiEinzelformaufbauState].
@ProviderFor(SoiEinzelformaufbauState)
const soiEinzelformaufbauStateProvider = SoiEinzelformaufbauStateFamily();

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SoiEinzelformaufbauState].
class SoiEinzelformaufbauStateFamily
    extends Family<AsyncValue<SoiEinzelformaufbau>> {
  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SoiEinzelformaufbauState].
  const SoiEinzelformaufbauStateFamily();

  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SoiEinzelformaufbauState].
  SoiEinzelformaufbauStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return SoiEinzelformaufbauStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  SoiEinzelformaufbauStateProvider getProviderOverride(
    covariant SoiEinzelformaufbauStateProvider provider,
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
  String? get name => r'soiEinzelformaufbauStateProvider';
}

/// Sales Order State
///
/// This state is used to manage and update the sales order details
///
/// Copied from [SoiEinzelformaufbauState].
class SoiEinzelformaufbauStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SoiEinzelformaufbauState,
        SoiEinzelformaufbau> {
  /// Sales Order State
  ///
  /// This state is used to manage and update the sales order details
  ///
  /// Copied from [SoiEinzelformaufbauState].
  SoiEinzelformaufbauStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => SoiEinzelformaufbauState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: soiEinzelformaufbauStateProvider,
          name: r'soiEinzelformaufbauStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$soiEinzelformaufbauStateHash,
          dependencies: SoiEinzelformaufbauStateFamily._dependencies,
          allTransitiveDependencies:
              SoiEinzelformaufbauStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  SoiEinzelformaufbauStateProvider._internal(
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
  FutureOr<SoiEinzelformaufbau> runNotifierBuild(
    covariant SoiEinzelformaufbauState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(SoiEinzelformaufbauState Function() create) {
    return ProviderOverride(
      origin: this,
      override: SoiEinzelformaufbauStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SoiEinzelformaufbauState,
      SoiEinzelformaufbau> createElement() {
    return _SoiEinzelformaufbauStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SoiEinzelformaufbauStateProvider &&
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
mixin SoiEinzelformaufbauStateRef
    on AutoDisposeAsyncNotifierProviderRef<SoiEinzelformaufbau> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SoiEinzelformaufbauStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SoiEinzelformaufbauState,
        SoiEinzelformaufbau> with SoiEinzelformaufbauStateRef {
  _SoiEinzelformaufbauStateProviderElement(super.provider);

  @override
  int get entityId => (origin as SoiEinzelformaufbauStateProvider).entityId;
  @override
  String get sessionId =>
      (origin as SoiEinzelformaufbauStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
