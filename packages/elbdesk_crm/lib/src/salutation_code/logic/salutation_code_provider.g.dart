// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salutation_code_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchSalutationCodeHash() =>
    r'8ec931ab49f805441456e5e46d81c926750d95db';

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

/// See also [fetchSalutationCode].
@ProviderFor(fetchSalutationCode)
const fetchSalutationCodeProvider = FetchSalutationCodeFamily();

/// See also [fetchSalutationCode].
class FetchSalutationCodeFamily extends Family<AsyncValue<SalutationCode>> {
  /// See also [fetchSalutationCode].
  const FetchSalutationCodeFamily();

  /// See also [fetchSalutationCode].
  FetchSalutationCodeProvider call(
    int id,
  ) {
    return FetchSalutationCodeProvider(
      id,
    );
  }

  @override
  FetchSalutationCodeProvider getProviderOverride(
    covariant FetchSalutationCodeProvider provider,
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
  String? get name => r'fetchSalutationCodeProvider';
}

/// See also [fetchSalutationCode].
class FetchSalutationCodeProvider
    extends AutoDisposeFutureProvider<SalutationCode> {
  /// See also [fetchSalutationCode].
  FetchSalutationCodeProvider(
    int id,
  ) : this._internal(
          (ref) => fetchSalutationCode(
            ref as FetchSalutationCodeRef,
            id,
          ),
          from: fetchSalutationCodeProvider,
          name: r'fetchSalutationCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchSalutationCodeHash,
          dependencies: FetchSalutationCodeFamily._dependencies,
          allTransitiveDependencies:
              FetchSalutationCodeFamily._allTransitiveDependencies,
          id: id,
        );

  FetchSalutationCodeProvider._internal(
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
    FutureOr<SalutationCode> Function(FetchSalutationCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchSalutationCodeProvider._internal(
        (ref) => create(ref as FetchSalutationCodeRef),
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
  AutoDisposeFutureProviderElement<SalutationCode> createElement() {
    return _FetchSalutationCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSalutationCodeProvider && other.id == id;
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
mixin FetchSalutationCodeRef on AutoDisposeFutureProviderRef<SalutationCode> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchSalutationCodeProviderElement
    extends AutoDisposeFutureProviderElement<SalutationCode>
    with FetchSalutationCodeRef {
  _FetchSalutationCodeProviderElement(super.provider);

  @override
  int get id => (origin as FetchSalutationCodeProvider).id;
}

String _$fetchAllSalutationCodesHash() =>
    r'69c6f0ce4d3f1b8888fa8ce23add7d981150cae0';

/// Used to fetch all salutation codes when adding an entity which
/// requires a salutation code (like a contact).
///
/// Copied from [fetchAllSalutationCodes].
@ProviderFor(fetchAllSalutationCodes)
final fetchAllSalutationCodesProvider =
    AutoDisposeFutureProvider<List<SalutationCode>>.internal(
  fetchAllSalutationCodes,
  name: r'fetchAllSalutationCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAllSalutationCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchAllSalutationCodesRef
    = AutoDisposeFutureProviderRef<List<SalutationCode>>;
String _$findSalutationCodesHash() =>
    r'c143a41794d0c54eb3736ca2354ac39693786866';

/// See also [findSalutationCodes].
@ProviderFor(findSalutationCodes)
const findSalutationCodesProvider = FindSalutationCodesFamily();

/// See also [findSalutationCodes].
class FindSalutationCodesFamily
    extends Family<AsyncValue<List<SalutationCode>>> {
  /// See also [findSalutationCodes].
  const FindSalutationCodesFamily();

  /// See also [findSalutationCodes].
  FindSalutationCodesProvider call(
    String sessionId,
  ) {
    return FindSalutationCodesProvider(
      sessionId,
    );
  }

  @override
  FindSalutationCodesProvider getProviderOverride(
    covariant FindSalutationCodesProvider provider,
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
  String? get name => r'findSalutationCodesProvider';
}

/// See also [findSalutationCodes].
class FindSalutationCodesProvider
    extends AutoDisposeFutureProvider<List<SalutationCode>> {
  /// See also [findSalutationCodes].
  FindSalutationCodesProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findSalutationCodes(
            ref as FindSalutationCodesRef,
            sessionId,
          ),
          from: findSalutationCodesProvider,
          name: r'findSalutationCodesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findSalutationCodesHash,
          dependencies: FindSalutationCodesFamily._dependencies,
          allTransitiveDependencies:
              FindSalutationCodesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindSalutationCodesProvider._internal(
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
    FutureOr<List<SalutationCode>> Function(FindSalutationCodesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindSalutationCodesProvider._internal(
        (ref) => create(ref as FindSalutationCodesRef),
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
  AutoDisposeFutureProviderElement<List<SalutationCode>> createElement() {
    return _FindSalutationCodesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindSalutationCodesProvider && other.sessionId == sessionId;
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
mixin FindSalutationCodesRef
    on AutoDisposeFutureProviderRef<List<SalutationCode>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindSalutationCodesProviderElement
    extends AutoDisposeFutureProviderElement<List<SalutationCode>>
    with FindSalutationCodesRef {
  _FindSalutationCodesProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindSalutationCodesProvider).sessionId;
}

String _$salutationCodeRepositoryHash() =>
    r'65ade53fea602494a74ff57dd9e8f9d2bc49c3d5';

/// See also [salutationCodeRepository].
@ProviderFor(salutationCodeRepository)
final salutationCodeRepositoryProvider =
    AutoDisposeProvider<SalutationCodeRepository>.internal(
  salutationCodeRepository,
  name: r'salutationCodeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salutationCodeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SalutationCodeRepositoryRef
    = AutoDisposeProviderRef<SalutationCodeRepository>;
String _$watchSalutationCodeHash() =>
    r'94f527899a9b36ef4f2f399fac8aae96b6b47e3f';

/// See also [watchSalutationCode].
@ProviderFor(watchSalutationCode)
const watchSalutationCodeProvider = WatchSalutationCodeFamily();

/// See also [watchSalutationCode].
class WatchSalutationCodeFamily extends Family<AsyncValue<SalutationCode>> {
  /// See also [watchSalutationCode].
  const WatchSalutationCodeFamily();

  /// See also [watchSalutationCode].
  WatchSalutationCodeProvider call({
    required String sessionId,
    required int salutationCodeId,
  }) {
    return WatchSalutationCodeProvider(
      sessionId: sessionId,
      salutationCodeId: salutationCodeId,
    );
  }

  @override
  WatchSalutationCodeProvider getProviderOverride(
    covariant WatchSalutationCodeProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      salutationCodeId: provider.salutationCodeId,
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
  String? get name => r'watchSalutationCodeProvider';
}

/// See also [watchSalutationCode].
class WatchSalutationCodeProvider
    extends AutoDisposeStreamProvider<SalutationCode> {
  /// See also [watchSalutationCode].
  WatchSalutationCodeProvider({
    required String sessionId,
    required int salutationCodeId,
  }) : this._internal(
          (ref) => watchSalutationCode(
            ref as WatchSalutationCodeRef,
            sessionId: sessionId,
            salutationCodeId: salutationCodeId,
          ),
          from: watchSalutationCodeProvider,
          name: r'watchSalutationCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSalutationCodeHash,
          dependencies: WatchSalutationCodeFamily._dependencies,
          allTransitiveDependencies:
              WatchSalutationCodeFamily._allTransitiveDependencies,
          sessionId: sessionId,
          salutationCodeId: salutationCodeId,
        );

  WatchSalutationCodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.salutationCodeId,
  }) : super.internal();

  final String sessionId;
  final int salutationCodeId;

  @override
  Override overrideWith(
    Stream<SalutationCode> Function(WatchSalutationCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSalutationCodeProvider._internal(
        (ref) => create(ref as WatchSalutationCodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        salutationCodeId: salutationCodeId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<SalutationCode> createElement() {
    return _WatchSalutationCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSalutationCodeProvider &&
        other.sessionId == sessionId &&
        other.salutationCodeId == salutationCodeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, salutationCodeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchSalutationCodeRef on AutoDisposeStreamProviderRef<SalutationCode> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `salutationCodeId` of this provider.
  int get salutationCodeId;
}

class _WatchSalutationCodeProviderElement
    extends AutoDisposeStreamProviderElement<SalutationCode>
    with WatchSalutationCodeRef {
  _WatchSalutationCodeProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchSalutationCodeProvider).sessionId;
  @override
  int get salutationCodeId =>
      (origin as WatchSalutationCodeProvider).salutationCodeId;
}

String _$watchAllSalutationCodesHash() =>
    r'e39e8949eecb782cbdeea7e3202070d5ff76fd49';

/// See also [watchAllSalutationCodes].
@ProviderFor(watchAllSalutationCodes)
final watchAllSalutationCodesProvider =
    AutoDisposeStreamProvider<SalutationCode>.internal(
  watchAllSalutationCodes,
  name: r'watchAllSalutationCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAllSalutationCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllSalutationCodesRef
    = AutoDisposeStreamProviderRef<SalutationCode>;
String _$fetchAndWatchAllSalutationCodesHash() =>
    r'ab40e030e9f329addb39e68bf1c4f086cfe4cc61';

/// See also [FetchAndWatchAllSalutationCodes].
@ProviderFor(FetchAndWatchAllSalutationCodes)
final fetchAndWatchAllSalutationCodesProvider =
    AutoDisposeAsyncNotifierProvider<FetchAndWatchAllSalutationCodes,
        List<SalutationCode>>.internal(
  FetchAndWatchAllSalutationCodes.new,
  name: r'fetchAndWatchAllSalutationCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAndWatchAllSalutationCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FetchAndWatchAllSalutationCodes
    = AutoDisposeAsyncNotifier<List<SalutationCode>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
