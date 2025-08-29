// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_code_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchLanguageCodeHash() => r'e50336eecf8f15277a55dbc1162d00aeb3d6ac43';

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

/// See also [fetchLanguageCode].
@ProviderFor(fetchLanguageCode)
const fetchLanguageCodeProvider = FetchLanguageCodeFamily();

/// See also [fetchLanguageCode].
class FetchLanguageCodeFamily extends Family<AsyncValue<LanguageCode>> {
  /// See also [fetchLanguageCode].
  const FetchLanguageCodeFamily();

  /// See also [fetchLanguageCode].
  FetchLanguageCodeProvider call(
    int id,
  ) {
    return FetchLanguageCodeProvider(
      id,
    );
  }

  @override
  FetchLanguageCodeProvider getProviderOverride(
    covariant FetchLanguageCodeProvider provider,
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
  String? get name => r'fetchLanguageCodeProvider';
}

/// See also [fetchLanguageCode].
class FetchLanguageCodeProvider
    extends AutoDisposeFutureProvider<LanguageCode> {
  /// See also [fetchLanguageCode].
  FetchLanguageCodeProvider(
    int id,
  ) : this._internal(
          (ref) => fetchLanguageCode(
            ref as FetchLanguageCodeRef,
            id,
          ),
          from: fetchLanguageCodeProvider,
          name: r'fetchLanguageCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchLanguageCodeHash,
          dependencies: FetchLanguageCodeFamily._dependencies,
          allTransitiveDependencies:
              FetchLanguageCodeFamily._allTransitiveDependencies,
          id: id,
        );

  FetchLanguageCodeProvider._internal(
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
    FutureOr<LanguageCode> Function(FetchLanguageCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchLanguageCodeProvider._internal(
        (ref) => create(ref as FetchLanguageCodeRef),
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
  AutoDisposeFutureProviderElement<LanguageCode> createElement() {
    return _FetchLanguageCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchLanguageCodeProvider && other.id == id;
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
mixin FetchLanguageCodeRef on AutoDisposeFutureProviderRef<LanguageCode> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchLanguageCodeProviderElement
    extends AutoDisposeFutureProviderElement<LanguageCode>
    with FetchLanguageCodeRef {
  _FetchLanguageCodeProviderElement(super.provider);

  @override
  int get id => (origin as FetchLanguageCodeProvider).id;
}

String _$findLanguageCodesHash() => r'3a1ed172d1a5dee6bfd7cd4ca2c2e67138cbc7a3';

/// See also [findLanguageCodes].
@ProviderFor(findLanguageCodes)
const findLanguageCodesProvider = FindLanguageCodesFamily();

/// See also [findLanguageCodes].
class FindLanguageCodesFamily extends Family<AsyncValue<List<LanguageCode>>> {
  /// See also [findLanguageCodes].
  const FindLanguageCodesFamily();

  /// See also [findLanguageCodes].
  FindLanguageCodesProvider call(
    String sessionId,
  ) {
    return FindLanguageCodesProvider(
      sessionId,
    );
  }

  @override
  FindLanguageCodesProvider getProviderOverride(
    covariant FindLanguageCodesProvider provider,
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
  String? get name => r'findLanguageCodesProvider';
}

/// See also [findLanguageCodes].
class FindLanguageCodesProvider
    extends AutoDisposeFutureProvider<List<LanguageCode>> {
  /// See also [findLanguageCodes].
  FindLanguageCodesProvider(
    String sessionId,
  ) : this._internal(
          (ref) => findLanguageCodes(
            ref as FindLanguageCodesRef,
            sessionId,
          ),
          from: findLanguageCodesProvider,
          name: r'findLanguageCodesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$findLanguageCodesHash,
          dependencies: FindLanguageCodesFamily._dependencies,
          allTransitiveDependencies:
              FindLanguageCodesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FindLanguageCodesProvider._internal(
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
    FutureOr<List<LanguageCode>> Function(FindLanguageCodesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindLanguageCodesProvider._internal(
        (ref) => create(ref as FindLanguageCodesRef),
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
  AutoDisposeFutureProviderElement<List<LanguageCode>> createElement() {
    return _FindLanguageCodesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindLanguageCodesProvider && other.sessionId == sessionId;
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
mixin FindLanguageCodesRef on AutoDisposeFutureProviderRef<List<LanguageCode>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FindLanguageCodesProviderElement
    extends AutoDisposeFutureProviderElement<List<LanguageCode>>
    with FindLanguageCodesRef {
  _FindLanguageCodesProviderElement(super.provider);

  @override
  String get sessionId => (origin as FindLanguageCodesProvider).sessionId;
}

String _$fetchAllLanguageCodesHash() =>
    r'4bc805a757648d6db67333c26941e3fac9da8e03';

/// See also [fetchAllLanguageCodes].
@ProviderFor(fetchAllLanguageCodes)
const fetchAllLanguageCodesProvider = FetchAllLanguageCodesFamily();

/// See also [fetchAllLanguageCodes].
class FetchAllLanguageCodesFamily
    extends Family<AsyncValue<List<LanguageCode>>> {
  /// See also [fetchAllLanguageCodes].
  const FetchAllLanguageCodesFamily();

  /// See also [fetchAllLanguageCodes].
  FetchAllLanguageCodesProvider call(
    String sessionId,
  ) {
    return FetchAllLanguageCodesProvider(
      sessionId,
    );
  }

  @override
  FetchAllLanguageCodesProvider getProviderOverride(
    covariant FetchAllLanguageCodesProvider provider,
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
  String? get name => r'fetchAllLanguageCodesProvider';
}

/// See also [fetchAllLanguageCodes].
class FetchAllLanguageCodesProvider
    extends AutoDisposeFutureProvider<List<LanguageCode>> {
  /// See also [fetchAllLanguageCodes].
  FetchAllLanguageCodesProvider(
    String sessionId,
  ) : this._internal(
          (ref) => fetchAllLanguageCodes(
            ref as FetchAllLanguageCodesRef,
            sessionId,
          ),
          from: fetchAllLanguageCodesProvider,
          name: r'fetchAllLanguageCodesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchAllLanguageCodesHash,
          dependencies: FetchAllLanguageCodesFamily._dependencies,
          allTransitiveDependencies:
              FetchAllLanguageCodesFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  FetchAllLanguageCodesProvider._internal(
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
    FutureOr<List<LanguageCode>> Function(FetchAllLanguageCodesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchAllLanguageCodesProvider._internal(
        (ref) => create(ref as FetchAllLanguageCodesRef),
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
  AutoDisposeFutureProviderElement<List<LanguageCode>> createElement() {
    return _FetchAllLanguageCodesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAllLanguageCodesProvider &&
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
mixin FetchAllLanguageCodesRef
    on AutoDisposeFutureProviderRef<List<LanguageCode>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _FetchAllLanguageCodesProviderElement
    extends AutoDisposeFutureProviderElement<List<LanguageCode>>
    with FetchAllLanguageCodesRef {
  _FetchAllLanguageCodesProviderElement(super.provider);

  @override
  String get sessionId => (origin as FetchAllLanguageCodesProvider).sessionId;
}

String _$languageCodeRepositoryHash() =>
    r'ca3de55ba20145674910ad5a3bac59fc0ede3025';

/// See also [languageCodeRepository].
@ProviderFor(languageCodeRepository)
final languageCodeRepositoryProvider =
    AutoDisposeProvider<LanguageCodeRepository>.internal(
  languageCodeRepository,
  name: r'languageCodeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$languageCodeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LanguageCodeRepositoryRef
    = AutoDisposeProviderRef<LanguageCodeRepository>;
String _$watchLanguageCodeHash() => r'453d824e6a440c160816412dc8da6570bf10383f';

/// See also [watchLanguageCode].
@ProviderFor(watchLanguageCode)
const watchLanguageCodeProvider = WatchLanguageCodeFamily();

/// See also [watchLanguageCode].
class WatchLanguageCodeFamily extends Family<AsyncValue<LanguageCode>> {
  /// See also [watchLanguageCode].
  const WatchLanguageCodeFamily();

  /// See also [watchLanguageCode].
  WatchLanguageCodeProvider call({
    required String sessionId,
    required int languageCodeId,
  }) {
    return WatchLanguageCodeProvider(
      sessionId: sessionId,
      languageCodeId: languageCodeId,
    );
  }

  @override
  WatchLanguageCodeProvider getProviderOverride(
    covariant WatchLanguageCodeProvider provider,
  ) {
    return call(
      sessionId: provider.sessionId,
      languageCodeId: provider.languageCodeId,
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
  String? get name => r'watchLanguageCodeProvider';
}

/// See also [watchLanguageCode].
class WatchLanguageCodeProvider
    extends AutoDisposeStreamProvider<LanguageCode> {
  /// See also [watchLanguageCode].
  WatchLanguageCodeProvider({
    required String sessionId,
    required int languageCodeId,
  }) : this._internal(
          (ref) => watchLanguageCode(
            ref as WatchLanguageCodeRef,
            sessionId: sessionId,
            languageCodeId: languageCodeId,
          ),
          from: watchLanguageCodeProvider,
          name: r'watchLanguageCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchLanguageCodeHash,
          dependencies: WatchLanguageCodeFamily._dependencies,
          allTransitiveDependencies:
              WatchLanguageCodeFamily._allTransitiveDependencies,
          sessionId: sessionId,
          languageCodeId: languageCodeId,
        );

  WatchLanguageCodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.languageCodeId,
  }) : super.internal();

  final String sessionId;
  final int languageCodeId;

  @override
  Override overrideWith(
    Stream<LanguageCode> Function(WatchLanguageCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchLanguageCodeProvider._internal(
        (ref) => create(ref as WatchLanguageCodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        languageCodeId: languageCodeId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<LanguageCode> createElement() {
    return _WatchLanguageCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchLanguageCodeProvider &&
        other.sessionId == sessionId &&
        other.languageCodeId == languageCodeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, languageCodeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchLanguageCodeRef on AutoDisposeStreamProviderRef<LanguageCode> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `languageCodeId` of this provider.
  int get languageCodeId;
}

class _WatchLanguageCodeProviderElement
    extends AutoDisposeStreamProviderElement<LanguageCode>
    with WatchLanguageCodeRef {
  _WatchLanguageCodeProviderElement(super.provider);

  @override
  String get sessionId => (origin as WatchLanguageCodeProvider).sessionId;
  @override
  int get languageCodeId =>
      (origin as WatchLanguageCodeProvider).languageCodeId;
}

String _$watchAllLanguageCodesHash() =>
    r'd53d8f4e8e9a3c2080e0e82f267299ccc887f9ad';

/// See also [watchAllLanguageCodes].
@ProviderFor(watchAllLanguageCodes)
final watchAllLanguageCodesProvider =
    AutoDisposeStreamProvider<LanguageCode>.internal(
  watchAllLanguageCodes,
  name: r'watchAllLanguageCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAllLanguageCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllLanguageCodesRef = AutoDisposeStreamProviderRef<LanguageCode>;
String _$fetchAndWatchAllLanguageCodesHash() =>
    r'c7beb415d645c35ad15761fd7acdf8da981bbba8';

/// See also [FetchAndWatchAllLanguageCodes].
@ProviderFor(FetchAndWatchAllLanguageCodes)
final fetchAndWatchAllLanguageCodesProvider = AutoDisposeAsyncNotifierProvider<
    FetchAndWatchAllLanguageCodes, List<LanguageCode>>.internal(
  FetchAndWatchAllLanguageCodes.new,
  name: r'fetchAndWatchAllLanguageCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAndWatchAllLanguageCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FetchAndWatchAllLanguageCodes
    = AutoDisposeAsyncNotifier<List<LanguageCode>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
