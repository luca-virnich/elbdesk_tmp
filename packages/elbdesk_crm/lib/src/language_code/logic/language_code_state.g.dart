// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_code_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchCountryCodeHash() => r'3bbdf4a75aa8c9754ab58e5f096eb6c954c2b804';

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

String _$languageCodeStateHash() => r'4ac6f66b5de855fe0156b21710a391015be60c93';

abstract class _$LanguageCodeState
    extends BuildlessAutoDisposeAsyncNotifier<LanguageCode> {
  late final int entityId;
  late final String sessionId;

  FutureOr<LanguageCode> build(
    int entityId,
    String sessionId,
  );
}

/// The State of the current language code.
///
/// Copied from [LanguageCodeState].
@ProviderFor(LanguageCodeState)
const languageCodeStateProvider = LanguageCodeStateFamily();

/// The State of the current language code.
///
/// Copied from [LanguageCodeState].
class LanguageCodeStateFamily extends Family<AsyncValue<LanguageCode>> {
  /// The State of the current language code.
  ///
  /// Copied from [LanguageCodeState].
  const LanguageCodeStateFamily();

  /// The State of the current language code.
  ///
  /// Copied from [LanguageCodeState].
  LanguageCodeStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return LanguageCodeStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  LanguageCodeStateProvider getProviderOverride(
    covariant LanguageCodeStateProvider provider,
  ) {
    return call(
      provider.entityId,
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
  String? get name => r'languageCodeStateProvider';
}

/// The State of the current language code.
///
/// Copied from [LanguageCodeState].
class LanguageCodeStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LanguageCodeState, LanguageCode> {
  /// The State of the current language code.
  ///
  /// Copied from [LanguageCodeState].
  LanguageCodeStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => LanguageCodeState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: languageCodeStateProvider,
          name: r'languageCodeStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$languageCodeStateHash,
          dependencies: LanguageCodeStateFamily._dependencies,
          allTransitiveDependencies:
              LanguageCodeStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  LanguageCodeStateProvider._internal(
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
  FutureOr<LanguageCode> runNotifierBuild(
    covariant LanguageCodeState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(LanguageCodeState Function() create) {
    return ProviderOverride(
      origin: this,
      override: LanguageCodeStateProvider._internal(
        () => create()
          ..entityId = entityId
          ..sessionId = sessionId,
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
  AutoDisposeAsyncNotifierProviderElement<LanguageCodeState, LanguageCode>
      createElement() {
    return _LanguageCodeStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LanguageCodeStateProvider &&
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
mixin LanguageCodeStateRef
    on AutoDisposeAsyncNotifierProviderRef<LanguageCode> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _LanguageCodeStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LanguageCodeState,
        LanguageCode> with LanguageCodeStateRef {
  _LanguageCodeStateProviderElement(super.provider);

  @override
  int get entityId => (origin as LanguageCodeStateProvider).entityId;
  @override
  String get sessionId => (origin as LanguageCodeStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
