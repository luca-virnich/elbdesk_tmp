// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_billing_address_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchCustomerBillingAddressesHash() =>
    r'46bb4f11ce536fa5ff7905779c7b5aab9ab5aa50';

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

/// See also [fetchCustomerBillingAddresses].
@ProviderFor(fetchCustomerBillingAddresses)
const fetchCustomerBillingAddressesProvider =
    FetchCustomerBillingAddressesFamily();

/// See also [fetchCustomerBillingAddresses].
class FetchCustomerBillingAddressesFamily
    extends Family<AsyncValue<List<CustomerBillingCustomer>>> {
  /// See also [fetchCustomerBillingAddresses].
  const FetchCustomerBillingAddressesFamily();

  /// See also [fetchCustomerBillingAddresses].
  FetchCustomerBillingAddressesProvider call(
    String sessionId, {
    required int customerId,
  }) {
    return FetchCustomerBillingAddressesProvider(
      sessionId,
      customerId: customerId,
    );
  }

  @override
  FetchCustomerBillingAddressesProvider getProviderOverride(
    covariant FetchCustomerBillingAddressesProvider provider,
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
  String? get name => r'fetchCustomerBillingAddressesProvider';
}

/// See also [fetchCustomerBillingAddresses].
class FetchCustomerBillingAddressesProvider
    extends AutoDisposeFutureProvider<List<CustomerBillingCustomer>> {
  /// See also [fetchCustomerBillingAddresses].
  FetchCustomerBillingAddressesProvider(
    String sessionId, {
    required int customerId,
  }) : this._internal(
          (ref) => fetchCustomerBillingAddresses(
            ref as FetchCustomerBillingAddressesRef,
            sessionId,
            customerId: customerId,
          ),
          from: fetchCustomerBillingAddressesProvider,
          name: r'fetchCustomerBillingAddressesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCustomerBillingAddressesHash,
          dependencies: FetchCustomerBillingAddressesFamily._dependencies,
          allTransitiveDependencies:
              FetchCustomerBillingAddressesFamily._allTransitiveDependencies,
          sessionId: sessionId,
          customerId: customerId,
        );

  FetchCustomerBillingAddressesProvider._internal(
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
    FutureOr<List<CustomerBillingCustomer>> Function(
            FetchCustomerBillingAddressesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCustomerBillingAddressesProvider._internal(
        (ref) => create(ref as FetchCustomerBillingAddressesRef),
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
  AutoDisposeFutureProviderElement<List<CustomerBillingCustomer>>
      createElement() {
    return _FetchCustomerBillingAddressesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCustomerBillingAddressesProvider &&
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
mixin FetchCustomerBillingAddressesRef
    on AutoDisposeFutureProviderRef<List<CustomerBillingCustomer>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _FetchCustomerBillingAddressesProviderElement
    extends AutoDisposeFutureProviderElement<List<CustomerBillingCustomer>>
    with FetchCustomerBillingAddressesRef {
  _FetchCustomerBillingAddressesProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FetchCustomerBillingAddressesProvider).sessionId;
  @override
  int get customerId =>
      (origin as FetchCustomerBillingAddressesProvider).customerId;
}

String _$watchCustomerBillingContactsUpdatesHash() =>
    r'08250c58ddea96016ec186c753efd590cd146a24';

/// See also [watchCustomerBillingContactsUpdates].
@ProviderFor(watchCustomerBillingContactsUpdates)
const watchCustomerBillingContactsUpdatesProvider =
    WatchCustomerBillingContactsUpdatesFamily();

/// See also [watchCustomerBillingContactsUpdates].
class WatchCustomerBillingContactsUpdatesFamily
    extends Family<AsyncValue<CustomerBillingCustomer>> {
  /// See also [watchCustomerBillingContactsUpdates].
  const WatchCustomerBillingContactsUpdatesFamily();

  /// See also [watchCustomerBillingContactsUpdates].
  WatchCustomerBillingContactsUpdatesProvider call(
    int customerId,
  ) {
    return WatchCustomerBillingContactsUpdatesProvider(
      customerId,
    );
  }

  @override
  WatchCustomerBillingContactsUpdatesProvider getProviderOverride(
    covariant WatchCustomerBillingContactsUpdatesProvider provider,
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
  String? get name => r'watchCustomerBillingContactsUpdatesProvider';
}

/// See also [watchCustomerBillingContactsUpdates].
class WatchCustomerBillingContactsUpdatesProvider
    extends AutoDisposeStreamProvider<CustomerBillingCustomer> {
  /// See also [watchCustomerBillingContactsUpdates].
  WatchCustomerBillingContactsUpdatesProvider(
    int customerId,
  ) : this._internal(
          (ref) => watchCustomerBillingContactsUpdates(
            ref as WatchCustomerBillingContactsUpdatesRef,
            customerId,
          ),
          from: watchCustomerBillingContactsUpdatesProvider,
          name: r'watchCustomerBillingContactsUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCustomerBillingContactsUpdatesHash,
          dependencies: WatchCustomerBillingContactsUpdatesFamily._dependencies,
          allTransitiveDependencies: WatchCustomerBillingContactsUpdatesFamily
              ._allTransitiveDependencies,
          customerId: customerId,
        );

  WatchCustomerBillingContactsUpdatesProvider._internal(
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
    Stream<CustomerBillingCustomer> Function(
            WatchCustomerBillingContactsUpdatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCustomerBillingContactsUpdatesProvider._internal(
        (ref) => create(ref as WatchCustomerBillingContactsUpdatesRef),
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
  AutoDisposeStreamProviderElement<CustomerBillingCustomer> createElement() {
    return _WatchCustomerBillingContactsUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCustomerBillingContactsUpdatesProvider &&
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
mixin WatchCustomerBillingContactsUpdatesRef
    on AutoDisposeStreamProviderRef<CustomerBillingCustomer> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _WatchCustomerBillingContactsUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<CustomerBillingCustomer>
    with WatchCustomerBillingContactsUpdatesRef {
  _WatchCustomerBillingContactsUpdatesProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as WatchCustomerBillingContactsUpdatesProvider).customerId;
}

String _$watchCustomerBillingContactsDeletionsHash() =>
    r'e2e7d760035c9c1263832a290299ae0054ba8ca1';

/// See also [watchCustomerBillingContactsDeletions].
@ProviderFor(watchCustomerBillingContactsDeletions)
final watchCustomerBillingContactsDeletionsProvider =
    AutoDisposeStreamProvider<int>.internal(
  watchCustomerBillingContactsDeletions,
  name: r'watchCustomerBillingContactsDeletionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchCustomerBillingContactsDeletionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchCustomerBillingContactsDeletionsRef
    = AutoDisposeStreamProviderRef<int>;
String _$watchCustomerBillingContactsHash() =>
    r'326a9d203ff41fad4447432f67e19312669a3dee';

abstract class _$WatchCustomerBillingContacts
    extends BuildlessAutoDisposeAsyncNotifier<List<CustomerBillingCustomer>> {
  late final String sessionId;
  late final int customerId;

  FutureOr<List<CustomerBillingCustomer>> build(
    String sessionId, {
    required int customerId,
  });
}

/// See also [WatchCustomerBillingContacts].
@ProviderFor(WatchCustomerBillingContacts)
const watchCustomerBillingContactsProvider =
    WatchCustomerBillingContactsFamily();

/// See also [WatchCustomerBillingContacts].
class WatchCustomerBillingContactsFamily
    extends Family<AsyncValue<List<CustomerBillingCustomer>>> {
  /// See also [WatchCustomerBillingContacts].
  const WatchCustomerBillingContactsFamily();

  /// See also [WatchCustomerBillingContacts].
  WatchCustomerBillingContactsProvider call(
    String sessionId, {
    required int customerId,
  }) {
    return WatchCustomerBillingContactsProvider(
      sessionId,
      customerId: customerId,
    );
  }

  @override
  WatchCustomerBillingContactsProvider getProviderOverride(
    covariant WatchCustomerBillingContactsProvider provider,
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
  String? get name => r'watchCustomerBillingContactsProvider';
}

/// See also [WatchCustomerBillingContacts].
class WatchCustomerBillingContactsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchCustomerBillingContacts,
        List<CustomerBillingCustomer>> {
  /// See also [WatchCustomerBillingContacts].
  WatchCustomerBillingContactsProvider(
    String sessionId, {
    required int customerId,
  }) : this._internal(
          () => WatchCustomerBillingContacts()
            ..sessionId = sessionId
            ..customerId = customerId,
          from: watchCustomerBillingContactsProvider,
          name: r'watchCustomerBillingContactsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCustomerBillingContactsHash,
          dependencies: WatchCustomerBillingContactsFamily._dependencies,
          allTransitiveDependencies:
              WatchCustomerBillingContactsFamily._allTransitiveDependencies,
          sessionId: sessionId,
          customerId: customerId,
        );

  WatchCustomerBillingContactsProvider._internal(
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
  FutureOr<List<CustomerBillingCustomer>> runNotifierBuild(
    covariant WatchCustomerBillingContacts notifier,
  ) {
    return notifier.build(
      sessionId,
      customerId: customerId,
    );
  }

  @override
  Override overrideWith(WatchCustomerBillingContacts Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchCustomerBillingContactsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WatchCustomerBillingContacts,
      List<CustomerBillingCustomer>> createElement() {
    return _WatchCustomerBillingContactsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCustomerBillingContactsProvider &&
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
mixin WatchCustomerBillingContactsRef
    on AutoDisposeAsyncNotifierProviderRef<List<CustomerBillingCustomer>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _WatchCustomerBillingContactsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchCustomerBillingContacts,
        List<CustomerBillingCustomer>> with WatchCustomerBillingContactsRef {
  _WatchCustomerBillingContactsProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchCustomerBillingContactsProvider).sessionId;
  @override
  int get customerId =>
      (origin as WatchCustomerBillingContactsProvider).customerId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
