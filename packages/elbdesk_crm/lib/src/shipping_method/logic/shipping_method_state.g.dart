// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_method_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shippingMethodStateHash() =>
    r'b47f82776d5bfd95fa2ec5d27ac2ce32b4bfc528';

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

abstract class _$ShippingMethodState
    extends BuildlessAutoDisposeAsyncNotifier<ShippingMethod> {
  late final int entityId;
  late final String sessionId;

  FutureOr<ShippingMethod> build(
    int entityId,
    String sessionId,
  );
}

/// See also [ShippingMethodState].
@ProviderFor(ShippingMethodState)
const shippingMethodStateProvider = ShippingMethodStateFamily();

/// See also [ShippingMethodState].
class ShippingMethodStateFamily extends Family<AsyncValue<ShippingMethod>> {
  /// See also [ShippingMethodState].
  const ShippingMethodStateFamily();

  /// See also [ShippingMethodState].
  ShippingMethodStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return ShippingMethodStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  ShippingMethodStateProvider getProviderOverride(
    covariant ShippingMethodStateProvider provider,
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
  String? get name => r'shippingMethodStateProvider';
}

/// See also [ShippingMethodState].
class ShippingMethodStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ShippingMethodState, ShippingMethod> {
  /// See also [ShippingMethodState].
  ShippingMethodStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => ShippingMethodState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: shippingMethodStateProvider,
          name: r'shippingMethodStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shippingMethodStateHash,
          dependencies: ShippingMethodStateFamily._dependencies,
          allTransitiveDependencies:
              ShippingMethodStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  ShippingMethodStateProvider._internal(
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
  FutureOr<ShippingMethod> runNotifierBuild(
    covariant ShippingMethodState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(ShippingMethodState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ShippingMethodStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ShippingMethodState, ShippingMethod>
      createElement() {
    return _ShippingMethodStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShippingMethodStateProvider &&
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
mixin ShippingMethodStateRef
    on AutoDisposeAsyncNotifierProviderRef<ShippingMethod> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _ShippingMethodStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ShippingMethodState,
        ShippingMethod> with ShippingMethodStateRef {
  _ShippingMethodStateProviderElement(super.provider);

  @override
  int get entityId => (origin as ShippingMethodStateProvider).entityId;
  @override
  String get sessionId => (origin as ShippingMethodStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
