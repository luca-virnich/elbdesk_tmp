// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_code_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentCodeStateHash() => r'dd6d60833015dc3c05f8d13e6625a758ee8dc5c3';

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

abstract class _$PaymentCodeState
    extends BuildlessAutoDisposeAsyncNotifier<PaymentCode> {
  late final int entityId;
  late final String sessionId;

  FutureOr<PaymentCode> build(
    int entityId,
    String sessionId,
  );
}

/// See also [PaymentCodeState].
@ProviderFor(PaymentCodeState)
const paymentCodeStateProvider = PaymentCodeStateFamily();

/// See also [PaymentCodeState].
class PaymentCodeStateFamily extends Family<AsyncValue<PaymentCode>> {
  /// See also [PaymentCodeState].
  const PaymentCodeStateFamily();

  /// See also [PaymentCodeState].
  PaymentCodeStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return PaymentCodeStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  PaymentCodeStateProvider getProviderOverride(
    covariant PaymentCodeStateProvider provider,
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
  String? get name => r'paymentCodeStateProvider';
}

/// See also [PaymentCodeState].
class PaymentCodeStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PaymentCodeState, PaymentCode> {
  /// See also [PaymentCodeState].
  PaymentCodeStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => PaymentCodeState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: paymentCodeStateProvider,
          name: r'paymentCodeStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paymentCodeStateHash,
          dependencies: PaymentCodeStateFamily._dependencies,
          allTransitiveDependencies:
              PaymentCodeStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  PaymentCodeStateProvider._internal(
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
  FutureOr<PaymentCode> runNotifierBuild(
    covariant PaymentCodeState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(PaymentCodeState Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaymentCodeStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PaymentCodeState, PaymentCode>
      createElement() {
    return _PaymentCodeStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentCodeStateProvider &&
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
mixin PaymentCodeStateRef on AutoDisposeAsyncNotifierProviderRef<PaymentCode> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _PaymentCodeStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PaymentCodeState,
        PaymentCode> with PaymentCodeStateRef {
  _PaymentCodeStateProviderElement(super.provider);

  @override
  int get entityId => (origin as PaymentCodeStateProvider).entityId;
  @override
  String get sessionId => (origin as PaymentCodeStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
