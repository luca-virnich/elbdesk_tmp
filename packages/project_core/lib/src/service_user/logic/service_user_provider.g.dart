// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchServiceUserHash() => r'8fb610c64adcd9974e9bf8b16f6bb5a71682a3de';

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

/// Fetch Service User Provider
///
/// Copied from [fetchServiceUser].
@ProviderFor(fetchServiceUser)
const fetchServiceUserProvider = FetchServiceUserFamily();

/// Fetch Service User Provider
///
/// Copied from [fetchServiceUser].
class FetchServiceUserFamily extends Family<AsyncValue<ServiceUser?>> {
  /// Fetch Service User Provider
  ///
  /// Copied from [fetchServiceUser].
  const FetchServiceUserFamily();

  /// Fetch Service User Provider
  ///
  /// Copied from [fetchServiceUser].
  FetchServiceUserProvider call(
    int serviceUserId,
    String sessionId,
  ) {
    return FetchServiceUserProvider(
      serviceUserId,
      sessionId,
    );
  }

  @override
  FetchServiceUserProvider getProviderOverride(
    covariant FetchServiceUserProvider provider,
  ) {
    return call(
      provider.serviceUserId,
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
  String? get name => r'fetchServiceUserProvider';
}

/// Fetch Service User Provider
///
/// Copied from [fetchServiceUser].
class FetchServiceUserProvider extends AutoDisposeFutureProvider<ServiceUser?> {
  /// Fetch Service User Provider
  ///
  /// Copied from [fetchServiceUser].
  FetchServiceUserProvider(
    int serviceUserId,
    String sessionId,
  ) : this._internal(
          (ref) => fetchServiceUser(
            ref as FetchServiceUserRef,
            serviceUserId,
            sessionId,
          ),
          from: fetchServiceUserProvider,
          name: r'fetchServiceUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchServiceUserHash,
          dependencies: FetchServiceUserFamily._dependencies,
          allTransitiveDependencies:
              FetchServiceUserFamily._allTransitiveDependencies,
          serviceUserId: serviceUserId,
          sessionId: sessionId,
        );

  FetchServiceUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.serviceUserId,
    required this.sessionId,
  }) : super.internal();

  final int serviceUserId;
  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<ServiceUser?> Function(FetchServiceUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchServiceUserProvider._internal(
        (ref) => create(ref as FetchServiceUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        serviceUserId: serviceUserId,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ServiceUser?> createElement() {
    return _FetchServiceUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchServiceUserProvider &&
        other.serviceUserId == serviceUserId &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, serviceUserId.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchServiceUserRef on AutoDisposeFutureProviderRef<ServiceUser?> {
  /// The parameter `serviceUserId` of this provider.
  int get serviceUserId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchServiceUserProviderElement
    extends AutoDisposeFutureProviderElement<ServiceUser?>
    with FetchServiceUserRef {
  _FetchServiceUserProviderElement(super.provider);

  @override
  int get serviceUserId => (origin as FetchServiceUserProvider).serviceUserId;
  @override
  String get sessionId => (origin as FetchServiceUserProvider).sessionId;
}

String _$findServiceUsersHash() => r'967f6823d2f5c68f00feb264d32b1c325b92cc4f';

/// Fetch Service Users Provider
///
/// Fetches a list of service users from the server
/// Sort and Filter are fetched from the table state through the sessionId
///
/// Copied from [findServiceUsers].
@ProviderFor(findServiceUsers)
const findServiceUsersProvider = FindServiceUsersFamily();

/// Fetch Service Users Provider
///
/// Fetches a list of service users from the server
/// Sort and Filter are fetched from the table state through the sessionId
///
/// Copied from [findServiceUsers].
class FindServiceUsersFamily extends Family<AsyncValue<List<ServiceUser>>> {
  /// Fetch Service Users Provider
  ///
  /// Fetches a list of service users from the server
  /// Sort and Filter are fetched from the table state through the sessionId
  ///
  /// Copied from [findServiceUsers].
  const FindServiceUsersFamily();

  /// Fetch Service Users Provider
  ///
  /// Fetches a list of service users from the server
  /// Sort and Filter are fetched from the table state through the sessionId
  ///
  /// Copied from [findServiceUsers].
  FindServiceUsersProvider call(
    String sessionId,
  ) {
    return FindServiceUsersProvider(
      sessionId,
    );
  }

  @override
  FindServiceUsersProvider getProviderOverride(
    covariant FindServiceUsersProvider provider,
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
  String? get name => r'findServiceUsersProvider';
}

/// Fetch Service Users Provider
///
/// Fetches a list of service users from the server
/// Sort and Filter are fetched from the table state through the sessionId
///
/// Copied from [findServiceUsers].
class FindServiceUsersProvider
    extends AutoDisposeFutureProvider<List<ServiceUser>> {
  /// Fetch Service Users Provider
  ///
  /// Fetches a list of service users from the server
  /// Sort and Filter are fetched from the table state through the sessionId
  ///
  /// Copied from [findServiceUsers].
  FindServiceUsersProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findServiceUsers(
            ref as FindServiceUsersRef,
            sessionId,
          ),
          from: findServiceUsersProvider,
          name: r'findServiceUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findServiceUsersHash,
          dependencies: FindServiceUsersFamily._dependencies,
          allTransitiveDependencies:
              FindServiceUsersFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindServiceUsersProvider._internal(
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
    FutureOr<List<ServiceUser>> Function(FindServiceUsersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindServiceUsersProvider._internal(
        (ref) => create(ref as FindServiceUsersRef),
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
  AutoDisposeFutureProviderElement<List<ServiceUser>> createElement() {
    return _FindServiceUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindServiceUsersProvider && other.sessionId == sessionId;
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
mixin FindServiceUsersRef on AutoDisposeFutureProviderRef<List<ServiceUser>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindServiceUsersProviderElement
    extends AutoDisposeFutureProviderElement<List<ServiceUser>>
    with FindServiceUsersRef {
  _FindServiceUsersProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindServiceUsersProvider).sessionId;
}

String _$fetchAllServiceUsersHash() =>
    r'65ac96c324febd2275842178ca8cfb8744a0f5a3';

/// See also [fetchAllServiceUsers].
@ProviderFor(fetchAllServiceUsers)
const fetchAllServiceUsersProvider = FetchAllServiceUsersFamily();

/// See also [fetchAllServiceUsers].
class FetchAllServiceUsersFamily extends Family<AsyncValue<List<ServiceUser>>> {
  /// See also [fetchAllServiceUsers].
  const FetchAllServiceUsersFamily();

  /// See also [fetchAllServiceUsers].
  FetchAllServiceUsersProvider call(
    String sessionId,
  ) {
    return FetchAllServiceUsersProvider(
      sessionId,
    );
  }

  @override
  FetchAllServiceUsersProvider getProviderOverride(
    covariant FetchAllServiceUsersProvider provider,
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
  String? get name => r'fetchAllServiceUsersProvider';
}

/// See also [fetchAllServiceUsers].
class FetchAllServiceUsersProvider
    extends AutoDisposeFutureProvider<List<ServiceUser>> {
  /// See also [fetchAllServiceUsers].
  FetchAllServiceUsersProvider(
    String sessionId,
  ) : this._internal(
          (ref) => fetchAllServiceUsers(
            ref as FetchAllServiceUsersRef,
            sessionId,
          ),
          from: fetchAllServiceUsersProvider,
          name: r'fetchAllServiceUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAllServiceUsersHash,
          dependencies: FetchAllServiceUsersFamily._dependencies,
          allTransitiveDependencies:
              FetchAllServiceUsersFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FetchAllServiceUsersProvider._internal(
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
    FutureOr<List<ServiceUser>> Function(FetchAllServiceUsersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAllServiceUsersProvider._internal(
        (ref) => create(ref as FetchAllServiceUsersRef),
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
  AutoDisposeFutureProviderElement<List<ServiceUser>> createElement() {
    return _FetchAllServiceUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAllServiceUsersProvider &&
        other.sessionId == sessionId;
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
mixin FetchAllServiceUsersRef
    on AutoDisposeFutureProviderRef<List<ServiceUser>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchAllServiceUsersProviderElement
    extends AutoDisposeFutureProviderElement<List<ServiceUser>>
    with FetchAllServiceUsersRef {
  _FetchAllServiceUsersProviderElement(super.provider);

  @override
  String get sessionId => (origin as FetchAllServiceUsersProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
