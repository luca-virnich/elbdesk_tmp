// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_code_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPaymentCodeHash() => r'db73af53420c85f48047c0f062f8ced4685c1920';

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

/// See also [fetchPaymentCode].
@ProviderFor(fetchPaymentCode)
const fetchPaymentCodeProvider = FetchPaymentCodeFamily();

/// See also [fetchPaymentCode].
class FetchPaymentCodeFamily extends Family<AsyncValue<PaymentCode>> {
  /// See also [fetchPaymentCode].
  const FetchPaymentCodeFamily();

  /// See also [fetchPaymentCode].
  FetchPaymentCodeProvider call(
    int id,
  ) {
    return FetchPaymentCodeProvider(
      id,
    );
  }

  @override
  FetchPaymentCodeProvider getProviderOverride(
    covariant FetchPaymentCodeProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'fetchPaymentCodeProvider';
}

/// See also [fetchPaymentCode].
class FetchPaymentCodeProvider extends AutoDisposeFutureProvider<PaymentCode> {
  /// See also [fetchPaymentCode].
  FetchPaymentCodeProvider(
    int id,
  ) : this._internal(
          (ref) => fetchPaymentCode(
            ref as FetchPaymentCodeRef,
            id,
          ),
          from: fetchPaymentCodeProvider,
          name: r'fetchPaymentCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPaymentCodeHash,
          dependencies: FetchPaymentCodeFamily._dependencies,
          allTransitiveDependencies:
              FetchPaymentCodeFamily._allTransitiveDependencies,
          id: id,
        );

  FetchPaymentCodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<PaymentCode> Function(FetchPaymentCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPaymentCodeProvider._internal(
        (ref) => create(ref as FetchPaymentCodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaymentCode> createElement() {
    return _FetchPaymentCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPaymentCodeProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchPaymentCodeRef on AutoDisposeFutureProviderRef<PaymentCode> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchPaymentCodeProviderElement
    extends AutoDisposeFutureProviderElement<PaymentCode>
    with FetchPaymentCodeRef {
  _FetchPaymentCodeProviderElement(super.provider);

  @override
  int get id => (origin as FetchPaymentCodeProvider).id;
}

String _$findPaymentCodesHash() => r'501a41509a1f8ee3184813b0cda9685296aad92e';

/// See also [findPaymentCodes].
@ProviderFor(findPaymentCodes)
const findPaymentCodesProvider = FindPaymentCodesFamily();

/// See also [findPaymentCodes].
class FindPaymentCodesFamily extends Family<AsyncValue<List<PaymentCode>>> {
  /// See also [findPaymentCodes].
  const FindPaymentCodesFamily();

  /// See also [findPaymentCodes].
  FindPaymentCodesProvider call(
    String sessionId,
  ) {
    return FindPaymentCodesProvider(
      sessionId,
    );
  }

  @override
  FindPaymentCodesProvider getProviderOverride(
    covariant FindPaymentCodesProvider provider,
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
  String? get name => r'findPaymentCodesProvider';
}

/// See also [findPaymentCodes].
class FindPaymentCodesProvider
    extends AutoDisposeFutureProvider<List<PaymentCode>> {
  /// See also [findPaymentCodes].
  FindPaymentCodesProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findPaymentCodes(
            ref as FindPaymentCodesRef,
            sessionId,
          ),
          from: findPaymentCodesProvider,
          name: r'findPaymentCodesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findPaymentCodesHash,
          dependencies: FindPaymentCodesFamily._dependencies,
          allTransitiveDependencies:
              FindPaymentCodesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindPaymentCodesProvider._internal(
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
    FutureOr<List<PaymentCode>> Function(FindPaymentCodesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindPaymentCodesProvider._internal(
        (ref) => create(ref as FindPaymentCodesRef),
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
  AutoDisposeFutureProviderElement<List<PaymentCode>> createElement() {
    return _FindPaymentCodesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindPaymentCodesProvider && other.sessionId == sessionId;
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
mixin FindPaymentCodesRef on AutoDisposeFutureProviderRef<List<PaymentCode>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindPaymentCodesProviderElement
    extends AutoDisposeFutureProviderElement<List<PaymentCode>>
    with FindPaymentCodesRef {
  _FindPaymentCodesProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindPaymentCodesProvider).sessionId;
}

String _$paymentCodeRepositoryHash() =>
    r'fda377430aa7a36abd25f1b12a05e51f867fcdd8';

/// See also [paymentCodeRepository].
@ProviderFor(paymentCodeRepository)
final paymentCodeRepositoryProvider =
    AutoDisposeProvider<PaymentCodeRepository>.internal(
  paymentCodeRepository,
  name: r'paymentCodeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentCodeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PaymentCodeRepositoryRef
    = AutoDisposeProviderRef<PaymentCodeRepository>;
String _$watchPaymentCodeHash() => r'f05052b427a58193924f25f25ea9ab310d08686c';

/// See also [watchPaymentCode].
@ProviderFor(watchPaymentCode)
const watchPaymentCodeProvider = WatchPaymentCodeFamily();

/// See also [watchPaymentCode].
class WatchPaymentCodeFamily extends Family<AsyncValue<PaymentCode>> {
  /// See also [watchPaymentCode].
  const WatchPaymentCodeFamily();

  /// See also [watchPaymentCode].
  WatchPaymentCodeProvider call({
    required String sessionId,
    required int paymentCodeId,
  }) {
    return WatchPaymentCodeProvider(
      sessionId: sessionId,
      paymentCodeId: paymentCodeId,
    );
  }

  @override
  WatchPaymentCodeProvider getProviderOverride(
    covariant WatchPaymentCodeProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      paymentCodeId: provider.paymentCodeId,
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
  String? get name => r'watchPaymentCodeProvider';
}

/// See also [watchPaymentCode].
class WatchPaymentCodeProvider extends AutoDisposeStreamProvider<PaymentCode> {
  /// See also [watchPaymentCode].
  WatchPaymentCodeProvider({
    required String sessionId,
    required int paymentCodeId,
  }) : this._internal(
          (ref) => watchPaymentCode(
            ref as WatchPaymentCodeRef,
            sessionId: sessionId,
            paymentCodeId: paymentCodeId,
          ),
          from: watchPaymentCodeProvider,
          name: r'watchPaymentCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchPaymentCodeHash,
          dependencies: WatchPaymentCodeFamily._dependencies,
          allTransitiveDependencies:
              WatchPaymentCodeFamily._allTransitiveDependencies,
          sessionId: sessionId,
          paymentCodeId: paymentCodeId,
        );

  WatchPaymentCodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.paymentCodeId,
  }) : super.internal();

  final String sessionId;
  final int paymentCodeId;

  @override
  Override overrideWith(
    Stream<PaymentCode> Function(WatchPaymentCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchPaymentCodeProvider._internal(
        (ref) => create(ref as WatchPaymentCodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        paymentCodeId: paymentCodeId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<PaymentCode> createElement() {
    return _WatchPaymentCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchPaymentCodeProvider &&
        other.sessionId == sessionId &&
        other.paymentCodeId == paymentCodeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, paymentCodeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchPaymentCodeRef on AutoDisposeStreamProviderRef<PaymentCode> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `paymentCodeId` of this provider.
  int get paymentCodeId;
}

class _WatchPaymentCodeProviderElement
    extends AutoDisposeStreamProviderElement<PaymentCode>
    with WatchPaymentCodeRef {
  _WatchPaymentCodeProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchPaymentCodeProvider).sessionId;
  @override
  int get paymentCodeId => (origin as WatchPaymentCodeProvider).paymentCodeId;
}

String _$watchAllPaymentCodesHash() =>
    r'21dff001e4b7e7a3b8c3d2a44d5eaed5f94395b0';

/// See also [watchAllPaymentCodes].
@ProviderFor(watchAllPaymentCodes)
final watchAllPaymentCodesProvider =
    AutoDisposeStreamProvider<PaymentCode>.internal(
  watchAllPaymentCodes,
  name: r'watchAllPaymentCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAllPaymentCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllPaymentCodesRef = AutoDisposeStreamProviderRef<PaymentCode>;
String _$fetchAndWatchAllPaymentCodesHash() =>
    r'adb6a2d197b982a5b52dbc8f1c18cfc4d2c27be4';

/// See also [FetchAndWatchAllPaymentCodes].
@ProviderFor(FetchAndWatchAllPaymentCodes)
final fetchAndWatchAllPaymentCodesProvider = AutoDisposeAsyncNotifierProvider<
    FetchAndWatchAllPaymentCodes, List<PaymentCode>>.internal(
  FetchAndWatchAllPaymentCodes.new,
  name: r'fetchAndWatchAllPaymentCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAndWatchAllPaymentCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FetchAndWatchAllPaymentCodes
    = AutoDisposeAsyncNotifier<List<PaymentCode>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
