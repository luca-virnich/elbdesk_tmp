// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_employee_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$companyEmployeeRepositoryHash() =>
    r'b39739678e5dfd5f642db3c765068d5da0144b09';

/// See also [companyEmployeeRepository].
@ProviderFor(companyEmployeeRepository)
final companyEmployeeRepositoryProvider =
    AutoDisposeProvider<CompanyEmployeeRepository>.internal(
  companyEmployeeRepository,
  name: r'companyEmployeeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$companyEmployeeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CompanyEmployeeRepositoryRef
    = AutoDisposeProviderRef<CompanyEmployeeRepository>;
String _$watchCompanyEmployeeHash() =>
    r'5ca670d73a4b356ee20de54b509b0b06f85271eb';

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

/// See also [watchCompanyEmployee].
@ProviderFor(watchCompanyEmployee)
const watchCompanyEmployeeProvider = WatchCompanyEmployeeFamily();

/// See also [watchCompanyEmployee].
class WatchCompanyEmployeeFamily extends Family<AsyncValue<CompanyEmployee>> {
  /// See also [watchCompanyEmployee].
  const WatchCompanyEmployeeFamily();

  /// See also [watchCompanyEmployee].
  WatchCompanyEmployeeProvider call({
    required String sessionId,
    required int companyEmployeeId,
  }) {
    return WatchCompanyEmployeeProvider(
      sessionId: sessionId,
      companyEmployeeId: companyEmployeeId,
    );
  }

  @override
  WatchCompanyEmployeeProvider getProviderOverride(
    covariant WatchCompanyEmployeeProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      companyEmployeeId: provider.companyEmployeeId,
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
  String? get name => r'watchCompanyEmployeeProvider';
}

/// See also [watchCompanyEmployee].
class WatchCompanyEmployeeProvider
    extends AutoDisposeStreamProvider<CompanyEmployee> {
  /// See also [watchCompanyEmployee].
  WatchCompanyEmployeeProvider({
    required String sessionId,
    required int companyEmployeeId,
  }) : this._internal(
          (ref) => watchCompanyEmployee(
            ref as WatchCompanyEmployeeRef,
            sessionId: sessionId,
            companyEmployeeId: companyEmployeeId,
          ),
          from: watchCompanyEmployeeProvider,
          name: r'watchCompanyEmployeeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCompanyEmployeeHash,
          dependencies: WatchCompanyEmployeeFamily._dependencies,
          allTransitiveDependencies:
              WatchCompanyEmployeeFamily._allTransitiveDependencies,
          sessionId: sessionId,
          companyEmployeeId: companyEmployeeId,
        );

  WatchCompanyEmployeeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.companyEmployeeId,
  }) : super.internal();

  final String sessionId;
  final int companyEmployeeId;

  @override
  Override overrideWith(
    Stream<CompanyEmployee> Function(WatchCompanyEmployeeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCompanyEmployeeProvider._internal(
        (ref) => create(ref as WatchCompanyEmployeeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        companyEmployeeId: companyEmployeeId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<CompanyEmployee> createElement() {
    return _WatchCompanyEmployeeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCompanyEmployeeProvider &&
        other.sessionId == sessionId &&
        other.companyEmployeeId == companyEmployeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, companyEmployeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchCompanyEmployeeRef on AutoDisposeStreamProviderRef<CompanyEmployee> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `companyEmployeeId` of this provider.
  int get companyEmployeeId;
}

class _WatchCompanyEmployeeProviderElement
    extends AutoDisposeStreamProviderElement<CompanyEmployee>
    with WatchCompanyEmployeeRef {
  _WatchCompanyEmployeeProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchCompanyEmployeeProvider).sessionId;
  @override
  int get companyEmployeeId =>
      (origin as WatchCompanyEmployeeProvider).companyEmployeeId;
}

String _$watchEmployeeUpdatesHash() =>
    r'd3f3d7dbfc9c9fa09a027a145d16f868bc98178a';

/// See also [watchEmployeeUpdates].
@ProviderFor(watchEmployeeUpdates)
const watchEmployeeUpdatesProvider = WatchEmployeeUpdatesFamily();

/// See also [watchEmployeeUpdates].
class WatchEmployeeUpdatesFamily
    extends Family<AsyncValue<(int?, CompanyEmployee?)>> {
  /// See also [watchEmployeeUpdates].
  const WatchEmployeeUpdatesFamily();

  /// See also [watchEmployeeUpdates].
  WatchEmployeeUpdatesProvider call(
    String sessionId, {
    required int companyId,
  }) {
    return WatchEmployeeUpdatesProvider(
      sessionId,
      companyId: companyId,
    );
  }

  @override
  WatchEmployeeUpdatesProvider getProviderOverride(
    covariant WatchEmployeeUpdatesProvider provider,
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
  String? get name => r'watchEmployeeUpdatesProvider';
}

/// See also [watchEmployeeUpdates].
class WatchEmployeeUpdatesProvider
    extends AutoDisposeStreamProvider<(int?, CompanyEmployee?)> {
  /// See also [watchEmployeeUpdates].
  WatchEmployeeUpdatesProvider(
    String sessionId, {
    required int companyId,
  }) : this._internal(
          (ref) => watchEmployeeUpdates(
            ref as WatchEmployeeUpdatesRef,
            sessionId,
            companyId: companyId,
          ),
          from: watchEmployeeUpdatesProvider,
          name: r'watchEmployeeUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchEmployeeUpdatesHash,
          dependencies: WatchEmployeeUpdatesFamily._dependencies,
          allTransitiveDependencies:
              WatchEmployeeUpdatesFamily._allTransitiveDependencies,
          sessionId: sessionId,
          companyId: companyId,
        );

  WatchEmployeeUpdatesProvider._internal(
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
    Stream<(int?, CompanyEmployee?)> Function(WatchEmployeeUpdatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchEmployeeUpdatesProvider._internal(
        (ref) => create(ref as WatchEmployeeUpdatesRef),
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
  AutoDisposeStreamProviderElement<(int?, CompanyEmployee?)> createElement() {
    return _WatchEmployeeUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEmployeeUpdatesProvider &&
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
mixin WatchEmployeeUpdatesRef
    on AutoDisposeStreamProviderRef<(int?, CompanyEmployee?)> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `companyId` of this provider.
  int get companyId;
}

class _WatchEmployeeUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<(int?, CompanyEmployee?)>
    with WatchEmployeeUpdatesRef {
  _WatchEmployeeUpdatesProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchEmployeeUpdatesProvider).sessionId;
  @override
  int get companyId => (origin as WatchEmployeeUpdatesProvider).companyId;
}

String _$streamActiveEmployeesByCompanyHash() =>
    r'b4dd65577470322a1a11e3faf26b4ad8efc4ae1d';

/// See also [streamActiveEmployeesByCompany].
@ProviderFor(streamActiveEmployeesByCompany)
const streamActiveEmployeesByCompanyProvider =
    StreamActiveEmployeesByCompanyFamily();

/// See also [streamActiveEmployeesByCompany].
class StreamActiveEmployeesByCompanyFamily
    extends Family<AsyncValue<List<CompanyEmployee>>> {
  /// See also [streamActiveEmployeesByCompany].
  const StreamActiveEmployeesByCompanyFamily();

  /// See also [streamActiveEmployeesByCompany].
  StreamActiveEmployeesByCompanyProvider call(
    String sessionId, {
    required int companyId,
  }) {
    return StreamActiveEmployeesByCompanyProvider(
      sessionId,
      companyId: companyId,
    );
  }

  @override
  StreamActiveEmployeesByCompanyProvider getProviderOverride(
    covariant StreamActiveEmployeesByCompanyProvider provider,
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
  String? get name => r'streamActiveEmployeesByCompanyProvider';
}

/// See also [streamActiveEmployeesByCompany].
class StreamActiveEmployeesByCompanyProvider
    extends AutoDisposeFutureProvider<List<CompanyEmployee>> {
  /// See also [streamActiveEmployeesByCompany].
  StreamActiveEmployeesByCompanyProvider(
    String sessionId, {
    required int companyId,
  }) : this._internal(
          (ref) => streamActiveEmployeesByCompany(
            ref as StreamActiveEmployeesByCompanyRef,
            sessionId,
            companyId: companyId,
          ),
          from: streamActiveEmployeesByCompanyProvider,
          name: r'streamActiveEmployeesByCompanyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$streamActiveEmployeesByCompanyHash,
          dependencies: StreamActiveEmployeesByCompanyFamily._dependencies,
          allTransitiveDependencies:
              StreamActiveEmployeesByCompanyFamily._allTransitiveDependencies,
          sessionId: sessionId,
          companyId: companyId,
        );

  StreamActiveEmployeesByCompanyProvider._internal(
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
    FutureOr<List<CompanyEmployee>> Function(
            StreamActiveEmployeesByCompanyRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StreamActiveEmployeesByCompanyProvider._internal(
        (ref) => create(ref as StreamActiveEmployeesByCompanyRef),
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
  AutoDisposeFutureProviderElement<List<CompanyEmployee>> createElement() {
    return _StreamActiveEmployeesByCompanyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StreamActiveEmployeesByCompanyProvider &&
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
mixin StreamActiveEmployeesByCompanyRef
    on AutoDisposeFutureProviderRef<List<CompanyEmployee>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `companyId` of this provider.
  int get companyId;
}

class _StreamActiveEmployeesByCompanyProviderElement
    extends AutoDisposeFutureProviderElement<List<CompanyEmployee>>
    with StreamActiveEmployeesByCompanyRef {
  _StreamActiveEmployeesByCompanyProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as StreamActiveEmployeesByCompanyProvider).sessionId;
  @override
  int get companyId =>
      (origin as StreamActiveEmployeesByCompanyProvider).companyId;
}

String _$fetchCompaniesByEmployeeHash() =>
    r'91ee7282f7b316ce71aa3196429bd71fea928138';

/// See also [fetchCompaniesByEmployee].
@ProviderFor(fetchCompaniesByEmployee)
const fetchCompaniesByEmployeeProvider = FetchCompaniesByEmployeeFamily();

/// See also [fetchCompaniesByEmployee].
class FetchCompaniesByEmployeeFamily
    extends Family<AsyncValue<List<CompanyEmployee>>> {
  /// See also [fetchCompaniesByEmployee].
  const FetchCompaniesByEmployeeFamily();

  /// See also [fetchCompaniesByEmployee].
  FetchCompaniesByEmployeeProvider call(
    String sessionId, {
    required int employeeId,
  }) {
    return FetchCompaniesByEmployeeProvider(
      sessionId,
      employeeId: employeeId,
    );
  }

  @override
  FetchCompaniesByEmployeeProvider getProviderOverride(
    covariant FetchCompaniesByEmployeeProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'fetchCompaniesByEmployeeProvider';
}

/// See also [fetchCompaniesByEmployee].
class FetchCompaniesByEmployeeProvider
    extends AutoDisposeFutureProvider<List<CompanyEmployee>> {
  /// See also [fetchCompaniesByEmployee].
  FetchCompaniesByEmployeeProvider(
    String sessionId, {
    required int employeeId,
  }) : this._internal(
          (ref) => fetchCompaniesByEmployee(
            ref as FetchCompaniesByEmployeeRef,
            sessionId,
            employeeId: employeeId,
          ),
          from: fetchCompaniesByEmployeeProvider,
          name: r'fetchCompaniesByEmployeeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCompaniesByEmployeeHash,
          dependencies: FetchCompaniesByEmployeeFamily._dependencies,
          allTransitiveDependencies:
              FetchCompaniesByEmployeeFamily._allTransitiveDependencies,
          sessionId: sessionId,
          employeeId: employeeId,
        );

  FetchCompaniesByEmployeeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.employeeId,
  }) : super.internal();

  final String sessionId;
  final int employeeId;

  @override
  Override overrideWith(
    FutureOr<List<CompanyEmployee>> Function(
            FetchCompaniesByEmployeeRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCompaniesByEmployeeProvider._internal(
        (ref) => create(ref as FetchCompaniesByEmployeeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CompanyEmployee>> createElement() {
    return _FetchCompaniesByEmployeeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCompaniesByEmployeeProvider &&
        other.sessionId == sessionId &&
        other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchCompaniesByEmployeeRef
    on AutoDisposeFutureProviderRef<List<CompanyEmployee>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `employeeId` of this provider.
  int get employeeId;
}

class _FetchCompaniesByEmployeeProviderElement
    extends AutoDisposeFutureProviderElement<List<CompanyEmployee>>
    with FetchCompaniesByEmployeeRef {
  _FetchCompaniesByEmployeeProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FetchCompaniesByEmployeeProvider).sessionId;
  @override
  int get employeeId => (origin as FetchCompaniesByEmployeeProvider).employeeId;
}

String _$watchCompaniesByEmployeeUpdatesHash() =>
    r'8c5d67448881344cc36eff8a637792f3077e5d4a';

/// See also [watchCompaniesByEmployeeUpdates].
@ProviderFor(watchCompaniesByEmployeeUpdates)
const watchCompaniesByEmployeeUpdatesProvider =
    WatchCompaniesByEmployeeUpdatesFamily();

/// See also [watchCompaniesByEmployeeUpdates].
class WatchCompaniesByEmployeeUpdatesFamily
    extends Family<AsyncValue<CompanyEmployee>> {
  /// See also [watchCompaniesByEmployeeUpdates].
  const WatchCompaniesByEmployeeUpdatesFamily();

  /// See also [watchCompaniesByEmployeeUpdates].
  WatchCompaniesByEmployeeUpdatesProvider call(
    int employeeId,
  ) {
    return WatchCompaniesByEmployeeUpdatesProvider(
      employeeId,
    );
  }

  @override
  WatchCompaniesByEmployeeUpdatesProvider getProviderOverride(
    covariant WatchCompaniesByEmployeeUpdatesProvider provider,
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
  String? get name => r'watchCompaniesByEmployeeUpdatesProvider';
}

/// See also [watchCompaniesByEmployeeUpdates].
class WatchCompaniesByEmployeeUpdatesProvider
    extends AutoDisposeStreamProvider<CompanyEmployee> {
  /// See also [watchCompaniesByEmployeeUpdates].
  WatchCompaniesByEmployeeUpdatesProvider(
    int employeeId,
  ) : this._internal(
          (ref) => watchCompaniesByEmployeeUpdates(
            ref as WatchCompaniesByEmployeeUpdatesRef,
            employeeId,
          ),
          from: watchCompaniesByEmployeeUpdatesProvider,
          name: r'watchCompaniesByEmployeeUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCompaniesByEmployeeUpdatesHash,
          dependencies: WatchCompaniesByEmployeeUpdatesFamily._dependencies,
          allTransitiveDependencies:
              WatchCompaniesByEmployeeUpdatesFamily._allTransitiveDependencies,
          employeeId: employeeId,
        );

  WatchCompaniesByEmployeeUpdatesProvider._internal(
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
    Stream<CompanyEmployee> Function(
            WatchCompaniesByEmployeeUpdatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCompaniesByEmployeeUpdatesProvider._internal(
        (ref) => create(ref as WatchCompaniesByEmployeeUpdatesRef),
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
  AutoDisposeStreamProviderElement<CompanyEmployee> createElement() {
    return _WatchCompaniesByEmployeeUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCompaniesByEmployeeUpdatesProvider &&
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
mixin WatchCompaniesByEmployeeUpdatesRef
    on AutoDisposeStreamProviderRef<CompanyEmployee> {
  /// The parameter `employeeId` of this provider.
  int get employeeId;
}

class _WatchCompaniesByEmployeeUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<CompanyEmployee>
    with WatchCompaniesByEmployeeUpdatesRef {
  _WatchCompaniesByEmployeeUpdatesProviderElement(super.provider);

  @override
  int get employeeId =>
      (origin as WatchCompaniesByEmployeeUpdatesProvider).employeeId;
}

String _$fetchEmployeesByCompanyAndDepartmentHash() =>
    r'f191257e354c0da7fbac5396aba61839acaff693';

/// Fetch employees by company and department provider
///
/// Copied from [fetchEmployeesByCompanyAndDepartment].
@ProviderFor(fetchEmployeesByCompanyAndDepartment)
const fetchEmployeesByCompanyAndDepartmentProvider =
    FetchEmployeesByCompanyAndDepartmentFamily();

/// Fetch employees by company and department provider
///
/// Copied from [fetchEmployeesByCompanyAndDepartment].
class FetchEmployeesByCompanyAndDepartmentFamily
    extends Family<AsyncValue<List<CompanyEmployee>>> {
  /// Fetch employees by company and department provider
  ///
  /// Copied from [fetchEmployeesByCompanyAndDepartment].
  const FetchEmployeesByCompanyAndDepartmentFamily();

  /// Fetch employees by company and department provider
  ///
  /// Copied from [fetchEmployeesByCompanyAndDepartment].
  FetchEmployeesByCompanyAndDepartmentProvider call(
    String sessionId, {
    required int companyId,
    required int departmentId,
  }) {
    return FetchEmployeesByCompanyAndDepartmentProvider(
      sessionId,
      companyId: companyId,
      departmentId: departmentId,
    );
  }

  @override
  FetchEmployeesByCompanyAndDepartmentProvider getProviderOverride(
    covariant FetchEmployeesByCompanyAndDepartmentProvider provider,
  ) {
    return call(
      provider.sessionId,
      companyId: provider.companyId,
      departmentId: provider.departmentId,
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
  String? get name => r'fetchEmployeesByCompanyAndDepartmentProvider';
}

/// Fetch employees by company and department provider
///
/// Copied from [fetchEmployeesByCompanyAndDepartment].
class FetchEmployeesByCompanyAndDepartmentProvider
    extends AutoDisposeFutureProvider<List<CompanyEmployee>> {
  /// Fetch employees by company and department provider
  ///
  /// Copied from [fetchEmployeesByCompanyAndDepartment].
  FetchEmployeesByCompanyAndDepartmentProvider(
    String sessionId, {
    required int companyId,
    required int departmentId,
  }) : this._internal(
          (ref) => fetchEmployeesByCompanyAndDepartment(
            ref as FetchEmployeesByCompanyAndDepartmentRef,
            sessionId,
            companyId: companyId,
            departmentId: departmentId,
          ),
          from: fetchEmployeesByCompanyAndDepartmentProvider,
          name: r'fetchEmployeesByCompanyAndDepartmentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchEmployeesByCompanyAndDepartmentHash,
          dependencies:
              FetchEmployeesByCompanyAndDepartmentFamily._dependencies,
          allTransitiveDependencies: FetchEmployeesByCompanyAndDepartmentFamily
              ._allTransitiveDependencies,
          sessionId: sessionId,
          companyId: companyId,
          departmentId: departmentId,
        );

  FetchEmployeesByCompanyAndDepartmentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.companyId,
    required this.departmentId,
  }) : super.internal();

  final String sessionId;
  final int companyId;
  final int departmentId;

  @override
  Override overrideWith(
    FutureOr<List<CompanyEmployee>> Function(
            FetchEmployeesByCompanyAndDepartmentRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchEmployeesByCompanyAndDepartmentProvider._internal(
        (ref) => create(ref as FetchEmployeesByCompanyAndDepartmentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        companyId: companyId,
        departmentId: departmentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CompanyEmployee>> createElement() {
    return _FetchEmployeesByCompanyAndDepartmentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEmployeesByCompanyAndDepartmentProvider &&
        other.sessionId == sessionId &&
        other.companyId == companyId &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, companyId.hashCode);
    hash = _SystemHash.combine(hash, departmentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchEmployeesByCompanyAndDepartmentRef
    on AutoDisposeFutureProviderRef<List<CompanyEmployee>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `companyId` of this provider.
  int get companyId;

  /// The parameter `departmentId` of this provider.
  int get departmentId;
}

class _FetchEmployeesByCompanyAndDepartmentProviderElement
    extends AutoDisposeFutureProviderElement<List<CompanyEmployee>>
    with FetchEmployeesByCompanyAndDepartmentRef {
  _FetchEmployeesByCompanyAndDepartmentProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FetchEmployeesByCompanyAndDepartmentProvider).sessionId;
  @override
  int get companyId =>
      (origin as FetchEmployeesByCompanyAndDepartmentProvider).companyId;
  @override
  int get departmentId =>
      (origin as FetchEmployeesByCompanyAndDepartmentProvider).departmentId;
}

String _$watchEmployeesByCompanyAndDepartmentUpdatesHash() =>
    r'4d6748b696af1b97f73767fb26371bcd3c2685a5';

/// Watch employees by company and department updates provider
///
/// Copied from [watchEmployeesByCompanyAndDepartmentUpdates].
@ProviderFor(watchEmployeesByCompanyAndDepartmentUpdates)
const watchEmployeesByCompanyAndDepartmentUpdatesProvider =
    WatchEmployeesByCompanyAndDepartmentUpdatesFamily();

/// Watch employees by company and department updates provider
///
/// Copied from [watchEmployeesByCompanyAndDepartmentUpdates].
class WatchEmployeesByCompanyAndDepartmentUpdatesFamily
    extends Family<AsyncValue<CompanyEmployee>> {
  /// Watch employees by company and department updates provider
  ///
  /// Copied from [watchEmployeesByCompanyAndDepartmentUpdates].
  const WatchEmployeesByCompanyAndDepartmentUpdatesFamily();

  /// Watch employees by company and department updates provider
  ///
  /// Copied from [watchEmployeesByCompanyAndDepartmentUpdates].
  WatchEmployeesByCompanyAndDepartmentUpdatesProvider call({
    required int companyId,
    required int departmentId,
  }) {
    return WatchEmployeesByCompanyAndDepartmentUpdatesProvider(
      companyId: companyId,
      departmentId: departmentId,
    );
  }

  @override
  WatchEmployeesByCompanyAndDepartmentUpdatesProvider getProviderOverride(
    covariant WatchEmployeesByCompanyAndDepartmentUpdatesProvider provider,
  ) {
    return call(
      companyId: provider.companyId,
      departmentId: provider.departmentId,
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
  String? get name => r'watchEmployeesByCompanyAndDepartmentUpdatesProvider';
}

/// Watch employees by company and department updates provider
///
/// Copied from [watchEmployeesByCompanyAndDepartmentUpdates].
class WatchEmployeesByCompanyAndDepartmentUpdatesProvider
    extends AutoDisposeStreamProvider<CompanyEmployee> {
  /// Watch employees by company and department updates provider
  ///
  /// Copied from [watchEmployeesByCompanyAndDepartmentUpdates].
  WatchEmployeesByCompanyAndDepartmentUpdatesProvider({
    required int companyId,
    required int departmentId,
  }) : this._internal(
          (ref) => watchEmployeesByCompanyAndDepartmentUpdates(
            ref as WatchEmployeesByCompanyAndDepartmentUpdatesRef,
            companyId: companyId,
            departmentId: departmentId,
          ),
          from: watchEmployeesByCompanyAndDepartmentUpdatesProvider,
          name: r'watchEmployeesByCompanyAndDepartmentUpdatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchEmployeesByCompanyAndDepartmentUpdatesHash,
          dependencies:
              WatchEmployeesByCompanyAndDepartmentUpdatesFamily._dependencies,
          allTransitiveDependencies:
              WatchEmployeesByCompanyAndDepartmentUpdatesFamily
                  ._allTransitiveDependencies,
          companyId: companyId,
          departmentId: departmentId,
        );

  WatchEmployeesByCompanyAndDepartmentUpdatesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.companyId,
    required this.departmentId,
  }) : super.internal();

  final int companyId;
  final int departmentId;

  @override
  Override overrideWith(
    Stream<CompanyEmployee> Function(
            WatchEmployeesByCompanyAndDepartmentUpdatesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchEmployeesByCompanyAndDepartmentUpdatesProvider._internal(
        (ref) => create(ref as WatchEmployeesByCompanyAndDepartmentUpdatesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        companyId: companyId,
        departmentId: departmentId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<CompanyEmployee> createElement() {
    return _WatchEmployeesByCompanyAndDepartmentUpdatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEmployeesByCompanyAndDepartmentUpdatesProvider &&
        other.companyId == companyId &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, companyId.hashCode);
    hash = _SystemHash.combine(hash, departmentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchEmployeesByCompanyAndDepartmentUpdatesRef
    on AutoDisposeStreamProviderRef<CompanyEmployee> {
  /// The parameter `companyId` of this provider.
  int get companyId;

  /// The parameter `departmentId` of this provider.
  int get departmentId;
}

class _WatchEmployeesByCompanyAndDepartmentUpdatesProviderElement
    extends AutoDisposeStreamProviderElement<CompanyEmployee>
    with WatchEmployeesByCompanyAndDepartmentUpdatesRef {
  _WatchEmployeesByCompanyAndDepartmentUpdatesProviderElement(super.provider);

  @override
  int get companyId =>
      (origin as WatchEmployeesByCompanyAndDepartmentUpdatesProvider).companyId;
  @override
  int get departmentId =>
      (origin as WatchEmployeesByCompanyAndDepartmentUpdatesProvider)
          .departmentId;
}

String _$watchEmployeesByDepartmentDeletionHash() =>
    r'9e4721861aa6533dc23cde6471b1c9fbcff755c5';

/// Watch employees by department deletion provider
///
/// Copied from [watchEmployeesByDepartmentDeletion].
@ProviderFor(watchEmployeesByDepartmentDeletion)
const watchEmployeesByDepartmentDeletionProvider =
    WatchEmployeesByDepartmentDeletionFamily();

/// Watch employees by department deletion provider
///
/// Copied from [watchEmployeesByDepartmentDeletion].
class WatchEmployeesByDepartmentDeletionFamily extends Family<AsyncValue<int>> {
  /// Watch employees by department deletion provider
  ///
  /// Copied from [watchEmployeesByDepartmentDeletion].
  const WatchEmployeesByDepartmentDeletionFamily();

  /// Watch employees by department deletion provider
  ///
  /// Copied from [watchEmployeesByDepartmentDeletion].
  WatchEmployeesByDepartmentDeletionProvider call(
    int departmentId,
  ) {
    return WatchEmployeesByDepartmentDeletionProvider(
      departmentId,
    );
  }

  @override
  WatchEmployeesByDepartmentDeletionProvider getProviderOverride(
    covariant WatchEmployeesByDepartmentDeletionProvider provider,
  ) {
    return call(
      provider.departmentId,
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
  String? get name => r'watchEmployeesByDepartmentDeletionProvider';
}

/// Watch employees by department deletion provider
///
/// Copied from [watchEmployeesByDepartmentDeletion].
class WatchEmployeesByDepartmentDeletionProvider
    extends AutoDisposeStreamProvider<int> {
  /// Watch employees by department deletion provider
  ///
  /// Copied from [watchEmployeesByDepartmentDeletion].
  WatchEmployeesByDepartmentDeletionProvider(
    int departmentId,
  ) : this._internal(
          (ref) => watchEmployeesByDepartmentDeletion(
            ref as WatchEmployeesByDepartmentDeletionRef,
            departmentId,
          ),
          from: watchEmployeesByDepartmentDeletionProvider,
          name: r'watchEmployeesByDepartmentDeletionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchEmployeesByDepartmentDeletionHash,
          dependencies: WatchEmployeesByDepartmentDeletionFamily._dependencies,
          allTransitiveDependencies: WatchEmployeesByDepartmentDeletionFamily
              ._allTransitiveDependencies,
          departmentId: departmentId,
        );

  WatchEmployeesByDepartmentDeletionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.departmentId,
  }) : super.internal();

  final int departmentId;

  @override
  Override overrideWith(
    Stream<int> Function(WatchEmployeesByDepartmentDeletionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchEmployeesByDepartmentDeletionProvider._internal(
        (ref) => create(ref as WatchEmployeesByDepartmentDeletionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        departmentId: departmentId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<int> createElement() {
    return _WatchEmployeesByDepartmentDeletionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEmployeesByDepartmentDeletionProvider &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, departmentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchEmployeesByDepartmentDeletionRef
    on AutoDisposeStreamProviderRef<int> {
  /// The parameter `departmentId` of this provider.
  int get departmentId;
}

class _WatchEmployeesByDepartmentDeletionProviderElement
    extends AutoDisposeStreamProviderElement<int>
    with WatchEmployeesByDepartmentDeletionRef {
  _WatchEmployeesByDepartmentDeletionProviderElement(super.provider);

  @override
  int get departmentId =>
      (origin as WatchEmployeesByDepartmentDeletionProvider).departmentId;
}

String _$streamEmployeesByCompanyHash() =>
    r'fa0f3929ead9f9d3a368205e6dca2c4de48bb961';

abstract class _$StreamEmployeesByCompany
    extends BuildlessAutoDisposeAsyncNotifier<List<CompanyEmployee>> {
  late final String sessionId;
  late final int companyId;

  FutureOr<List<CompanyEmployee>> build(
    String sessionId, {
    required int companyId,
  });
}

/// See also [StreamEmployeesByCompany].
@ProviderFor(StreamEmployeesByCompany)
const streamEmployeesByCompanyProvider = StreamEmployeesByCompanyFamily();

/// See also [StreamEmployeesByCompany].
class StreamEmployeesByCompanyFamily
    extends Family<AsyncValue<List<CompanyEmployee>>> {
  /// See also [StreamEmployeesByCompany].
  const StreamEmployeesByCompanyFamily();

  /// See also [StreamEmployeesByCompany].
  StreamEmployeesByCompanyProvider call(
    String sessionId, {
    required int companyId,
  }) {
    return StreamEmployeesByCompanyProvider(
      sessionId,
      companyId: companyId,
    );
  }

  @override
  StreamEmployeesByCompanyProvider getProviderOverride(
    covariant StreamEmployeesByCompanyProvider provider,
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
  String? get name => r'streamEmployeesByCompanyProvider';
}

/// See also [StreamEmployeesByCompany].
class StreamEmployeesByCompanyProvider
    extends AutoDisposeAsyncNotifierProviderImpl<StreamEmployeesByCompany,
        List<CompanyEmployee>> {
  /// See also [StreamEmployeesByCompany].
  StreamEmployeesByCompanyProvider(
    String sessionId, {
    required int companyId,
  }) : this._internal(
          () => StreamEmployeesByCompany()
            ..sessionId = sessionId
            ..companyId = companyId,
          from: streamEmployeesByCompanyProvider,
          name: r'streamEmployeesByCompanyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$streamEmployeesByCompanyHash,
          dependencies: StreamEmployeesByCompanyFamily._dependencies,
          allTransitiveDependencies:
              StreamEmployeesByCompanyFamily._allTransitiveDependencies,
          sessionId: sessionId,
          companyId: companyId,
        );

  StreamEmployeesByCompanyProvider._internal(
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
  FutureOr<List<CompanyEmployee>> runNotifierBuild(
    covariant StreamEmployeesByCompany notifier,
  ) {
    return notifier.build(
      sessionId,
      companyId: companyId,
    );
  }

  @override
  Override overrideWith(StreamEmployeesByCompany Function() create) {
    return ProviderOverride(
      origin: this,
      override: StreamEmployeesByCompanyProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<StreamEmployeesByCompany,
      List<CompanyEmployee>> createElement() {
    return _StreamEmployeesByCompanyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StreamEmployeesByCompanyProvider &&
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
mixin StreamEmployeesByCompanyRef
    on AutoDisposeAsyncNotifierProviderRef<List<CompanyEmployee>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `companyId` of this provider.
  int get companyId;
}

class _StreamEmployeesByCompanyProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<StreamEmployeesByCompany,
        List<CompanyEmployee>> with StreamEmployeesByCompanyRef {
  _StreamEmployeesByCompanyProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as StreamEmployeesByCompanyProvider).sessionId;
  @override
  int get companyId => (origin as StreamEmployeesByCompanyProvider).companyId;
}

String _$watchCompaniesByEmployeeHash() =>
    r'567d9103a0c55cafa701eb5ea2735e6ff555324f';

abstract class _$WatchCompaniesByEmployee
    extends BuildlessAutoDisposeAsyncNotifier<List<CompanyEmployee>> {
  late final String sessionId;
  late final int employeeId;

  FutureOr<List<CompanyEmployee>> build(
    String sessionId, {
    required int employeeId,
  });
}

/// See also [WatchCompaniesByEmployee].
@ProviderFor(WatchCompaniesByEmployee)
const watchCompaniesByEmployeeProvider = WatchCompaniesByEmployeeFamily();

/// See also [WatchCompaniesByEmployee].
class WatchCompaniesByEmployeeFamily
    extends Family<AsyncValue<List<CompanyEmployee>>> {
  /// See also [WatchCompaniesByEmployee].
  const WatchCompaniesByEmployeeFamily();

  /// See also [WatchCompaniesByEmployee].
  WatchCompaniesByEmployeeProvider call(
    String sessionId, {
    required int employeeId,
  }) {
    return WatchCompaniesByEmployeeProvider(
      sessionId,
      employeeId: employeeId,
    );
  }

  @override
  WatchCompaniesByEmployeeProvider getProviderOverride(
    covariant WatchCompaniesByEmployeeProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'watchCompaniesByEmployeeProvider';
}

/// See also [WatchCompaniesByEmployee].
class WatchCompaniesByEmployeeProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WatchCompaniesByEmployee,
        List<CompanyEmployee>> {
  /// See also [WatchCompaniesByEmployee].
  WatchCompaniesByEmployeeProvider(
    String sessionId, {
    required int employeeId,
  }) : this._internal(
          () => WatchCompaniesByEmployee()
            ..sessionId = sessionId
            ..employeeId = employeeId,
          from: watchCompaniesByEmployeeProvider,
          name: r'watchCompaniesByEmployeeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCompaniesByEmployeeHash,
          dependencies: WatchCompaniesByEmployeeFamily._dependencies,
          allTransitiveDependencies:
              WatchCompaniesByEmployeeFamily._allTransitiveDependencies,
          sessionId: sessionId,
          employeeId: employeeId,
        );

  WatchCompaniesByEmployeeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.employeeId,
  }) : super.internal();

  final String sessionId;
  final int employeeId;

  @override
  FutureOr<List<CompanyEmployee>> runNotifierBuild(
    covariant WatchCompaniesByEmployee notifier,
  ) {
    return notifier.build(
      sessionId,
      employeeId: employeeId,
    );
  }

  @override
  Override overrideWith(WatchCompaniesByEmployee Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchCompaniesByEmployeeProvider._internal(
        () => create()
          ..sessionId = sessionId
          ..employeeId = employeeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WatchCompaniesByEmployee,
      List<CompanyEmployee>> createElement() {
    return _WatchCompaniesByEmployeeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCompaniesByEmployeeProvider &&
        other.sessionId == sessionId &&
        other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchCompaniesByEmployeeRef
    on AutoDisposeAsyncNotifierProviderRef<List<CompanyEmployee>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `employeeId` of this provider.
  int get employeeId;
}

class _WatchCompaniesByEmployeeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WatchCompaniesByEmployee,
        List<CompanyEmployee>> with WatchCompaniesByEmployeeRef {
  _WatchCompaniesByEmployeeProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchCompaniesByEmployeeProvider).sessionId;
  @override
  int get employeeId => (origin as WatchCompaniesByEmployeeProvider).employeeId;
}

String _$watchEmployeesByCompanyAndDepartmentHash() =>
    r'36b4629359d49aee2deed252a36a6779fa45629d';

abstract class _$WatchEmployeesByCompanyAndDepartment
    extends BuildlessAutoDisposeAsyncNotifier<List<CompanyEmployee>> {
  late final String sessionId;
  late final int companyId;
  late final int departmentId;

  FutureOr<List<CompanyEmployee>> build(
    String sessionId, {
    required int companyId,
    required int departmentId,
  });
}

/// Watch employees by company and department provider
///
/// Copied from [WatchEmployeesByCompanyAndDepartment].
@ProviderFor(WatchEmployeesByCompanyAndDepartment)
const watchEmployeesByCompanyAndDepartmentProvider =
    WatchEmployeesByCompanyAndDepartmentFamily();

/// Watch employees by company and department provider
///
/// Copied from [WatchEmployeesByCompanyAndDepartment].
class WatchEmployeesByCompanyAndDepartmentFamily
    extends Family<AsyncValue<List<CompanyEmployee>>> {
  /// Watch employees by company and department provider
  ///
  /// Copied from [WatchEmployeesByCompanyAndDepartment].
  const WatchEmployeesByCompanyAndDepartmentFamily();

  /// Watch employees by company and department provider
  ///
  /// Copied from [WatchEmployeesByCompanyAndDepartment].
  WatchEmployeesByCompanyAndDepartmentProvider call(
    String sessionId, {
    required int companyId,
    required int departmentId,
  }) {
    return WatchEmployeesByCompanyAndDepartmentProvider(
      sessionId,
      companyId: companyId,
      departmentId: departmentId,
    );
  }

  @override
  WatchEmployeesByCompanyAndDepartmentProvider getProviderOverride(
    covariant WatchEmployeesByCompanyAndDepartmentProvider provider,
  ) {
    return call(
      provider.sessionId,
      companyId: provider.companyId,
      departmentId: provider.departmentId,
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
  String? get name => r'watchEmployeesByCompanyAndDepartmentProvider';
}

/// Watch employees by company and department provider
///
/// Copied from [WatchEmployeesByCompanyAndDepartment].
class WatchEmployeesByCompanyAndDepartmentProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        WatchEmployeesByCompanyAndDepartment, List<CompanyEmployee>> {
  /// Watch employees by company and department provider
  ///
  /// Copied from [WatchEmployeesByCompanyAndDepartment].
  WatchEmployeesByCompanyAndDepartmentProvider(
    String sessionId, {
    required int companyId,
    required int departmentId,
  }) : this._internal(
          () => WatchEmployeesByCompanyAndDepartment()
            ..sessionId = sessionId
            ..companyId = companyId
            ..departmentId = departmentId,
          from: watchEmployeesByCompanyAndDepartmentProvider,
          name: r'watchEmployeesByCompanyAndDepartmentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchEmployeesByCompanyAndDepartmentHash,
          dependencies:
              WatchEmployeesByCompanyAndDepartmentFamily._dependencies,
          allTransitiveDependencies: WatchEmployeesByCompanyAndDepartmentFamily
              ._allTransitiveDependencies,
          sessionId: sessionId,
          companyId: companyId,
          departmentId: departmentId,
        );

  WatchEmployeesByCompanyAndDepartmentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.companyId,
    required this.departmentId,
  }) : super.internal();

  final String sessionId;
  final int companyId;
  final int departmentId;

  @override
  FutureOr<List<CompanyEmployee>> runNotifierBuild(
    covariant WatchEmployeesByCompanyAndDepartment notifier,
  ) {
    return notifier.build(
      sessionId,
      companyId: companyId,
      departmentId: departmentId,
    );
  }

  @override
  Override overrideWith(
      WatchEmployeesByCompanyAndDepartment Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchEmployeesByCompanyAndDepartmentProvider._internal(
        () => create()
          ..sessionId = sessionId
          ..companyId = companyId
          ..departmentId = departmentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        companyId: companyId,
        departmentId: departmentId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WatchEmployeesByCompanyAndDepartment,
      List<CompanyEmployee>> createElement() {
    return _WatchEmployeesByCompanyAndDepartmentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEmployeesByCompanyAndDepartmentProvider &&
        other.sessionId == sessionId &&
        other.companyId == companyId &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, companyId.hashCode);
    hash = _SystemHash.combine(hash, departmentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchEmployeesByCompanyAndDepartmentRef
    on AutoDisposeAsyncNotifierProviderRef<List<CompanyEmployee>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `companyId` of this provider.
  int get companyId;

  /// The parameter `departmentId` of this provider.
  int get departmentId;
}

class _WatchEmployeesByCompanyAndDepartmentProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        WatchEmployeesByCompanyAndDepartment,
        List<CompanyEmployee>> with WatchEmployeesByCompanyAndDepartmentRef {
  _WatchEmployeesByCompanyAndDepartmentProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as WatchEmployeesByCompanyAndDepartmentProvider).sessionId;
  @override
  int get companyId =>
      (origin as WatchEmployeesByCompanyAndDepartmentProvider).companyId;
  @override
  int get departmentId =>
      (origin as WatchEmployeesByCompanyAndDepartmentProvider).departmentId;
}

String _$fetchAndWatchCompaniesByEmployeeHash() =>
    r'e2e43b52272f2578e549b5628e98bb2196f323a2';

abstract class _$FetchAndWatchCompaniesByEmployee
    extends BuildlessAutoDisposeAsyncNotifier<List<CompanyEmployee>> {
  late final String sessionId;
  late final int employeeId;

  FutureOr<List<CompanyEmployee>> build(
    String sessionId, {
    required int employeeId,
  });
}

/// Efficient provider that combines fetch and watch using the new
/// record-based stream
///
/// Copied from [FetchAndWatchCompaniesByEmployee].
@ProviderFor(FetchAndWatchCompaniesByEmployee)
const fetchAndWatchCompaniesByEmployeeProvider =
    FetchAndWatchCompaniesByEmployeeFamily();

/// Efficient provider that combines fetch and watch using the new
/// record-based stream
///
/// Copied from [FetchAndWatchCompaniesByEmployee].
class FetchAndWatchCompaniesByEmployeeFamily
    extends Family<AsyncValue<List<CompanyEmployee>>> {
  /// Efficient provider that combines fetch and watch using the new
  /// record-based stream
  ///
  /// Copied from [FetchAndWatchCompaniesByEmployee].
  const FetchAndWatchCompaniesByEmployeeFamily();

  /// Efficient provider that combines fetch and watch using the new
  /// record-based stream
  ///
  /// Copied from [FetchAndWatchCompaniesByEmployee].
  FetchAndWatchCompaniesByEmployeeProvider call(
    String sessionId, {
    required int employeeId,
  }) {
    return FetchAndWatchCompaniesByEmployeeProvider(
      sessionId,
      employeeId: employeeId,
    );
  }

  @override
  FetchAndWatchCompaniesByEmployeeProvider getProviderOverride(
    covariant FetchAndWatchCompaniesByEmployeeProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'fetchAndWatchCompaniesByEmployeeProvider';
}

/// Efficient provider that combines fetch and watch using the new
/// record-based stream
///
/// Copied from [FetchAndWatchCompaniesByEmployee].
class FetchAndWatchCompaniesByEmployeeProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        FetchAndWatchCompaniesByEmployee, List<CompanyEmployee>> {
  /// Efficient provider that combines fetch and watch using the new
  /// record-based stream
  ///
  /// Copied from [FetchAndWatchCompaniesByEmployee].
  FetchAndWatchCompaniesByEmployeeProvider(
    String sessionId, {
    required int employeeId,
  }) : this._internal(
          () => FetchAndWatchCompaniesByEmployee()
            ..sessionId = sessionId
            ..employeeId = employeeId,
          from: fetchAndWatchCompaniesByEmployeeProvider,
          name: r'fetchAndWatchCompaniesByEmployeeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAndWatchCompaniesByEmployeeHash,
          dependencies: FetchAndWatchCompaniesByEmployeeFamily._dependencies,
          allTransitiveDependencies:
              FetchAndWatchCompaniesByEmployeeFamily._allTransitiveDependencies,
          sessionId: sessionId,
          employeeId: employeeId,
        );

  FetchAndWatchCompaniesByEmployeeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.employeeId,
  }) : super.internal();

  final String sessionId;
  final int employeeId;

  @override
  FutureOr<List<CompanyEmployee>> runNotifierBuild(
    covariant FetchAndWatchCompaniesByEmployee notifier,
  ) {
    return notifier.build(
      sessionId,
      employeeId: employeeId,
    );
  }

  @override
  Override overrideWith(FetchAndWatchCompaniesByEmployee Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchAndWatchCompaniesByEmployeeProvider._internal(
        () => create()
          ..sessionId = sessionId
          ..employeeId = employeeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FetchAndWatchCompaniesByEmployee,
      List<CompanyEmployee>> createElement() {
    return _FetchAndWatchCompaniesByEmployeeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAndWatchCompaniesByEmployeeProvider &&
        other.sessionId == sessionId &&
        other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchAndWatchCompaniesByEmployeeRef
    on AutoDisposeAsyncNotifierProviderRef<List<CompanyEmployee>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `employeeId` of this provider.
  int get employeeId;
}

class _FetchAndWatchCompaniesByEmployeeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        FetchAndWatchCompaniesByEmployee,
        List<CompanyEmployee>> with FetchAndWatchCompaniesByEmployeeRef {
  _FetchAndWatchCompaniesByEmployeeProviderElement(super.provider);

  @override
  String get sessionId =>
      (origin as FetchAndWatchCompaniesByEmployeeProvider).sessionId;
  @override
  int get employeeId =>
      (origin as FetchAndWatchCompaniesByEmployeeProvider).employeeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
