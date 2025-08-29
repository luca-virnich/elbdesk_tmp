// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_department_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$companyDepartmentRepositoryHash() =>
    r'e476a7b608adf1d4b22617406eef3b02fa6c9975';

/// See also [companyDepartmentRepository].
@ProviderFor(companyDepartmentRepository)
final companyDepartmentRepositoryProvider =
    AutoDisposeProvider<CompanyDepartmentRepository>.internal(
  companyDepartmentRepository,
  name: r'companyDepartmentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$companyDepartmentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CompanyDepartmentRepositoryRef
    = AutoDisposeProviderRef<CompanyDepartmentRepository>;
String _$findCompanyDepartmentsHash() =>
    r'7abe44c4b1bce1d40316fa9c86567a89f6d2d515';

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

/// Find CompanyDepartment Provider
///
/// Copied from [findCompanyDepartments].
@ProviderFor(findCompanyDepartments)
const findCompanyDepartmentsProvider = FindCompanyDepartmentsFamily();

/// Find CompanyDepartment Provider
///
/// Copied from [findCompanyDepartments].
class FindCompanyDepartmentsFamily
    extends Family<AsyncValue<List<CompanyDepartment>>> {
  /// Find CompanyDepartment Provider
  ///
  /// Copied from [findCompanyDepartments].
  const FindCompanyDepartmentsFamily();

  /// Find CompanyDepartment Provider
  ///
  /// Copied from [findCompanyDepartments].
  FindCompanyDepartmentsProvider call(
    String sessionId,
  ) {
    return FindCompanyDepartmentsProvider(
      sessionId,
    );
  }

  @override
  FindCompanyDepartmentsProvider getProviderOverride(
    covariant FindCompanyDepartmentsProvider provider,
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
  String? get name => r'findCompanyDepartmentsProvider';
}

/// Find CompanyDepartment Provider
///
/// Copied from [findCompanyDepartments].
class FindCompanyDepartmentsProvider
    extends AutoDisposeFutureProvider<List<CompanyDepartment>> {
  /// Find CompanyDepartment Provider
  ///
  /// Copied from [findCompanyDepartments].
  FindCompanyDepartmentsProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findCompanyDepartments(
            ref as FindCompanyDepartmentsRef,
            sessionId,
          ),
          from: findCompanyDepartmentsProvider,
          name: r'findCompanyDepartmentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findCompanyDepartmentsHash,
          dependencies: FindCompanyDepartmentsFamily._dependencies,
          allTransitiveDependencies:
              FindCompanyDepartmentsFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindCompanyDepartmentsProvider._internal(
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
    FutureOr<List<CompanyDepartment>> Function(
            FindCompanyDepartmentsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindCompanyDepartmentsProvider._internal(
        (ref) => create(ref as FindCompanyDepartmentsRef),
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
  AutoDisposeFutureProviderElement<List<CompanyDepartment>> createElement() {
    return _FindCompanyDepartmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindCompanyDepartmentsProvider &&
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
mixin FindCompanyDepartmentsRef
    on AutoDisposeFutureProviderRef<List<CompanyDepartment>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindCompanyDepartmentsProviderElement
    extends AutoDisposeFutureProviderElement<List<CompanyDepartment>>
    with FindCompanyDepartmentsRef {
  _FindCompanyDepartmentsProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindCompanyDepartmentsProvider).sessionId;
}

String _$fetchCompanyDepartmentsHash() =>
    r'9b8cff429ecbb66b595aac701845f00c22e18911';

/// See also [fetchCompanyDepartments].
@ProviderFor(fetchCompanyDepartments)
final fetchCompanyDepartmentsProvider =
    AutoDisposeFutureProvider<List<CompanyDepartment>>.internal(
  fetchCompanyDepartments,
  name: r'fetchCompanyDepartmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchCompanyDepartmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchCompanyDepartmentsRef
    = AutoDisposeFutureProviderRef<List<CompanyDepartment>>;
String _$fetchCompanyDepartmentHash() =>
    r'ef891cacaddbfc1705ccd451b2f2fb0110327e0c';

/// See also [fetchCompanyDepartment].
@ProviderFor(fetchCompanyDepartment)
const fetchCompanyDepartmentProvider = FetchCompanyDepartmentFamily();

/// See also [fetchCompanyDepartment].
class FetchCompanyDepartmentFamily
    extends Family<AsyncValue<CompanyDepartment?>> {
  /// See also [fetchCompanyDepartment].
  const FetchCompanyDepartmentFamily();

  /// See also [fetchCompanyDepartment].
  FetchCompanyDepartmentProvider call(
    int id,
  ) {
    return FetchCompanyDepartmentProvider(
      id,
    );
  }

  @override
  FetchCompanyDepartmentProvider getProviderOverride(
    covariant FetchCompanyDepartmentProvider provider,
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
  String? get name => r'fetchCompanyDepartmentProvider';
}

/// See also [fetchCompanyDepartment].
class FetchCompanyDepartmentProvider
    extends AutoDisposeFutureProvider<CompanyDepartment?> {
  /// See also [fetchCompanyDepartment].
  FetchCompanyDepartmentProvider(
    int id,
  ) : this._internal(
          (ref) => fetchCompanyDepartment(
            ref as FetchCompanyDepartmentRef,
            id,
          ),
          from: fetchCompanyDepartmentProvider,
          name: r'fetchCompanyDepartmentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCompanyDepartmentHash,
          dependencies: FetchCompanyDepartmentFamily._dependencies,
          allTransitiveDependencies:
              FetchCompanyDepartmentFamily._allTransitiveDependencies,
          id: id,
        );

  FetchCompanyDepartmentProvider._internal(
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
    FutureOr<CompanyDepartment?> Function(FetchCompanyDepartmentRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCompanyDepartmentProvider._internal(
        (ref) => create(ref as FetchCompanyDepartmentRef),
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
  AutoDisposeFutureProviderElement<CompanyDepartment?> createElement() {
    return _FetchCompanyDepartmentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCompanyDepartmentProvider && other.id == id;
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
mixin FetchCompanyDepartmentRef
    on AutoDisposeFutureProviderRef<CompanyDepartment?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchCompanyDepartmentProviderElement
    extends AutoDisposeFutureProviderElement<CompanyDepartment?>
    with FetchCompanyDepartmentRef {
  _FetchCompanyDepartmentProviderElement(super.provider);

  @override
  int get id => (origin as FetchCompanyDepartmentProvider).id;
}

String _$watchCompanyDepartmentHash() =>
    r'1ea884a300ec92f8e2cc47c7477fa030f3c0629a';

/// See also [watchCompanyDepartment].
@ProviderFor(watchCompanyDepartment)
const watchCompanyDepartmentProvider = WatchCompanyDepartmentFamily();

/// See also [watchCompanyDepartment].
class WatchCompanyDepartmentFamily
    extends Family<AsyncValue<CompanyDepartment>> {
  /// See also [watchCompanyDepartment].
  const WatchCompanyDepartmentFamily();

  /// See also [watchCompanyDepartment].
  WatchCompanyDepartmentProvider call({
    required int entityId,
    required String sessionId,
  }) {
    return WatchCompanyDepartmentProvider(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  WatchCompanyDepartmentProvider getProviderOverride(
    covariant WatchCompanyDepartmentProvider provider,
  ) {
    return call(
      entityId: provider.entityId,
      sessionId: provider.sessionId,
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
  String? get name => r'watchCompanyDepartmentProvider';
}

/// See also [watchCompanyDepartment].
class WatchCompanyDepartmentProvider
    extends AutoDisposeStreamProvider<CompanyDepartment> {
  /// See also [watchCompanyDepartment].
  WatchCompanyDepartmentProvider({
    required int entityId,
    required String sessionId,
  }) : this._internal(
          (ref) => watchCompanyDepartment(
            ref as WatchCompanyDepartmentRef,
            entityId: entityId,
            sessionId: sessionId,
          ),
          from: watchCompanyDepartmentProvider,
          name: r'watchCompanyDepartmentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCompanyDepartmentHash,
          dependencies: WatchCompanyDepartmentFamily._dependencies,
          allTransitiveDependencies:
              WatchCompanyDepartmentFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  WatchCompanyDepartmentProvider._internal(
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
  Override overrideWith(
    Stream<CompanyDepartment> Function(WatchCompanyDepartmentRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCompanyDepartmentProvider._internal(
        (ref) => create(ref as WatchCompanyDepartmentRef),
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
  AutoDisposeStreamProviderElement<CompanyDepartment> createElement() {
    return _WatchCompanyDepartmentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCompanyDepartmentProvider &&
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
mixin WatchCompanyDepartmentRef
    on AutoDisposeStreamProviderRef<CompanyDepartment> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _WatchCompanyDepartmentProviderElement
    extends AutoDisposeStreamProviderElement<CompanyDepartment>
    with WatchCompanyDepartmentRef {
  _WatchCompanyDepartmentProviderElement(super.provider);

  @override
  int get entityId => (origin as WatchCompanyDepartmentProvider).entityId;
  @override
  String get sessionId => (origin as WatchCompanyDepartmentProvider).sessionId;
}

String _$fetchDepartmentsByCompanyHash() =>
    r'a1b264f179132bec6d68ecc8435b6b1ee1274a61';

/// Fetch departments by company provider
///
/// Copied from [fetchDepartmentsByCompany].
@ProviderFor(fetchDepartmentsByCompany)
const fetchDepartmentsByCompanyProvider = FetchDepartmentsByCompanyFamily();

/// Fetch departments by company provider
///
/// Copied from [fetchDepartmentsByCompany].
class FetchDepartmentsByCompanyFamily
    extends Family<AsyncValue<List<CompanyDepartment>>> {
  /// Fetch departments by company provider
  ///
  /// Copied from [fetchDepartmentsByCompany].
  const FetchDepartmentsByCompanyFamily();

  /// Fetch departments by company provider
  ///
  /// Copied from [fetchDepartmentsByCompany].
  FetchDepartmentsByCompanyProvider call(
    String sessionId, {
    required int companyId,
  }) {
    return FetchDepartmentsByCompanyProvider(
      sessionId,
      companyId: companyId,
    );
  }

  @override
  FetchDepartmentsByCompanyProvider getProviderOverride(
    covariant FetchDepartmentsByCompanyProvider provider,
  ) {
    return call(
      provider.sessionId,
      companyId: provider.companyId,
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
  String? get name => r'fetchDepartmentsByCompanyProvider';
}

/// Fetch departments by company provider
///
/// Copied from [fetchDepartmentsByCompany].
class FetchDepartmentsByCompanyProvider
    extends AutoDisposeFutureProvider<List<CompanyDepartment>> {
  /// Fetch departments by company provider
  ///
  /// Copied from [fetchDepartmentsByCompany].
  FetchDepartmentsByCompanyProvider(
    String sessionId, {
    required int companyId,
  }) : this._internal(
          (ref) => fetchDepartmentsByCompany(
            ref as FetchDepartmentsByCompanyRef,
            sessionId,
            companyId: companyId,
          ),
          from: fetchDepartmentsByCompanyProvider,
          name: r'fetchDepartmentsByCompanyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchDepartmentsByCompanyHash,
          dependencies: FetchDepartmentsByCompanyFamily._dependencies,
          allTransitiveDependencies:
              FetchDepartmentsByCompanyFamily._allTransitiveDependencies,
          sessionId: sessionId,
          companyId: companyId,
        );

  FetchDepartmentsByCompanyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.companyId,
  }) : super.internal();

  final String sessionId;
  final int companyId;

  @override
  Override overrideWith(
    FutureOr<List<CompanyDepartment>> Function(
            FetchDepartmentsByCompanyRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchDepartmentsByCompanyProvider._internal(
        (ref) => create(ref as FetchDepartmentsByCompanyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        companyId: companyId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CompanyDepartment>> createElement() {
    return _FetchDepartmentsByCompanyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchDepartmentsByCompanyProvider &&
        other.sessionId == sessionId &&
        other.companyId == companyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, companyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchDepartmentsByCompanyRef
    on AutoDisposeFutureProviderRef<List<CompanyDepartment>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `companyId` of this provider.
  int get companyId;
}

class _FetchDepartmentsByCompanyProviderElement
    extends AutoDisposeFutureProviderElement<List<CompanyDepartment>>
    with FetchDepartmentsByCompanyRef {
  _FetchDepartmentsByCompanyProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FetchDepartmentsByCompanyProvider).sessionId;
  @override
  int get companyId => (origin as FetchDepartmentsByCompanyProvider).companyId;
}

String _$watchDepartmentsByCompanyUpdatesHash() =>
    r'7b50203565188be828cea68c4b8591f5858c982c';

/// Watch departments by company updates provider
///
/// Copied from [watchDepartmentsByCompanyUpdates].
@ProviderFor(watchDepartmentsByCompanyUpdates)
const watchDepartmentsByCompanyUpdatesProvider =
    WatchDepartmentsByCompanyUpdatesFamily();

/// Watch departments by company updates provider
///
/// Copied from [watchDepartmentsByCompanyUpdates].
class WatchDepartmentsByCompanyUpdatesFamily
    extends Family<AsyncValue<CompanyDepartment>> {
  /// Watch departments by company updates provider
  ///
  /// Copied from [watchDepartmentsByCompanyUpdates].
  const WatchDepartmentsByCompanyUpdatesFamily();

  /// Watch departments by company updates provider
  ///
  /// Copied from [watchDepartmentsByCompanyUpdates].
  WatchDepartmentsByCompanyUpdatesProvider call(
    int companyId,
  ) {
    return WatchDepartmentsByCompanyUpdatesProvider(
      companyId,
    );
  }

  @override
  WatchDepartmentsByCompanyUpdatesProvider getProviderOverride(
    covariant WatchDepartmentsByCompanyUpdatesProvider provider,
  ) {
    return call(
      provider.companyId,
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
  String? get name => r'watchDepartmentsByCompanyUpdatesProvider';
}

/// Watch departments by company updates provider
///
/// Copied from [watchDepartmentsByCompanyUpdates].
class WatchDepartmentsByCompanyUpdatesProvider
    extends AutoDisposeStreamProvider<CompanyDepartment> {
  /// Watch departments by company updates provider
  ///
  /// Copied from [watchDepartmentsByCompanyUpdates].
  WatchDepartmentsByCompanyUpdatesProvider(
    int companyId,
  ) : this._internal(
          (ref) => watchDepartmentsByCompanyUpdates(
            ref as WatchDepartmentsByCompanyUpdatesRef,
            companyId,
          ),
          from: watchDepartmentsByCompanyUpdatesProvider,
          name: r'watchDepartmentsByCompanyUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDepartmentsByCompanyUpdatesHash,
          dependencies: WatchDepartmentsByCompanyUpdatesFamily._dependencies,
          allTransitiveDependencies:
              WatchDepartmentsByCompanyUpdatesFamily._allTransitiveDependencies,
          companyId: companyId,
        );

  WatchDepartmentsByCompanyUpdatesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.companyId,
  }) : super.internal();

  final int companyId;

  @override
  Override overrideWith(
    Stream<CompanyDepartment> Function(
            WatchDepartmentsByCompanyUpdatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchDepartmentsByCompanyUpdatesProvider._internal(
        (ref) => create(ref as WatchDepartmentsByCompanyUpdatesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        companyId: companyId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<CompanyDepartment> createElement() {
    return _WatchDepartmentsByCompanyUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDepartmentsByCompanyUpdatesProvider &&
        other.companyId == companyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, companyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchDepartmentsByCompanyUpdatesRef
    on AutoDisposeStreamProviderRef<CompanyDepartment> {
  /// The parameter `companyId` of this provider.
  int get companyId;
}

class _WatchDepartmentsByCompanyUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<CompanyDepartment>
    with WatchDepartmentsByCompanyUpdatesRef {
  _WatchDepartmentsByCompanyUpdatesProviderElement(super.provider);

  @override
  int get companyId =>
      (origin as WatchDepartmentsByCompanyUpdatesProvider).companyId;
}

String _$fetchDepartmentsByEmployeeHash() =>
    r'dcfbb06ea13bdc47d45e938bd4feb7323d5a6bc3';

/// Fetch departments by employee provider
///
/// Copied from [fetchDepartmentsByEmployee].
@ProviderFor(fetchDepartmentsByEmployee)
const fetchDepartmentsByEmployeeProvider = FetchDepartmentsByEmployeeFamily();

/// Fetch departments by employee provider
///
/// Copied from [fetchDepartmentsByEmployee].
class FetchDepartmentsByEmployeeFamily
    extends Family<AsyncValue<List<CompanyDepartment>>> {
  /// Fetch departments by employee provider
  ///
  /// Copied from [fetchDepartmentsByEmployee].
  const FetchDepartmentsByEmployeeFamily();

  /// Fetch departments by employee provider
  ///
  /// Copied from [fetchDepartmentsByEmployee].
  FetchDepartmentsByEmployeeProvider call(
    int employeeId,
  ) {
    return FetchDepartmentsByEmployeeProvider(
      employeeId,
    );
  }

  @override
  FetchDepartmentsByEmployeeProvider getProviderOverride(
    covariant FetchDepartmentsByEmployeeProvider provider,
  ) {
    return call(
      provider.employeeId,
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
  String? get name => r'fetchDepartmentsByEmployeeProvider';
}

/// Fetch departments by employee provider
///
/// Copied from [fetchDepartmentsByEmployee].
class FetchDepartmentsByEmployeeProvider
    extends AutoDisposeFutureProvider<List<CompanyDepartment>> {
  /// Fetch departments by employee provider
  ///
  /// Copied from [fetchDepartmentsByEmployee].
  FetchDepartmentsByEmployeeProvider(
    int employeeId,
  ) : this._internal(
          (ref) => fetchDepartmentsByEmployee(
            ref as FetchDepartmentsByEmployeeRef,
            employeeId,
          ),
          from: fetchDepartmentsByEmployeeProvider,
          name: r'fetchDepartmentsByEmployeeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchDepartmentsByEmployeeHash,
          dependencies: FetchDepartmentsByEmployeeFamily._dependencies,
          allTransitiveDependencies:
              FetchDepartmentsByEmployeeFamily._allTransitiveDependencies,
          employeeId: employeeId,
        );

  FetchDepartmentsByEmployeeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.employeeId,
  }) : super.internal();

  final int employeeId;

  @override
  Override overrideWith(
    FutureOr<List<CompanyDepartment>> Function(
            FetchDepartmentsByEmployeeRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchDepartmentsByEmployeeProvider._internal(
        (ref) => create(ref as FetchDepartmentsByEmployeeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CompanyDepartment>> createElement() {
    return _FetchDepartmentsByEmployeeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchDepartmentsByEmployeeProvider &&
        other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchDepartmentsByEmployeeRef
    on AutoDisposeFutureProviderRef<List<CompanyDepartment>> {
  /// The parameter `employeeId` of this provider.
  int get employeeId;
}

class _FetchDepartmentsByEmployeeProviderElement
    extends AutoDisposeFutureProviderElement<List<CompanyDepartment>>
    with FetchDepartmentsByEmployeeRef {
  _FetchDepartmentsByEmployeeProviderElement(super.provider);

  @override
  int get employeeId =>
      (origin as FetchDepartmentsByEmployeeProvider).employeeId;
}

String _$watchDepartmentsByEmployeeUpdatesHash() =>
    r'4d11aff8d466caab7768bff8866638cb244828d4';

/// Watch departments by employee updates provider
///
/// Copied from [watchDepartmentsByEmployeeUpdates].
@ProviderFor(watchDepartmentsByEmployeeUpdates)
const watchDepartmentsByEmployeeUpdatesProvider =
    WatchDepartmentsByEmployeeUpdatesFamily();

/// Watch departments by employee updates provider
///
/// Copied from [watchDepartmentsByEmployeeUpdates].
class WatchDepartmentsByEmployeeUpdatesFamily
    extends Family<AsyncValue<CompanyDepartment>> {
  /// Watch departments by employee updates provider
  ///
  /// Copied from [watchDepartmentsByEmployeeUpdates].
  const WatchDepartmentsByEmployeeUpdatesFamily();

  /// Watch departments by employee updates provider
  ///
  /// Copied from [watchDepartmentsByEmployeeUpdates].
  WatchDepartmentsByEmployeeUpdatesProvider call(
    int employeeId,
  ) {
    return WatchDepartmentsByEmployeeUpdatesProvider(
      employeeId,
    );
  }

  @override
  WatchDepartmentsByEmployeeUpdatesProvider getProviderOverride(
    covariant WatchDepartmentsByEmployeeUpdatesProvider provider,
  ) {
    return call(
      provider.employeeId,
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
  String? get name => r'watchDepartmentsByEmployeeUpdatesProvider';
}

/// Watch departments by employee updates provider
///
/// Copied from [watchDepartmentsByEmployeeUpdates].
class WatchDepartmentsByEmployeeUpdatesProvider
    extends AutoDisposeStreamProvider<CompanyDepartment> {
  /// Watch departments by employee updates provider
  ///
  /// Copied from [watchDepartmentsByEmployeeUpdates].
  WatchDepartmentsByEmployeeUpdatesProvider(
    int employeeId,
  ) : this._internal(
          (ref) => watchDepartmentsByEmployeeUpdates(
            ref as WatchDepartmentsByEmployeeUpdatesRef,
            employeeId,
          ),
          from: watchDepartmentsByEmployeeUpdatesProvider,
          name: r'watchDepartmentsByEmployeeUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDepartmentsByEmployeeUpdatesHash,
          dependencies: WatchDepartmentsByEmployeeUpdatesFamily._dependencies,
          allTransitiveDependencies: WatchDepartmentsByEmployeeUpdatesFamily
              ._allTransitiveDependencies,
          employeeId: employeeId,
        );

  WatchDepartmentsByEmployeeUpdatesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.employeeId,
  }) : super.internal();

  final int employeeId;

  @override
  Override overrideWith(
    Stream<CompanyDepartment> Function(
            WatchDepartmentsByEmployeeUpdatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchDepartmentsByEmployeeUpdatesProvider._internal(
        (ref) => create(ref as WatchDepartmentsByEmployeeUpdatesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<CompanyDepartment> createElement() {
    return _WatchDepartmentsByEmployeeUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDepartmentsByEmployeeUpdatesProvider &&
        other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchDepartmentsByEmployeeUpdatesRef
    on AutoDisposeStreamProviderRef<CompanyDepartment> {
  /// The parameter `employeeId` of this provider.
  int get employeeId;
}

class _WatchDepartmentsByEmployeeUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<CompanyDepartment>
    with WatchDepartmentsByEmployeeUpdatesRef {
  _WatchDepartmentsByEmployeeUpdatesProviderElement(super.provider);

  @override
  int get employeeId =>
      (origin as WatchDepartmentsByEmployeeUpdatesProvider).employeeId;
}

String _$watchEmployeeRemovalsFromAnyDepartmentHash() =>
    r'0843f347ea77624b6d112b87f6a3e2d234a29b9b';

/// Watch employee removals from any department provider
///
/// Copied from [watchEmployeeRemovalsFromAnyDepartment].
@ProviderFor(watchEmployeeRemovalsFromAnyDepartment)
const watchEmployeeRemovalsFromAnyDepartmentProvider =
    WatchEmployeeRemovalsFromAnyDepartmentFamily();

/// Watch employee removals from any department provider
///
/// Copied from [watchEmployeeRemovalsFromAnyDepartment].
class WatchEmployeeRemovalsFromAnyDepartmentFamily
    extends Family<AsyncValue<int>> {
  /// Watch employee removals from any department provider
  ///
  /// Copied from [watchEmployeeRemovalsFromAnyDepartment].
  const WatchEmployeeRemovalsFromAnyDepartmentFamily();

  /// Watch employee removals from any department provider
  ///
  /// Copied from [watchEmployeeRemovalsFromAnyDepartment].
  WatchEmployeeRemovalsFromAnyDepartmentProvider call(
    int employeeId,
  ) {
    return WatchEmployeeRemovalsFromAnyDepartmentProvider(
      employeeId,
    );
  }

  @override
  WatchEmployeeRemovalsFromAnyDepartmentProvider getProviderOverride(
    covariant WatchEmployeeRemovalsFromAnyDepartmentProvider provider,
  ) {
    return call(
      provider.employeeId,
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
  String? get name => r'watchEmployeeRemovalsFromAnyDepartmentProvider';
}

/// Watch employee removals from any department provider
///
/// Copied from [watchEmployeeRemovalsFromAnyDepartment].
class WatchEmployeeRemovalsFromAnyDepartmentProvider
    extends AutoDisposeStreamProvider<int> {
  /// Watch employee removals from any department provider
  ///
  /// Copied from [watchEmployeeRemovalsFromAnyDepartment].
  WatchEmployeeRemovalsFromAnyDepartmentProvider(
    int employeeId,
  ) : this._internal(
          (ref) => watchEmployeeRemovalsFromAnyDepartment(
            ref as WatchEmployeeRemovalsFromAnyDepartmentRef,
            employeeId,
          ),
          from: watchEmployeeRemovalsFromAnyDepartmentProvider,
          name: r'watchEmployeeRemovalsFromAnyDepartmentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchEmployeeRemovalsFromAnyDepartmentHash,
          dependencies:
              WatchEmployeeRemovalsFromAnyDepartmentFamily._dependencies,
          allTransitiveDependencies:
              WatchEmployeeRemovalsFromAnyDepartmentFamily
                  ._allTransitiveDependencies,
          employeeId: employeeId,
        );

  WatchEmployeeRemovalsFromAnyDepartmentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.employeeId,
  }) : super.internal();

  final int employeeId;

  @override
  Override overrideWith(
    Stream<int> Function(WatchEmployeeRemovalsFromAnyDepartmentRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchEmployeeRemovalsFromAnyDepartmentProvider._internal(
        (ref) => create(ref as WatchEmployeeRemovalsFromAnyDepartmentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<int> createElement() {
    return _WatchEmployeeRemovalsFromAnyDepartmentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEmployeeRemovalsFromAnyDepartmentProvider &&
        other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchEmployeeRemovalsFromAnyDepartmentRef
    on AutoDisposeStreamProviderRef<int> {
  /// The parameter `employeeId` of this provider.
  int get employeeId;
}

class _WatchEmployeeRemovalsFromAnyDepartmentProviderElement
    extends AutoDisposeStreamProviderElement<int>
    with WatchEmployeeRemovalsFromAnyDepartmentRef {
  _WatchEmployeeRemovalsFromAnyDepartmentProviderElement(super.provider);

  @override
  int get employeeId =>
      (origin as WatchEmployeeRemovalsFromAnyDepartmentProvider).employeeId;
}

String _$watchDepartmentsByCompanyHash() =>
    r'231eb0b6f7d45a48d19efa9b807d0d8f5b187020';

abstract class _$WatchDepartmentsByCompany
    extends BuildlessAutoDisposeAsyncNotifier<List<CompanyDepartment>> {
  late final String sessionId;
  late final int companyId;

  FutureOr<List<CompanyDepartment>> build(
    String sessionId, {
    required int companyId,
  });
}

/// Watch departments by company provider
///
/// Copied from [WatchDepartmentsByCompany].
@ProviderFor(WatchDepartmentsByCompany)
const watchDepartmentsByCompanyProvider = WatchDepartmentsByCompanyFamily();

/// Watch departments by company provider
///
/// Copied from [WatchDepartmentsByCompany].
class WatchDepartmentsByCompanyFamily
    extends Family<AsyncValue<List<CompanyDepartment>>> {
  /// Watch departments by company provider
  ///
  /// Copied from [WatchDepartmentsByCompany].
  const WatchDepartmentsByCompanyFamily();

  /// Watch departments by company provider
  ///
  /// Copied from [WatchDepartmentsByCompany].
  WatchDepartmentsByCompanyProvider call(
    String sessionId, {
    required int companyId,
  }) {
    return WatchDepartmentsByCompanyProvider(
      sessionId,
      companyId: companyId,
    );
  }

  @override
  WatchDepartmentsByCompanyProvider getProviderOverride(
    covariant WatchDepartmentsByCompanyProvider provider,
  ) {
    return call(
      provider.sessionId,
      companyId: provider.companyId,
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
  String? get name => r'watchDepartmentsByCompanyProvider';
}

/// Watch departments by company provider
///
/// Copied from [WatchDepartmentsByCompany].
class WatchDepartmentsByCompanyProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchDepartmentsByCompany,
        List<CompanyDepartment>> {
  /// Watch departments by company provider
  ///
  /// Copied from [WatchDepartmentsByCompany].
  WatchDepartmentsByCompanyProvider(
    String sessionId, {
    required int companyId,
  }) : this._internal(
          () => WatchDepartmentsByCompany()
            ..sessionId = sessionId
            ..companyId = companyId,
          from: watchDepartmentsByCompanyProvider,
          name: r'watchDepartmentsByCompanyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDepartmentsByCompanyHash,
          dependencies: WatchDepartmentsByCompanyFamily._dependencies,
          allTransitiveDependencies:
              WatchDepartmentsByCompanyFamily._allTransitiveDependencies,
          sessionId: sessionId,
          companyId: companyId,
        );

  WatchDepartmentsByCompanyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.companyId,
  }) : super.internal();

  final String sessionId;
  final int companyId;

  @override
  FutureOr<List<CompanyDepartment>> runNotifierBuild(
    covariant WatchDepartmentsByCompany notifier,
  ) {
    return notifier.build(
      sessionId,
      companyId: companyId,
    );
  }

  @override
  Override overrideWith(WatchDepartmentsByCompany Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchDepartmentsByCompanyProvider._internal(
        () => create()
          ..sessionId = sessionId
          ..companyId = companyId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        companyId: companyId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WatchDepartmentsByCompany,
      List<CompanyDepartment>> createElement() {
    return _WatchDepartmentsByCompanyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDepartmentsByCompanyProvider &&
        other.sessionId == sessionId &&
        other.companyId == companyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, companyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchDepartmentsByCompanyRef
    on AutoDisposeAsyncNotifierProviderRef<List<CompanyDepartment>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `companyId` of this provider.
  int get companyId;
}

class _WatchDepartmentsByCompanyProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WatchDepartmentsByCompany,
        List<CompanyDepartment>> with WatchDepartmentsByCompanyRef {
  _WatchDepartmentsByCompanyProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchDepartmentsByCompanyProvider).sessionId;
  @override
  int get companyId => (origin as WatchDepartmentsByCompanyProvider).companyId;
}

String _$watchDepartmentsByEmployeeHash() =>
    r'd92d9670dea62efc58c46cdfd5c5c11abd7b3285';

abstract class _$WatchDepartmentsByEmployee
    extends BuildlessAutoDisposeAsyncNotifier<List<CompanyDepartment>> {
  late final int employeeId;

  FutureOr<List<CompanyDepartment>> build({
    required int employeeId,
  });
}

/// Watch departments by employee provider
///
/// Used to fetch all departments in the EmployeeCard
///
/// Copied from [WatchDepartmentsByEmployee].
@ProviderFor(WatchDepartmentsByEmployee)
const watchDepartmentsByEmployeeProvider = WatchDepartmentsByEmployeeFamily();

/// Watch departments by employee provider
///
/// Used to fetch all departments in the EmployeeCard
///
/// Copied from [WatchDepartmentsByEmployee].
class WatchDepartmentsByEmployeeFamily
    extends Family<AsyncValue<List<CompanyDepartment>>> {
  /// Watch departments by employee provider
  ///
  /// Used to fetch all departments in the EmployeeCard
  ///
  /// Copied from [WatchDepartmentsByEmployee].
  const WatchDepartmentsByEmployeeFamily();

  /// Watch departments by employee provider
  ///
  /// Used to fetch all departments in the EmployeeCard
  ///
  /// Copied from [WatchDepartmentsByEmployee].
  WatchDepartmentsByEmployeeProvider call({
    required int employeeId,
  }) {
    return WatchDepartmentsByEmployeeProvider(
      employeeId: employeeId,
    );
  }

  @override
  WatchDepartmentsByEmployeeProvider getProviderOverride(
    covariant WatchDepartmentsByEmployeeProvider provider,
  ) {
    return call(
      employeeId: provider.employeeId,
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
  String? get name => r'watchDepartmentsByEmployeeProvider';
}

/// Watch departments by employee provider
///
/// Used to fetch all departments in the EmployeeCard
///
/// Copied from [WatchDepartmentsByEmployee].
class WatchDepartmentsByEmployeeProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchDepartmentsByEmployee,
        List<CompanyDepartment>> {
  /// Watch departments by employee provider
  ///
  /// Used to fetch all departments in the EmployeeCard
  ///
  /// Copied from [WatchDepartmentsByEmployee].
  WatchDepartmentsByEmployeeProvider({
    required int employeeId,
  }) : this._internal(
          () => WatchDepartmentsByEmployee()..employeeId = employeeId,
          from: watchDepartmentsByEmployeeProvider,
          name: r'watchDepartmentsByEmployeeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchDepartmentsByEmployeeHash,
          dependencies: WatchDepartmentsByEmployeeFamily._dependencies,
          allTransitiveDependencies:
              WatchDepartmentsByEmployeeFamily._allTransitiveDependencies,
          employeeId: employeeId,
        );

  WatchDepartmentsByEmployeeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.employeeId,
  }) : super.internal();

  final int employeeId;

  @override
  FutureOr<List<CompanyDepartment>> runNotifierBuild(
    covariant WatchDepartmentsByEmployee notifier,
  ) {
    return notifier.build(
      employeeId: employeeId,
    );
  }

  @override
  Override overrideWith(WatchDepartmentsByEmployee Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchDepartmentsByEmployeeProvider._internal(
        () => create()..employeeId = employeeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WatchDepartmentsByEmployee,
      List<CompanyDepartment>> createElement() {
    return _WatchDepartmentsByEmployeeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchDepartmentsByEmployeeProvider &&
        other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchDepartmentsByEmployeeRef
    on AutoDisposeAsyncNotifierProviderRef<List<CompanyDepartment>> {
  /// The parameter `employeeId` of this provider.
  int get employeeId;
}

class _WatchDepartmentsByEmployeeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WatchDepartmentsByEmployee,
        List<CompanyDepartment>> with WatchDepartmentsByEmployeeRef {
  _WatchDepartmentsByEmployeeProviderElement(super.provider);

  @override
  int get employeeId =>
      (origin as WatchDepartmentsByEmployeeProvider).employeeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
