// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchCustomerHash() => r'85467381d1d4cbf8a98cc2c8cccc5492d8d91891';

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

/// See also [watchCustomer].
@ProviderFor(watchCustomer)
const watchCustomerProvider = WatchCustomerFamily();

/// See also [watchCustomer].
class WatchCustomerFamily extends Family<AsyncValue<Customer>> {
  /// See also [watchCustomer].
  const WatchCustomerFamily();

  /// See also [watchCustomer].
  WatchCustomerProvider call({
    required String sessionId,
    required int customerId,
  }) {
    return WatchCustomerProvider(
      sessionId: sessionId,
      customerId: customerId,
    );
  }

  @override
  WatchCustomerProvider getProviderOverride(
    covariant WatchCustomerProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      customerId: provider.customerId,
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
  String? get name => r'watchCustomerProvider';
}

/// See also [watchCustomer].
class WatchCustomerProvider extends AutoDisposeStreamProvider<Customer> {
  /// See also [watchCustomer].
  WatchCustomerProvider({
    required String sessionId,
    required int customerId,
  }) : this._internal(
          (ref) => watchCustomer(
            ref as WatchCustomerRef,
            sessionId: sessionId,
            customerId: customerId,
          ),
          from: watchCustomerProvider,
          name: r'watchCustomerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCustomerHash,
          dependencies: WatchCustomerFamily._dependencies,
          allTransitiveDependencies:
              WatchCustomerFamily._allTransitiveDependencies,
          sessionId: sessionId,
          customerId: customerId,
        );

  WatchCustomerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.customerId,
  }) : super.internal();

  final String sessionId;
  final int customerId;

  @override
  Override overrideWith(
    Stream<Customer> Function(WatchCustomerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCustomerProvider._internal(
        (ref) => create(ref as WatchCustomerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Customer> createElement() {
    return _WatchCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCustomerProvider &&
        other.sessionId == sessionId &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchCustomerRef on AutoDisposeStreamProviderRef<Customer> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _WatchCustomerProviderElement
    extends AutoDisposeStreamProviderElement<Customer> with WatchCustomerRef {
  _WatchCustomerProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchCustomerProvider).sessionId;
  @override
  int get customerId => (origin as WatchCustomerProvider).customerId;
}

String _$customerStateHash() => r'b01a09a5a27841c0e5ba88b7922e1c5d9b613b8a';

abstract class _$CustomerState
    extends BuildlessAutoDisposeAsyncNotifier<Customer> {
  late final int entityId;
  late final String sessionId;

  FutureOr<Customer> build(
    int entityId,
    String sessionId,
  );
}

/// Customer State
///
/// Used to manage and update the state of a customer
///
/// Copied from [CustomerState].
@ProviderFor(CustomerState)
const customerStateProvider = CustomerStateFamily();

/// Customer State
///
/// Used to manage and update the state of a customer
///
/// Copied from [CustomerState].
class CustomerStateFamily extends Family<AsyncValue<Customer>> {
  /// Customer State
  ///
  /// Used to manage and update the state of a customer
  ///
  /// Copied from [CustomerState].
  const CustomerStateFamily();

  /// Customer State
  ///
  /// Used to manage and update the state of a customer
  ///
  /// Copied from [CustomerState].
  CustomerStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return CustomerStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  CustomerStateProvider getProviderOverride(
    covariant CustomerStateProvider provider,
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
  String? get name => r'customerStateProvider';
}

/// Customer State
///
/// Used to manage and update the state of a customer
///
/// Copied from [CustomerState].
class CustomerStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CustomerState, Customer> {
  /// Customer State
  ///
  /// Used to manage and update the state of a customer
  ///
  /// Copied from [CustomerState].
  CustomerStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => CustomerState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: customerStateProvider,
          name: r'customerStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$customerStateHash,
          dependencies: CustomerStateFamily._dependencies,
          allTransitiveDependencies:
              CustomerStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  CustomerStateProvider._internal(
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
  FutureOr<Customer> runNotifierBuild(
    covariant CustomerState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(CustomerState Function() create) {
    return ProviderOverride(
      origin: this,
      override: CustomerStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CustomerState, Customer>
      createElement() {
    return _CustomerStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerStateProvider &&
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
mixin CustomerStateRef on AutoDisposeAsyncNotifierProviderRef<Customer> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _CustomerStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CustomerState, Customer>
    with CustomerStateRef {
  _CustomerStateProviderElement(super.provider);

  @override
  int get entityId => (origin as CustomerStateProvider).entityId;
  @override
  String get sessionId => (origin as CustomerStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
