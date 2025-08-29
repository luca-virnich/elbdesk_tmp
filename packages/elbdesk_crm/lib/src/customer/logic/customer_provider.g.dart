// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$findCustomersHash() => r'c08bdea4181e32b60a7ec9a35340bc85f504f924';

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

/// See also [findCustomers].
@ProviderFor(findCustomers)
const findCustomersProvider = FindCustomersFamily();

/// See also [findCustomers].
class FindCustomersFamily extends Family<AsyncValue<List<Customer>>> {
  /// See also [findCustomers].
  const FindCustomersFamily();

  /// See also [findCustomers].
  FindCustomersProvider call(
    String sessionId,
  ) {
    return FindCustomersProvider(
      sessionId,
    );
  }

  @override
  FindCustomersProvider getProviderOverride(
    covariant FindCustomersProvider provider,
  ) {
    return call(
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
  String? get name => r'findCustomersProvider';
}

/// See also [findCustomers].
class FindCustomersProvider extends AutoDisposeFutureProvider<List<Customer>> {
  /// See also [findCustomers].
  FindCustomersProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findCustomers(
            ref as FindCustomersRef,
            sessionId,
          ),
          from: findCustomersProvider,
          name: r'findCustomersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findCustomersHash,
          dependencies: FindCustomersFamily._dependencies,
          allTransitiveDependencies:
              FindCustomersFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindCustomersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<Customer>> Function(FindCustomersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindCustomersProvider._internal(
        (ref) => create(ref as FindCustomersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Customer>> createElement() {
    return _FindCustomersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindCustomersProvider && other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindCustomersRef on AutoDisposeFutureProviderRef<List<Customer>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindCustomersProviderElement
    extends AutoDisposeFutureProviderElement<List<Customer>>
    with FindCustomersRef {
  _FindCustomersProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindCustomersProvider).sessionId;
}

String _$fetchCustomerBillingAddressesForSalesOrderHash() =>
    r'801e6e00f84fc62d0427cca06cc5e05572ae9c93';

/// See also [fetchCustomerBillingAddressesForSalesOrder].
@ProviderFor(fetchCustomerBillingAddressesForSalesOrder)
const fetchCustomerBillingAddressesForSalesOrderProvider =
    FetchCustomerBillingAddressesForSalesOrderFamily();

/// See also [fetchCustomerBillingAddressesForSalesOrder].
class FetchCustomerBillingAddressesForSalesOrderFamily
    extends Family<AsyncValue<List<Customer>>> {
  /// See also [fetchCustomerBillingAddressesForSalesOrder].
  const FetchCustomerBillingAddressesForSalesOrderFamily();

  /// See also [fetchCustomerBillingAddressesForSalesOrder].
  FetchCustomerBillingAddressesForSalesOrderProvider call({
    required Customer customer,
  }) {
    return FetchCustomerBillingAddressesForSalesOrderProvider(
      customer: customer,
    );
  }

  @override
  FetchCustomerBillingAddressesForSalesOrderProvider getProviderOverride(
    covariant FetchCustomerBillingAddressesForSalesOrderProvider provider,
  ) {
    return call(
      customer: provider.customer,
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
  String? get name => r'fetchCustomerBillingAddressesForSalesOrderProvider';
}

/// See also [fetchCustomerBillingAddressesForSalesOrder].
class FetchCustomerBillingAddressesForSalesOrderProvider
    extends AutoDisposeFutureProvider<List<Customer>> {
  /// See also [fetchCustomerBillingAddressesForSalesOrder].
  FetchCustomerBillingAddressesForSalesOrderProvider({
    required Customer customer,
  }) : this._internal(
          (ref) => fetchCustomerBillingAddressesForSalesOrder(
            ref as FetchCustomerBillingAddressesForSalesOrderRef,
            customer: customer,
          ),
          from: fetchCustomerBillingAddressesForSalesOrderProvider,
          name: r'fetchCustomerBillingAddressesForSalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCustomerBillingAddressesForSalesOrderHash,
          dependencies:
              FetchCustomerBillingAddressesForSalesOrderFamily._dependencies,
          allTransitiveDependencies:
              FetchCustomerBillingAddressesForSalesOrderFamily
                  ._allTransitiveDependencies,
          customer: customer,
        );

  FetchCustomerBillingAddressesForSalesOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customer,
  }) : super.internal();

  final Customer customer;

  @override
  Override overrideWith(
    FutureOr<List<Customer>> Function(
            FetchCustomerBillingAddressesForSalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCustomerBillingAddressesForSalesOrderProvider._internal(
        (ref) => create(ref as FetchCustomerBillingAddressesForSalesOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customer: customer,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Customer>> createElement() {
    return _FetchCustomerBillingAddressesForSalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCustomerBillingAddressesForSalesOrderProvider &&
        other.customer == customer;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customer.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchCustomerBillingAddressesForSalesOrderRef
    on AutoDisposeFutureProviderRef<List<Customer>> {
  /// The parameter `customer` of this provider.
  Customer get customer;
}

class _FetchCustomerBillingAddressesForSalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<Customer>>
    with FetchCustomerBillingAddressesForSalesOrderRef {
  _FetchCustomerBillingAddressesForSalesOrderProviderElement(super.provider);

  @override
  Customer get customer =>
      (origin as FetchCustomerBillingAddressesForSalesOrderProvider).customer;
}

String _$fetchCustomerShippingAddressesForSalesOrderHash() =>
    r'72991191068aeaf21703c3879aef9e2c1c03ea25';

/// See also [fetchCustomerShippingAddressesForSalesOrder].
@ProviderFor(fetchCustomerShippingAddressesForSalesOrder)
const fetchCustomerShippingAddressesForSalesOrderProvider =
    FetchCustomerShippingAddressesForSalesOrderFamily();

/// See also [fetchCustomerShippingAddressesForSalesOrder].
class FetchCustomerShippingAddressesForSalesOrderFamily
    extends Family<AsyncValue<List<Contact>>> {
  /// See also [fetchCustomerShippingAddressesForSalesOrder].
  const FetchCustomerShippingAddressesForSalesOrderFamily();

  /// See also [fetchCustomerShippingAddressesForSalesOrder].
  FetchCustomerShippingAddressesForSalesOrderProvider call(
    String sessionId, {
    required Customer customer,
  }) {
    return FetchCustomerShippingAddressesForSalesOrderProvider(
      sessionId,
      customer: customer,
    );
  }

  @override
  FetchCustomerShippingAddressesForSalesOrderProvider getProviderOverride(
    covariant FetchCustomerShippingAddressesForSalesOrderProvider provider,
  ) {
    return call(
      provider.sessionId,
      customer: provider.customer,
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
  String? get name => r'fetchCustomerShippingAddressesForSalesOrderProvider';
}

/// See also [fetchCustomerShippingAddressesForSalesOrder].
class FetchCustomerShippingAddressesForSalesOrderProvider
    extends AutoDisposeFutureProvider<List<Contact>> {
  /// See also [fetchCustomerShippingAddressesForSalesOrder].
  FetchCustomerShippingAddressesForSalesOrderProvider(
    String sessionId, {
    required Customer customer,
  }) : this._internal(
          (ref) => fetchCustomerShippingAddressesForSalesOrder(
            ref as FetchCustomerShippingAddressesForSalesOrderRef,
            sessionId,
            customer: customer,
          ),
          from: fetchCustomerShippingAddressesForSalesOrderProvider,
          name: r'fetchCustomerShippingAddressesForSalesOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCustomerShippingAddressesForSalesOrderHash,
          dependencies:
              FetchCustomerShippingAddressesForSalesOrderFamily._dependencies,
          allTransitiveDependencies:
              FetchCustomerShippingAddressesForSalesOrderFamily
                  ._allTransitiveDependencies,
          sessionId: sessionId,
          customer: customer,
        );

  FetchCustomerShippingAddressesForSalesOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.customer,
  }) : super.internal();

  final String sessionId;
  final Customer customer;

  @override
  Override overrideWith(
    FutureOr<List<Contact>> Function(
            FetchCustomerShippingAddressesForSalesOrderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCustomerShippingAddressesForSalesOrderProvider._internal(
        (ref) => create(ref as FetchCustomerShippingAddressesForSalesOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        customer: customer,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Contact>> createElement() {
    return _FetchCustomerShippingAddressesForSalesOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCustomerShippingAddressesForSalesOrderProvider &&
        other.sessionId == sessionId &&
        other.customer == customer;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, customer.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchCustomerShippingAddressesForSalesOrderRef
    on AutoDisposeFutureProviderRef<List<Contact>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `customer` of this provider.
  Customer get customer;
}

class _FetchCustomerShippingAddressesForSalesOrderProviderElement
    extends AutoDisposeFutureProviderElement<List<Contact>>
    with FetchCustomerShippingAddressesForSalesOrderRef {
  _FetchCustomerShippingAddressesForSalesOrderProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FetchCustomerShippingAddressesForSalesOrderProvider).sessionId;
  @override
  Customer get customer =>
      (origin as FetchCustomerShippingAddressesForSalesOrderProvider).customer;
}

String _$fetchCustomerHash() => r'234301d6850942325ec3ce440ca7a91a5b45541d';

/// See also [fetchCustomer].
@ProviderFor(fetchCustomer)
const fetchCustomerProvider = FetchCustomerFamily();

/// See also [fetchCustomer].
class FetchCustomerFamily extends Family<AsyncValue<Customer>> {
  /// See also [fetchCustomer].
  const FetchCustomerFamily();

  /// See also [fetchCustomer].
  FetchCustomerProvider call({
    required int customerId,
  }) {
    return FetchCustomerProvider(
      customerId: customerId,
    );
  }

  @override
  FetchCustomerProvider getProviderOverride(
    covariant FetchCustomerProvider provider,
  ) {
    return call(
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
  String? get name => r'fetchCustomerProvider';
}

/// See also [fetchCustomer].
class FetchCustomerProvider extends AutoDisposeFutureProvider<Customer> {
  /// See also [fetchCustomer].
  FetchCustomerProvider({
    required int customerId,
  }) : this._internal(
          (ref) => fetchCustomer(
            ref as FetchCustomerRef,
            customerId: customerId,
          ),
          from: fetchCustomerProvider,
          name: r'fetchCustomerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCustomerHash,
          dependencies: FetchCustomerFamily._dependencies,
          allTransitiveDependencies:
              FetchCustomerFamily._allTransitiveDependencies,
          customerId: customerId,
        );

  FetchCustomerProvider._internal(
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
    FutureOr<Customer> Function(FetchCustomerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCustomerProvider._internal(
        (ref) => create(ref as FetchCustomerRef),
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
  AutoDisposeFutureProviderElement<Customer> createElement() {
    return _FetchCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCustomerProvider && other.customerId == customerId;
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
mixin FetchCustomerRef on AutoDisposeFutureProviderRef<Customer> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _FetchCustomerProviderElement
    extends AutoDisposeFutureProviderElement<Customer> with FetchCustomerRef {
  _FetchCustomerProviderElement(super.provider);

  @override
  int get customerId => (origin as FetchCustomerProvider).customerId;
}

String _$findCustomersSpotlightHash() =>
    r'0c1fa4d07e53c5936069b54c2a39fc769fad9d1e';

/// See also [findCustomersSpotlight].
@ProviderFor(findCustomersSpotlight)
const findCustomersSpotlightProvider = FindCustomersSpotlightFamily();

/// See also [findCustomersSpotlight].
class FindCustomersSpotlightFamily
    extends Family<AsyncValue<List<SpotlightItem>>> {
  /// See also [findCustomersSpotlight].
  const FindCustomersSpotlightFamily();

  /// See also [findCustomersSpotlight].
  FindCustomersSpotlightProvider call(
    String query,
  ) {
    return FindCustomersSpotlightProvider(
      query,
    );
  }

  @override
  FindCustomersSpotlightProvider getProviderOverride(
    covariant FindCustomersSpotlightProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'findCustomersSpotlightProvider';
}

/// See also [findCustomersSpotlight].
class FindCustomersSpotlightProvider
    extends AutoDisposeFutureProvider<List<SpotlightItem>> {
  /// See also [findCustomersSpotlight].
  FindCustomersSpotlightProvider(
    String query,
  ) : this._internal(
          (ref) => findCustomersSpotlight(
            ref as FindCustomersSpotlightRef,
            query,
          ),
          from: findCustomersSpotlightProvider,
          name: r'findCustomersSpotlightProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findCustomersSpotlightHash,
          dependencies: FindCustomersSpotlightFamily._dependencies,
          allTransitiveDependencies:
              FindCustomersSpotlightFamily._allTransitiveDependencies,
          query: query,
        );

  FindCustomersSpotlightProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<SpotlightItem>> Function(FindCustomersSpotlightRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindCustomersSpotlightProvider._internal(
        (ref) => create(ref as FindCustomersSpotlightRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SpotlightItem>> createElement() {
    return _FindCustomersSpotlightProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindCustomersSpotlightProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindCustomersSpotlightRef
    on AutoDisposeFutureProviderRef<List<SpotlightItem>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FindCustomersSpotlightProviderElement
    extends AutoDisposeFutureProviderElement<List<SpotlightItem>>
    with FindCustomersSpotlightRef {
  _FindCustomersSpotlightProviderElement(super.provider);

  @override
  String get query => (origin as FindCustomersSpotlightProvider).query;
}

String _$customerRepositoryHash() =>
    r'c9c1167da80aa115dba95864304b4242a8a0c22f';

/// Customer Repository Provider
///
/// Copied from [customerRepository].
@ProviderFor(customerRepository)
final customerRepositoryProvider =
    AutoDisposeProvider<CustomerRepository>.internal(
  customerRepository,
  name: r'customerRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customerRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CustomerRepositoryRef = AutoDisposeProviderRef<CustomerRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
