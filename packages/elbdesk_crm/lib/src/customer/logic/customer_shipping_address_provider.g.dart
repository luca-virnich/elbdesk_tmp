// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_shipping_address_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchCustomerShippingAddressesHash() =>
    r'06c497718e49c36a5190a7cfcf354d0ed9b5cddb';

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

/// See also [fetchCustomerShippingAddresses].
@ProviderFor(fetchCustomerShippingAddresses)
const fetchCustomerShippingAddressesProvider =
    FetchCustomerShippingAddressesFamily();

/// See also [fetchCustomerShippingAddresses].
class FetchCustomerShippingAddressesFamily
    extends Family<AsyncValue<List<CustomerShippingContact>>> {
  /// See also [fetchCustomerShippingAddresses].
  const FetchCustomerShippingAddressesFamily();

  /// See also [fetchCustomerShippingAddresses].
  FetchCustomerShippingAddressesProvider call(
    String sessionId, {
    required int customerId,
  }) {
    return FetchCustomerShippingAddressesProvider(
      sessionId,
      customerId: customerId,
    );
  }

  @override
  FetchCustomerShippingAddressesProvider getProviderOverride(
    covariant FetchCustomerShippingAddressesProvider provider,
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
  String? get name => r'fetchCustomerShippingAddressesProvider';
}

/// See also [fetchCustomerShippingAddresses].
class FetchCustomerShippingAddressesProvider
    extends AutoDisposeFutureProvider<List<CustomerShippingContact>> {
  /// See also [fetchCustomerShippingAddresses].
  FetchCustomerShippingAddressesProvider(
    String sessionId, {
    required int customerId,
  }) : this._internal(
          (ref) => fetchCustomerShippingAddresses(
            ref as FetchCustomerShippingAddressesRef,
            sessionId,
            customerId: customerId,
          ),
          from: fetchCustomerShippingAddressesProvider,
          name: r'fetchCustomerShippingAddressesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCustomerShippingAddressesHash,
          dependencies: FetchCustomerShippingAddressesFamily._dependencies,
          allTransitiveDependencies:
              FetchCustomerShippingAddressesFamily._allTransitiveDependencies,
          sessionId: sessionId,
          customerId: customerId,
        );

  FetchCustomerShippingAddressesProvider._internal(
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
    FutureOr<List<CustomerShippingContact>> Function(
            FetchCustomerShippingAddressesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCustomerShippingAddressesProvider._internal(
        (ref) => create(ref as FetchCustomerShippingAddressesRef),
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
  AutoDisposeFutureProviderElement<List<CustomerShippingContact>>
      createElement() {
    return _FetchCustomerShippingAddressesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCustomerShippingAddressesProvider &&
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
mixin FetchCustomerShippingAddressesRef
    on AutoDisposeFutureProviderRef<List<CustomerShippingContact>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _FetchCustomerShippingAddressesProviderElement
    extends AutoDisposeFutureProviderElement<List<CustomerShippingContact>>
    with FetchCustomerShippingAddressesRef {
  _FetchCustomerShippingAddressesProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FetchCustomerShippingAddressesProvider).sessionId;
  @override
  int get customerId =>
      (origin as FetchCustomerShippingAddressesProvider).customerId;
}

String _$watchCustomerShippingContactsUpdatesHash() =>
    r'88aae1385602d602ac9009992788e248df8fc161';

/// See also [watchCustomerShippingContactsUpdates].
@ProviderFor(watchCustomerShippingContactsUpdates)
const watchCustomerShippingContactsUpdatesProvider =
    WatchCustomerShippingContactsUpdatesFamily();

/// See also [watchCustomerShippingContactsUpdates].
class WatchCustomerShippingContactsUpdatesFamily
    extends Family<AsyncValue<CustomerShippingContact>> {
  /// See also [watchCustomerShippingContactsUpdates].
  const WatchCustomerShippingContactsUpdatesFamily();

  /// See also [watchCustomerShippingContactsUpdates].
  WatchCustomerShippingContactsUpdatesProvider call(
    int customerId,
  ) {
    return WatchCustomerShippingContactsUpdatesProvider(
      customerId,
    );
  }

  @override
  WatchCustomerShippingContactsUpdatesProvider getProviderOverride(
    covariant WatchCustomerShippingContactsUpdatesProvider provider,
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
  String? get name => r'watchCustomerShippingContactsUpdatesProvider';
}

/// See also [watchCustomerShippingContactsUpdates].
class WatchCustomerShippingContactsUpdatesProvider
    extends AutoDisposeStreamProvider<CustomerShippingContact> {
  /// See also [watchCustomerShippingContactsUpdates].
  WatchCustomerShippingContactsUpdatesProvider(
    int customerId,
  ) : this._internal(
          (ref) => watchCustomerShippingContactsUpdates(
            ref as WatchCustomerShippingContactsUpdatesRef,
            customerId,
          ),
          from: watchCustomerShippingContactsUpdatesProvider,
          name: r'watchCustomerShippingContactsUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCustomerShippingContactsUpdatesHash,
          dependencies:
              WatchCustomerShippingContactsUpdatesFamily._dependencies,
          allTransitiveDependencies: WatchCustomerShippingContactsUpdatesFamily
              ._allTransitiveDependencies,
          customerId: customerId,
        );

  WatchCustomerShippingContactsUpdatesProvider._internal(
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
    Stream<CustomerShippingContact> Function(
            WatchCustomerShippingContactsUpdatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCustomerShippingContactsUpdatesProvider._internal(
        (ref) => create(ref as WatchCustomerShippingContactsUpdatesRef),
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
  AutoDisposeStreamProviderElement<CustomerShippingContact> createElement() {
    return _WatchCustomerShippingContactsUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCustomerShippingContactsUpdatesProvider &&
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
mixin WatchCustomerShippingContactsUpdatesRef
    on AutoDisposeStreamProviderRef<CustomerShippingContact> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _WatchCustomerShippingContactsUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<CustomerShippingContact>
    with WatchCustomerShippingContactsUpdatesRef {
  _WatchCustomerShippingContactsUpdatesProviderElement(super.provider);

  @override
  int get customerId =>
      (origin as WatchCustomerShippingContactsUpdatesProvider).customerId;
}

String _$watchCustomerShippingContactsDeletionsHash() =>
    r'121ad630c222989f0fcf127155018714d6cdfcc2';

/// See also [watchCustomerShippingContactsDeletions].
@ProviderFor(watchCustomerShippingContactsDeletions)
final watchCustomerShippingContactsDeletionsProvider =
    AutoDisposeStreamProvider<int>.internal(
  watchCustomerShippingContactsDeletions,
  name: r'watchCustomerShippingContactsDeletionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchCustomerShippingContactsDeletionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchCustomerShippingContactsDeletionsRef
    = AutoDisposeStreamProviderRef<int>;
String _$watchCustomerShippingContactsHash() =>
    r'da858ff2bb8bc8e1ea15dea950034b3c373dbca6';

abstract class _$WatchCustomerShippingContacts
    extends BuildlessAutoDisposeAsyncNotifier<List<CustomerShippingContact>> {
  late final String sessionId;
  late final int customerId;

  FutureOr<List<CustomerShippingContact>> build(
    String sessionId, {
    required int customerId,
  });
}

/// See also [WatchCustomerShippingContacts].
@ProviderFor(WatchCustomerShippingContacts)
const watchCustomerShippingContactsProvider =
    WatchCustomerShippingContactsFamily();

/// See also [WatchCustomerShippingContacts].
class WatchCustomerShippingContactsFamily
    extends Family<AsyncValue<List<CustomerShippingContact>>> {
  /// See also [WatchCustomerShippingContacts].
  const WatchCustomerShippingContactsFamily();

  /// See also [WatchCustomerShippingContacts].
  WatchCustomerShippingContactsProvider call(
    String sessionId, {
    required int customerId,
  }) {
    return WatchCustomerShippingContactsProvider(
      sessionId,
      customerId: customerId,
    );
  }

  @override
  WatchCustomerShippingContactsProvider getProviderOverride(
    covariant WatchCustomerShippingContactsProvider provider,
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
  String? get name => r'watchCustomerShippingContactsProvider';
}

/// See also [WatchCustomerShippingContacts].
class WatchCustomerShippingContactsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchCustomerShippingContacts,
        List<CustomerShippingContact>> {
  /// See also [WatchCustomerShippingContacts].
  WatchCustomerShippingContactsProvider(
    String sessionId, {
    required int customerId,
  }) : this._internal(
          () => WatchCustomerShippingContacts()
            ..sessionId = sessionId
            ..customerId = customerId,
          from: watchCustomerShippingContactsProvider,
          name: r'watchCustomerShippingContactsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCustomerShippingContactsHash,
          dependencies: WatchCustomerShippingContactsFamily._dependencies,
          allTransitiveDependencies:
              WatchCustomerShippingContactsFamily._allTransitiveDependencies,
          sessionId: sessionId,
          customerId: customerId,
        );

  WatchCustomerShippingContactsProvider._internal(
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
  FutureOr<List<CustomerShippingContact>> runNotifierBuild(
    covariant WatchCustomerShippingContacts notifier,
  ) {
    return notifier.build(
      sessionId,
      customerId: customerId,
    );
  }

  @override
  Override overrideWith(WatchCustomerShippingContacts Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchCustomerShippingContactsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WatchCustomerShippingContacts,
      List<CustomerShippingContact>> createElement() {
    return _WatchCustomerShippingContactsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCustomerShippingContactsProvider &&
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
mixin WatchCustomerShippingContactsRef
    on AutoDisposeAsyncNotifierProviderRef<List<CustomerShippingContact>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _WatchCustomerShippingContactsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchCustomerShippingContacts,
        List<CustomerShippingContact>> with WatchCustomerShippingContactsRef {
  _WatchCustomerShippingContactsProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchCustomerShippingContactsProvider).sessionId;
  @override
  int get customerId =>
      (origin as WatchCustomerShippingContactsProvider).customerId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
