// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_code_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$departmentCodeRepositoryHash() =>
    r'ef200b2d63d8af976233efb411aea224583b2a6c';

/// See also [departmentCodeRepository].
@ProviderFor(departmentCodeRepository)
final departmentCodeRepositoryProvider =
    AutoDisposeProvider<DepartmentCodeRepository>.internal(
  departmentCodeRepository,
  name: r'departmentCodeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$departmentCodeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DepartmentCodeRepositoryRef
    = AutoDisposeProviderRef<DepartmentCodeRepository>;
String _$fetchDepartmentCodeHash() =>
    r'49dc12111a98e9814b3e1049aedcc7e42318ce96';

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

/// See also [fetchDepartmentCode].
@ProviderFor(fetchDepartmentCode)
const fetchDepartmentCodeProvider = FetchDepartmentCodeFamily();

/// See also [fetchDepartmentCode].
class FetchDepartmentCodeFamily extends Family<AsyncValue<DepartmentCode>> {
  /// See also [fetchDepartmentCode].
  const FetchDepartmentCodeFamily();

  /// See also [fetchDepartmentCode].
  FetchDepartmentCodeProvider call(
    int id,
  ) {
    return FetchDepartmentCodeProvider(
      id,
    );
  }

  @override
  FetchDepartmentCodeProvider getProviderOverride(
    covariant FetchDepartmentCodeProvider provider,
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
  String? get name => r'fetchDepartmentCodeProvider';
}

/// See also [fetchDepartmentCode].
class FetchDepartmentCodeProvider
    extends AutoDisposeFutureProvider<DepartmentCode> {
  /// See also [fetchDepartmentCode].
  FetchDepartmentCodeProvider(
    int id,
  ) : this._internal(
          (ref) => fetchDepartmentCode(
            ref as FetchDepartmentCodeRef,
            id,
          ),
          from: fetchDepartmentCodeProvider,
          name: r'fetchDepartmentCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchDepartmentCodeHash,
          dependencies: FetchDepartmentCodeFamily._dependencies,
          allTransitiveDependencies:
              FetchDepartmentCodeFamily._allTransitiveDependencies,
          id: id,
        );

  FetchDepartmentCodeProvider._internal(
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
    FutureOr<DepartmentCode> Function(FetchDepartmentCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchDepartmentCodeProvider._internal(
        (ref) => create(ref as FetchDepartmentCodeRef),
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
  AutoDisposeFutureProviderElement<DepartmentCode> createElement() {
    return _FetchDepartmentCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchDepartmentCodeProvider && other.id == id;
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
mixin FetchDepartmentCodeRef on AutoDisposeFutureProviderRef<DepartmentCode> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchDepartmentCodeProviderElement
    extends AutoDisposeFutureProviderElement<DepartmentCode>
    with FetchDepartmentCodeRef {
  _FetchDepartmentCodeProviderElement(super.provider);

  @override
  int get id => (origin as FetchDepartmentCodeProvider).id;
}

String _$fetchAllDepartmentCodesHash() =>
    r'b23f12c6e94d43e884af33177156e118019403a6';

/// Used to fetch all department codes when adding an entity which
/// requires a department code (like an app user).
///
/// Copied from [fetchAllDepartmentCodes].
@ProviderFor(fetchAllDepartmentCodes)
final fetchAllDepartmentCodesProvider =
    AutoDisposeFutureProvider<List<DepartmentCode>>.internal(
  fetchAllDepartmentCodes,
  name: r'fetchAllDepartmentCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAllDepartmentCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchAllDepartmentCodesRef
    = AutoDisposeFutureProviderRef<List<DepartmentCode>>;
String _$findDepartmentCodesHash() =>
    r'8a9be36381ee77fefb554b84837a1db99141948f';

/// See also [findDepartmentCodes].
@ProviderFor(findDepartmentCodes)
const findDepartmentCodesProvider = FindDepartmentCodesFamily();

/// See also [findDepartmentCodes].
class FindDepartmentCodesFamily
    extends Family<AsyncValue<List<DepartmentCode>>> {
  /// See also [findDepartmentCodes].
  const FindDepartmentCodesFamily();

  /// See also [findDepartmentCodes].
  FindDepartmentCodesProvider call(
    String sessionId,
  ) {
    return FindDepartmentCodesProvider(
      sessionId,
    );
  }

  @override
  FindDepartmentCodesProvider getProviderOverride(
    covariant FindDepartmentCodesProvider provider,
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
  String? get name => r'findDepartmentCodesProvider';
}

/// See also [findDepartmentCodes].
class FindDepartmentCodesProvider
    extends AutoDisposeFutureProvider<List<DepartmentCode>> {
  /// See also [findDepartmentCodes].
  FindDepartmentCodesProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findDepartmentCodes(
            ref as FindDepartmentCodesRef,
            sessionId,
          ),
          from: findDepartmentCodesProvider,
          name: r'findDepartmentCodesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findDepartmentCodesHash,
          dependencies: FindDepartmentCodesFamily._dependencies,
          allTransitiveDependencies:
              FindDepartmentCodesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindDepartmentCodesProvider._internal(
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
    FutureOr<List<DepartmentCode>> Function(FindDepartmentCodesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindDepartmentCodesProvider._internal(
        (ref) => create(ref as FindDepartmentCodesRef),
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
  AutoDisposeFutureProviderElement<List<DepartmentCode>> createElement() {
    return _FindDepartmentCodesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindDepartmentCodesProvider && other.sessionId == sessionId;
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
mixin FindDepartmentCodesRef
    on AutoDisposeFutureProviderRef<List<DepartmentCode>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindDepartmentCodesProviderElement
    extends AutoDisposeFutureProviderElement<List<DepartmentCode>>
    with FindDepartmentCodesRef {
  _FindDepartmentCodesProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindDepartmentCodesProvider).sessionId;
}

String _$watchDepartmentCodeHash() =>
    r'658c26b5f683362e066dd6c65386005e29213c47';

/// See also [watchDepartmentCode].
@ProviderFor(watchDepartmentCode)
const watchDepartmentCodeProvider = WatchDepartmentCodeFamily();

/// See also [watchDepartmentCode].
class WatchDepartmentCodeFamily extends Family<AsyncValue<DepartmentCode>> {
  /// See also [watchDepartmentCode].
  const WatchDepartmentCodeFamily();

  /// See also [watchDepartmentCode].
  WatchDepartmentCodeProvider call({
    required String sessionId,
    required int id,
  }) {
    return WatchDepartmentCodeProvider(
      sessionId: sessionId,
      id: id,
    );
  }

  @override
  WatchDepartmentCodeProvider getProviderOverride(
    covariant WatchDepartmentCodeProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      id: provider.id,
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
  String? get name => r'watchDepartmentCodeProvider';
}

/// See also [watchDepartmentCode].
class WatchDepartmentCodeProvider
    extends AutoDisposeStreamProvider<DepartmentCode> {
  /// See also [watchDepartmentCode].
  WatchDepartmentCodeProvider({
    required String sessionId,
    required int id,
  }) : this._internal(
          (ref) => watchDepartmentCode(
            ref as WatchDepartmentCodeRef,
            sessionId: sessionId,
            id: id,
          ),
          from: watchDepartmentCodeProvider,
          name: r'watchDepartmentCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDepartmentCodeHash,
          dependencies: WatchDepartmentCodeFamily._dependencies,
          allTransitiveDependencies:
              WatchDepartmentCodeFamily._allTransitiveDependencies,
          sessionId: sessionId,
          id: id,
        );

  WatchDepartmentCodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.id,
  }) : super.internal();

  final String sessionId;
  final int id;

  @override
  Override overrideWith(
    Stream<DepartmentCode> Function(WatchDepartmentCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchDepartmentCodeProvider._internal(
        (ref) => create(ref as WatchDepartmentCodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<DepartmentCode> createElement() {
    return _WatchDepartmentCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDepartmentCodeProvider &&
        other.sessionId == sessionId &&
        other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchDepartmentCodeRef on AutoDisposeStreamProviderRef<DepartmentCode> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `id` of this provider.
  int get id;
}

class _WatchDepartmentCodeProviderElement
    extends AutoDisposeStreamProviderElement<DepartmentCode>
    with WatchDepartmentCodeRef {
  _WatchDepartmentCodeProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchDepartmentCodeProvider).sessionId;
  @override
  int get id => (origin as WatchDepartmentCodeProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
