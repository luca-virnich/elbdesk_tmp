// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_customer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customerCustomerRepositoryHash() =>
    r'42e921c999a45f21687e254a49941542a07d0b19';

/// See also [customerCustomerRepository].
@ProviderFor(customerCustomerRepository)
final customerCustomerRepositoryProvider =
    AutoDisposeProvider<CustomerCustomerRepository>.internal(
  customerCustomerRepository,
  name: r'customerCustomerRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customerCustomerRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CustomerCustomerRepositoryRef
    = AutoDisposeProviderRef<CustomerCustomerRepository>;
String _$fetchCustomerCustomersHash() =>
    r'2f75f5f834967bbafada202b9c13b6331f640705';

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

/// See also [fetchCustomerCustomers].
@ProviderFor(fetchCustomerCustomers)
const fetchCustomerCustomersProvider = FetchCustomerCustomersFamily();

/// See also [fetchCustomerCustomers].
class FetchCustomerCustomersFamily
    extends Family<AsyncValue<List<CustomerCustomer>>> {
  /// See also [fetchCustomerCustomers].
  const FetchCustomerCustomersFamily();

  /// See also [fetchCustomerCustomers].
  FetchCustomerCustomersProvider call(
    String sessionId, {
    required int customerId,
  }) {
    return FetchCustomerCustomersProvider(
      sessionId,
      customerId: customerId,
    );
  }

  @override
  FetchCustomerCustomersProvider getProviderOverride(
    covariant FetchCustomerCustomersProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'fetchCustomerCustomersProvider';
}

/// See also [fetchCustomerCustomers].
class FetchCustomerCustomersProvider
    extends AutoDisposeFutureProvider<List<CustomerCustomer>> {
  /// See also [fetchCustomerCustomers].
  FetchCustomerCustomersProvider(
    String sessionId, {
    required int customerId,
  }) : this._internal(
          (ref) => fetchCustomerCustomers(
            ref as FetchCustomerCustomersRef,
            sessionId,
            customerId: customerId,
          ),
          from: fetchCustomerCustomersProvider,
          name: r'fetchCustomerCustomersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCustomerCustomersHash,
          dependencies: FetchCustomerCustomersFamily._dependencies,
          allTransitiveDependencies:
              FetchCustomerCustomersFamily._allTransitiveDependencies,
          sessionId: sessionId,
          customerId: customerId,
        );

  FetchCustomerCustomersProvider._internal(
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
    FutureOr<List<CustomerCustomer>> Function(
            FetchCustomerCustomersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCustomerCustomersProvider._internal(
        (ref) => create(ref as FetchCustomerCustomersRef),
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
  AutoDisposeFutureProviderElement<List<CustomerCustomer>> createElement() {
    return _FetchCustomerCustomersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCustomerCustomersProvider &&
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
mixin FetchCustomerCustomersRef
    on AutoDisposeFutureProviderRef<List<CustomerCustomer>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _FetchCustomerCustomersProviderElement
    extends AutoDisposeFutureProviderElement<List<CustomerCustomer>>
    with FetchCustomerCustomersRef {
  _FetchCustomerCustomersProviderElement(super.provider);

  @override
  String get sessionId => (origin as FetchCustomerCustomersProvider).sessionId;
  @override
  int get customerId => (origin as FetchCustomerCustomersProvider).customerId;
}

String _$watchCustomerCustomersUpdatesHash() =>
    r'44177588b23273e43c719c5b69accb46809049f8';

/// See also [watchCustomerCustomersUpdates].
@ProviderFor(watchCustomerCustomersUpdates)
const watchCustomerCustomersUpdatesProvider =
    WatchCustomerCustomersUpdatesFamily();

/// See also [watchCustomerCustomersUpdates].
class WatchCustomerCustomersUpdatesFamily
    extends Family<AsyncValue<CustomerCustomer>> {
  /// See also [watchCustomerCustomersUpdates].
  const WatchCustomerCustomersUpdatesFamily();

  /// See also [watchCustomerCustomersUpdates].
  WatchCustomerCustomersUpdatesProvider call(
    int customerId,
  ) {
    return WatchCustomerCustomersUpdatesProvider(
      customerId,
    );
  }

  @override
  WatchCustomerCustomersUpdatesProvider getProviderOverride(
    covariant WatchCustomerCustomersUpdatesProvider provider,
  ) {
    return call(
      provider.customerId,
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
  String? get name => r'watchCustomerCustomersUpdatesProvider';
}

/// See also [watchCustomerCustomersUpdates].
class WatchCustomerCustomersUpdatesProvider
    extends AutoDisposeStreamProvider<CustomerCustomer> {
  /// See also [watchCustomerCustomersUpdates].
  WatchCustomerCustomersUpdatesProvider(
    int customerId,
  ) : this._internal(
          (ref) => watchCustomerCustomersUpdates(
            ref as WatchCustomerCustomersUpdatesRef,
            customerId,
          ),
          from: watchCustomerCustomersUpdatesProvider,
          name: r'watchCustomerCustomersUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCustomerCustomersUpdatesHash,
          dependencies: WatchCustomerCustomersUpdatesFamily._dependencies,
          allTransitiveDependencies:
              WatchCustomerCustomersUpdatesFamily._allTransitiveDependencies,
          customerId: customerId,
        );

  WatchCustomerCustomersUpdatesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
  }) : super.internal();

  final int customerId;

  @override
  Override overrideWith(
    Stream<CustomerCustomer> Function(WatchCustomerCustomersUpdatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCustomerCustomersUpdatesProvider._internal(
        (ref) => create(ref as WatchCustomerCustomersUpdatesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<CustomerCustomer> createElement() {
    return _WatchCustomerCustomersUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCustomerCustomersUpdatesProvider &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchCustomerCustomersUpdatesRef
    on AutoDisposeStreamProviderRef<CustomerCustomer> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _WatchCustomerCustomersUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<CustomerCustomer>
    with WatchCustomerCustomersUpdatesRef {
  _WatchCustomerCustomersUpdatesProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as WatchCustomerCustomersUpdatesProvider).customerId;
}

String _$watchCustomerCustomersHash() =>
    r'7c1fb318e61ac20998589085bc7885a515216551';

abstract class _$WatchCustomerCustomers
    extends BuildlessAutoDisposeAsyncNotifier<List<CustomerCustomer>> {
  late final String sessionId;
  late final int customerId;

  FutureOr<List<CustomerCustomer>> build(
    String sessionId, {
    required int customerId,
  });
}

/// See also [WatchCustomerCustomers].
@ProviderFor(WatchCustomerCustomers)
const watchCustomerCustomersProvider = WatchCustomerCustomersFamily();

/// See also [WatchCustomerCustomers].
class WatchCustomerCustomersFamily
    extends Family<AsyncValue<List<CustomerCustomer>>> {
  /// See also [WatchCustomerCustomers].
  const WatchCustomerCustomersFamily();

  /// See also [WatchCustomerCustomers].
  WatchCustomerCustomersProvider call(
    String sessionId, {
    required int customerId,
  }) {
    return WatchCustomerCustomersProvider(
      sessionId,
      customerId: customerId,
    );
  }

  @override
  WatchCustomerCustomersProvider getProviderOverride(
    covariant WatchCustomerCustomersProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'watchCustomerCustomersProvider';
}

/// See also [WatchCustomerCustomers].
class WatchCustomerCustomersProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchCustomerCustomers,
        List<CustomerCustomer>> {
  /// See also [WatchCustomerCustomers].
  WatchCustomerCustomersProvider(
    String sessionId, {
    required int customerId,
  }) : this._internal(
          () => WatchCustomerCustomers()
            ..sessionId = sessionId
            ..customerId = customerId,
          from: watchCustomerCustomersProvider,
          name: r'watchCustomerCustomersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCustomerCustomersHash,
          dependencies: WatchCustomerCustomersFamily._dependencies,
          allTransitiveDependencies:
              WatchCustomerCustomersFamily._allTransitiveDependencies,
          sessionId: sessionId,
          customerId: customerId,
        );

  WatchCustomerCustomersProvider._internal(
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
  FutureOr<List<CustomerCustomer>> runNotifierBuild(
    covariant WatchCustomerCustomers notifier,
  ) {
    return notifier.build(
      sessionId,
      customerId: customerId,
    );
  }

  @override
  Override overrideWith(WatchCustomerCustomers Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchCustomerCustomersProvider._internal(
        () => create()
          ..sessionId = sessionId
          ..customerId = customerId,
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
  AutoDisposeAsyncNotifierProviderElement<WatchCustomerCustomers,
      List<CustomerCustomer>> createElement() {
    return _WatchCustomerCustomersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCustomerCustomersProvider &&
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
mixin WatchCustomerCustomersRef
    on AutoDisposeAsyncNotifierProviderRef<List<CustomerCustomer>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _WatchCustomerCustomersProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WatchCustomerCustomers,
        List<CustomerCustomer>> with WatchCustomerCustomersRef {
  _WatchCustomerCustomersProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchCustomerCustomersProvider).sessionId;
  @override
  int get customerId => (origin as WatchCustomerCustomersProvider).customerId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
