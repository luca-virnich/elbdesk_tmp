// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countryCodeStateHash() => r'684e6b4e55f7288a3e89f376c14d4cdc5579f5c1';

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

abstract class _$CountryCodeState
    extends BuildlessAutoDisposeAsyncNotifier<CountryCode> {
  late final int entityId;
  late final String sessionId;

  FutureOr<CountryCode> build(
    int entityId,
    String sessionId,
  );
}

/// The State of the current country code.
///
/// Copied from [CountryCodeState].
@ProviderFor(CountryCodeState)
const countryCodeStateProvider = CountryCodeStateFamily();

/// The State of the current country code.
///
/// Copied from [CountryCodeState].
class CountryCodeStateFamily extends Family<AsyncValue<CountryCode>> {
  /// The State of the current country code.
  ///
  /// Copied from [CountryCodeState].
  const CountryCodeStateFamily();

  /// The State of the current country code.
  ///
  /// Copied from [CountryCodeState].
  CountryCodeStateProvider call(
    int entityId,
    String sessionId,
  ) {
    return CountryCodeStateProvider(
      entityId,
      sessionId,
    );
  }

  @override
  CountryCodeStateProvider getProviderOverride(
    covariant CountryCodeStateProvider provider,
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
  String? get name => r'countryCodeStateProvider';
}

/// The State of the current country code.
///
/// Copied from [CountryCodeState].
class CountryCodeStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CountryCodeState, CountryCode> {
  /// The State of the current country code.
  ///
  /// Copied from [CountryCodeState].
  CountryCodeStateProvider(
    int entityId,
    String sessionId,
  ) : this._internal(
          () => CountryCodeState()
            ..entityId = entityId
            ..sessionId = sessionId,
          from: countryCodeStateProvider,
          name: r'countryCodeStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$countryCodeStateHash,
          dependencies: CountryCodeStateFamily._dependencies,
          allTransitiveDependencies:
              CountryCodeStateFamily._allTransitiveDependencies,
          entityId: entityId,
          sessionId: sessionId,
        );

  CountryCodeStateProvider._internal(
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
  FutureOr<CountryCode> runNotifierBuild(
    covariant CountryCodeState notifier,
  ) {
    return notifier.build(
      entityId,
      sessionId,
    );
  }

  @override
  Override overrideWith(CountryCodeState Function() create) {
    return ProviderOverride(
      origin: this,
      override: CountryCodeStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CountryCodeState, CountryCode>
      createElement() {
    return _CountryCodeStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CountryCodeStateProvider &&
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
mixin CountryCodeStateRef on AutoDisposeAsyncNotifierProviderRef<CountryCode> {
  /// The parameter `entityId` of this provider.
  int get entityId;

  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _CountryCodeStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CountryCodeState,
        CountryCode> with CountryCodeStateRef {
  _CountryCodeStateProviderElement(super.provider);

  @override
  int get entityId => (origin as CountryCodeStateProvider).entityId;
  @override
  String get sessionId => (origin as CountryCodeStateProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
