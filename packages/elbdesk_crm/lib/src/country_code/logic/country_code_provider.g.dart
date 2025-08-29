// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countryCodeRepositoryHash() =>
    r'8bea266d4dcfebfc27c2958841a7d6c64fd12900';

/// See also [countryCodeRepository].
@ProviderFor(countryCodeRepository)
final countryCodeRepositoryProvider =
    AutoDisposeProvider<CountryCodeRepository>.internal(
  countryCodeRepository,
  name: r'countryCodeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$countryCodeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CountryCodeRepositoryRef
    = AutoDisposeProviderRef<CountryCodeRepository>;
String _$fetchCountryCodeHash() => r'4529c63cb6fd648079f71dfa1a408cf4b5ac840e';

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

/// See also [fetchCountryCode].
@ProviderFor(fetchCountryCode)
const fetchCountryCodeProvider = FetchCountryCodeFamily();

/// See also [fetchCountryCode].
class FetchCountryCodeFamily extends Family<AsyncValue<CountryCode>> {
  /// See also [fetchCountryCode].
  const FetchCountryCodeFamily();

  /// See also [fetchCountryCode].
  FetchCountryCodeProvider call(
    int id,
  ) {
    return FetchCountryCodeProvider(
      id,
    );
  }

  @override
  FetchCountryCodeProvider getProviderOverride(
    covariant FetchCountryCodeProvider provider,
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
  String? get name => r'fetchCountryCodeProvider';
}

/// See also [fetchCountryCode].
class FetchCountryCodeProvider extends AutoDisposeFutureProvider<CountryCode> {
  /// See also [fetchCountryCode].
  FetchCountryCodeProvider(
    int id,
  ) : this._internal(
          (ref) => fetchCountryCode(
            ref as FetchCountryCodeRef,
            id,
          ),
          from: fetchCountryCodeProvider,
          name: r'fetchCountryCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCountryCodeHash,
          dependencies: FetchCountryCodeFamily._dependencies,
          allTransitiveDependencies:
              FetchCountryCodeFamily._allTransitiveDependencies,
          id: id,
        );

  FetchCountryCodeProvider._internal(
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
    FutureOr<CountryCode> Function(FetchCountryCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCountryCodeProvider._internal(
        (ref) => create(ref as FetchCountryCodeRef),
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
  AutoDisposeFutureProviderElement<CountryCode> createElement() {
    return _FetchCountryCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCountryCodeProvider && other.id == id;
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
mixin FetchCountryCodeRef on AutoDisposeFutureProviderRef<CountryCode> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchCountryCodeProviderElement
    extends AutoDisposeFutureProviderElement<CountryCode>
    with FetchCountryCodeRef {
  _FetchCountryCodeProviderElement(super.provider);

  @override
  int get id => (origin as FetchCountryCodeProvider).id;
}

String _$fetchAllCountryCodesHash() =>
    r'7b4c9abb8071fbcec5620a21c885a35fc18c82c9';

/// See also [fetchAllCountryCodes].
@ProviderFor(fetchAllCountryCodes)
const fetchAllCountryCodesProvider = FetchAllCountryCodesFamily();

/// See also [fetchAllCountryCodes].
class FetchAllCountryCodesFamily extends Family<AsyncValue<List<CountryCode>>> {
  /// See also [fetchAllCountryCodes].
  const FetchAllCountryCodesFamily();

  /// See also [fetchAllCountryCodes].
  FetchAllCountryCodesProvider call(
    String sessionId,
  ) {
    return FetchAllCountryCodesProvider(
      sessionId,
    );
  }

  @override
  FetchAllCountryCodesProvider getProviderOverride(
    covariant FetchAllCountryCodesProvider provider,
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
  String? get name => r'fetchAllCountryCodesProvider';
}

/// See also [fetchAllCountryCodes].
class FetchAllCountryCodesProvider
    extends AutoDisposeFutureProvider<List<CountryCode>> {
  /// See also [fetchAllCountryCodes].
  FetchAllCountryCodesProvider(
    String sessionId,
  ) : this._internal(
          (ref) => fetchAllCountryCodes(
            ref as FetchAllCountryCodesRef,
            sessionId,
          ),
          from: fetchAllCountryCodesProvider,
          name: r'fetchAllCountryCodesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAllCountryCodesHash,
          dependencies: FetchAllCountryCodesFamily._dependencies,
          allTransitiveDependencies:
              FetchAllCountryCodesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FetchAllCountryCodesProvider._internal(
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
    FutureOr<List<CountryCode>> Function(FetchAllCountryCodesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAllCountryCodesProvider._internal(
        (ref) => create(ref as FetchAllCountryCodesRef),
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
  AutoDisposeFutureProviderElement<List<CountryCode>> createElement() {
    return _FetchAllCountryCodesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAllCountryCodesProvider &&
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
mixin FetchAllCountryCodesRef
    on AutoDisposeFutureProviderRef<List<CountryCode>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchAllCountryCodesProviderElement
    extends AutoDisposeFutureProviderElement<List<CountryCode>>
    with FetchAllCountryCodesRef {
  _FetchAllCountryCodesProviderElement(super.provider);

  @override
  String get sessionId => (origin as FetchAllCountryCodesProvider).sessionId;
}

String _$findCountryCodesHash() => r'094856cda617a31b786ed04f8384f323936d2ea3';

/// See also [findCountryCodes].
@ProviderFor(findCountryCodes)
const findCountryCodesProvider = FindCountryCodesFamily();

/// See also [findCountryCodes].
class FindCountryCodesFamily extends Family<AsyncValue<List<CountryCode>>> {
  /// See also [findCountryCodes].
  const FindCountryCodesFamily();

  /// See also [findCountryCodes].
  FindCountryCodesProvider call(
    String sessionId,
  ) {
    return FindCountryCodesProvider(
      sessionId,
    );
  }

  @override
  FindCountryCodesProvider getProviderOverride(
    covariant FindCountryCodesProvider provider,
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
  String? get name => r'findCountryCodesProvider';
}

/// See also [findCountryCodes].
class FindCountryCodesProvider
    extends AutoDisposeFutureProvider<List<CountryCode>> {
  /// See also [findCountryCodes].
  FindCountryCodesProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findCountryCodes(
            ref as FindCountryCodesRef,
            sessionId,
          ),
          from: findCountryCodesProvider,
          name: r'findCountryCodesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findCountryCodesHash,
          dependencies: FindCountryCodesFamily._dependencies,
          allTransitiveDependencies:
              FindCountryCodesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindCountryCodesProvider._internal(
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
    FutureOr<List<CountryCode>> Function(FindCountryCodesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindCountryCodesProvider._internal(
        (ref) => create(ref as FindCountryCodesRef),
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
  AutoDisposeFutureProviderElement<List<CountryCode>> createElement() {
    return _FindCountryCodesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindCountryCodesProvider && other.sessionId == sessionId;
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
mixin FindCountryCodesRef on AutoDisposeFutureProviderRef<List<CountryCode>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindCountryCodesProviderElement
    extends AutoDisposeFutureProviderElement<List<CountryCode>>
    with FindCountryCodesRef {
  _FindCountryCodesProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindCountryCodesProvider).sessionId;
}

String _$watchCountryCodeHash() => r'5b7491c26fb2beade476574494a5f26be5d29911';

/// See also [watchCountryCode].
@ProviderFor(watchCountryCode)
const watchCountryCodeProvider = WatchCountryCodeFamily();

/// See also [watchCountryCode].
class WatchCountryCodeFamily extends Family<AsyncValue<CountryCode>> {
  /// See also [watchCountryCode].
  const WatchCountryCodeFamily();

  /// See also [watchCountryCode].
  WatchCountryCodeProvider call({
    required String sessionId,
    required int countryCodeId,
  }) {
    return WatchCountryCodeProvider(
      sessionId: sessionId,
      countryCodeId: countryCodeId,
    );
  }

  @override
  WatchCountryCodeProvider getProviderOverride(
    covariant WatchCountryCodeProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      countryCodeId: provider.countryCodeId,
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
  String? get name => r'watchCountryCodeProvider';
}

/// See also [watchCountryCode].
class WatchCountryCodeProvider extends AutoDisposeStreamProvider<CountryCode> {
  /// See also [watchCountryCode].
  WatchCountryCodeProvider({
    required String sessionId,
    required int countryCodeId,
  }) : this._internal(
          (ref) => watchCountryCode(
            ref as WatchCountryCodeRef,
            sessionId: sessionId,
            countryCodeId: countryCodeId,
          ),
          from: watchCountryCodeProvider,
          name: r'watchCountryCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCountryCodeHash,
          dependencies: WatchCountryCodeFamily._dependencies,
          allTransitiveDependencies:
              WatchCountryCodeFamily._allTransitiveDependencies,
          sessionId: sessionId,
          countryCodeId: countryCodeId,
        );

  WatchCountryCodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.countryCodeId,
  }) : super.internal();

  final String sessionId;
  final int countryCodeId;

  @override
  Override overrideWith(
    Stream<CountryCode> Function(WatchCountryCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCountryCodeProvider._internal(
        (ref) => create(ref as WatchCountryCodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        countryCodeId: countryCodeId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<CountryCode> createElement() {
    return _WatchCountryCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCountryCodeProvider &&
        other.sessionId == sessionId &&
        other.countryCodeId == countryCodeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, countryCodeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchCountryCodeRef on AutoDisposeStreamProviderRef<CountryCode> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `countryCodeId` of this provider.
  int get countryCodeId;
}

class _WatchCountryCodeProviderElement
    extends AutoDisposeStreamProviderElement<CountryCode>
    with WatchCountryCodeRef {
  _WatchCountryCodeProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchCountryCodeProvider).sessionId;
  @override
  int get countryCodeId => (origin as WatchCountryCodeProvider).countryCodeId;
}

String _$watchAllCountryCodesHash() =>
    r'a0e21da9fc297248066674120bef5893a8fce1bf';

/// See also [watchAllCountryCodes].
@ProviderFor(watchAllCountryCodes)
final watchAllCountryCodesProvider =
    AutoDisposeStreamProvider<CountryCode>.internal(
  watchAllCountryCodes,
  name: r'watchAllCountryCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAllCountryCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllCountryCodesRef = AutoDisposeStreamProviderRef<CountryCode>;
String _$fetchAndWatchAllCountryCodesHash() =>
    r'f56a349a993e91f91ea74f4b6049a22884568049';

/// See also [FetchAndWatchAllCountryCodes].
@ProviderFor(FetchAndWatchAllCountryCodes)
final fetchAndWatchAllCountryCodesProvider = AutoDisposeAsyncNotifierProvider<
    FetchAndWatchAllCountryCodes, List<CountryCode>>.internal(
  FetchAndWatchAllCountryCodes.new,
  name: r'fetchAndWatchAllCountryCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAndWatchAllCountryCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FetchAndWatchAllCountryCodes
    = AutoDisposeAsyncNotifier<List<CountryCode>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
